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

  wn(application)
  ui()

  wv()
  dialogs()

  consig()
  addacts()
end

exit(app.run([$0] + ARGV))
