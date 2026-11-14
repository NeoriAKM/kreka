provider = Gtk::CssProvider.new
provider.load(
    path: File.expand_path("#{Dir.home}/.progwi0/kreka/themes/#{$config['theme']['theme']}/#{$config['theme']['theme']}-#{$config['theme']['scheme']}.css")
)

Gtk::StyleContext.add_provider_for_display(
  Gdk::Display.default,
  provider,
  Gtk::StyleProvider::PRIORITY_APPLICATION
)