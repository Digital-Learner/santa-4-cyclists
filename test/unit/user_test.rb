require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.new(name: "Example User", email: "user@example.com" )
  end

  test "user" do
    assert_respond_to(@user, :name )
    assert_respond_to(@user, :email )
    assert @user.valid?
  end

  test "when name is not present" do
    @user.name = ""
    assert @user.invalid?, "User has no name"
  end

  test "when user name is too long" do
    @user.name = "a" * 26
    assert @user.invalid?, "User name is too long (25 chars max)"
  end

end
