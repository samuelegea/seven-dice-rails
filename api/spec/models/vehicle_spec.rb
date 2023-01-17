RSpec.describe Vehicle, type: :model do
  let(:vehicle) { create(:vehicle) }
  let(:equipment) { create(:equipment) }

  describe 'associations' do
    it 'has one equipment' do
      vehicle.equipment = equipment
      expect(vehicle.equipment).to eq(equipment)
    end
  end

  describe 'enum' do
    it 'has the correct vehicle categories' do
      expect(Vehicle.vehicle_categories).to eq({
                                                 'Mounts and Other Animals' => 0,
                                                 'Tack, Harness, and Drawn Vehicles' => 1,
                                                 'Waterborne Vehicles' => 2
                                               })
    end
  end
end
