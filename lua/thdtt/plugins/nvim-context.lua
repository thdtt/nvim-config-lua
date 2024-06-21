return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    local nvim_context = require("treesitter-context")

    local keymap = vim.keymap

    nvim_context.setup({
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 10, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 5, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    })

    keymap.set("n", "]c", function()
      nvim_context.go_to_context(vim.v.count1)
    end, { desc = "Go to context", silent = true })
  end,
}
