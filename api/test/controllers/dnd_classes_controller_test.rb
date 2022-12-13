require "test_helper"

class DndClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dnd_class = dnd_classes(:one)
  end

  test "should get index" do
    get dnd_classes_url, as: :json
    assert_response :success
  end

  test "should create dnd_class" do
    assert_difference("DndClass.count") do
      post dnd_classes_url, params: { dnd_class: { desc: @dnd_class.desc, details: @dnd_class.details, name: @dnd_class.name } }, as: :json
    end

    assert_response :created
  end

  test "should show dnd_class" do
    get dnd_class_url(@dnd_class), as: :json
    assert_response :success
  end

  test "should update dnd_class" do
    patch dnd_class_url(@dnd_class), params: { dnd_class: { desc: @dnd_class.desc, details: @dnd_class.details, name: @dnd_class.name } }, as: :json
    assert_response :success
  end

  test "should destroy dnd_class" do
    assert_difference("DndClass.count", -1) do
      delete dnd_class_url(@dnd_class), as: :json
    end

    assert_response :no_content
  end
end
