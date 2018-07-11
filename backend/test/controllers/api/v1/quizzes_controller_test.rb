require 'test_helper'

class Api::V1::QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_quizzes_show_url
    assert_response :success
  end

end
