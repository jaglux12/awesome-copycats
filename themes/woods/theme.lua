--[[
     
     Original:
     	Vertex Awesome WM theme
     	github.com/lcpz

     Modificado:
		Woods Awesome WM
		github.com/jaglux12

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local math, string, tag, tonumber, type, os = math, string, tag, tonumber, type, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.icon_dir                                  = os.getenv("HOME") .. "/.config/awesome/themes/woods/icons"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/woods/wallpapers/woods4.jpg"
theme.font                                      = "Arial 10"
theme.taglist_font                              = "FontAwesome 17"
theme.fg_normal                                 = "#707070"
theme.fg_focus                                  = "#ec831a"
theme.bg_focus                                  = "#000000"
theme.bg_focus2                                 = "#000000"
theme.bg_normal                                 = "#000000"
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#006B8E"
theme.border_width                              = dpi(2)
theme.border_normal                             = "#000000"
theme.border_focus                              = "#ec831a"
theme.tooltip_border_color                      = theme.fg_focus
theme.tooltip_border_width                      = theme.border_width
theme.menu_height                               = dpi(30)
theme.menu_width                                = dpi(140)
theme.taglist_squares_sel                       = gears.surface.load_from_shape(dpi(1), dpi(30), gears.shape.rectangle, theme.fg_focus)
theme.taglist_squares_unsel                     = gears.surface.load_from_shape(dpi(1), dpi(30), gears.shape.rectangle, theme.bg_focus2)

-- http://fontawesome.io/cheatsheet
awful.util.tagnames = { "", "" ,"","", "", "", "", "", "" }
local markup = lain.util.markup

-- Reloj y calendario de la parte superior
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
mytextclock = wibox.widget.textclock()

local cw = calendar_widget({
    theme = 'dark',
    placement = 'top_center',
    start_sunday = true,
    radius = 8,
    previous_month_button = 1,
    next_month_button = 3,
})
mytextclock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)


-- Batería (en caso de no tener - desactivarla)
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")

-- Porcentaje de uso de la CPU
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")

-- Control de volúmen
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')

-- Control para cerrar sesión
local logout_popup = require("awesome-wm-widgets.logout-popup-widget.logout-popup")

-- Velocidad de internet
local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")

-- Memoria RAM
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")

-- Launcher
local mylauncher = awful.widget.button({image = theme.awesome_icon})
mylauncher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

-- Separators
local space = wibox.widget.textbox(" ")
local rspace1 = wibox.widget.textbox()
local rspace0 = wibox.widget.textbox()
local rspace2 = wibox.widget.textbox()
local rspace3 = wibox.widget.textbox()
local rspace4 = wibox.widget.textbox()
local tspace1 = wibox.widget.textbox()
tspace1.forced_width = dpi(8)
rspace1.forced_width = dpi(8)
rspace0.forced_width = dpi(8)
rspace2.forced_width = dpi(8)
rspace3.forced_width = dpi(8)
rspace4.forced_width = dpi(8)


local lspace1 = wibox.widget.textbox()
local lspace2 = wibox.widget.textbox()
local lspace3 = wibox.widget.textbox()
lspace1.forced_height = dpi(18)
lspace2.forced_height = dpi(10)
lspace3.forced_height = dpi(16)

local barcolor = gears.color({
    type  = "linear",
    from  = { 0, dpi(46) },
    to    = { dpi(46), dpi(46) },
    stops = { {0, theme.bg_focus}, {0.9, theme.bg_focus2} }
})

local barcolor2 = gears.color({
    type  = "linear",
    from  = { 0, dpi(46) },
    to    = { dpi(46), dpi(46) },
    stops = { {0, "#000000"}, {1, theme.bg_normal} }
})

local dockshape = function(cr, width, height)
    gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, 5)
end

