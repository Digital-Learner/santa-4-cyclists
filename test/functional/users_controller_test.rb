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

  test "anonymous users cannot edit any users" do
    put :update, {:id => 5}
    assert_redirected_to root_path
  end

  test "user can update their settings" do
    assert @test_user
    put :update, { id: @test_user.id, user: {email: "kungfoo@example.com"} }, {:user_id => @test_user.id}
    assert_redirected_to user_path(@test_user)
    # @test_user.reload
    assert_equal "kungfoo@example.com", User.find(@test_user.id).email
  end

  test "user can delete their profile" do
    assert @test_user
    assert_difference('User.count', -1) do
      delete :destroy, { :id => @test_user.id } , {:user_id => @test_user.id}
    end
  end

  test "anonymous users cannot delete any users" do
    delete :destroy, { id: 5 }
    assert_redirected_to root_path
  end

end
