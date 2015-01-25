class Client

  attr_reader(:client_name, :client_phone, :stylist_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @client_phone = attributes.fetch(:client_phone)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_name = client.fetch("client_name")
      client_phone = client.fetch("client_phone")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:client_name => client_name, :client_phone => client_phone, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (client_name, client_phone, stylist_id) VALUES ('#{@client_name}', #{@client_phone}, #{@stylist_id});")
  end

  define_method(:==) do |compared_client|
    self.client_name == compared_client.client_name() && self.stylist_id == compared_client.stylist_id()
  end

  define_method(:update_client) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @stylist_id = self.stylist_id()
    DB.exec("UPDATE clients SET client_name = '#{@client_name}' WHERE id = #{@stylist_id};")
  end

end
