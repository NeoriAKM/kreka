def ui
  $sw = $bld.get_object('sw')

  $settings = $bld.get_object('settings')
  $info = $bld.get_object('info')

  # $wv = WebKitGtk::WebView.new
  # sttngs = WebKitGtk::Settings.new

  # sttngs.enable_javascript = true

  # $wv.hexpand = true
  # $wv.vexpand = true

  # $wv.settings = sttngs

  # $wv.load_uri(config['pages']['home'])

  $jsdefok = $bld.get_object('jsok-def')
  $jsdeftext = $bld.get_object('jsmsg-def')

  $sw.set_child($wv)
end
