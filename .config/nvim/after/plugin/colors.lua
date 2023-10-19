local api = vim.api

function ColorMyPencils(color)
	color = color or "nord"
	vim.cmd.colorscheme(color)

	api.nvim_set_hl(0, "Normal", { bg = "none" })
	api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
