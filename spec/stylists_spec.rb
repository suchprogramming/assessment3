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

  describe("#save") do
    it("saves a stylist name to the stylist class array") do
      test_stylist = Stylist.new({:stylist_name => "Becky", :stylist_id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same stylist name") do
      test_stylist = Stylist.new({:stylist_name => "Becky", :id => 1 })
      test_stylist2= Stylist.new({:stylist_name => "Becky", :id => 1 })
      expect(test_stylist).to(eq(test_stylist2))
    end
  end
end
