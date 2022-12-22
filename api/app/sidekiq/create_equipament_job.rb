class CreateEquipamentJob
  include Sidekiq::Job

  def which_equipament_type(equipament)
    return 0 if equipament["weapon_category"].present?
    return 1 if equipament["armor_category"].present?
    return 2 if equipament["gear_category"].present?
    return 3 if equipament["vehicle_category"].present?
    return 4 if equipament["tool_category"].present?
    return 5 if equipament["name"].include? "Pack"

    7
  end

  def perform(url)
    uri = URI("https://www.dnd5eapi.co#{url}")
    res = Net::HTTP.get_response(uri)
    data = JSON.parse(res.body)
    Equipament.create!(
      name: data["name"],
      description: data["desc"],
      equipament_type: (url.include?('magic-item') ? "Magic Item" : which_equipament_type(data)),
      equipament_category_id: EquipamentCategory.find_by(name: data["equipment_category"]["name"]).id,
      homebrew: false,
      details: {
        rarity: data["rarity"],
        requires_attunement: data["requires_attunement"],
        weapon_category_id: EquipamentCategory.find_by(name: data["weapon_category"])&.id.to_s,
        armor_category_id: EquipamentCategory.find_by(name: data["armor_category"])&.id.to_s,
        gear_category_id: EquipamentCategory.find_by(name: data.dig("gear_category", "name"))&.id.to_s,
        vehicle_category_id: EquipamentCategory.find_by(name: data["vehicle_category"])&.id.to_s,
        tool_category_id: EquipamentCategory.find_by(name: data["tool_category"])&.id.to_s,
        cost: data["cost"],
        weight: data["weight"],
        weapon_range: data["weapon_range"],
        range: {
          normal: data.dig("range", "normal"),
          long: data.dig("range", "long")
        },
        damage: {
          damage_dice: data.dig("damage", "damage_dice"),
          damage_type: data.dig("damage", "damage_type", "name")
        },
        two_handend_damage: {
          damage_dice: data.dig("two_hand_damage", "damage_dice"),
          damage_type: data.dig("two_hand_damage", "damage_type", "name")
        },
        armor_class: data.dig("armor_class", "base"),
        strength_required: data["str_minimum"],
        stealth_disadvantage: data["stealth_disadvantage"],
        contents: data["contents"]
      }
    )
  end
end
