class Stylist

  attr_reader(:stylist_name, :stylist_id)

  define_method(:initialize) do |attributes|
    @stylist_name = attributes.fetch(:stylist_name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      stylist_name = stylist.fetch("stylist_name")
      stylist_id = stylist.fetch("stylist_id").to_i()
      stylists.push(Stylist.new({:stylist_name => stylist_name, :stylist_id => stylist_id}))
    end
    stylists
  end
end
