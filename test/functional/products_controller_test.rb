require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  test "request to google shopping api is successful" do
    get 'https://www.googleapis.com/shopping/search/v1/public/products?key=AIzaSyDk2XGfZpOUeNjOaBx6deWfbecbcGhBy04&country=US&q=digital+camera&alt=json'
    assert_response :success
  end

end