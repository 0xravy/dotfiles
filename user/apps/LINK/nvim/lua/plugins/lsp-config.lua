-- this plugin for languages severs


return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({ -- NOTE: this just for install packages in mason!
				ensure_installed = { "lua_ls", "ts_ls", "gopls", "jdtls", "html", "cssls", "nil_ls" }
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local util = require("lspconfig/util")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP definition" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP implementation" })
			vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "LSP references" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })

			-- NOTE: In the bottom you gona to config you're LSP

			-- NIX
			lspconfig.nixd.setup({
				capabilities = capabilities,
				cmd = { "nixd" },
				filetypes = { "nix" },
				settings = {
					nixd = {
						expr = {
							"import <nixpkgs> { }",
							"import (builtins.getFlake \"github:0xravy/dotfiles\").inputs.nixpkgs { }",
						},
					},
					formatting = {
						command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
					},
					options = {
						nixos = {
							expr = "(builtins.getFlake \"github:0xravy/dotfiles\").nixosConfigurations.desktop.options",
						},
						home_manager = {
							expr = "(builtins.getFlake \"github:0xravy/dotfiles\").nixosConfigurations.desktop.options",
						},
					},
				},
			})

			-- LUA
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
			})

			-- TS/JS
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			--
			-- GO
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
					},
					analyses = {
						unusedparams = true,
					},
				},
			})

			-- JAVA
			lspconfig.jdtls.setup({
				capabilities = capabilities,
				cmd = { "/run/current-system/sw/bin/jdtls" },
				root_dir = util.root_pattern("gradlew", "mvnw", ".git"),
				filetypes = { "java" },
			})

			-- RUST
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				cmd = { "rust-analyzer" },
				filetypes = { "rust" },
				root_dir = util.root_pattern("Cargo.toml", ".git"),
				settings = {
					['rust-analyzer'] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})

			-- Svelte LSP setup
			lspconfig.svelte.setup({
				cmd = { "svelteserver", "--stdio" },
				filetypes = { "svelte" },
				root_dir = lspconfig.util.root_pattern("package.json", ".git"),
				settings = {
					svelte = {
						plugin = {
							svelte = {
								compilerWarnings = {
									enable = true
								}
							}
						}
					}
				}
			})

			-- Dart LSP setup
			lspconfig.dartls.setup({
				cmd = { "dart", "language-server", "--protocol=lsp" },
				filetypes = { "dart" },
				root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
			})
		end
	},
	{
		"rust-lang/rust.vim",
		ft = rust,
		init = function()
			vim.g.rustfmt_autosave = 1
		end
	},
	{
		"simrat39/rust-tools.nvim",
		ft = rust,
	},
}
