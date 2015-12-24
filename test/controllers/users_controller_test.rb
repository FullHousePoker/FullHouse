require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test '#index returns all users' do
    get :index

    users = JSON.parse(response.body)

    assert_equal 2, users.count
  end

  test '#create creates user' do  
    user_params = {
      email: "ch33sybr3ad",
      first_name: "jason",
      last_name: "zhao" 
    }

    post :create, user: user_params

    user = JSON.parse(response.body)

    assert_equal user_params[:email], user["email"]
    assert_equal user_params[:first_name], user["first_name"]
    assert_equal user_params[:last_name], user["last_name"]
  end

  test '#update updates user' do
    user = users(:eunice)
    user_params = {
      last_name: "poop"
    }

    put :update, user: user_params, id: user.id

    user = JSON.parse(response.body)

    assert_equal user_params[:last_name], user['last_name']
  end

  test '#destroy destroys user' do
    user = users(:eunice)

    assert_difference 'User.count', -1 do 
      delete :destroy, id: user.id
    end

    assert_response 204
  end
end
