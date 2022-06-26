require "test_helper"

class AnalysisControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get analysis_create_url
    assert_response :success
  end
end
