require_relative './wn'
require_relative './ui'
require 'yaml'
require 'fileutils'

home = Dir.home

begin
  puts "#{home}/.config/kreka/translations/#{$config['browser']['language']}/translation.yaml"
  $language = YAML.load_file("#{$home}/.config/kreka/translations/#{$config['browser']['language']}/translation.yaml")
rescue Errno::ENOENT => e
  puts "WARNING: moving translation files to ~/.config...\n"

  FileUtils.mkdir_p("#{$home}/.config/kreka")
  FileUtils.cp_r("../translations", "#{$home}/.config/kreka/")

  puts "-------------------------------------------"
  puts "Success! Rerun Kreka now"
  exit 0
rescue Psych::SyntaxError => e
  puts "Syntax problem. Error: #{e.message}"
  exit 1
end

def translate
  $abt.application_name = $language['about']['name']
  $abt.comments = $language['about']['desc']

  $jsdeftitle.text = $language['javascript']['alert']
  $jscontitle.text = $language['javascript']['confirm']
  $jsprmpttitle.text = $language['javascript']['prompt']

  $jsdefok.label = $language['javascript']['ok']

  $jsconok.label = $language['javascript']['ok']
  $jsconcn.label = $language['javascript']['cancel']

  $jsprmptok.label = $language['javascript']['ok']
  $jsprmptcn.label = $language['javascript']['cancel']
end
