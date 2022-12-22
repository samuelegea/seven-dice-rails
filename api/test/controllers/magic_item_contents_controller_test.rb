require "test_helper"

class MagicItemContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @magic_item_content = magic_item_contents(:one)
  end

  test "should get index" do
    get magic_item_contents_url, as: :json
    assert_response :success
  end

  test "should create magic_item_content" do
    assert_difference("MagicItemContent.count") do
      post magic_item_contents_url, params: { magic_item_content: { holded_equipament_id: @magic_item_content.holded_equipament_id, holder_equipament_id: @magic_item_content.holder_equipament_id, quantity: @magic_item_content.quantity } }, as: :json
    end

    assert_response :created
  end

  test "should show magic_item_content" do
    get magic_item_content_url(@magic_item_content), as: :json
    assert_response :success
  end

  test "should update magic_item_content" do
    patch magic_item_content_url(@magic_item_content), params: { magic_item_content: { holded_equipament_id: @magic_item_content.holded_equipament_id, holder_equipament_id: @magic_item_content.holder_equipament_id, quantity: @magic_item_content.quantity } }, as: :json
    assert_response :success
  end

  test "should destroy magic_item_content" do
    assert_difference("MagicItemContent.count", -1) do
      delete magic_item_content_url(@magic_item_content), as: :json
    end

    assert_response :no_content
  end
end
