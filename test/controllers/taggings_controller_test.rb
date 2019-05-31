require 'test_helper'

class TaggingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get taggings_new_url
    assert_response :success
  end

end
