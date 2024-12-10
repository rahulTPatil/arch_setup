local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { '/usr/bin/fish', '-l' }

config.color_scheme = 'Tokyo Night'
config.font = wezterm.font 'FiraMono Nerd Font'
config.initial_rows = 50
config.initial_cols = 140
config.window_decorations = 'RESIZE'
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_max_width = 32
config.hide_tab_bar_if_only_one_tab = false
config.tab_and_split_indices_are_zero_based = true


-- Copy Pasta from Windows config file

config.keys = {
    -- panes
    {key="h", mods="ALT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},    
    {key="v", mods="ALT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},    
    {key="LeftArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},    
    {key="RightArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},    
    {key="UpArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Up"}},    
    {key="DownArrow", mods="ALT", action=wezterm.action{ActivatePaneDirection="Down"}},        

    -- resize panes
    {key="h", mods="ALT|SHIFT",action=wezterm.action{AdjustPaneSize={"Left", 3}}},
    {key="l", mods="ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 3}}},
    {key="k", mods="ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 3}}},
    {key="j", mods="ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 3}}},

    -- switch panes
    {key="Tab", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Next"}},
    --[[ {key="Tab", mods="CTRL|SHIFT", action=wezterm.action{ActivatePaneDirection="Prev"}}, --]]


    -- workspace management (tabs)
    {key="t", mods="ALT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    {key="w", mods="ALT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
    {key="RightArrow", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},
    --[[ {key="LeftArrow", mods="ALT|SHIFT", action=wezterm.action{ActivateTabRelative=-1}}, --]]

    -- Rename the current tab (bind to ALT + r)    
    {key="r", mods="ALT", action=wezterm.action{PromptInputLine={
        description = "Enter new name for tab",
        action = wezterm.action_callback(function(window, pane, line)
            if line then
                window:active_tab():set_title(line)
            end
        end),
    }}},
    -- quit
    {key="q", mods="ALT", action=wezterm.action{CloseCurrentPane={confirm=true}}}, 
}

return config
