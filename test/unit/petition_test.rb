require 'test_helper'

class PetitionTest < ActiveSupport::TestCase
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

  test 'Title is required' do
    @petition.title = ''
    assert !@petition.save
  end

  test '4 char title is not allowed' do
    @petition.title = '1234'
    assert !@petition.save
  end

  test 'Content is required' do
    @petition.body = ''
    assert !@petition.save
  end

  test '19 char content is not allowed' do
    @petition.body = '1234567890123456789'
    assert !@petition.save
  end

  test 'Target is required' do
    @petition.target = ''
    assert !@petition.save
  end

  test 'User is required' do
    @petition.user_id = ''
    assert !@petition.save
  end
end
