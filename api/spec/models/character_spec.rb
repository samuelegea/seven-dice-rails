class CharacterTest < ActiveSupport::TestCase
  test 'character has a valid race' do
    character = Character.create(race: Race.first)
    assert character.valid?
  end

  test 'character has a valid subrace' do
    character = Character.create(subrace: Subrace.first)
    assert character.valid?
  end
end
