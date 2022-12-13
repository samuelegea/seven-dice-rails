require "test_helper"

class FeatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feat = feats(:one)
  end

  test "should get index" do
    get feats_url, as: :json
    assert_response :success
  end

  test "should create feat" do
    assert_difference("Feat.count") do
      post feats_url, params: { feat: { desc: @feat.desc, details: @feat.details, name: @feat.name } }, as: :json
    end

    assert_response :created
  end

  test "should show feat" do
    get feat_url(@feat), as: :json
    assert_response :success
  end

  test "should update feat" do
    patch feat_url(@feat), params: { feat: { desc: @feat.desc, details: @feat.details, name: @feat.name } }, as: :json
    assert_response :success
  end

  test "should destroy feat" do
    assert_difference("Feat.count", -1) do
      delete feat_url(@feat), as: :json
    end

    assert_response :no_content
  end
end
