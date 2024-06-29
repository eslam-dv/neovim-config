return {
	-- Dressing
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	-- Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	-- Indentline
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {},
	},
	-- Comment
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
