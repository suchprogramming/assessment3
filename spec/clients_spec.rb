require('spec_helper')
describe(Client) do

  describe(".all") do
    it("contains all clients array, begins empty") do
      expect(Client.all()).to(eq([]))
    end
  end

end
