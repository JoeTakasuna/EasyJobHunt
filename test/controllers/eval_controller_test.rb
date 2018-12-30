require 'test_helper'

class EvalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eval_index_url
    assert_response :success
  end

end
