require_relative '../otr/wn'
require_relative '../otr/wv'
require_relative '../otr/ui'

def dialogs
  $wv.signal_connect('script-dialog') do |_, dialog|
    next false unless dialog.dialog_type == :alert

    $jsdeftext.label = dialog.message

    $jsdefok.signal_connect('clicked') do
      $jsdef.hide
      dialog.close
    end

    $jsdef.signal_connect('close-request') do
      $jsdef.hide
      dialog.close
      true
    end

    $jsdef.present
    true
  end
end
