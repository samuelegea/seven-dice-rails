require 'uri'
require 'net/http'

# First of all, we need to create all the vanilla classes, subclasses, races and subraces
# We will use the D&D 5e API to get all the information we need


# Classes
class_names = [
  "barbarian",
  "bard",
  "cleric",
  "druid",
  "fighter",
  "monk",
  "paladin",
  "ranger",
  "rogue",
  "sorcerer",
  "warlock",
  "wizard"
]

# Create every equipament category
uri = URI("https://www.dnd5eapi.co/api/equipment-categories") # This is the API endpoint for the equipament
res = Net::HTTP.get_response(uri)
data = JSON.parse(res.body)

data["results"].each do |category|
  EquipamentCategory.create!(
    name: category["name"],
  )
end # OK

# Create the equipaments

batch = Sidekiq::Batch.new

uri = URI("https://www.dnd5eapi.co/api/equipment") # This is the API endpoint for the equipament
res = Net::HTTP.get_response(uri)
data = JSON.parse(res.body)
pp 'Started creating equipaments'
batch.jobs do
  data["results"].each do |equipament|
    next if Equipament.find_by(name: equipament["name"]).present?

    CreateEquipamentJob.perform_async(equipament["url"])
  end
end

pp 'Started creating magic items'
uri = URI("https://www.dnd5eapi.co/api/magic-items") # This is the API endpoint for the magic items
res = Net::HTTP.get_response(uri)
data = JSON.parse(res.body)
pp 'Started creating magic items'
batch.jobs do
  data["results"].each do |magic_item|
    next if Equipament.find_by(name: magic_item["name"]).present?

    CreateEquipamentJob.perform_async(magic_item["url"])
  end
end

# Create magic items

Equipament.all.filter { |a| a.name.include? "Pack" }.each do |pack|
  pp "Creating content for #{pack.name}"
  pack.details["contents"].each do |content|
    pp "Creating content for #{pack.name} with #{content['quantity']} #{content['item']['name']}"
    pack.holded_contents.create!(holdee_id: Equipament.find_by(name: content["item"]["name"]).id, quantity: content["quantity"])
  end
end


# Create spells

# uri = URI("https://www.dnd5eapi.co/api/spells") # This is the API endpoint for the spells
# res = Net::HTTP.get_response(uri)
# data = JSON.parse(res.body)
# pp 'Started creating spells'
# time = Time.now
# data["results"].each do |spell|
#   # pp "Creating Spell named: #{spell['name']}"
#   next if Spell.find_by(name: spell["name"]).present?

#   uri = URI("https://www.dnd5eapi.co#{spell['url']}")
#   res = Net::HTTP.get_response(uri)
#   data = JSON.parse(res.body)
#   Spell.create!(
#     name: data["name"],
#     description: data["desc"],
#     homebrew: false,
#     details: {
#       level: data["level"],
#       school: data["school"]["name"],
#       casting_time: data["casting_time"],
#       range: data["range"],
#       components: data["components"],
#       duration: data["duration"],
#       concentration: data["concentration"],
#       ritual: data["ritual"]
#     })
# end

# pp "It took #{ActiveSupport::Duration.build(Time.now - time)} to create all the spells"


# class_names.each do |class_name|
#   uri = URI("https://www.dnd5eapi.co/api/classes/#{class_name}") # This is the API endpoint for the classes
#   res = Net::HTTP.get_response(uri)
#   data = JSON.parse(res.body)
#   dnd_class = DndClass.create!(
#     name: data["name"],,
#     description: data["desc"],
#   )
#   create_new_subclasses(data["subclasses"], dnd_class)
# end

# def create_new_subclasses(subclasses, dnd_class)
#   subclasses.each do |subclass|
#     uri = URI("https://www.dnd5eapi.co/api/#{subclass["url"]}")
#     res = Net::HTTP.get_response(uri)
#     data = JSON.parse(res.body)
#     dnd_subclass = DndSubclass.create!(
#       name: data["name"],
#       description: data["desc"],
#       dnd_class: dnd_class
#     )
#     # create_new_spells(data["spells"], dnd_subclass)
#   end
  
# end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
