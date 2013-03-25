require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.new(name: "Example User", email: "user@example.com" )
  end

  test "user" do
    assert_respond_to(@user, :name )
    assert_respond_to(@user, :email )
  end

end
