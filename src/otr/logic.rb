require_relative './wn'
require_relative './ui'

def consig
  $ab = Gio::SimpleAction.new('ab')
  $pr = Gio::SimpleAction.new('pr')

  $ab.signal_connect('activate') do
    $abt.present
    true
  end

  $abt.signal_connect('close-request') do
    $abt.hide
    true
  end

  $pr.signal_connect('activate') do
    if File.exist?("#{Dir.home}/.config/kreka/config.yaml")
      system("kgx --title='Kreka Configuration edit' --command='vim #{`echo ~`.strip}/.config/kreka/config.yaml'")
    else
      puts "Sorry."
    end
    true
  end

  $settings.signal_connect('clicked') do
    if File.exist?("#{Dir.home}/.config/kreka/config.yaml")
      system("kgx --title='Kreka Configuration edit' --command='vim #{`echo ~`.strip}/.config/kreka/config.yaml'")
    else
      puts "Sorry."
    end
  end

  $info.signal_connect('clicked') do
    $abt.present
    true
  end

  $sb.signal_connect('activate') do
    $wv.load_uri("#{$config['browser']['sengine']}#{$sb.text}")
    true
  end

  $undo.signal_connect('clicked') do
    $wv.go_back
  end

  $redo.signal_connect('clicked') do
    $wv.go_forward
  end

  $home.signal_connect('clicked') do
    $wv.load_uri($config['pages']['home'])
  end
end

