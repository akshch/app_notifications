require "test_helper"

class DeviceInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get device_infos_create_url
    assert_response :success
  end
end
