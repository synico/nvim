vim.opt_local.shiftwidth =2
vim.opt_local.tabstop = 2
vim.opt_local.cmdheight = 2

local jdtls = require('jdtls')
local root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})

if vim.fn.has "unix" == 1 then
  WORKSPACE_PATH = os.getenv('HOME')..'/workspace/'
  LIB_PATH = '/opt/jdtls/current/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
  CONFIG = '/opt/jdtls/current/config_linux/'
  JDK11 = '/usr/local/java/jdk-11/'
  JDK17 = '/usr/local/java/jdk-17/'
else --win
  WORKSPACE_PATH = 'C:/Users/Nick/workspace/'
  LIB_PATH = 'C:/usr/local/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
  CONFIG = 'C:/usr/local/jdtls/config_win/'
  JDK11 = 'C:/usr/local/java/jdk-11.0.13/'
  JDK17 = 'C:/usr/local/java/jdk-17.0.2/'
end

local config = {
  flags = {},
  handlers = {},
  capabilities = {},
  cmd = {},
  root_dir = {},
  on_attach = {},
  settings = {},
}

config.flags = {
  debounce_text_changes = 80,
}

config.cmd = {
  -- 💀
  'java', -- or '/path/to/java17_or_newer/bin/java'
          -- depends on if `java` is in your $PATH env variable and if it points to the right version.
  '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  '-Dosgi.bundles.defaultStartLevel=4',
  '-Declipse.product=org.eclipse.jdt.ls.core.product',
  '-Dlog.protocol=true',
  '-Dlog.level=ALL',
  '-Xms1g',
  '--add-modules=ALL-SYSTEM',
  '--add-opens', 'java.base/java.util=ALL-UNNAMED',
  '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  -- 💀
  '-jar', LIB_PATH,
       -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
       -- Must point to the                                                     Change this to
       -- eclipse.jdt.ls installation                                           the actual version
  -- 💀
  '-configuration', CONFIG,
                  -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                  -- Must point to the                      Change to one of `linux`, `win` or `mac`
                  -- eclipse.jdt.ls installation            Depending on your system.
  -- 💀
  -- See `data directory configuration` section in the README
  '-data', WORKSPACE_PATH
}

config.on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', "<A-o>", jdtls.organize_imports, opts)
  vim.keymap.set('n', "crv", jdtls.extract_variable, opts)
  vim.keymap.set('v', "crv", [[<ESC><CMD>lua require('jdtls').extract_variable(true)<CR>]], opts)
  vim.keymap.set('v', 'crm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
  vim.keymap.set('n', "crc", jdtls.extract_constant, opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ci', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- Java specific
--  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
--  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
--  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
--  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

end

config.root_dir = root_dir

config.settings = {
  java = {
    signatureHelp = { enabled = true },
    contentProvider = { preferred = 'fernflower' },
    configuration = {
      runtimes = {
        {
          name = 'JavaSE-11',
          path = JDK11,
        },
        {
          name = 'JavaSE-17',
          path = JDK17,
        },
      },
    }
  },
}

jdtls.start_or_attach(config)
