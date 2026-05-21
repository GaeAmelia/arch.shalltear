---------------------
---- MY PROGRAMS ----
---------------------

local home = os.getenv("HOME")

local mainMod   = "SUPER"
local secondMod = mainMod .. " + SHIFT"

local terminal    = "kitty"
local fileManager = "nautilus"
local menu     = "rofi"

---------------------
---- KEYBINDINGS ----
---------------------

-- ===== Apps =====
hl.bind(mainMod .. " + Return",    hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Space",     hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))

hl.bind(secondMod .. " + R", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))

-- ===== Window Management =====
hl.bind(mainMod .. " + Backspace", hl.dsp.window.close())
hl.bind(mainMod .. " + M",         hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",         hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen())

-- ===== Focus =====
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- ===== Workspaces (1..10) =====
for i = 1, 10 do
    local key = i % 10  -- 10 → key "0"
    hl.bind(mainMod   .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(secondMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- ===== Scratchpad =====
-- hl.bind(mainMod   .. " + X", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(secondMod .. " + X", hl.dsp.window.move({ workspace = "special:magic" }))


-- ===== Mouse =====
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize(), { mouse = true })

-- ===== Custom Scripts =====
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/game-mode.sh"))
hl.bind(mainMod .. " + N",  hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/night-mode.sh"))

-- ===== Screenshots =====
hl.bind(mainMod   .. " + F12", hl.dsp.exec_cmd("hyprshot -o " .. home .. "/Pictures/Screenshots -m output"))
hl.bind(secondMod .. " + F12", hl.dsp.exec_cmd("hyprshot -o " .. home .. "/Pictures/Screenshots -m region"))

-- ===== Color Picker =====
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("hyprpicker -a"))

-- ===== Media =====
hl.bind("F9",              hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("F10",             hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("F11",             hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev",   hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("XF86AudioPlay",   hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext",   hl.dsp.exec_cmd("playerctl next"),       { locked = true })
