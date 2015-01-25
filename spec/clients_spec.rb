require('spec_helper')
describe(Client) do

  describe(".all") do
    it("contains all clients array, begins empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#client_name") do
    it("returns the name of the client") do
      test_client = Client.new({:client_name => "Becky", :client_phone => 1234567890, :stylist_id => 1})
      expect(test_client.client_name()).to(eq("Becky"))
    end
  end

  describe("#client_phone") do
    it("returns the clients phone nymber") do
      test_client = Client.new({:client_name => "Becky", :client_phone => 1234567890, :stylist_id => 1})
      expect(test_client.client_phone()).to(eq(1234567890))
    end
  end

  describe("#stylist_id") do
    it("returns the client ID") do
      test_client = Client.new({:client_name => "Becky", :client_phone => 1234567890, :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe("#save") do
    it("saves a client name to the clients array") do
      test_client = Client.new({:client_name => "Becky", :client_phone => 1234567890, :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same client name and id") do
      test_client = Client.new({:client_name => "Becky", :client_phone => 1234567890, :stylist_id => 1})
      test_client2= Client.new({:client_name => "Becky", :client_phone => 1234567890, :stylist_id => 1})
      expect(test_client).to(eq(test_client2))
    end
  end

  describe("#update_client") do
    it("updates a selected client name in the database") do
      test_client = Client.new({:client_name => "Becky", :client_phone => 1234567890, :stylist_id => 1})
      test_client.save()
      test_client.update_client(:client_name => "Rebecca")
      expect(test_client.client_name()).to(eq("Rebecca"))
    end
  end

end
