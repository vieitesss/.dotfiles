--[[
--

     Awesome WM configuration template
     github.com/lcpz

--]]

-- {{{ Required libraries

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local menubar       = require("menubar")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup")
                      require("awful.hotkeys_popup.keys")
local mytable       = awful.util.table or gears.table -- 4.{0,1} compatibility
--local volume_control = require("volume_control")

-- }}}

-- {{{ Error handling

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify {
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    }
end

-- Handle runtime errors after startup
do
    local in_error = false

    awesome.connect_signal("debug::error", function (err)
        if in_error then return end

        in_error = true

        naughty.notify {
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        }

        in_error = false
    end)
end

-- }}}

-- {{{ Autostart windowless processes

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ "urxvtd", "unclutter -root" }) -- comma-separated entries

-- This function implements the XDG autostart specification
--[[
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
--]]

-- }}}

-- {{{ Variable definitions

local themes = {
    "blackburn",       -- 1
    "copland",         -- 2
    "dremora",         -- 3
    "holo",            -- 4
    "multicolor",      -- 5
    "powerarrow",      -- 6
    "powerarrow-dark", -- 7
    "rainbow",         -- 8
    "steamburn",       -- 9
    "vertex"           -- 10
}
local chosen_theme = "powerarrow"
local modkey       = "Mod4"
local altkey       = "Mod1"
local terminal     = "/home/vieites/.cargo/bin/alacritty"
local vi_focus     = false -- vi-like client focus https://github.com/lcpz/awesome-copycats/issues/275
local cycle_prev   = true  -- cycle with only the previously focused client or all https://github.com/lcpz/awesome-copycats/issues/274
local editor       = "vim"
local browser      = "firefox"
local discord      = "/opt/Discord/Discord"
--local volumecfg = volume_control({})

--awful.util.volumecfg = volumecfg
awful.util.terminal = terminal
awful.util.tagnames = { "1", "2" }
awful.layout.layouts = {
    --awful.layout.suit.floating,
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --lain.layout.magnifier,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
    --lain.layout.cascade,
    --lain.layout.cascade.tile,
    --lain.layout.centerwork,
    --lain.layout.centerwork.horizontal,
    --lain.layout.termfair,
    --lain.layout.termfair.center
}

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = 2
lain.layout.cascade.tile.offset_y      = 32
lain.layout.cascade.tile.extra_padding = 5
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

awful.util.taglist_buttons = mytable.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.util.tasklist_buttons = mytable.join(
     awful.button({ }, 1, function(c)
         if c == client.focus then
             c.minimized = true
         else
             c:emit_signal("request::activate", "tasklist", { raise = true })
         end
     end),
     awful.button({ }, 3, function()
         awful.menu.client_list({ theme = { width = 250 } })
     end),
     awful.button({ }, 4, function() awful.client.focus.byidx(1) end),
     awful.button({ }, 5, function() awful.client.focus.byidx(-1) end)
)

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

-- }}}

