describe Campaign do
  describe 'associations' do
    it { should belong_to(:created_by) }
    it { should belong_to(:dmed_by) }
  end
end
