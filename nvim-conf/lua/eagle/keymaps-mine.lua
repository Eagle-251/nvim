local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- General mappings
keymap('n', '<leader>h', '<cmd>noh<CR>', opts)

-- Create file under cursor and open it ---
keymap('n', 'nf', '<cmd>e %:p:h/<cfile><CR>', opts)

-- Yazi file manager
keymap('n', '<leader>e', '<cmd>Yazi<CR>', opts)
-- keymap('n', '<leader>y', '<cmd>lua _YAZI_TOGGLE()<CR>', opts)

-- Tab navigation
-- keymap('n', '<M-Tab>', '<cmd>tabnext<CR>', opts)
-- keymap('n', '<M-Tab>', '<cmd>tabprevious<CR>', opts)
keymap('n', '<leader>1', '1gt')
keymap('n', '<leader>2', '2gt')
keymap('n', '<leader>3', '3gt')
keymap('n', '<leader>4', '4gt')
keymap('n', '<leader>5', '5gt')
keymap('n', '<leader>6', '6gt')
keymap('n', '<leader>7', '7gt')
keymap('n', '<leader>8', '8gt')
keymap('n', '<leader>9', '9gt')
keymap('n', '<leader>0', '<cmd>tablast<cr>')

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window navigation (terminal mode)
keymap('t', '<M-C-H>', '<Cmd>wincmd h<CR>', term_opts)
keymap('t', '<M-C-L>', '<Cmd>wincmd l<CR>', term_opts)
keymap('t', '<M-C-J>', '<Cmd>wincmd j<CR>', term_opts)
keymap('t', '<M-C-K>', '<Cmd>wincmd k<CR>', term_opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Telescope mappings
keymap('n', '<leader><leader>', '<cmd>Telescope find_files<CR>', opts)
keymap('n', '<leader>fk', '<cmd>Telescope keymaps<CR>', opts)
keymap('n', '<leader>fs', '<cmd>Telescope spell_suggest<CR>', opts)
keymap('n', '<leader>fc', '<cmd>Telescope commands<CR>', opts)
keymap('n', '<leader>fm', '<cmd>Telescope man_pages<CR>', opts)
keymap('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', opts)
keymap('n', '<leader>fj', '<cmd>Telescope jumplist<CR>', opts)
keymap('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
keymap('n', '<leader>fa', '<cmd>Telescope<CR>', opts)
keymap('n', '<leader>fls', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts)

-- Git related
-- keymap('n', '<leader>g', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', opts)
-- keymap('n', '<leader>gf', '<cmd>LazyGitCurrentFile<CR>', opts)
keymap('n', '<leader>fgs', '<cmd>Telescope git_status<CR>', opts)
keymap('n', '<leader>fgS', '<cmd>Telescope git_stash<CR>', opts)

-- LSP and diagnostics
keymap('n', '<leader>lo', '<cmd>Lspsaga outline<CR>', opts)
keymap('n', '<leader>x', '<cmd>TroubleToggle<CR>', opts)

-- Terminal
keymap('n', '<C-S-\\>', '<cmd>ToggleTerm size=95 direction=vertical<CR>', opts)
keymap('n', '<M-C-\\>', '<cmd>ToggleTerm direction=horizontal<CR>', opts)
keymap({ 'n', 't' }, '<C-\\>', '<cmd>ToggleTerm direction=float<CR>', opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode 
-- keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)
