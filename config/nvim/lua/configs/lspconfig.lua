local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "ts_ls", "angularls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- local project_library_path = "/usr/lib/node_modules/@angular/language-server/"
--
-- local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}
--
-- require'lspconfig'.angularls.setup{
--   cmd = cmd,
--   on_new_config = function(new_config,new_root_dir)
--     new_config.cmd = cmd
--   end,
-- }
