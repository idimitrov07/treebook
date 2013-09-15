require 'test_helper'

class UserFriendshipsControllerTest < ActionController::TestCase
  context "#new" do 
  	context "when not logged in" do
      should "redirect to login page" do
      	get :new
      	assert_response :redirect
      end
  	end

  	context "when logged in" do
  	  setup do
        sign_in users(:jason)
  	  end

  	  should "get new page and return success" do
  	  	get :new
  	  	assert_response :success
  	  end

  	  should "send a flash error is friend_id param is missing" do
  	  	get :new, {}
  	  	assert_equal "Friend required", flash[:error]
  	  end

  	  should "display the friends name" do
  	  	get :new, friend_id: users(:jim).id
  	  	assert_match /#{users(:jim).full_name}/, response.body
  	  end

  	  should "assign a new user friendship" do
  	  	get :new, friend_id: users(:jim).id
  	  	assert assigns(:user_friendship)
  	  end

  	  should "assign a new user friendship to the correct friend" do
  	  	get :new, friend_id: users(:jim).id
  	  	assert_equal users(:jim), assigns(:user_friendship).friend
  	  end

  	  should "assign a new user friendship to the currently logged in user" do
  	  	get :new, friend_id: users(:jim).id
  	  	assert_equal users(:jason), assigns(:user_friendship).user
  	  end

  	  should "return a 404 status if no friend is found" do
  	  	get :new, friend_id: 'invalid'
  	  	assert_response :not_found
  	  end

  	  should "ask if you really want to request this friendship" do
  	  	
  	  end

  	end
  end
end
