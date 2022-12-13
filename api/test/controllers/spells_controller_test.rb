require "test_helper"

class SpellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spell = spells(:one)
  end

  test "should get index" do
    get spells_url, as: :json
    assert_response :success
  end

  test "should create spell" do
    assert_difference("Spell.count") do
      post spells_url, params: { spell: { casting_time_qtd: @spell.casting_time_qtd, casting_time_type: @spell.casting_time_type, components: @spell.components, concentration?: @spell.concentration?, desc: @spell.desc, details: @spell.details, duration_qtd: @spell.duration_qtd, duration_type: @spell.duration_type, format: @spell.format, name: @spell.name, range: @spell.range, ritual?: @spell.ritual?, size: @spell.size, summoning?: @spell.summoning? } }, as: :json
    end

    assert_response :created
  end

  test "should show spell" do
    get spell_url(@spell), as: :json
    assert_response :success
  end

  test "should update spell" do
    patch spell_url(@spell), params: { spell: { casting_time_qtd: @spell.casting_time_qtd, casting_time_type: @spell.casting_time_type, components: @spell.components, concentration?: @spell.concentration?, desc: @spell.desc, details: @spell.details, duration_qtd: @spell.duration_qtd, duration_type: @spell.duration_type, format: @spell.format, name: @spell.name, range: @spell.range, ritual?: @spell.ritual?, size: @spell.size, summoning?: @spell.summoning? } }, as: :json
    assert_response :success
  end

  test "should destroy spell" do
    assert_difference("Spell.count", -1) do
      delete spell_url(@spell), as: :json
    end

    assert_response :no_content
  end
end
