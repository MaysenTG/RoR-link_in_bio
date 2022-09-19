require "test_helper"

class LandingpagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @landingpage = landingpages(:one)
  end

  test "should get index" do
    get landingpages_url
    assert_response :success
  end

  test "should get new" do
    get new_landingpage_url
    assert_response :success
  end

  test "should create landingpage" do
    assert_difference("Landingpage.count") do
      post landingpages_url, params: { landingpage: { url: @landingpage.url } }
    end

    assert_redirected_to landingpage_url(Landingpage.last)
  end

  test "should show landingpage" do
    get landingpage_url(@landingpage)
    assert_response :success
  end

  test "should get edit" do
    get edit_landingpage_url(@landingpage)
    assert_response :success
  end

  test "should update landingpage" do
    patch landingpage_url(@landingpage), params: { landingpage: { url: @landingpage.url } }
    assert_redirected_to landingpage_url(@landingpage)
  end

  test "should destroy landingpage" do
    assert_difference("Landingpage.count", -1) do
      delete landingpage_url(@landingpage)
    end

    assert_redirected_to landingpages_url
  end
end
