class Stylist

  attr_reader(:stylist_name, :id)

  define_method(:initialize) do |attributes|
    @stylist_name = attributes.fetch(:stylist_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      stylist_name = stylist.fetch("stylist_name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:stylist_name => stylist_name, :id => id}))
    end
    stylists
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@stylist_name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
    DB.exec("DELETE FROM clients WHERE client_id = #{self.id()};")
  end

  define_method(:==) do |compared_stylist|
    self.stylist_name == compared_stylist.stylist_name() && self.id == compared_stylist.id()
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE client_id = #{self.id()};")
    clients.each() do |client|
      client_name = client.fetch("client_name")
      client_phone = client.fetch("client_phone")
      client_id = client.fetch("client_id").to_i()
      stylist_clients.push(Client.new({:client_name => client_name, :client_phone => client_phone, :client_id => client_id}))
    end
    stylist_clients
  end

end
