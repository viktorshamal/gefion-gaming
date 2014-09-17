require 'test_helper'

class ConversationsControllerTest < ActionController::TestCase
  test "should get clear" do
    get :clear
    assert_response :success
  end

end
