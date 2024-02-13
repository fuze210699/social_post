require "test_helper"

class Api::V1::NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_news_index_url
    assert_response :success
  end
end
