class DamageTypesTest < ActiveSupport::TestCase
  test "damage_type values should be as expected" do
    assert_equal 0, DamageTypes.damage_types["Acid"]
    assert_equal 1, DamageTypes.damage_types["Bludgeoning"]
    assert_equal 2, DamageTypes.damage_types["Cold"]
    assert_equal 3, DamageTypes.damage_types["Fire"]
    assert_equal 4, DamageTypes.damage_types["Force"]
    assert_equal 5, DamageTypes.damage_types["Lightning"]
    assert_equal 7, DamageTypes.damage_types["Necrotic"]
    assert_equal 8, DamageTypes.damage_types["Piercing"]
    assert_equal 9, DamageTypes.damage_types["Poison"]
    assert_equal 10, DamageTypes.damage_types["Psychic"]
    assert_equal 11, DamageTypes.damage_types["Radiant"]
    assert_equal 12, DamageTypes.damage_types["Slashing"]
    assert_equal 13, DamageTypes.damage_types["Thunder"]
  end
end
