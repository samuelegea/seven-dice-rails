RSpec.describe Equipment, type: :model do
  let(:equipment) { Equipment.create }

  describe 'table_name' do
    it 'uses equipments as the table name' do
      expect(Equipment.table_name).to eq('equipments')
    end
  end

  describe 'associations' do
    it { should belong_to(:source).optional }
    it { should belong_to(:equipment_category) }
  end

  describe 'include Costs' do
    it 'includes Costs module' do
      expect(Equipment.included_modules).to include(Costs)
    end
  end
end
