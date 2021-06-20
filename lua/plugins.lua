local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"
local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    use {"neovim/nvim-lspconfig", opt = true}
    require_plugin("nvim-lspconfig")
    use {"glepnir/lspsaga.nvim", opt = true}
    require_plugin("lspsaga.nvim")
    use {"kabouzeid/nvim-lspinstall", opt = true}
    require_plugin("nvim-lspinstall")
    use {"folke/trouble.nvim", opt = true}
    require_plugin('trouble.nvim')

    -- Telescope
    use {"nvim-lua/popup.nvim", opt = true}
    require_plugin("popup.nvim")
    use {"nvim-lua/plenary.nvim", opt = true}
    require_plugin("plenary.nvim")
    use {"nvim-telescope/telescope.nvim", opt = true}
    require_plugin("telescope.nvim")
    use "nvim-telescope/telescope-project.nvim"
    require_plugin("telescope-project.nvim")
    use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}

    -- Terminal Integration
    use "akinsho/nvim-toggleterm.lua"
    use {'RishabhRD/popfix'}
    use {'RishabhRD/nvim-cheat.sh'}

    -- Debugging
    -- TODO replace with vimspector
    use 'puremourning/vimspector'
    use {"mfussenegger/nvim-dap", opt = true}
    require_plugin("nvim-dap")
    use 'szw/vim-maximizer'

    -- Autocomplete
    use {"hrsh7th/nvim-compe", opt = true}
    require_plugin("nvim-compe")
    use {"hrsh7th/vim-vsnip", opt = true}
    require_plugin("vim-vsnip")
    use {"rafamadriz/friendly-snippets", opt = true}
    require_plugin("friendly-snippets")
    use {"windwp/nvim-autopairs", opt = true}
    require_plugin("nvim-autopairs")

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    require_plugin("nvim-treesitter")
    use {"windwp/nvim-ts-autotag", opt = true}
    require_plugin("nvim-ts-autotag")
    use {'andymass/vim-matchup', opt = true}
    require_plugin('vim-matchup')

    -- Explorer
    use {"kyazdani42/nvim-tree.lua", opt = true}
    require_plugin("nvim-tree.lua")
    use {"ahmedkhalf/lsp-rooter.nvim", opt = true} -- with this nvim-tree will follow you
    require_plugin('lsp-rooter.nvim')
    use "kevinhwang91/rnvimr"
    require_plugin('lsp-rooter.nvim')

    -- Git
    use {"lewis6991/gitsigns.nvim", opt = true}
    require_plugin("gitsigns.nvim")
    use {'f-person/git-blame.nvim', opt = true}
    require_plugin("git-blame.nvim")
    use {'kdheepak/lazygit.nvim', opt = true}
    require_plugin('lazygit.nvim')

    -- Comments
    use {"terrortylor/nvim-comment", opt = true}
    require_plugin("nvim-comment")
    use {'JoosepAlviste/nvim-ts-context-commentstring', opt = true}
    require_plugin("nvim-ts-context-commentstring")

    -- Color
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
    require_plugin("nvcode-color-schemes.vim")

    -- Icons
    use {"kyazdani42/nvim-web-devicons", opt = true}
    require_plugin("nvim-web-devicons")

    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim", opt = true}
    require_plugin("galaxyline.nvim")
    use {"romgrk/barbar.nvim", opt = true}
    require_plugin("barbar.nvim")

    -- Zen Mode
    use {"Pocco81/TrueZen.nvim", opt = true}
    require_plugin("TrueZen.nvim")

    -- use {'lukas-reineke/indent-blankline.nvim', opt=true, branch = 'lua'}
    use {"folke/which-key.nvim", opt = true}
    require_plugin("which-key.nvim")
    use {"ChristianChiarulli/dashboard-nvim", opt = true}
    require_plugin("dashboard-nvim")
    use {"kevinhwang91/nvim-bqf", opt = true}
    require_plugin("nvim-bqf")
    use 'folke/todo-comments.nvim'
    require_plugin('todo-comments')
    use 'tpope/vim-surround'
    use 'unblevable/quick-scope'
    use 'wojtekmach/vim-rename'



    -- Extras
    if O.extras then
        use {'metakirby5/codi.vim', opt = true}
        require_plugin('codi.vim')
        use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', opt = true}
        require_plugin('markdown-preview.nvim')
        use {'monaqa/dial.nvim', opt = true}
        require_plugin('dial.nvim')
        use {'nacro90/numb.nvim', opt = true}
        require_plugin('numb.nvim')
        -- live html, css, and javascript editing might be useful one day
        -- use {'turbio/bracey.vim', run = 'npm install --prefix server', opt = true}
        -- require_plugin('bracey.vim')
        use {'phaazon/hop.nvim', opt = true}
        require_plugin('hop.nvim')
        use {'norcalli/nvim-colorizer.lua', opt = true}
        require_plugin('nvim-colorizer.lua')
        use {'windwp/nvim-spectre', opt = true}
        require_plugin('windwp/nvim-spectre')
        use {'simrat39/symbols-outline.nvim', opt = true}
        require_plugin('symbols-outline.nvim')
        use {'nvim-treesitter/playground', opt = true}
        require_plugin('playground')

        -- Note Taking

        use "oberblastmeister/neuron.nvim"
        use 'vimwiki/vimwiki'
        use 'ferrine/md-img-paste.vim'
        use 'jbyuki/nabla.nvim'
        use 'tjdevries/train.nvim'
        use {'michaelb/sniprun', run = 'bash install.sh'}
        use 'karb94/neoscroll.nvim'
        use "Pocco81/HighStr.nvim"
        use 'mizlan/iswap.nvim'
        use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

        use 'junegunn/fzf.vim'
        use 'fiatjaf/neuron.vim'

        use { 'vhyrro/neorg', requires = { 'nvim-lua/plenary.nvim' }}
        require_plugin('neorg')
        -- gennaro-tedesco/nvim-jqx
        -- TimUntersberger/neogit
        -- folke/lsp-colors.nvim

        -- Git
        -- TODO include lazygit
        -- use {'tpope/vim-fugitive', opt = true}
        -- use {'tpope/vim-rhubarb', opt = true}
        -- pwntester/octo.nvim

        -- Easily Create Gists
        -- use {'mattn/vim-gist', opt = true}
        -- use {'mattn/webapi-vim', opt = true}
    end

end)
