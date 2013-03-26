require 'test_helper'
require 'factories/user_factory'

class SessionsControllerTest < ActionController::TestCase

  test "user can login" do
    # create the user
    @user = UserFactory.user
    # assert the user is not logged in
    refute session[:user_id]
    # send a post request to the create action, sending form data along, including the correct password
    # this simulates a user submitting a form with two fields named session[email] and session[password]
    post :create, { :session => { :email => @user.email, :password => @user.password } }
    # assert the user is logged in
    assert_equal @user.id, session[:user_id]
    # assert a redirect to
    # assert_redirected_to user_path(assigns(:user)) <==== Ask why this doesn't work
    assert_redirected_to :controller => :users, :action => :show, :id => @user.id
  end

  # test "user can logout" do

  # end


end