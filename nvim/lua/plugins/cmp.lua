return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.mapping = cmp.mapping.preset.insert({
      ["<C-h>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<C-j>"] = cmp.mapping(function(fallback)
        if not cmp.visible() then
          cmp.complete()
        elseif cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end),

      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-l>"] = cmp.mapping.confirm({ select = true }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),

      ["<C-Space>"] = cmp.mapping.complete_common_string(),

      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-u>"] = cmp.mapping.scroll_docs(-1),
      ["<C-d>"] = cmp.mapping.scroll_docs(1),
    })
  end,
}
