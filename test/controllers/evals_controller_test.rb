require 'test_helper'

class EvalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evals_index_url
    assert_response :success
  end

end
