local M = {}

M._keys = nil

function M.get()
  if not M._keys then
    -- stylua: ignore
    M._keys = {
      { "<leader>ld", vim.diagnostic.open_float,                 desc = "Line Diagnostics" },
      { "<leader>li", "<cmd>LspInfo<cr>",                        desc = "Lsp Info" },
      { "<leader>d",  vim.lsp.buf.definition,                    desc = "Goto Definition",       has = "definition" },
      { "<leader>lr", vim.lsp.buf.references,                    desc = "References" },
      { "gd",         vim.lsp.buf.declaration,                   desc = "Goto Declaration" },
      { "<leader>lI", "<cmd>Telescope lsp_implementations<cr>",  desc = "Goto Implementation" },
      { "<leader>D",  "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto T[y]pe Definition" },
      { "K",          vim.lsp.buf.hover,                         desc = "Hover" },
      { "gK",         vim.lsp.buf.signature_help,                desc = "Signature Help",        has = "signatureHelp" },
      {
        "<c-k>",
        vim.lsp.buf.signature_help,
        mode = "i",
        desc = "Signature Help",
        has =
        "signatureHelp"
      },
      { "]d", M.diagnostic_goto(true),           desc = "Next Diagnostic" },
      { "[d", M.diagnostic_goto(false),          desc = "Prev Diagnostic" },
      { "]e", M.diagnostic_goto(true, "ERROR"),  desc = "Next Error" },
      { "[e", M.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
      { "]w", M.diagnostic_goto(true, "WARN"),   desc = "Next Warning" },
      { "[w", M.diagnostic_goto(false, "WARN"),  desc = "Prev Warning" },
      { "]h", M.diagnostic_goto(true, "HINT"),   desc = "Next Hint" },
      { "[h", M.diagnostic_goto(false, "HINT"),  desc = "Prev Hint" },
      {
        "<leader>lf",
        vim.lsp.buf.format,
        desc = "Format Document",
        has =
        "documentFormatting"
      },
      {
        "<leader>ca",
        vim.lsp.buf.code_action,
        desc = "Code Action",
        mode = { "n", "v" },
        has =
        "codeAction"
      },
      {
        "<leader>cA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Source Action",
        has = "codeAction",
      },
      { "<leader>lR", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    }
  end
  return M._keys
end

function M.on_attach(client, buffer)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = {} ---@type table<string,LazyKeys|{has?:string}>

  for _, value in ipairs(M.get()) do
    local keys = Keys.parse(value)
    if keys[2] == vim.NIL or keys[2] == false then
      keymaps[keys.id] = nil
    else
      keymaps[keys.id] = keys
    end
  end

  for _, keys in pairs(keymaps) do
    if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
      local opts = Keys.opts(keys)
      ---@diagnostic disable-next-line: no-unknown
      opts.has = nil
      opts.silent = opts.silent ~= false
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
    end
  end
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M
