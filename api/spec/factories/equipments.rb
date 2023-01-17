FactoryBot.define do
  factory :equipment do
    name { 'Equipment' }
    description { 'Description' }
    cost_qtd { 1 }
    cost_unit { 'gp' }
    source { create(:weapon) }
    weight { 1 }
  end
end
