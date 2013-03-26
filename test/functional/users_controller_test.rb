require 'test_helper'
require 'factories/user_factory'


class UsersControllerTest < ActionController::TestCase

  def setup
    @test_user = UserFactory.user
  end

  def login_user
    {:user_id => @test_user.id}
    # session[:user_id] => @test_user.id
  end

  test "can get new" do
    get :new
    assert_response :success
  end

  test "user can be created" do
    post :create, { user: { name: "Example User",
                            email: "foo@example.com",
                            password: "foobar",
                            password_confirmation: "foobar"
                          }
                   }
    assert_redirected_to user_path(assigns(:user))
  end

  # test "user can edit their settings" do
  #   self.login_user
  #   assert_equal @test_user.id, session[:user_id]


  # end

end