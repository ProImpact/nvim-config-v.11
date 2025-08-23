return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			--			lua = { "selene" },
			-- sh = { "shellcheck" },
			-- python = { "flake8" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("LintingGroup", { clear = true }),
			callback = function()
				local file_path = vim.fn.expand("%:p")
				if file_path == "" then
					return
				end
				local stat = vim.loop.fs_stat(file_path)
				if stat and stat.size < 1024 * 100 and vim.bo.filetype ~= "git" and vim.bo.filetype ~= "netrw" then
					lint.try_lint()
				end
			end,
		})
	end,
}
