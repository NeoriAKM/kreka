def ui
  $sw = $bld.get_object('sw')

  $settings = $bld.get_object('settings')
  $info = $bld.get_object('info')

  $home = $bld.get_object('home')
  $undo = $bld.get_object('undo')
  $redo = $bld.get_object('redo')

  $sb = $bld.get_object('sb')

  # $wv = WebKitGtk::WebView.new
  # sttngs = WebKitGtk::Settings.new

  # sttngs.enable_javascript = true

  # $wv.hexpand = true
  # $wv.vexpand = true

  # $wv.settings = sttngs

  # $wv.load_uri(config['pages']['home'])

  $jsdefok = $bld.get_object('jsok-def')
  $jsdeftext = $bld.get_object('jsmsg-def')

  $jsconok = $bld.get_object('jsok-con')
  $jsconcn = $bld.get_object('jscn-con')
  $jscontext = $bld.get_object('jsmsg-con')

  $jsprmptok = $bld.get_object('jsok-prmpt')
  $jsprmptcn = $bld.get_object('jscn-prmpt')
  $jsprmpttext = $bld.get_object('jsmsg-prmpt')
  $jsprmptentry = $bld.get_object('jsen-prmpt')

  $sw.set_child($wv)
end
