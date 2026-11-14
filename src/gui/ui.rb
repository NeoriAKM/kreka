def ui
  $sw = $bld.get_object('sw')

  $settings = $bld.get_object('settings')
  $info = $bld.get_object('info')

  $home = $bld.get_object('home')
  $undo = $bld.get_object('undo')
  $redo = $bld.get_object('redo')

  $hb = $bld.get_object('hb')
  $bx1 = $bld.get_object('bx1')
  $bx2 = $bld.get_object('bx2')

  $sb = $bld.get_object('sb')

  # $wv = WebKitGtk::WebView.new
  # sttngs = WebKitGtk::Settings.new

  # sttngs.enable_javascript = true

  # $wv.hexpand = true
  # $wv.vexpand = true

  # $wv.settings = sttngs

  # $wv.load_uri(config['pages']['home'])

  $jsdefok = $bld.get_object('jsok-def')
  $jsdeftitle = $bld.get_object('jswn-deftitle')
  $jsdeftext = $bld.get_object('jsmsg-def')

  $jsconok = $bld.get_object('jsok-con')
  $jsconcn = $bld.get_object('jscn-con')
  $jscontitle = $bld.get_object('jswn-contitle')
  $jscontext = $bld.get_object('jsmsg-con')

  $jsprmptok = $bld.get_object('jsok-prmpt')
  $jsprmptcn = $bld.get_object('jscn-prmpt')
  $jsprmpttitle = $bld.get_object('jswn-prmpttitle')
  $jsprmpttext = $bld.get_object('jsmsg-prmpt')
  $jsprmptentry = $bld.get_object('jsen-prmpt')

  $tst = $bld.get_object('tst')

  $ttl = $bld.get_object('ttl')

  $sw.set_child($wv)
end
