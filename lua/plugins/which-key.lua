return {
  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { 'n', 'v' },
      [']'] = { name = '+next' },
      ['['] = { name = '+prev' },
      ['<leader>b'] = { desc = 'buffer next/prev' },
      ['<leader>ch'] = { desc = 'code/chat gippity' },
      ['<leader>e'] = { desc = 'neotree' },
      ['<leader>g'] = { desc = 'git' },
      ['<leader>h'] = { desc = 'harpoon' },
      ['<leader>l'] = { desc = 'list session' },
      ['<leader>t'] = { desc = 'todo comments' },
      ['<leader>v'] = { desc = 'vim maximize' },
      ['<leader>x'] = { desc = 'trouble' },
      ['<leader>z'] = { desc = 'code folding' },
    },
  },
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    }
  end,
}
