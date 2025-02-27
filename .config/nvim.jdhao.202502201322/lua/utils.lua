local fn, api, cmd, diag, o, g, tbl_contains, bo, keymap, ui =
  vim.fn, vim.api, vim.cmd, vim.diagnostic, vim.o, vim.g, vim.tbl_contains, vim.bo, vim.keymap, vim.ui

local version = vim.version

local M = {}

function M.executable(name)
  if fn.executable(name) > 0 then
    return true
  end

  return false
end

--- check whether a feature exists in Nvim
--- @param feat string the feature name, like `nvim-0.7` or `unix`.
--- @return boolean
M.has = function(feat)
  if fn.has(feat) == 1 then
    return true
  end

  return false
end

--- Create a dir if it does not exist
function M.may_create_dir(dir)
  local res = fn.isdirectory(dir)

  if res == 0 then
    fn.mkdir(dir, "p")
  end
end

--- Generate random integers in the range [Low, High], inclusive,
--- adapted from https://stackoverflow.com/a/12739441/6064933
--- @param low integer the lower value for this range
--- @param high integer the upper value for this range
--- @return integer
function M.rand_int(low, high)
  -- Use lua to generate random int, see also: https://stackoverflow.com/a/20157671/6064933
  math.randomseed(os.time())

  return math.random(low, high)
end

--- Select a random element from a sequence/list.
--- @param seq any[] the sequence to choose an element
function M.rand_element(seq)
  local idx = M.rand_int(1, #seq)

  return seq[idx]
end

--- check if the current nvim version is compatible with the allowed version
--- @param expected_version string
--- @return boolean
function M.is_compatible_version(expected_version)
  -- check if we have the latest stable version of nvim
  local expect_ver = version.parse(expected_version)
  local actual_ver = vim.version()

  if expect_ver == nil then
    local msg = string.format("Unsupported version string: %s", expected_version)
    vim.api.nvim_err_writeln(msg)
    return false
  end

  local result = version.cmp(expect_ver, actual_ver)
  if result ~= 0 then
    local _ver = string.format("%s.%s.%s", actual_ver.major, actual_ver.minor, actual_ver.patch)
    local msg = string.format(
      "Expect nvim version %s, but your current nvim version is %s. Use at your own risk!",
      expected_version,
      _ver
    )
    vim.api.nvim_err_writeln(msg)
  end

  return true
end

--- check if we are inside a git repo
--- @return boolean
function M.inside_git_repo()
  local result = vim.system({ "git", "rev-parse", "--is-inside-work-tree" }, { text = true }):wait()
  if result.code ~= 0 then
    return false
  end

  -- Manually trigger a special user autocmd InGitRepo (used lazyloading.
  vim.cmd([[doautocmd User InGitRepo]])

  return true
end

function M.screen_scale(config)
  local defaults = {
    width = 0.5,
    height = 0.5,
  }
  config = config or {}
  config.width = config.width or defaults.width
  config.height = config.height or defaults.height
  local width = fn.round(o.columns * config.width)
  local height = fn.round(o.lines * config.height)
  return {
    width = width,
    height = height,
  }
end

local function cmd_string(cmd_arg)
  return [[<cmd>]] .. cmd_arg .. [[<cr>]]
end

local function str_to_tbl(v)
  if type(v) == "string" then
    v = { v }
  end
  return v
end

function M.cmd_map(lhs, rhs, modes, opts)
  modes = str_to_tbl(modes) or { "n"}
  opts = opts or { silent = true, noremap = true }
  for _, mode in ipairs(modes) do
    keymap.set(mode, lhs, cmd_string(rhs), opts)
  end
end

function M.key_map(lhs, rhs, modes, opts)
  modes = str_to_tbl(modes) or { "n"}
  opts = opts or { silent = true, noremap = true }
  for _, mode in ipairs(modes) do
    keymap.set(mode, lhs, rhs, opts)
  end
end

function M.lazy_map(lhs, rhs, modes)
  if type(rhs) == "string" then
    rhs = cmd_string(rhs)
  end
  modes = str_to_tbl(modes) or { "n" }
  return {
    lhs,
    rhs,
    mode = modes,
  }
end

function M.toggleterm_opts(added_opts)
  local ratio = 0.85
  local scale = M.screen_scale({ width = ration ,height = ratio })
  local opts = {
    auto_scroll = true,
    direction = "float",
    float_opts = {
      border = "curved",
      width = scale.width,
      height = scale.height,
      winblend = 2,
    },
    winbar = {
      enabled = false,
    },
    shade_terminals = true,
    hide_numbers = false,
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(
        term.bufnr,
        "n",
        "q",
        [[<cmd>close<cr>]],
        { noremap = true, silent = true }
      )
    end,
    on_close = function() end,
  }
  if not added_opts then
    return opts
  end
  return vim.tbl_deep_extend("force", opts, added_opts)
end

function M.toggle_term_cmd(config)
  if not config or not config.count then
    return
  end
  if config.cmd[1] ~= nil then
    ui.select(config.cmd, {
      prompt = "Select command",
    }, function(selected)
      if not selected then
        return
      end
      config.cmd = selected
      M.toggle_term_cmd(config)
    end)
  else
    local term_config = M.toggleterm_opts(config)
    local Terminal = require("toggleterm.terminal").Terminal
    local term = Terminal:new(term_config)
    term:toggle()
  end
end

function M.create_cmd(command, f, opts)
  opts = opts or {}
  api.nvim_create_user_command(command, f, opts)
end

function M.term_open(c)
  vim.g.catgoose_terminal_enable_startinsert = 1
  if type(c) == "string" then
    cmd(c)
  end
  if type(c) == "table" then
    for _, v in ipairs(c) do
      cmd(v)
    end
  end
end

return M
