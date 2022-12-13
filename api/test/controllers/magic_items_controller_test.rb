require "test_helper"

class MagicItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @magic_item = magic_items(:one)
  end

  test "should get index" do
    get magic_items_url, as: :json
    assert_response :success
  end

  test "should create magic_item" do
    assert_difference("MagicItem.count") do
      post magic_items_url, params: { magic_item: { desc: @magic_item.desc, details: @magic_item.details, name: @magic_item.name } }, as: :json
    end

    assert_response :created
  end

  test "should show magic_item" do
    get magic_item_url(@magic_item), as: :json
    assert_response :success
  end

  test "should update magic_item" do
    patch magic_item_url(@magic_item), params: { magic_item: { desc: @magic_item.desc, details: @magic_item.details, name: @magic_item.name } }, as: :json
    assert_response :success
  end

  test "should destroy magic_item" do
    assert_difference("MagicItem.count", -1) do
      delete magic_item_url(@magic_item), as: :json
    end

    assert_response :no_content
  end
end
