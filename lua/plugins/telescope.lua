-- ~/.config/nvim/lua/user/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    -- Ensure defaults are defined
    local defaults = opts.defaults or {}

    -- Customize vimgrep_arguments
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

    -- Add the custom path_display function
    defaults.path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s (%s)", tail, path), { { { 0, #tail }, "Constant" } }
    end

    -- Assign the modified defaults back to opts
    opts.defaults = defaults
  end,
}
