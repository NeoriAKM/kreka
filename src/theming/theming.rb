# frozen_string_literal: true

provider = Gtk::CssProvider.new

theme  = $config&.dig('theme', 'theme')  || 'none'
scheme = $config&.dig('theme', 'scheme') || 'light'

css_path = File.expand_path("#{Dir.home}/.config/kreka/themes/#{theme}/#{theme}-#{scheme}.css")

begin
  provider.load(path: css_path)
rescue StandardError => e
  puts "[WARN] error on opening themes (#{e.message}). Using standard themes...\n"

  begin
    $stdconfig = YAML.load_file("skel/config.yaml")

    std_theme  = $stdconfig&.dig('theme', 'theme')  || 'none'
    std_scheme = $stdconfig&.dig('theme', 'scheme') || 'light'
    std_css_path = File.expand_path("themes/theming/themes/#{std_theme}/#{std_theme}-#{std_scheme}.css")

    provider.load(path: std_css_path)

  rescue Errno::ENOENT
    puts "[ERROR] Standart config not found! Sorry, but you need to fix your config on \"~/.config/kreka/config.yaml\""
  rescue StandardError => e
    puts "[ERROR] Failed to load standard config or themes: #{e.message}"
  end
end

Gtk::StyleContext.add_provider_for_display(
  Gdk::Display.default,
  provider,
  Gtk::StyleProvider::PRIORITY_APPLICATION
)