require "test_helper"

class DndSubClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dnd_sub_class = dnd_sub_classes(:one)
  end

  test "should get index" do
    get dnd_sub_classes_url, as: :json
    assert_response :success
  end

  test "should create dnd_sub_class" do
    assert_difference("DndSubClass.count") do
      post dnd_sub_classes_url, params: { dnd_sub_class: { desc: @dnd_sub_class.desc, details: @dnd_sub_class.details, dnd_class_id: @dnd_sub_class.dnd_class_id, name: @dnd_sub_class.name } }, as: :json
    end

    assert_response :created
  end

  test "should show dnd_sub_class" do
    get dnd_sub_class_url(@dnd_sub_class), as: :json
    assert_response :success
  end

  test "should update dnd_sub_class" do
    patch dnd_sub_class_url(@dnd_sub_class), params: { dnd_sub_class: { desc: @dnd_sub_class.desc, details: @dnd_sub_class.details, dnd_class_id: @dnd_sub_class.dnd_class_id, name: @dnd_sub_class.name } }, as: :json
    assert_response :success
  end

  test "should destroy dnd_sub_class" do
    assert_difference("DndSubClass.count", -1) do
      delete dnd_sub_class_url(@dnd_sub_class), as: :json
    end

    assert_response :no_content
  end
end
