local wezterm = require("wezterm")
local config = {}

local tmux = {}
if wezterm.target_triple == "aarch64-apple-darwin" then
	tmux = { "/opt/homebrew/bin/fish", "-l", "-c", "tmux attach || tmux" }
else
	tmux = { "tmux", "new", "-As0" }
end

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	-- return pane:get_user_vars().IS_NVIM == 'true'
	local process_name = basename(pane:get_foreground_process_name())
	return process_name == "nvim" or process_name == "vim"
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- config.default_prog = tmux
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "tokyonight_night" -- "Wez" -- "Operator Mono Dark" -- "Kibble" -- "Jellybeans" -- "ChallengerDeep" -- 'OneDark (base16)'
-- config.font = wezterm.font {
--   family = 'Fantasque Sans Mono', -- 'JetBrainsMono Nerd Font',
--   harfbuzz_features = { 'ss01=1' }, -- { 'zero=1', 'calt=0', 'clig=0', 'liga=0', },
-- }
-- == === != !== :  ///
config.font = wezterm.font_with_fallback({
	{
		family = "Red Hat Mono", -- 'JetBrainsMono Nerd Font',
		-- weight = "Regular",
		harfbuzz_features = {
			-- "dlig=0", -- Code ligatures
			-- "liga=0", -- Italic ligatures
			-- "zero=1", -- Slashed zero
			-- "ss20=0", -- Slashed zero
			-- "ss01=1", -- Single-story 'a'
			-- "ss02=1", -- Single-story 'g'
			-- "ss03=1", -- Simplified 'f'
			-- "ss04=1", -- Simplified 'i'
			-- "ss05=1", -- Simplified 'l'
			-- "ss06=1", -- Simplified 'r'
			-- "ss07=1", -- Simplified italic diagnals
			-- "ss08=1", -- No-serif 'L' & 'Z'
			-- "ss09=1", -- Simplified six & nine
			-- "ss10=1", -- Dotted zero
			-- "ss11=1", -- Simplified one
			-- "ss12=1", -- Simplified mono 'at'
		}, -- { 'zero=1', 'calt=0', 'clig=0', 'liga=0', },
	},
	{
		family = "Monaspace Argon", -- 'Neon, Argon, Xenon, Radon, Krypton',
		weight = "Regular",
		harfbuzz_features = {
			"calt=1", -- enables texture healing
			"liga=1", -- enables dynamic spacing for certain repeating character patterns like ///
			"ss01=0", -- ligatures related to the equals glyph like != and ===.
			"ss02=0", -- ligatures for greater/less or equal (<=, >=).
			"ss03=0", -- ligatures related to arrows like -> and ~>.
			"ss04=0", -- ligatures related to markup, like </ and />.
			"ss05=0", -- ligatures related to the F# programming language, like |>.
			"ss06=0", -- ligatures related to repeated uses of #, +, and &.
			"ss07=0", -- ligatures related to colons like :: or =:=.
			"ss08=0", -- ligatures related to combinations of periods with other glyphs like ..= or .-.
			"ss09=0", -- ligatures related to combinations of the greater/less than and equals signs, like <=>,>>, and =<<.
		},
	},
	{
		family = "CommitMono Nerd Font", -- 'JetBrainsMono Nerd Font',
		weight = "Regular",
		harfbuzz_features = {
			"calt=0",
			"clig=0",
			"liga=0",
			"dlig=0",
		},
	},
	{
		family = "FantasqueSansM Nerd Font",
		weight = "Regular",
		harfbuzz_features = {
			"ss01=1", -- nondescript k
			"calt=0",
			"clig=0",
			"liga=0",
			"dlig=0",
		},
	},
	{
		family = "ZedMono NF Extd",
		weight = "Regular",
		harfbuzz_features = {},
	},
	{
		family = "IntoneMono NF", -- 'JetBrainsMono Nerd Font',
		weight = "Regular",
		harfbuzz_features = {
			"ss01=0", -- Programming ligatures
			"ss02=0", -- Arrow forms of less/equal and greater/equal combinations
			"ss12=1", -- Raised colon
			"locl=1", -- Localizations
			"sups=0",
			"subs=0",
		},
	},
	{
		family = "Hurmit Nerd Font",
		weight = "Regular",
		harfbuzz_features = {},
	},
	{
		family = "Iosevka Extended",
		weight = "Regular",
		harfbuzz_features = {
			"calt=0",
			"clig=0",
			"liga=0",
			"dlig=0",
			"ss01=0", -- Andale Mono
			"ss03=0", -- Consoles
			"ss09=1", -- Source Code Pro
			"ss14=0", -- JetBrains Mono
			"ss17=0", -- Recursive Mono
			"zero",
		},
	},
	{
		family = "Mononoki Nerd Font", -- 'JetBrainsMono Nerd Font',
		weight = "Regular",
		-- harfbuzz_features = { "ss01=1", "calt=0", "clig=0", "liga=0" }, -- { 'zero=1', 'calt=0', 'clig=0', 'liga=0', },
	},
	{
		family = "Regio Mono", -- 'JetBrainsMono Nerd Font',
		weight = "Regular",
		harfbuzz_features = {
			"ss01=1",
			"calt=0",
			"clig=0",
			"liga=0",
		}, -- { 'zero=1', 'calt=0', 'clig=0', 'liga=0', },
	},
	{
		family = "Source Code Pro",
		weight = "Regular",
		harfbuzz_features = {
			"zero=1",
			"calt=0",
			"clig=0",
			"liga=0",
		},
	},
	{
		family = "Cascadia Code",
		weight = "Regular",
		harfbuzz_features = {
			"ss19=1",
			"ss20=1",
			"calt=0",
			"clig=0",
			"liga=0",
		},
	},
	{
		family = "JetBrains Mono",
		weight = "Regular",
		harfbuzz_features = {
			"zero=1",
			"calt=0",
			"clig=0",
			"liga=0",
		},
	},
	{
		family = "JuliaMono",
		weight = "Regular",
		harfbuzz_features = {
			"zero=1",
			"calt=0",
			"clig=0",
			"liga=0",
		},
	},
	{
		family = "MonoLisa",
		weight = "Regular",
	},
	{
		family = "mononoki", -- 'JetBrainsMono Nerd Font',
		weight = "Regular",
		harfbuzz_features = {
			"calt=0",
			"clig=0",
			"liga=0",
		},
	},
	{
		family = "Victor Mono",
		weight = "Regular",
		harfbuzz_features = {
			"ss01=0",
			"ss02=1",
			"ss06=0",
			"ss07=1",
			"ss08=0",
			"calt=0",
			"clig=0",
			"liga=0",
		},
	},
})
config.font_size = 14
config.line_height = 1.2

config.initial_rows = 50
config.initial_cols = 220

-- Key bindings
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 10000 }
config.keys = {
	-- splitting
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "_",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "m",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- rotate panes
	{
		mods = "LEADER",
		key = "Space",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	-- show the pane seleciton mode, but have it swap the active and selected panes
	{
		mods = "LEADER",
		key = "0",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	-- activate copy mode or vim mode
	{
		key = "Enter",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
}

return config
