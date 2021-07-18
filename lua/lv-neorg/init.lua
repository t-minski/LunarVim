require('neorg').setup {
		load = {
            ["core.defaults"] = {},	-- Tells neorg to load the module called core.defaults with no extra data
			["core.norg.concealer"] = {}, -- Since this module isn't part of core.defaults, we can include it ourselves, like so
			["core.norg.dirman"] = {
                config = { -- Load a custom configuration

                      -- Define your workspaces here!
                      workspaces = {
                          -- You can give it any name and any directory, get creative!
                          my_workspace = "~/Documents/Zettelkasten",
                      },
                       
                      -- Automatically detect whenever we have entered a subdirectory of a workspace
                      autodetect = true,
                      -- Automatically change the directory to the root of the workspace every time 
                      autochdir = true,
                  }
        }, -- Loads the directory manager with no configuration
		},

        hook = function()
            -- This sets the leader for all Neorg keybinds. It is separate from the regular <Leader>,
            -- And allows you to shove every Neorg keybind under one "umbrella".
            local neorg_leader = "<Leader>o" -- You may also want to set this to <Leader>o for "organization"

            -- Require the user callbacks module, which allows us to tap into the core of Neorg
            local neorg_callbacks = require('neorg.callbacks')

            -- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
            -- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
            -- needs to reevaluate all the bound keys is invoked
            neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)

                -- Map all the below keybinds only when the "norg" mode is active
                keybinds.map_event_to_mode("norg", {
                    n = { -- Bind keys in normal mode

                        -- Keys for managing TODO items and setting their states
                        { "gtd", "core.norg.qol.todo_items.todo.task_done" },
                        { "gtu", "core.norg.qol.todo_items.todo.task_undone" },
                        { "gtp", "core.norg.qol.todo_items.todo.task_pending" },
                        { "gtt", "core.norg.qol.todo_items.todo.task_cycle" }

                    },
                }, { silent = true, noremap = true })

        end)

        end
}