-- {{{ Menu

-- Create a launcher widget and a main menu
local myawesomemenu = {
   { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Manual", string.format("%s -e man awesome", terminal) },
   { "Edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
   { "Restart", awesome.restart },
   { "Quit", function() awesome.quit() end },
}

--awful.util.mymainmenu = freedesktop.menu.build {
--    before = {
--        { "Awesome", myawesomemenu, beautiful.awesome_icon},
--    },
--    after = {
--        { "Open terminal", terminal },
--    }
--}

awful.util.mymainmenu = awful.menu({ items = 
    {
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        { "Shut down", "systemctl poweroff" },
        { "Reboot", "systemctl reboot" },
        { "Open terminal", terminal },
    }
})

-- Hide the menu when the mouse leaves it
--[[
awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function()
    if not awful.util.mymainmenu.active_child or
       (awful.util.mymainmenu.wibox ~= mouse.current_wibox and
       awful.util.mymainmenu.active_child.wibox ~= mouse.current_wibox) then
        awful.util.mymainmenu:hide()
    else
        awful.util.mymainmenu.active_child.wibox:connect_signal("mouse::leave",
        function()
            if awful.util.mymainmenu.wibox ~= mouse.current_wibox then
                awful.util.mymainmenu:hide()
            end
        end)
    end
end)
--]]

-- Set the Menubar terminal for applications that require it
--menubar.utils.terminal = terminal

-- }}}

-- {{{ Screen

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized or c.fullscreen then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width
        end
    end
end)

-- TYRANNICAL ------

local tyrannical = require("tyrannical")

tyrannical.tags = {
    {
        name        = "1",                 -- Call the tag "Term"
        init        = true,                   -- Load the tag on startup
        exclusive   = true,                   -- Refuse any other type of clients (by classes)
        screen      = {1,2},                  -- Create this tag on screen 1 and screen 2
        layout      = awful.layout.suit.tile, -- Use the tile layout
        instance    = {"dev", "ops"},         -- Accept the following instances. This takes precedence over 'class'
        class       = { --Accept the following classes, refuse everything else (because of "exclusive=true")
            "xterm" , "urxvt" , "aterm","URxvt","XTerm","konsole","terminator","gnome-terminal","alacritty"
        }
    } ,
    {
        name        = "2", --Browser
        init        = true,
        exclusive   = true,
      --icon        = "~net.png",                 -- Use this icon for the tag (uncomment with a real path)
        screen      = screen.count()>1 and 2 or 1,-- Setup on screen 2 if there is more than 1 screen, else on screen 1
        layout      = awful.layout.suit.tile,      -- Use the max layout
        class = {
            "Opera"         , "Firefox"        , "Rekonq"    , "Dillo"        , "Arora",
            "Chromium"      , "nightly"        , "minefield"     }
    } ,
    {
        name        = "3", --Files
        init        = false,
        exclusive   = true,
        screen      = 1,
        layout      = awful.layout.suit.tile,
        exec_once   = {"dolphin"}, --When the tag is accessed for the first time, execute this command
        class  = {
            "Thunar", "Konqueror", "Dolphin", "ark", "Nautilus","emelfm"
        }
    } ,
    {
        name        = "4", --Develop
        init        = true,
        exclusive   = true,
        screen      = 1,
        layout      = awful.layout.suit.tile                          ,
        class ={
            "Kate", "KDevelop", "Codeblocks", "Code::Blocks" , "DDD", "kate4", "VirtualBox",
            "VirtualBox Manager", "VirtualBox Machine", "RStudio", "Rcommander", "TkFDialog",
            "Toplevel", "com-cburch-logisim-Main"
        }
    } ,
    {
        name        = "5", --Doc
        init        = false, -- This tag wont be created at startup, but will be when one of the
                             -- client in the "class" section will start. It will be created on
                             -- the client startup screen
        exclusive   = true,
        layout      = awful.layout.suit.tile,
        class       = {
            "Assistant"     , "Okular"         , "Evince"    , "EPDFviewer"   , "xpdf",
            "Xpdf"          ,                                        }
    } ,
}

-- Ignore the tag "exclusive" property for the following clients (matched by classes)
tyrannical.properties.intrusive = {
    "ksnapshot"     , "pinentry"       , "gtksu"     , "kcalc"        , "xcalc"               ,
    "feh"           , "Gradient editor", "About KDE" , "Paste Special", "Background color"    ,
    "kcolorchooser" , "plasmoidviewer" , "Xephyr"    , "kruler"       , "plasmaengineexplorer",
}

-- Ignore the tiled layout for the matching clients
tyrannical.properties.floating = {
    "MPlayer"      , "pinentry"        , "ksnapshot"  , "pinentry"     , "gtksu"          ,
    "xine"         , "feh"             , "kmix"       , "kcalc"        , "xcalc"          ,
    "yakuake"      , "Select Color$"   , "kruler"     , "kcolorchooser", "Paste Special"  ,
    "New Form"     , "Insert Picture"  , "kcharselect", "mythfrontend" , "plasmoidviewer" ,
    "VirtualBox Manager",
}

-- Make the matching clients (by classes) on top of the default layout
tyrannical.properties.ontop = {
    "Xephyr"       , "ksnapshot"       , "kruler"
}

-- Force the matching clients (by classes) to be centered on the screen on init
tyrannical.properties.placement = {
    kcalc = awful.placement.centered
}

tyrannical.settings.block_children_focus_stealing = true --Block popups ()
tyrannical.settings.group_children = true --Force popups/dialogs to have the same tags as the parent client

-- TYRANNICAL -------

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) 
    beautiful.at_screen_connect(s)
end)

-- }}}

