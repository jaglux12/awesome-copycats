--[[

     Tema original:
     	Powerarrow Awesome WM theme
     	github.com/lcpz

	 Powercolors:
		Powercolors Awesome WM theme
		github.com/jaglux12

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local math, string, os = math, string, os
local my_table = awful.util.table or gears.table

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powercolors"

-- Fondo de pantalla
theme.wallpaper                                 = theme.dir .. "/wallpaper/background.png"

-- Fuente
theme.font                                      = "Terminus 10"

-- Colores
theme.fg_normal                                 = "#FEFEFE"
theme.fg_focus                                  = "#32D6FF"
theme.fg_urgent                                 = "#C83F11"
theme.bg_normal                                 = "#222222"
theme.bg_focus                                  = "#1E2320"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_focus                          = "#00CCFF"
theme.tasklist_bg_focus                         = "#222222"
theme.tasklist_fg_focus                         = "#FFFFFF"
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#6F6F6F"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus

-- Tamaños
theme.border_width                              = dpi(10)
theme.menu_height                               = dpi(30)
theme.menu_width                                = dpi(160)

-- Iconos
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_brightness                         = theme.dir .. "/icons/reloj.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_task                               = theme.dir .. "/icons/task.png"
theme.widget_scissors                           = theme.dir .. "/icons/reloj.png"
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 0


local markup = lain.util.markup
local separators = lain.util.separators
local white = theme.fg_focus

-- Reloj
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")

mytextclock = wibox.widget.textclock()
local cw = calendar_widget({
    theme = 'dark',
    placement = 'top_right',
    start_sunday = true,
    radius = 8,
    previous_month_button = 1,
    next_month_button = 3,
})
mytextclock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)


-- Batería
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")

-- Memoria RAM utilizada
local memicon = wibox.widget.imagebox(theme.widget_mem)
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")

-- Muestra el uso de la CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Muestra la temperatura de los núcleos - Coretemp (lain, average)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})

local tempicon = wibox.widget.imagebox(theme.widget_temp)

-- Muestra el uso de internet
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#FFFFFF", " " .. net_now.received .. " ↓↑ " .. net_now.sent .. " "))
    end
})

-- Brigtness
local brighticon = wibox.widget.imagebox(theme.widget_brightness)

-- Separators
local arrow = separators.arrow_left

function theme.powerline_rl(cr, width, height)
    local arrow_depth, offset = height/2, 0

    -- Avoid going out of the (potential) clip area
    if arrow_depth < 0 then
        width  =  width + 2*arrow_depth
        offset = -arrow_depth
    end

    cr:move_to(offset + arrow_depth         , 0        )
    cr:line_to(offset + width               , 0        )
    cr:line_to(offset + width - arrow_depth , height/2 )
    cr:line_to(offset + width               , height   )
    cr:line_to(offset + arrow_depth         , height   )
    cr:line_to(offset                       , height/2 )

    cr:close_path()
end

local function pl(widget, bgcolor, padding)
    return wibox.container.background(wibox.container.margin(widget, dpi(16), dpi(16)), bgcolor, theme.powerline_rl)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

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

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Creamos las barras de herramientas
    -- Barra superior (muestra la hora, cpu en uso, net, etc)
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })
    
    -- Barra inferior (muestra el nombre del programa en uso y el layout manager)
    s.mywiboxbottom = awful.wibar({ position = "bottom", screen = s, height = dpi(18), bg = theme.bg_normal, fg = "white" })

    -- Add widgets to the wibox / Agregamos los widgets de la barra superior
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets / Items de la izquierda (lista de "pantallas", y prompt para ejecutar programas)
            layout = wibox.layout.fixed.horizontal,
	    s.mytaglist,
	    s.mypromptbox,
        },
	nil,
        {
	    -- Items de la derecha (memoria ram,cpu,temperatura,net,hora)
        layout = wibox.layout.fixed.horizontal,
        
	    battery_widget({
			margin_right = 5,
			notification_position = "bottom_right",
			warning_msg_title = "Batería baja",
			warning_msg_text = "Atención",
			warning_msg_position = "bottom_right",
			font = theme.font
	    }),
	    
        arrow(theme.bg_normal, "#40b9d1"),
        wibox.container.background(wibox.container.margin(wibox.widget { nil, ram_widget(), layout = wibox.layout.align.horizontal }, dpi(2), dpi(3)), "#40b9d1"),
        
        arrow("#40b9d1", "#4d40d1"),
        wibox.container.background(wibox.container.margin(wibox.widget { cpuicon, cpu.widget, layout = wibox.layout.align.horizontal }, dpi(3), dpi(4)), "#4d40d1"),
	    
	    arrow("#4d40d1", "#7940d1"),
	    wibox.container.background(wibox.container.margin(wibox.widget { tempicon, temp.widget, layout = wibox.layout.align.horizontal }, dpi(4), dpi(4)), "#7940d1"),
        
        arrow("#7940d1", "#9c40d1"),
        wibox.container.background(wibox.container.margin(wibox.widget { neticon, net.widget, layout = wibox.layout.align.horizontal }, dpi(3), dpi(3)), "#9c40d1"),
	    
	    arrow("#9c40d1", "#000000"),
	    wibox.container.background(wibox.container.margin(wibox.widget { brighticon, mytextclock, layout = wibox.layout.align.horizontal }, dpi(3), dpi(3)), "#000000"),
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
        s.mytasklist,
        {
	     -- Item de la derecha (layout manager)
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox,
        },
    }

end

return theme
