# frozen_string_literal: true

mngr = Adwaita::StyleManager.default

mngr.color_scheme = if $config.dig('theme', 'scheme') == 'dark'
                      Adwaita::ColorScheme::FORCE_DARK
                    else
                      Adwaita::ColorScheme::FORCE_LIGHT
                    end
