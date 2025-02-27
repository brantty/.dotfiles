local hl = {
  error = "DiagnosticsSignError",
  warn = "DiagnosticsSignWarn",
  hint = "DiagnosticsSignHint",
  info = "DiagnosticsSignInfo",
}

local signs = {
  { warn = hl.error, dict = { text = "", texthl = hl.error }, },
  { warn = hl.warn, dict = { text = "", texthl = hl.warn }, },
  { hint = hl.hint, dict = { text = " ", texthl = hl.hint }, },
  { warn = hl.info, dict = { text = "", texthl = hl.info }, },
  {
    name = "DapBreakpoint",
    dict = {
      text = "",
      texthl = hl.error,
      numhl = hl.error,
    },
  },
  {
    name = "DapStopped",
    dict = {
      text = "",
      texthl = hl.warn,
      numhl = hl.warn,
    },
  },
  {
    name = "DapBreakpointCondition",
    dict = {
      text = "󰋗",
      texthl = hl.hint,
      numhl = hl.hint,
    },
  },
  {
    name = "DapBreakpointRejected",
    dict = {
      text = "󰅙",
      texthl = hl.error,
      numhl = hl.error,
    },
  },
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, sign.dict)
end

return signs
