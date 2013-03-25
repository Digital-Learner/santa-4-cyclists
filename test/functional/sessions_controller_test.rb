require 'test_helper'
require 'factories/user_factory'

class SessionsControllerTest < ActionController::TestCase

  test "user can login" do
    # create the user
    @user = UserFactory.user
    # assert the user is not logged in
    refute session[:user_id]
    # send a post request to the create action, sending form data along, including the correct password
    p @user.inspect
    post :create, user: @user
    # assert the user is logged in
    assert session[:user_id]
    # assert a redirect to
  end

  # test "user can logout" do

  # end


end