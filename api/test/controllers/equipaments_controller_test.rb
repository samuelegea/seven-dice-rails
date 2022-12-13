require "test_helper"

class EquipamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipament = equipaments(:one)
  end

  test "should get index" do
    get equipaments_url, as: :json
    assert_response :success
  end

  test "should create equipament" do
    assert_difference("Equipament.count") do
      post equipaments_url, params: { equipament: { desc: @equipament.desc, details: @equipament.details, name: @equipament.name } }, as: :json
    end

    assert_response :created
  end

  test "should show equipament" do
    get equipament_url(@equipament), as: :json
    assert_response :success
  end

  test "should update equipament" do
    patch equipament_url(@equipament), params: { equipament: { desc: @equipament.desc, details: @equipament.details, name: @equipament.name } }, as: :json
    assert_response :success
  end

  test "should destroy equipament" do
    assert_difference("Equipament.count", -1) do
      delete equipament_url(@equipament), as: :json
    end

    assert_response :no_content
  end
end
