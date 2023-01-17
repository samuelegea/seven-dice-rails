RSpec.describe Weapon, type: :model do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:weapon_properties) }
    it { is_expected.to have_one(:equipment).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:damage_type) }
  end

  describe '#damage_types' do
    it 'should include DamageTypes' do
      expect(Weapon.included_modules).to include DamageTypes
    end
  end
end
