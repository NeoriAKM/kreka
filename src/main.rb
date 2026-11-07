require_relative 'otr/logic'
require_relative 'otr/acts'

require_relative 'otr/ui'
require_relative 'otr/wn'
require_relative 'otr/wv'

require_relative 'js/dialogs'

require 'adwaita'
require 'webkit-gtk'

require 'yaml'
require 'fileutils'

$config = YAML.load_file("#{`echo ~`.strip}/.progwi0/kreka/config.yaml")
app = Gtk::Application.new('org.progwi0.kreka', :flags_none)

app.signal_connect('activate') do |application|
  $bld = Gtk::Builder.new
  $bld.add_from_file('ui/kreka-la.ui')

  # UI part.

  # $wn = bld.get_object('wn')
  # $sw = bld.get_object('sw')

  # $abt = bld.get_object('abt')

  # $ab = Gio::SimpleAction.new('ab')
  # $pr = Gio::SimpleAction.new('pr')

  # $settings = bld.get_object('settings')

  # $info = bld.get_object('info')

  # Webview part.

  # $wv = WebKitGtk::WebView.new
  # sttngs = WebKitGtk::Settings.new

  # sttngs.enable_javascript = true

  # $wv.hexpand = true
  # $wv.vexpand = true

  # $wv.settings = sttngs

  # load "otr/wn.rb"

  # wn(application)

  # $wn.application = application
  # $wn.present

  # JS windows.

  # $jsdef = bld.get_object('jswn-def')

  # Addin logic.

  wn(application)
  ui()

  wv()
  dialogs()

  consig()
  addacts()
end

exit(app.run([$0] + ARGV))
