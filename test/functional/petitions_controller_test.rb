require 'test_helper'

class PetitionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get mypetitions" do
    get :mypetitions
    assert_response :success
  end

end