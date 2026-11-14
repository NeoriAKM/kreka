mngr = Adwaita::StyleManager.default

if $config.dig('theme', 'scheme') == 'dark'
    mngr.color_scheme = Adwaita::ColorScheme::FORCE_DARK
else
    mngr.color_scheme = Adwaita::ColorScheme::FORCE_LIGHT
end