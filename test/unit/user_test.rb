require 'test_helper'

class UserTest < ActiveSupport::TestCase
    should have_many(:user_friendships)
    should have_many(:friends)


    test "a user should enter a first name" do
        user = User.new
        assert !user.save
        assert !user.errors[:first_name].empty?
    end

    test "a user should enter a last name" do
        user = User.new
        assert !user.save
        assert !user.errors[:last_name].empty?
    end

    test "a user should enter a profile name" do
        user = User.new
        assert !user.save
        assert !user.errors[:profile_name].empty?
    end

    test "a user shloud have a unique profile name" do
    	user = User.new
    	user.profile_name = users(:jason).profile_name

    	assert !user.save
    	assert !user.errors[:profile_name].empty?
    end

    test "a user should have a profile name without spaces" do
        user = User.new(first_name: 'jason', last_name: 'word', email: 'jasonw2@abv.bg')
        user.password = user.password_confirmation = 'asdfasdf'
        
        user.profile_name = "My profile with spaces"

        assert !user.save
        assert !user.errors[:profile_name].empty?
        assert user.errors[:profile_name].include?("Must be formatted correctly!")
    end

    test "a user can have a correctly formatted profile name" do
        user = User.new(first_name: 'jason', last_name: 'word', email: 'jasonw2@abv.bg')
        user.password = user.password_confirmation = 'asdfasdf'

        user.profile_name = 'jasonword_1'
        assert user.valid?
    end

    test "that no errors when trying to access a friend list" do
        assert_nothing_raised do
            users(:jason).friends
        end
    end

    test "that creating friendship on a user works" do
        users(:jason).friends << users(:mike)
        users(:jason).friends.reload
        assert users(:jason).friends.include?(users(:mike))
    end

    test "that creating friendship works on user_id and friend_id basis" do
        UserFriendship.create user_id: users(:jason).id, friend_id: users(:mike).id
        assert users(:jason).friends.include?(users(:mike))
    end
end