function theme.vertical_wibox(s)
    -- Create the vertical wibox
    s.dockheight = (50 *  s.workarea.height)/100

    s.myleftwibox = wibox({ screen = s, x=0, y=s.workarea.height/2 - s.dockheight/2, width = dpi(6), height = s.dockheight, fg = theme.fg_normal, bg = "#000000", ontop = true, visible = true, type = "dock" })

    if s.index > 1 and s.myleftwibox.y == 0 then
        s.myleftwibox.y = screen[1].myleftwibox.y
    end

    -- Add widgets to the vertical wibox
    s.myleftwibox:setup {
        layout = wibox.layout.align.vertical,
        {
            layout = wibox.layout.fixed.vertical,
            lspace1,
            s.mytaglist,
            lspace2
        },
    }

    -- Add toggling functionalities
    s.docktimer = gears.timer{ timeout = 2 }
    s.docktimer:connect_signal("timeout", function()
        local s = awful.screen.focused()
        s.myleftwibox.width = dpi(1)
        if s.docktimer.started then
            s.docktimer:stop()
        end
    end)
    tag.connect_signal("property::selected", function(t)
        local s = t.screen or awful.screen.focused()
        s.myleftwibox.width = dpi(40)
        --s.layoutb.visible = true
        --mylauncher.visible = true
        gears.surface.apply_shape_bounding(s.myleftwibox, dockshape)
        if not s.docktimer.started then
            s.docktimer:start()
        end
    end)

    s.myleftwibox:connect_signal("mouse::leave", function()
        local s = awful.screen.focused()
        s.myleftwibox.width = dpi(1)
       -- s.layoutb.visible = false
        --mylauncher.visible = false
    end)

    s.myleftwibox:connect_signal("mouse::enter", function()
        local s = awful.screen.focused()
        s.myleftwibox.width = dpi(38)
       -- s.layoutb.visible = true
        --mylauncher.visible = true
        gears.surface.apply_shape_bounding(s.myleftwibox, dockshape)
    end)
end


function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal, border = theme.border_width })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    s.mypromptbox.bg = "#e5be6f"

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    
    s.layoutb = s.mylayoutbox

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons, {
        font = theme.taglist_font,
        shape = gears.shape.rectangle,
        spacing = dpi(14),
        square_unsel = theme.square_unsel,
        bg_focus = barcolor
    }, nil, wibox.layout.fixed.vertical())

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.focused, awful.util.tasklist_buttons, { fg_focus = "#ffffff" })

    -- BarraSuperior
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(20), bg = "#252420" , fg = "white" })
    
    -- Barra inferior
    s.mywiboxbottom = awful.wibar({ position = "bottom", screen = s, height = dpi(24), bg = "#252420" , fg = "white" })

    -- Agregamos los widgets a la barra inferior
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mypromptbox
        },
        { -- Middle widgets
            layout = wibox.layout.flex.horizontal,
            max_widget_size = 1500,
            mytextclock
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget { nil, nil, nil, layout = wibox.layout.align.horizontal },
            net_speed_widget(),
            rspace0,
            cpu_widget({
				width = 40,
				step_width = 4,
				step_spacing = 0,
				color = '#ffffff'
			}),
			ram_widget({
				color_used = "#fb9c52",
				color_buf = "#ff7000",
				color_free = "#fefefe"
			}),
            rspace1,
            battery_widget(),
            rspace2,
            volume_widget{
				widget_type = 'arc',
				size = 25,
				mute_color = "#ff0404",
				main_color = "#04ff0b",
				bg_color = "#000000",
				thickness = 3
            },
            rspace0,
			logout_popup.widget{
				 bg_color = "#262832", accent_color = "#5d7797", text_color = '#66fce1', icon_size = 30,
				phrases = {""},},
        },
    }
    
    -- Agregamos los widgets a la barra inferior
	s.mywiboxbottom:setup {
        layout = wibox.layout.align.horizontal,
        {
	    -- Items de la izquierda
            layout = wibox.layout.fixed.horizontal,
            
        },
        -- Items del medio (lista de programas, generalmente muestra el nombre del programa activo)
        {
			layout = wibox.layout.fixed.horizontal,
			
        },
        {
	     -- Item de la derecha (layout manager)
            layout = wibox.layout.fixed.horizontal,
			s.layoutb,
        },
    
    }

    gears.timer.delayed_call(theme.vertical_wibox, s)
end

return theme
