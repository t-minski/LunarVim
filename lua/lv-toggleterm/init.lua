require('toggleterm').setup({
	size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	start_in_insert = true,
	persist_size = true,
	direction = 'vertical',
	close_on_exit = true,
	float_opts = {
		border = 'curved',
		-- width = Doom.terminal_width,
		-- height = Doom.terminal_height,
		winblend = 3,
		highlights = {
			border = 'Special',
			background = 'Normal',
		},
	},
})


-- lazygit
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "curved",
  },

  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>bdelete!<CR>", {noremap = true, silent = true})
  end,

  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd(":bdelete!")
  end,
  close_on_exit = true,
  hidden = true,
})

function _lazygit_toggle()
  lazygit:toggle()
end

local spotify = Terminal:new({
  cmd = "spotifyd && spt",
  direction = "float",
  float_opts = {
    border = "curved",
  },

  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>bdelete!<CR>", {noremap = true, silent = true})
  end,

  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd(":bdelete!")
  end,
  close_on_exit = true,
  hidden = true,
})

function _spotify_toggle()
  spotify:toggle()
end

local glow = Terminal:new({
  cmd = "glow",
  direction = "float",
  float_opts = {
    border = "curved",
  },

  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>bdelete!<CR>", {noremap = true, silent = true})
  end,

  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd(":bdelete!")
  end,
  close_on_exit = true,
  hidden = true,
})

function _glow_toggle()
  glow:toggle()
end

