-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

lvim.plugins = {
    { "Pocco81/auto-save.nvim" },
    -- {"preservim/nerdtree"},
    {"ryanoasis/vim-devicons"},  -- Для иконок файлов
    {
      "aca/emmet-ls",
        config = function()
          local lspconfig = require("lspconfig")
          local configs = require("lspconfig/configs")

          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = {
              "documentation",
              "detail",
              "additionalTextEdits",
            },
          }

      if not lspconfig.emmet_ls then
        configs.emmet_ls = {
          default_config = {
            cmd = { "emmet-ls", "--stdio" },
            filetypes = {
              "html",
              "css",
              "javascript",
              "typescript",
              "eruby",
              "typescriptreact",
              "javascriptreact",
              "svelte",
              "vue",
            },
            root_dir = function(fname)
              return vim.loop.cwd()
              end,
            settings = {},
          },
        }
      end
        lspconfig.emmet_ls.setup({ capabilities = capabilities })
        end,
    },

}

lvim.keys.insert_mode["jk"] = "<esc>"
lvim.keys.insert_mode["<C-.>"] = "<esc>>>llli"
lvim.keys.insert_mode["<C-,>"] = "<esc><<i"
-- NvimTree
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<CR>"  -- Открыть/закрыть NERDTree
-- Переключение между вкладками
lvim.keys.normal_mode["<Tab>"] = ":tabnext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":tabprevious<CR>"



-- local cmp = require'cmp'

-- cmp.setup({
--   mapping = {
--     ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--     ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Выбор первой подсказки
--   },
-- })
