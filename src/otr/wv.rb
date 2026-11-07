require_relative './ui'

def wv
  $wv = WebKitGtk::WebView.new
  $sttngs = WebKitGtk::Settings.new

  $sttngs.enable_javascript = $config['browser']['js']

  $wv.hexpand = true
  $wv.vexpand = true

  $wv.settings = $sttngs
  $sw.set_child($wv)

  $wv.load_uri($config['pages']['home'])
end
