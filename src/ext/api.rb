require_relative '../gui/ui'
require_relative '../js/dialogs'

module KrekaExt
    def self.addButton(icon, pos)
        butt = Gtk::Button.new(icon_name: icon)

        butt.signal_connect("clicked") do
            if block_given?
                yield
            else
                puts "..."
            end
        end

        if pos == "left"
            $bx1.append(butt)
        else
            $bx2.append(butt)
        end
    end

    def self.newWindow(title, url)
        win = Gtk::Window.new
        win.set_default_size(800, 600)
        headerbar = Gtk::HeaderBar.new

        lbl = Gtk::Label.new
        lbl.label = title
        lbl.add_css_class("heading")

        headerbar.title_widget = lbl

        win.titlebar = headerbar

        scrwin = Gtk::ScrolledWindow.new
        win.set_child(scrwin)

        wv = WebKitGtk::WebView.new

        wv.hexpand = true
        wv.vexpand = true

        scrwin.set_child(wv)

        wv.load_uri(url)

        wv.signal_connect('load-changed') do |widget, loadevent|
            if loadevent == :finished
                if widget.title.nil?
                    erpth = File.expand_path('../web/error.html', __dir__)
                    widget.load_uri("file://#{erpth}")
                else
                    puts "nothing."
                end
            end
        end

        win.transient_for = $wn
        win.present
    end
end