function getOption(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local function delete_tag()
    local t = awful.screen.focused().selected_tag
    if not t then return end
    t:delete()
end

local function add_tag()
    awful.tag.add("4", {
        screen = awful.screen.focused(),
        layout = awful.layout.suit.tile }):view_only()

    rename_tag()
end

function rename_tag()
    newName = getOption('echo \"Term\nBrowser\nFiles\nDevelop\nDoc\" | rofi -theme \"/home/vieites/.config/polybar/forest/scripts/rofi/confirm.rasi\" -dmenu -i -no-fixed-num-lines -p \"Tag name:\"', nil)

    if newName == "Term" then
        newName = "1"
    elseif newName == "Browser" then
        newName = "2"
    elseif newName == "Files" then
        newName = "3"
    elseif newName == "Develop" then
        newName = "4"
    elseif newName == "Doc" then
        newName = "5"
    else
        return
    end

    local t = awful.screen.focused().selected_tag
    if t then
        t.name = newName
    end
end

local function move_to_new_tag()
    local c = client.focus
    if not c then return end

    local t = awful.tag.add(c.class,{screen= c.screen })
    c:tags({t})
    t:view_only()

    rename_tag()
end


function tags()
    ans = getOption('echo \" \n[n]ew\n[r]ename\n[d]elete\n[m]ove\" | rofi -theme \"/home/vieites/.config/polybar/forest/scripts/rofi/confirm.rasi\" -dmenu -i -no-fixed-num-lines -p \"Acción:\"', nil)

    if ans == "[n]ew" then
        add_tag()
    elseif ans == "[r]ename" then
        rename_tag()
    elseif ans == "[d]elete" then
        delete_tag()
    elseif ans == "[m]ove" then
        move_to_new_tag()
    else
        return
    end
end

-- {{{ Mouse bindings

root.buttons(mytable.join(
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- }}}

-- {{{ Key bindings

globalkeys = mytable.join(

    -- Then **IN THE globalkeys TABLE** add a new shortcut
    awful.key({ modkey }, "e", tags,
        {description = "Echo a string", group = "custom"}),

    -- Destroy all notifications
    awful.key({ "Control",           }, "space", function() naughty.destroy_all_notifications() end,
              {description = "destroy all notifications", group = "hotkeys"}),

    --awful.key({  })

    -- Show help
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

    -- Non-empty tag browsing
    awful.key({ altkey }, "Left", function () lain.util.tag_view_nonempty(-1) end,
              {description = "view  previous nonempty", group = "tag"}),
    awful.key({ altkey }, "Right", function () lain.util.tag_view_nonempty(1) end,
              {description = "view  previous nonempty", group = "tag"}),

    -- By-direction client focus
    awful.key({ modkey }, "j",
        function()
            awful.client.focus.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey }, "k",
        function()
            awful.client.focus.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
    awful.key({ modkey }, "h",
        function()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey }, "l",
        function()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),

    -- Menu
    awful.key({ modkey,           }, "w", function () awful.util.mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.global_bydirection("down")    end,
              {description = "swap with down client", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.global_bydirection("up")    end,
              {description = "swap with up client", group = "client"}),
    awful.key({ modkey, "Shift"   }, "h", function () awful.client.swap.global_bydirection("left")    end,
              {description = "swap with left client", group = "client"}),
    awful.key({ modkey, "Shift"   }, "l", function () awful.client.swap.global_bydirection("right")    end,
              {description = "swap with right client", group = "client"}),
    awful.key({ altkey,           }, "h", function() awful.tag.incmwfact(-0.05) end,
              {description = "decrease master width factor"}),
    awful.key({ altkey,           }, "l", function() awful.tag.incmwfact(0.05) end,
              {description = "increase master width factor"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            if cycle_prev then
                awful.client.focus.history.previous()
            else
                awful.client.focus.byidx(-1)
            end
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "cycle with previous/go back", group = "client"}),

    -- On-the-fly useless gaps change
    awful.key({ altkey, "Control" }, "=", function () lain.util.useless_gaps_resize(1) end,
              {description = "increment useless gaps", group = "tag"}),
    awful.key({ altkey, "Control" }, "-", function () lain.util.useless_gaps_resize(-1) end,
              {description = "decrement useless gaps", group = "tag"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn.with_shell(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey,           }, "q", function() awful.spawn.with_shell("~/.config/polybar/forest/scripts/powermenu.sh") end,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ altkey,           }, "a", function() awful.spawn.with_shell(string.format("%s -e %s %s", terminal, editor, awesome.conffile)) end,
              {desciption = "open awesome rc.lua", group = "awesome"}),

    awful.key({ modkey, "Control" }, "n", function ()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
            c:emit_signal("request::activate", "key.unminimize", {raise = true})
        end
    end, {description = "restore minimized", group = "client"}),

    -- Widgets popups
    awful.key({ altkey, }, "c", function () if beautiful.cal then beautiful.cal.show(7) end end,
              {description = "show calendar", group = "widgets"}),

    -- Alacritty font size
    awful.key({ modkey, "Shift"}, ".", function () os.execute(string.format("file=$HOME/.config/alacritty/alacritty.yml && cambiar=$(sed '153!d' $file) && sed -i \"s/$cambiar/  size: $(($(echo \"$cambiar\" | awk '{print $2}') + 1))/\" $file")) end,
              {description = "+1 alacritty font", group = "hotkeys"}),

    awful.key({ modkey, "Shift"}, ",", function () os.execute(string.format("file=$HOME/.config/alacritty/alacritty.yml && cambiar=$(sed '153!d' $file) && sed -i \"s/$cambiar/  size: $(($(echo \"$cambiar\" | awk '{print $2}') - 1))/\" $file")) end,
              {description = "-1 alacritty font", group = "hotkeys"}),

    -- Screen brightness
    -- awful.key({  }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 10") end,
    --           {description = "+10%", group = "hotkeys"}),
    -- awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 3") end,
    --           {description = "-10%", group = "hotkeys"}),
    -- mac
    awful.key({  }, "XF86MonBrightnessUp", function () awful.spawn.with_shell(string.format("sudo echo $(($(sudo cat %s) +3)) > %s", os.getenv("HOME") .. "/brightness", os.getenv("HOME") .. "/brightness")) end,
              {description = "+10%", group = "hotkeys"}),
    awful.key({  }, "XF86MonBrightnessDown", function () os.execute(string.format("sudo echo $(($(sudo cat %s) -3)) > %s", os.getenv("HOME") .. "/brightness", os.getenv("HOME") .. "/brightness")) end,
              {description = "-10%", group = "hotkeys"}),

    awful.key({ modkey }, "=", function () 
        os.execute("xrandr --output DVI-D-0 --brightness 1") 
        os.execute("xrandr --output HDMI-0 --brightness 1") 
        os.execute("xrandr --output DP-0 --brightness 1") 
    end,
              {description = "+10%", group = "hotkeys"}),
    awful.key({ modkey }, "-", function () 
        os.execute("xrandr --output DVI-D-0 --brightness 0.7") 
        os.execute("xrandr --output HDMI-0 --brightness 0.7") 
        os.execute("xrandr --output DP-0 --brightness 0.7") 
    end,
              {description = "-10%", group = "hotkeys"}),
    -- Volume
    awful.key({  }, "XF86AudioRaiseVolume", function () awful.spawn.with_shell("amixer -D pulse sset Master 5%+") end,
              {description = "+5% volume", group = "hotkeys"}),
    awful.key({  }, "XF86AudioLowerVolume", function () os.execute("amixer -D pulse sset Master 5%-") end,
              {description = "-5% volume", group = "hotkeys"}),
    awful.key({  }, "XF86AudioMute", function () os.execute("amixer -D pulse sset Master 0%") end,
              {description = "0% volume", group = "hotkeys"}),

    --KBD Brightness
    awful.key({  }, "XF86KbdBrightnessUp", function () awful.spawn.with_shell(string.format("sudo echo $(($(sudo cat %s) +10)) > %s", os.getenv("HOME") .. "/kbdbrightness", os.getenv("HOME") .. "/kbdbrightness")) end,
              {description = "+5% kbd up", group = "hotkeys"}),
    awful.key({  }, "XF86KbdBrightnessDown", function () os.execute(string.format("sudo echo $(($(sudo cat %s) -10)) > %s", os.getenv("HOME") .. "/kbdbrightness", os.getenv("HOME") .. "/kbdbrightness")) end,
              {description = "-5% kbd down", group = "hotkeys"}),

    -- Data bar
    awful.key({ modkey }, "c", function () awful.spawn.with_shell(string.format("%s/.config/polybar/forest/scripts/data.sh", os.getenv("HOME"))) end,
              {description = "show data", group = "hotkeys"}),

    --Flameshot
    awful.key({ modkey, "Shift" }, "p", function () os.execute("flameshot gui") end,
              {description = "Screenshot", group = "hotkeys"}),
    awful.key({ modkey, "Shift" }, "f", function () os.execute("flameshot full -c") end,
              {description = "Screenshot", group = "hotkeys"}),

    -- Copy primary to clipboard (terminals to gtk)
    -- awful.key({ modkey }, "c", function () awful.spawn.with_shell("xsel | xsel -i -b") end,
    --           {description = "copy terminal to gtk", group = "hotkeys"}),
    -- Copy clipboard to primary (gtk to terminals)
    awful.key({ modkey }, "v", function () awful.spawn.with_shell("xsel -b | xsel") end,
              {description = "copy gtk to terminal", group = "hotkeys"}),

    -- User programs
    awful.key({ modkey }, "d", function () awful.spawn.with_shell(discord) end,
              {description = "run discord", group = "launcher"}),
    awful.key({ modkey }, "b", function () awful.spawn(browser) end,
              {description = "run browser", group = "launcher"}),

    -- Default
    --awful.key({ modkey }, "p", function() menubar.show() end,
              --{description = "show the menubar", group = "launcher"}),
    awful.key({ modkey }, "p", function() awful.spawn.with_shell("~/.config/polybar/forest/scripts/launcher.sh") end,
              {description = "show the menubar", group = "launcher"})
    --[[dmenu
    awful.key({ modkey }, "x", function ()
            os.execute(string.format("dmenu_run -i -fn 'Monospace' -nb '%s' -nf '%s' -sb '%s' -sf '%s'",
            beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus))
        end,
        {description = "show dmenu", group = "launcher"}),
    --]]
    -- alternatively use rofi, a dmenu-like application with more features
    -- check https://github.com/DaveDavenport/rofi for more details
    --[[ rofi
    awful.key({ modkey }, "x", function ()
            os.execute(string.format("rofi -show %s -theme %s",
            'run', 'dmenu'))
        end,
        {description = "show rofi", group = "launcher"}),
    --]]
    -- Prompt
    -- awful.key({ modkey }, "r", function () awful.screen.focused().mypromptbox:run() end,
    --           {description = "run prompt", group = "launcher"})

--    awful.key({ modkey }, "x",
--              function ()
--                  awful.prompt.run {
--                    prompt       = "Run Lua code: ",
--                    textbox      = awful.screen.focused().mypromptbox.widget,
--                    exe_callback = awful.util.eval,
--                    history_path = awful.util.get_cache_dir() .. "/history_eval"
--                  }
--              end,
--              {description = "lua execute prompt", group = "awesome"})
    --]]
)

clientkeys = mytable.join(
    awful.key({ altkey, "Shift"   }, "m",      lain.util.magnify_client,
              {description = "magnify client", group = "client"}),
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = mytable.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = mytable.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)

-- }}}

