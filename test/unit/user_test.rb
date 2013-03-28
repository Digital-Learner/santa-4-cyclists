# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.new( name: "Example User", 
                      email: "user@example.com",
                      password: "foobar",
                      password_confirmation: "foobar" 
                    )
  end

  test "user" do
    assert_respond_to(@user, :name )
    assert_respond_to(@user, :email )
    assert_respond_to(@user, :password_digest )
    assert_respond_to(@user, :password )
    assert_respond_to(@user, :password_confirmation )
    assert_respond_to(@user, :authenticate )

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

  test "when email is not present" do
    @user.email = nil
    refute @user.valid?    
    assert @user.errors[:email].include? "can't be blank"
    assert @user.errors[:email].any?
  end

  test "when email does not contain '@' " do
    @user.email = "bob_at_gmail.com"
    refute @user.valid?
  end

  test "when email already assigned to existing user" do
    user_with_same_email = @user.dup
    user_with_same_email.email = @user.email.upcase
    user_with_same_email.save
    refute @user.valid?
  end

  test "when password is not present" do
    @user.password = @user.password_confirmation = " "
    assert @user.invalid?
  end

  test "when password doesn't match confirmation" do
    @user.password_confirmation = "mismatch"
    assert @user.invalid?
  end

  test "when password confirmation is nil" do
    @user.password = @user.password_confirmation = nil
    assert @user.invalid?
  end

  test "when password confirmation by itself is nil" do
    @user.password_confirmation = nil
    assert @user.invalid?
  end

  test "return value of authenticate method with valid password" do
    @user.save
    found_user = User.find_by_email(@user.email)
    assert_equal found_user.authenticate(@user.password), @user.authenticate(@user.password)
  end

  test "with invalid password" do
    @user.save
    found_user = User.find_by_email(@user.email)
    user_for_invalid_password = found_user.authenticate("invalid")

    assert_not_equal user_for_invalid_password, @user.password
    assert user_for_invalid_password == false
  end

  test "with a password that's too short" do
    @user.password = @user.password_confirmation = "a" * 5
    assert @user.invalid?
  end
end
