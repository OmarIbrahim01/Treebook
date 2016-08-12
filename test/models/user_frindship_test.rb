require 'test_helper'

class UserFrindshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)


	test "that creating friendship works without raising an exeption" do
		assert_nothing_raised do
			UserFrindship.create user: users(:omar), friend: users(:mike)
		end
	end


end
