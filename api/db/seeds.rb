require 'json'

# Create Admin User for development
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? && AdminUser.find_by(email: 'admin@example.com').nil?

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
puts 'Creating all the equipment categories'
equipament_categories.each do |category|
  next if EquipmentCategory.find_by(name: category['name'])

  puts "Creating #{category['name']}"

  EquipmentCategory.create!(name: category['name'])
end
weapon_properties = JSON.parse(File.read('db/sources/5e-SRD-Weapon-Properties.json'))
puts 'Creating all the weapon properties'
puts '--------------------------------------------------'
weapon_properties.each do |category|
  next if WeaponProperty.find_by(name: category['name'])

  puts "Creating #{category['name']}"

  WeaponProperty.create!(name: category['name'],
                         description: category['desc']&.join(', ') || '',
                         actions: {})
end
puts 'Finished creating all the weapon properties'
puts '--------------------------------------------------'

# Creating all the equipments
equipments = JSON.parse(File.read('db/sources/5e-SRD-Equipment.json'))
# gear = equipments.filter { |a| a['gear_category'] }

# Creating all the weapons
puts 'Creating all the weapons'
ActiveRecord::Base.transaction do
  equipments.filter { |a| a['weapon_category'] }.each do |weapon|
    next if Equipment.find_by(name: weapon['name'])

    puts "Creating #{weapon['name']}"

    w = Weapon.create!(
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
      actions: {}
    )
    w.weapon_properties << WeaponProperty.where(name: weapon['properties'].map { |p| p['name'] })
    Equipment.create!(
      source: w,
      default_quantity: weapon['quantity'],
      name: weapon['name'],
      description: weapon['desc']&.join(', ') || '',
      cost_qtd: weapon['cost']['quantity'],
      cost_unit: weapon['cost']['unit'],
      equipment_category: EquipmentCategory.find_by(name: weapon['equipment_category']['name']),
      weight: weapon['weight']
    )
  end
end
puts 'Finished creating weapons'
puts '--------------------------------------------------'
# Creating all the vehicles
puts 'Creating vehicles'
ActiveRecord::Base.transaction do
  equipments.filter { |a| a['vehicle_category'] }.each do |vehicle|
    next if Equipment.find_by(name: vehicle['name'])

    puts "Creating #{vehicle['name']}"

    w = Vehicle.create!(
      vehicle_category: vehicle['vehicle_category'],
      speed_qtd: vehicle.dig('speed', 'quantity'),
      speed_unit: vehicle.dig('speed', 'unit'),
      capacity: vehicle['capacity']
    )
    Equipment.create!(
      source: w,
      default_quantity: vehicle['quantity'],
      name: vehicle['name'],
      description: vehicle['desc']&.join(', ') || '',
      cost_qtd: vehicle['cost']['quantity'],
      cost_unit: vehicle['cost']['unit'],
      equipment_category: EquipmentCategory.find_by(name: vehicle['equipment_category']['name']),
      weight: vehicle['weight']
    )
  end
end
puts 'Finished creating all the vehicles'
puts '--------------------------------------------------'

# Creating all the armor
puts 'Creating all the armor'
ActiveRecord::Base.transaction do
  equipments.filter { |a| a['armor_category'] }.each do |armor|
    next if Equipment.find_by(name: armor['name'])

    puts "Creating #{armor['name']}"

    w = Armor.create!(
      category: armor['armor_category'],
      armor_class: armor.dig('armor_class', 'base'),
      armor_class_dex_bonus: armor.dig('armor_class', 'dex_bonus'),
      armor_class_max_bonus: armor.dig('armor_class', 'max_bonus'),
      str_minimum: armor['str_minimum'],
      stealth_disadvantage: armor['stealth_disadvantage']
    )
    Equipment.create!(
      source: w,
      default_quantity: armor['quantity'],
      name: armor['name'],
      description: armor['desc']&.join(', ') || '',
      cost_qtd: armor['cost']['quantity'],
      cost_unit: armor['cost']['unit'],
      equipment_category: EquipmentCategory.find_by(name: armor['equipment_category']['name']),
      weight: armor['weight']
    )
  end
end
puts 'Finished creating all the armor'
puts '--------------------------------------------------'
# Creating all the gears
puts 'Creating all the gears'

ActiveRecord::Base.transaction do
  equipments.filter { |a| a['gear_category'] }.each do |gear|
    next if Equipment.find_by(name: gear['name'])

    puts "Creating #{gear['name']}"

    w = Gear.create!(
      category: gear.dig('gear_category', 'name')
    )
    Equipment.create!(
      source: w,
      default_quantity: gear['quantity'],
      name: gear['name'],
      description: gear['desc']&.join(', ') || '',
      cost_qtd: gear['cost']['quantity'],
      cost_unit: gear['cost']['unit'],
      equipment_category: EquipmentCategory.find_by(name: gear['equipment_category']['name']),
      weight: gear['weight']
    )

    next unless w['contents']

    w['contents'].each do |content|
      w.gears_equipaments.create!(
        equipment: Equipment.find_by(name: content['item']['name']),
        quantity: content['quantity']
      )
    end
  end
end

puts 'Finished creating all the gears'
puts '--------------------------------------------------'
puts 'Creating all the tools'

ActiveRecord::Base.transaction do
  equipments.filter { |a| a['tool_category'] }.each do |tool|
    next if Equipment.find_by(name: tool['name'])

    puts "Creating #{tool['name']}"

    w = Tool.create!(
      category: tool['tool_category']
    )
    Equipment.create!(
      source: w,
      default_quantity: tool['quantity'],
      name: tool['name'],
      description: tool['desc']&.join(', ') || '',
      cost_qtd: tool['cost']['quantity'],
      cost_unit: tool['cost']['unit'],
      equipment_category: EquipmentCategory.find_by(name: tool['equipment_category']['name']),
      weight: tool['weight']
    )
  end
end
