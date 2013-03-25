require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "can get new" do
    get :new
    assert_response :success
  end



  test "user can be created" do 
    post :create, { user: { name: "Example User", 
                            email: "user@example.com",
                            password: "foobar",
                            password_confirmation: "foobar" 
                          }
                   }
    assert_redirected_to user_path(assigns(:user))
  end


end