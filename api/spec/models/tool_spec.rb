RSpec.describe Tool, type: :model do
  let(:tool) { create(:tool) }
  let(:equipment) { create(:equipment) }

  describe 'associations' do
    it 'has one equipment' do
      tool.equipment = equipment
      expect(tool.equipment).to eq(equipment)
    end
  end

  describe 'enum' do
    it 'has the correct tool categories' do
      expect(Tool.categories).to eq(
        {
          "Artisan's Tools" => 0,
          "Gaming Sets" => 1,
          "Musical Instrument" => 2,
          "Other Tools" => 3
        }
      )
    end
  end
end
