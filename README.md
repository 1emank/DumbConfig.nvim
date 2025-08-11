# DumbConfig.nvim

This is probably the simplest plugin out there. More than a plugin it's a
"hack" to allow you to run arbitrary code during startup. Very useful to manage
your configuration (hence, the name).

## Installation

Using lazy.nvim:
```lua
{
    '1emank/dumbconfig.nvim',
    lazy = false,
    priority = 1000,
    opts = {}
}
```

## Options

This by itself doesn't do anything though. You provide the configuration by
creating functions, you can give the config in a table with names, without
names, or just a function instead of a table:

```lua
local function keybinds ()
    -- Your vim.keymap.set bindings
end
{
    '1emank/dumbconfig.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        keybinds = keybinds,
        commands = function ()
            -- Your vim.api.nvim_create_user_command stuff
        end,
        function ()
            -- Your vim.o stuff for example
        end
    }
}

```

or just:

```lua
local function config ()
    -- Your config
end
{
    '1emank/dumbconfig.nvim',
    lazy = false,
    priority = 1000,
    opts = config
}
```

IMPORTANT: DumbConfig.nvim runs the config functions in the order you provide
them. If you modify the same setting in two different places or some settings
require some previous steps, and you don't get the expected outcome, you may
have to change the order of operations.

## Future

I'm currently investigating how to make it so the config reloads itself when
modified. Supposedly, Lazy.nvim does this automatically, but it doesn't seem to
work every time. You can always use `:Lazy reload DumbConfig.nvim`.
