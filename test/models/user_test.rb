require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end
	test "a user should enter a last_name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end
	test "a user should enter a profile_name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end
	test "a user should have unique profile name" do
		user = User.new
		user.profile_name = users(:omar).profile_name

		users(:omar)

		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a profile name without spaces" do
		user = User.new(first_name: 'Omar', last_name: 'Ibrahim', email: 'omar1@live.com')
		user.password = user.password_confirmation = 'qweasdzxc'

		user.profile_name = "My profile name with spaces"
		
		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end


	test"a user can have a correctly formatted profile name" do 
		user = User.new(first_name: 'Omar', last_name: 'Ibrahim', email: 'omar1@live.com')
		user.password = user.password_confirmation = 'qweasdzxc'

		user.profile_name = 'omaribrahim_1'
		assert user.valid?
	end

end
