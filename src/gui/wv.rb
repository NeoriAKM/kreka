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

  $wv.signal_connect('load-changed') do |widget, loadevent|
    if loadevent == :finished
      if widget.title.nil?
        erpth = File.expand_path('../web/error.html', __dir__)
        widget.load_uri("file://#{erpth}")
      else
        $sb.text = $wv.uri
        $ttl.label = $wv.title.to_s
      end
    end
  end

  # $wv.signal_connect('resource-load-started') do |wg, rs, rq|
  #   rs.signal_connect('failed') do |rus, err|
  #     erpth = File.expand_path('../web/error.html', __dir__)

  #     GLib::Idle.add do
  #       wg.load_uri("file://#{erpth}")
  #       false
  #     end

  #     true
  #   end
  # end


  # $wv.signal_connect('resource-load-started') do |wg, rs, rq|
  #   puts rs.class
  #   puts rs.methods.grep(/failed|uri|response/)
  # end

  # $wv.signal_connect('load-failed') do |wg, ev, uri, amogus|
  #   erpth = File.expand_path('../web/error.html', __dir__)

  #   # GLib::Idle.add do
  #   #   wg.load_uri("file://#{erpth}")
  #   #   false
  #   # end

  #   puts "sigma."

  #   true

  # puts WebKitGtk::WebView.signals.keys

  # end
end
