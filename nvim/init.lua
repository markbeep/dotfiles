-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

function Transparent(color)
  color = color or "catppuccin"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- DMS rewrites this cache on every theme generation, including light/dark switches.
local dms_colors = (function()
  local cache = vim.env.XDG_CACHE_HOME
  if not cache or cache == "" then cache = vim.fs.joinpath(vim.env.HOME, ".cache") end
  return vim.fs.joinpath(cache, "DankMaterialShell", "dms-colors.json")
end)()

-- Catppuccin's default "auto" flavour maps background to latte/mocha.
local function sync_dms_mode()
  local file = io.open(dms_colors)
  if not file then return false end
  local ok, data = pcall(vim.json.decode, file:read("*a"))
  file:close()
  local mode = ok and data.mode
  if (mode ~= "light" and mode ~= "dark") or vim.o.background == mode then return false end
  vim.o.background = mode
  return true
end

sync_dms_mode()
Transparent()

local watcher = (vim.uv or vim.loop).new_fs_event()
-- The cache file is replaced on write, so watch its directory instead of the inode.
watcher:start(vim.fs.dirname(dms_colors), {}, vim.schedule_wrap(function(_, filename)
  if filename == "dms-colors.json" and sync_dms_mode() then Transparent() end
end))
