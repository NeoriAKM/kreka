require_relative './wn'
require_relative './ui'
require 'yaml'

$language = YAML.load_file("#{$home}/.config/kreka/#{$config['browser']['language']}/translation.yaml")

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
