#!/usr/bin/env ruby

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

Dir.chdir(File.dirname(__FILE__))

home = Dir.home

begin
  $config = YAML.load_file("#{home}/.config/kreka/config.yaml")
rescue Psych::SyntaxError => e
  puts "Config is corrupted. Error: #{e.message}"
rescue Errno::ENOENT => e
  puts "Config is not found. Making default..."

  FileUtils.mkdir_p("#{home}/.config/kreka")
  default_yaml = <<~YAML
    # Default Kreka configuration.
    # 2021-2026 progwi0

    pages:
      home: "https://progwi0.pp.ua/kreka"
      support: "https://t.me/progwi0?direct"
    browser:
      sengine: "https://www.google.com/search?q="
      js: true
      language: "en"
  YAML

  File.write("#{home}/.config/kreka/config.yaml", default_yaml)
  $config = YAML.load_file("#{home}/.config/kreka/config.yaml")
end

require_relative 'otr/translation'

app = Gtk::Application.new('org.progwi0.kreka', :flags_none)

app.signal_connect('activate') do |application|
  $bld = Gtk::Builder.new
  $bld.add_from_file("./ui/kreka-la.ui")

  wn(application)
  ui()

  wv()

  dlglgc()
  conlgc()
  prmptlgc()

  translate()

  consig()
  addacts()
end

exit(app.run([$0] + ARGV))