-- {{{ Rules

local number_of_screens = 0

awful.screen.connect_for_each_screen(function(s)
    number_of_screens = number_of_screens + 1
end)

if number_of_screens > 1 then
    number_of_screens = 2
end

--naughty.notify({ title = "Number of screens " .. number_of_screens, timeout = 5 })

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = false
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer",
          "Gnome-control-center",
          "Org.gnome.Nautilus",
          "TopLevelShell",
          "XPaint_es",
          "GNU Octave",
          "VirtualBox Manager",
          "VirtualBox",
          "Rcommander",
          "Toplevel",
          "TkFDialog"
        },

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { 
          floating = true,
          placement = awful.placement.centered
      }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    -- Set Discord to always map on the screen 2.
    { rule = { name = "Discord" },
      properties = { screen = number_of_screens, tag = "1" } },
}

-- }}}

-- {{{ Signals

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = mytable.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, { size = 4 }) : setup {
        { -- Left
            --awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            --{ -- Title
            --    align  = "center",
            --    widget = awful.titlebar.widget.titlewidget(c)
            --},
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            --awful.titlebar.widget.floatingbutton (c),
            --awful.titlebar.widget.maximizedbutton(c),
            --awful.titlebar.widget.stickybutton   (c),
            --awful.titlebar.widget.ontopbutton    (c),
            --awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
--    c:emit_signal("request::activate", "mouse_enter", {raise = vi_focus})
--end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- }}}
autorun=true
autorunApps={
    "$HOME/.config/awesome/initawesome.sh",
    "~/.config/polybar/forest/launch.sh",
    "~/.config/polybar/forest/scripts/bat_alarm.sh",
    "dunst"
}

if autorun then
    for app = 1, #autorunApps do
        awful.spawn.with_shell(autorunApps[app])
    end
end

