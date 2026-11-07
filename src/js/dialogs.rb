require_relative '../otr/wn'
require_relative '../otr/wv'
require_relative '../otr/ui'

def dlglgc
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

def conlgc
  $wv.signal_connect('script-dialog') do |_, dialog|
    next false unless dialog.dialog_type == :confirm

    $jscontext.label = dialog.message

    $jsconok.signal_connect('clicked') do
      $jscon.hide
      dialog.confirm_set_confirmed(true)
      dialog.close
      true
    end

    $jsconcn.signal_connect('clicked') do
      $jscon.hide
      dialog.confirm_set_confirmed(false)
      dialog.close
      false
    end

    $jscon.signal_connect('close-request') do
      $jscon.hide
      dialog.close
      true
    end

    $jscon.present
    true
  end
end

def prmptlgc
  $wv.signal_connect('script-dialog') do |_, dialog|
    next false unless dialog.dialog_type == :prompt

    $jsprmpttext.label = dialog.message
    $jsprmptentry.text = dialog.prompt_get_default_text || ""

    $jsprmptok.signal_connect('clicked') do
      dialog.prompt_set_text($jsprmptentry.text)

      $jsprmpt.hide
      dialog.close
      true
    end

    $jsprmptcn.signal_connect('clicked') do
      $jsprmpt.hide
      dialog.close
      false
    end

    $jsprmpt.signal_connect('close-request') do
      $jsprmpt.hide
      dialog.close
      true
    end

    $jsprmpt.present
    true
  end
end
