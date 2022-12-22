require "test_helper"

class EquipamentContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipament_content = equipament_contents(:one)
  end

  test "should get index" do
    get equipament_contents_url, as: :json
    assert_response :success
  end

  test "should create equipament_content" do
    assert_difference("EquipamentContent.count") do
      post equipament_contents_url, params: { equipament_content: { holded_equipament_id: @equipament_content.holded_equipament_id, holder_equipament_id: @equipament_content.holder_equipament_id, quantity: @equipament_content.quantity } }, as: :json
    end

    assert_response :created
  end

  test "should show equipament_content" do
    get equipament_content_url(@equipament_content), as: :json
    assert_response :success
  end

  test "should update equipament_content" do
    patch equipament_content_url(@equipament_content), params: { equipament_content: { holded_equipament_id: @equipament_content.holded_equipament_id, holder_equipament_id: @equipament_content.holder_equipament_id, quantity: @equipament_content.quantity } }, as: :json
    assert_response :success
  end

  test "should destroy equipament_content" do
    assert_difference("EquipamentContent.count", -1) do
      delete equipament_content_url(@equipament_content), as: :json
    end

    assert_response :no_content
  end
end
