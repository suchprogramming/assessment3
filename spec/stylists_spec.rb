require('spec_helper')

describe(Stylist) do

  describe(".all") do
    it("is initiall empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#stylist_name") do
    it("returns the name of the stylist") do
      test_stylist = Stylist.new({:stylist_name => "Becky", :stylist_id => nil})
      expect(test_stylist.stylist_name()).to(eq("Becky"))
    end
  end
end
