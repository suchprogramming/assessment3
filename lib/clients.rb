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
      client_name = client.fetch("client_name")
      id = client.fetch("id").to_i()
      clients.push(Client.new({:client_name => client_name, :id => id}))
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (client_name) VALUES ('#{@client_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |compared_client|
    self.client_name == compared_client.client_name() && self.id == compared_client.id()
  end
end
