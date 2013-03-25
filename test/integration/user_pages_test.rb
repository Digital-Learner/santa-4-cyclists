require 'test_helper'

class UserPagesTest < ActionDispatch::IntegrationTest
  test "registration page link is on home page" do
    get '/'
    assert_select 'a' 
  end

  test "registration of new user" do
    get '/registration'
    assert :success 
  end



end
