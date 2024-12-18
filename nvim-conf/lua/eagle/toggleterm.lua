local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "vertical",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})


function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<C-Esc>', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

function _G.open_next_terminal()
	local terminals = require("toggleterm.terminal").get_all()
	local direction = terminals[1].direction
	Terminal:new({
		close_on_exit = true,
		direction = direction,
	}):toggle()
end

vim.api.nvim_set_keymap(
	"t",
	"<C-t-t>",
	"<cmd>lua open_next_terminal()<CR>",
	{ noremap = true, silent = true }
)

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

-- Annoying to use as you can't open splits easily in the current neovim session
-- local yazi = Terminal:new({ cmd = "yazi", hidden = true })
-- function _YAZI_TOGGLE()
-- 	yazi:toggle()
-- end

-- local node = Terminal:new({ cmd = "node", hidden = true })
--
-- function _NODE_TOGGLE()
-- 	node:toggle()
-- end

-- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
--
-- function _NCDU_TOGGLE()
-- 	ncdu:toggle()
-- end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
	python:toggle()
end
