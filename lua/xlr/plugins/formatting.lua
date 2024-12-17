return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c_sharp = { "csharpier", "ast-grep" },
				css = { "prettier", "stylelint" },
				html = { "prettier" },
				go = { "golines", "goimports-reviser", "ast-grep" },
				graphql = { "prettier" },
				java = { "google-java-format", "ast-grep" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua", "ast-grep" },
				markdown = { "markdown-toc", "prettier" },
				nix = { "nixfmt" },
				python = { "ruff", "ast-grep" },
				rust = { "ast-grep" },
				svelte = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
