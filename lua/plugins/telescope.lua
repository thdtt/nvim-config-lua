-- ~/.config/nvim/lua/user/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local defaults = opts.defaults or {}
    defaults.vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--ignore-file",
      "~/.ignore", -- Use your custom ignore file
    }
    opts.defaults = defaults
  end,
}
