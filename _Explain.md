# Rice Swapper

Keyboard-driven TUI to apply Hyprland rice configs from this repo to `~/.config`.

## Usage

```bash
# Open TUI
python swapper.py

# List available rices (one per line — usable in scripts)
python swapper.py list

# Apply a rice directly (no TUI)
python swapper.py load <rice-name>
```

## TUI controls

| Key | Action |
|-----|--------|
| `↑` / `↓` | Navigate rice list |
| `Enter` | Apply selected rice (asks confirmation) |
| `y` | Confirm apply |
| `N` / any other key | Cancel |
| `q` | Quit |

## How it works

Each subdirectory in this repo is a rice. Applying a rice copies its contents into `~/.config`.

Example: applying `lili-noir` copies `lili-noir/hypr/` → `~/.config/hypr/`, `lili-noir/kitty/` → `~/.config/kitty/`, etc.

After applying, reload Hyprland:

```bash
hyprctl reload
```

## Rice folder structure

```
repo/
  swapper.py
  README.md
  <rice-name>/
    hypr/          # Hyprland config
    kitty/         # Kitty terminal
    zsh/           # Zsh / Starship
    dunst/         # Notifications
    rofi/          # Launcher
    waybar/        # Bar
    ...            # Any other ~/.config subfolder
```

Only the subfolders present in the rice are overwritten — everything else in `~/.config` is untouched.

## Adding your own rice

1. Create a folder with any name (no spaces recommended)
2. Add the config subfolders you want to include
3. Run `python swapper.py` — your rice appears automatically

## Font

`MS Gothic.ttf` is included in this repo. To install it system-wide:

```bash
cp "MS Gothic.ttf" ~/.local/share/fonts/
fc-cache -f
```

## API — Quickshell subprocess integration

The swapper exposes a stable CLI API for use from Quickshell or other tools:

```bash
python swapper.py list
python swapper.py load lili-noir
```

These commands produce no interactive prompts, making them safe to call from subprocesses.

Python API (importable):

```python
from swapper import list_rices, load_rice

rices = list_rices()          # -> ['lili-noir', ...]
ok    = load_rice('lili-noir') # -> True / False
```
