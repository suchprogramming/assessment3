require('spec_helper')

describe(Stylist) do

  describe(".all") do
    it("is initiall empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#stylist_name") do
    it("returns the name of the stylist") do
      test_stylist = Stylist.new({:stylist_name => "Katherine", :id => nil})
      expect(test_stylist.stylist_name()).to(eq("Katherine"))
    end
  end

  describe("#id") do
    it("sets an ID when saving a stylist") do
      stylist = Stylist.new({:stylist_name => "Katherine", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("saves a stylist name to the stylist class array") do
      test_stylist = Stylist.new({:stylist_name => "Katherine", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same stylist name and id") do
      test_stylist = Stylist.new({:stylist_name => "Katherine", :id => nil })
      test_stylist2= Stylist.new({:stylist_name => "Katherine", :id => nil })
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

  describe(".find") do
    it("returns a stylist by ID number") do
      test_stylist = Stylist.new({:stylist_name => "Katherine", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:stylist_name => "Zohan", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

end
