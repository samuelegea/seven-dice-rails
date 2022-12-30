require 'json'

# Create Admin User for development
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# First of all, we need to create all the vanilla classes, subclasses, races and subraces
# We will use the D&D 5e API to get all the information we need


# Classes
# class_names = [
#   "barbarian",
#   "bard",
#   "cleric",
#   "druid",
#   "fighter",
#   "monk",
#   "paladin",
#   "ranger",
#   "rogue",
#   "sorcerer",
#   "warlock",
#   "wizard"
# ]
# Creating all the equipment categories

equipament_categories = JSON.parse(File.read('db/sources/5e-SRD-Equipment-Categories.json'))
equipament_categories.each do |category|
  EquipmentCategory.create!(name: category['name'])
end
weapon_properties = JSON.parse(File.read('db/sources/5e-SRD-Weapon-Properties.json'))
weapon_properties.each do |category|
  WeaponProperty.create!(name: category['name'],
                         description: category['desc'],
                         actions: {})
end

# Creating all the equipments
equipments = JSON.parse(File.read('db/sources/5e-SRD-Equipment.json'))
# weapons = equipments.filter { |a| a['weapon_category'] }

# Creating all the weapons
ActiveRecord::Base.transaction do
  equipments.filter { |a| a['weapon_category'] }.each do |weapon|
    w = Weapon.create!(name: weapon['name'],
                       description: weapon['desc'] || '',
                       melee: weapon['weapon_range'] == 'Melee',
                       martial: weapon['weapon_category'] == 'Martial',
                       damage_type: weapon.dig('damage', 'damage_type', 'name') || 0,
                       damage_dice: weapon.dig('damage', 'damage_dice') || 0,
                       range: weapon.dig('range', 'normal'),
                       range_long: weapon.dig('range', 'long'),
                       throw_range: weapon.dig('range', 'throw'),
                       throw_range_long: weapon.dig('range', 'throw_long'),
                       two_handed_damage_dice: weapon.dig('two_handed_damage', 'damage_dice'),
                       two_handed_damage_type: weapon.dig('two_handed_damage', 'damage_type', 'name'),
                       actions: {})
    w.weapon_properties << WeaponProperty.where(name: weapon['properties'].map { |p| p['name'] })
    Equipment.create!(source: w,
                      cost_qtd: weapon['cost']['quantity'],
                      cost_unit: weapon['cost']['unit'],
                      equipment_category: EquipmentCategory.find_by(name: weapon['equipment_category']['name']),
                      weight: weapon['weight'])
  end
end
# Creating all the vehicles
ActiveRecord::Base.transaction do
  equipments.filter { |a| a['vehicle_category'] }.each do |vehicle|
    w = Vehicle.create!(name: vehicle['name'],
                        description: vehicle['desc'] || '',
                        vehicle_category: vehicle['vehicle_category'],
                        speed_qtd: vehicle.dig('speed', 'quantity'),
                        speed_unit: vehicle.dig('speed', 'unit'),
                        capacity: vehicle['capacity'])
    Equipment.create!(source: w,
                      cost_qtd: vehicle['cost']['quantity'],
                      cost_unit: vehicle['cost']['unit'],
                      equipment_category: EquipmentCategory.find_by(name: vehicle['equipment_category']['name']),
                      weight: vehicle['weight'])
  end
end
