require "test_helper"

class ProficienciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proficiency = proficiencies(:one)
  end

  test "should get index" do
    get proficiencies_url, as: :json
    assert_response :success
  end

  test "should create proficiency" do
    assert_difference("Proficiency.count") do
      post proficiencies_url, params: { proficiency: { equipament_type: @proficiency.equipament_type, source_id: @proficiency.source_id } }, as: :json
    end

    assert_response :created
  end

  test "should show proficiency" do
    get proficiency_url(@proficiency), as: :json
    assert_response :success
  end

  test "should update proficiency" do
    patch proficiency_url(@proficiency), params: { proficiency: { equipament_type: @proficiency.equipament_type, source_id: @proficiency.source_id } }, as: :json
    assert_response :success
  end

  test "should destroy proficiency" do
    assert_difference("Proficiency.count", -1) do
      delete proficiency_url(@proficiency), as: :json
    end

    assert_response :no_content
  end
end
