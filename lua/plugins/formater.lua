return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			go = { "goimports", "gofmt" },
			javascript = { { "prettierd", "prettier" } },
		},
	},
}
