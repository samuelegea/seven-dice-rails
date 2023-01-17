RSpec.describe Armor, type: :model do
  it { is_expected.to have_one(:equipment).dependent(:destroy).with_foreign_key(:source_id) }

  it { is_expected.to define_enum_for(:category).with_values(Light: 0, Medium: 1, Heavy: 2, Shield: 3) }
end
