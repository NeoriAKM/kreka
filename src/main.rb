require 'adwaita'
require 'webkit-gtk'

app = Gtk::Application.new('org.progwi0.kreka', :flags_none)

app.signal_connect('activate') do |application|
  bld = Gtk::Builder.new
  bld.add_from_file('ui/kreka-la.ui')

  wn = bld.get_object('wn')
  sw = bld.get_object('sw')

  abt = bld.get_object('abt')

  abt.signal_connect('close-request') do
    abt.hide
    true
  end

  info = bld.get_object('info')

  info.signal_connect('clicked') do
    abt.present
    true
  end

  wv = WebKitGtk::WebView.new
  wv.hexpand = true
  wv.vexpand = true

  sw.set_child(wv)

  wv.load_uri('https://progwi0.pp.ua/kreka')

  wn.application = application
  wn.present
end

exit(app.run([$0] + ARGV))
