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

home = `echo ~`.strip

begin
  $config = YAML.load_file("#{home}/.config/kreka/config.yaml")
rescue Psych::SyntaxError => e
  puts "Config is corrupted. Error: #{e.message}"
rescue Errno::ENOENT => e
  puts "Config is not found. Making default..."

  FileUtils.mkdir_p("#{home}/.config/kreka")
  default_yaml = <<~YAML
    pages:
      home: "https://progwi0.pp.ua/kreka"
      support: "https://t.me/progwi0?direct"
    browser:
      sengine: "https://www.google.com/search?q="
      js: true
  YAML

  File.write("#{home}/.config/kreka/config.yaml", default_yaml)
  $config = YAML.load_file("#{home}/.config/kreka/config.yaml")
end

$language = YAML.load_file("#{home}/.config/kreka/translation.yaml")

app = Gtk::Application.new('org.progwi0.kreka', :flags_none)

app.signal_connect('activate') do |application|
  $bld = Gtk::Builder.new
  $bld.add_from_file('ui/kreka-la.ui')

  wn(application)
  ui()

  wv()

  dlglgc()
  conlgc()
  prmptlgc()

  consig()
  addacts()
end

exit(app.run([$0] + ARGV))
