require 'test_helper'

class PetitionsControllerTest < ActionController::TestCase
  setup do
    @user = User.new
    @user.name = 'Test'
    @user.save

    @petition = Petition.new
    @petition.title = 'Test Petition'
    @petition.body = 'Make the world a better place'
    @petition.user_id = @user.id
    @petition.target = 1
    @petition.save
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get redirect' do
    get :new
    assert_response 302
  end

  test 'should show petition' do
    get :show, id: @petition
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @petition
    assert_response :success
  end

  test 'should destroy petition' do
    assert_difference('Petition.count', -1) do
      delete :destroy, id: @petition
    end
  end

  test 'mypetitions should redirect' do
    get :mypetitions
    assert_response 302
  end

end
