require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "list belongs to a user" do
    assert_equal 1, users(:one).lists.length
  end

  test "list has a title" do
    assert_equal "Custom", lists(:one).title
  end

  test "list belongs to correct user" do
    assert_equal lists(:one), users(:one).lists[0]
  end

  test "lists are created with new users" do
    test_user = User.create(email: "test@test.com", password: "test")
    assert_equal 2, test_user.lists.length
    test_user.destroy
  end

end
