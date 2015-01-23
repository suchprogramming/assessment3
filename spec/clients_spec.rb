require('spec_helper')
describe(Client) do

  describe(".all") do
    it("contains all clients array, begins empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#client_name") do
    it("returns the name of the client") do
      test_client = Client.new({:client_name => "Becky", :client_id => nil})
      expect(test_client.client_name()).to(eq("Becky"))
    end
  end

  describe("#save") do
    it("saves a client name to the clients array") do
      test_client = Client.new({:client_name => "Becky", :id => nil })
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same client name and id") do
      test_client = Client.new({:client_name => "Becky", :id => 1 })
      test_client2= Client.new({:client_name => "Becky", :id => 1 })
      expect(test_client).to(eq(test_client2))
    end
  end

end
