require('spec_helper')
describe(Client) do

  describe(".all") do
    it("contains all clients array, begins empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a client name to the clients array") do
      test_client = Client.new({:client_name => "Katherine", :id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

end
