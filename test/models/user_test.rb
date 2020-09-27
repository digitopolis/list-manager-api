require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user_count" do
    assert_equal 2, User.count
  end

  test "user has email address" do
    assert_equal "user2@email.com", users(:two).email
  end

  test "user can generate random token" do
    users(:one).generate_password_token!
    assert_equal 8, users(:one).password_token.length
  end

  test "user can check that tokens match" do
    users(:one).generate_password_token!
    token = users(:one).password_token
    assert users(:one).password_token_valid?(token)
    assert_not users(:one).password_token_valid?(SecureRandom.alphanumeric(8))
  end
end
