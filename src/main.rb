require 'gtk3'
require 'webkit2-gtk'

Gtk.init

wn = Gtk::Window.new
wn.set_default_size(1280, 720)
wn.signal_connect("destroy") { Gtk.main_quit }

hb = Gtk::HeaderBar.new
hb.show_close_button = true
hb.title = "Kreka"
hb.subtitle = "dev"

wn.titlebar = hb

wv = WebKit2Gtk::WebView.new
wv.load_uri("https://progwi0.pp.ua/")

wn.add(wv)

wn.show_all

Gtk.main
