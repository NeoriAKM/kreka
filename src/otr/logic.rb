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

  $settings.signal_connect('clicked') do
    if File.exist?("#{`echo ~`.strip}/.progwi0/kreka/config.yaml")
      system("kgx --title='Kreka Configuration edit' --command='vim #{`echo ~`.strip}/.progwi0/kreka/config.yaml'")
    else
      puts "Sorry."
    end
  end

  $info.signal_connect('clicked') do
    $abt.present
    true
  end
end

