require 'gtk3'

class MyWindow < Gtk::Window
  def initialize
    super

    set_title "Mi Ventana"
    signal_connect "destroy" do
      Gtk.main_quit
    end

    set_default_size 600, 600

    vbox = Gtk::Box.new(:vertical, 10)
    add(vbox)

    grid = Gtk::Grid.new
    grid.set_halign(Gtk::Align::CENTER)
    vbox.pack_start(grid, :expand => true, :fill => true)

    spacer = Gtk::Label.new
    grid.attach(spacer, 1, 0, 1, 1)
    spacer = Gtk::Label.new
    grid.attach(spacer, 1, 1, 1, 1)

    pixbuf1 = GdkPixbuf::Pixbuf.new(:file => "img/Escudo_Unison.png")
    pixbuf1 = pixbuf1.scale_simple(100, 100, GdkPixbuf::InterpType::BILINEAR)
    image1 = Gtk::Image.new(:pixbuf => pixbuf1)
    grid.attach(image1, 0, 2, 1, 1)

    title = Gtk::Label.new
    title.set_markup("<span font='20' weight='bold'>Registro de Eventos Culturest</span>")
    grid.attach(title, 1, 2, 1, 1)

    pixbuf2 = GdkPixbuf::Pixbuf.new(:file => "img/LOGO_CULTUREST.png")
    pixbuf2 = pixbuf2.scale_simple(100, 100, GdkPixbuf::InterpType::BILINEAR)
    image2 = Gtk::Image.new(:pixbuf => pixbuf2)
    grid.attach(image2, 2, 2, 1, 1)

    label1 = Gtk::Label.new
    label1.set_markup("<span font='18'>Eventos:</span>")
    grid.attach(label1, 1, 3, 1, 1)

    label2 = Gtk::Label.new
    label2.set_markup("<span font='16'>Hackathon 2025</span>")
    grid.attach(label2, 1, 4, 1, 1)

    spacer = Gtk::Label.new
    grid.attach(spacer, 1, 5, 1, 1)
    spacer = Gtk::Label.new
    grid.attach(spacer, 1, 6, 1, 1)

    label3 = Gtk::Label.new
    label3.set_markup("<span font='14'>Introduzca el expediente del alumno:</span>")
    grid.attach(label3, 1, 7, 1, 1)

    entry = Gtk::Entry.new
    entry.override_font(Pango::FontDescription.new("Sans 16"))
    grid.attach(entry, 1, 8, 1, 1)

    spacer = Gtk::Label.new
    grid.attach(spacer, 1, 9, 1, 1)
    spacer = Gtk::Label.new
    grid.attach(spacer, 1, 10, 1, 1)

    button = Gtk::Button.new(:label => "Registrar")
    grid.attach(button, 1, 11, 1, 1)

    show_all
  end
end

app = Gtk::Application.new("com.example.myapp", :flags_none)
app.signal_connect "activate" do
  window = MyWindow.new
  window.present
end

app.run
Gtk.main
