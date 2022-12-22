require "test_helper"

class EquipamentCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipament_category = equipament_categories(:one)
  end

  test "should get index" do
    get equipament_categories_url, as: :json
    assert_response :success
  end

  test "should create equipament_category" do
    assert_difference("EquipamentCategory.count") do
      post equipament_categories_url, params: { equipament_category: { name: @equipament_category.name } }, as: :json
    end

    assert_response :created
  end

  test "should show equipament_category" do
    get equipament_category_url(@equipament_category), as: :json
    assert_response :success
  end

  test "should update equipament_category" do
    patch equipament_category_url(@equipament_category), params: { equipament_category: { name: @equipament_category.name } }, as: :json
    assert_response :success
  end

  test "should destroy equipament_category" do
    assert_difference("EquipamentCategory.count", -1) do
      delete equipament_category_url(@equipament_category), as: :json
    end

    assert_response :no_content
  end
end
