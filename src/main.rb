require 'adwaita'
require 'webkit-gtk'
require 'yaml'

system('[ -s "~/.progwi0/kreka/config.yaml" ] && vim config.yaml || wget -P ~/.progwi0/kreka/config.yaml https://raw.githubusercontent.com/progwi0/kreka/refs/heads/dev/skel/config.yaml')

app = Gtk::Application.new('org.progwi0.kreka', :flags_none)

app.signal_connect('activate') do |application|
  bld = Gtk::Builder.new
  bld.add_from_file('ui/kreka-la.ui')

  wn = bld.get_object('wn')
  sw = bld.get_object('sw')

  abt = bld.get_object('abt')
  ab = Gio::SimpleAction.new('ab')

  ab.signal_connect('activate') do
    abt.present
    true
  end

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
  sttngs = WebKitGtk::Settings.new

  sttngs.enable_javascript = true

  wv.hexpand = true
  wv.vexpand = true

  wv.settings = sttngs

  sw.set_child(wv)

  wv.load_uri('https://www.whatismybrowser.com/detect/is-javascript-enabled/')

  wn.application = application
  wn.present

  wn.add_action(ab)
end

exit(app.run([$0] + ARGV))
