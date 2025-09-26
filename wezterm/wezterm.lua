local wezterm = require 'wezterm'

return {
    font = wezterm.font_with_fallback({
        "FiraCode Nerd Font",
        "Kawkab Mono",
        "Noto Sans Arabic",
        "DejaVu Sans Mono",
    }),

    font_size = 11,

    bidi_enabled = true,
    harfbuzz_features = { "calt", "liga", "rlig", "ccmp" },
}
