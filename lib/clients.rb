class Client

  attr_reader(:client_name, :id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_name = client.fetch("stylist_name")
      id = client.fetch("id").to_i()
      clients.push(Client.new({:client_name => stylist_name, :id => id}))
    end
    clients
  end
end
