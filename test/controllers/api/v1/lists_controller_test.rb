require 'test_helper'

class Api::V1::ListsControllerTest < ActionDispatch::IntegrationTest
  test "get one list" do
    get api_v1_list_url(List.first)
    assert_response :ok
  end

  test "creating a new list with incorrect params returns error" do
    post api_v1_lists_url( { 'name' => 'wrong_list'} )
    assert_response :not_acceptable
  end
end
