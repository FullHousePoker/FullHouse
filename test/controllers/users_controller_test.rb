require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test '#create creates user' do  
    user_params = {
      username: "ch33sybr3ad",
      password: "123456",
      first_name: "jason",
      last_name: "zhao" 
    }

    post :create, user: user_params

    user = JSON.parse(response.body)

    assert_equal user_params[:username], user["username"]
    assert_equal user_params[:password], user["password"]
    assert_equal user_params[:first_name], user["first_name"]
    assert_equal user_params[:last_name], user["last_name"]
  end
end
