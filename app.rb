require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylists")
require("./lib/clients")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

post("/clients") do
  client_name = params.fetch("client_name")
  client_phone = params.fetch("client_phone")
  stylist_id = params.fetch("stylist_id").to_i()
  client = Client.new({:client_name => client_name, :client_phone => client_phone, :stylist_id => stylist_id})
  client.save()
  @stylist = Stylist.find(stylist_id)
  erb(:clients)
end

post("/stylists") do
  stylist_name = params.fetch("stylist_name")
  stylist = Stylist.new({:stylist_name => stylist_name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:clients)
end
