return {
    "scottmckendry/cyberdream.nvim",
	config=function()
		require('cyberdream').setup({
            variant="dark",
			transparent=true,
            italic_comments = false,
		});
		-- vim.cmd("colorscheme cyberdream");
	end
}
