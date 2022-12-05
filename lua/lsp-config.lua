-- Native LSP Setup
-- tell nvim to use tsserver
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function() 
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer=0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer=0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer=0})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer=0})
  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer=0})
  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer=0})
  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer=0})
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
	vim.keymap.set("n", "<leader>gh", vim.lsp.buf.signature_help, {buffer=0})
  end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  single_file_support = true,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}


require'lspconfig'.cssls.setup{

  capabilities = capabilities,
  on_attach = on_attach
}


