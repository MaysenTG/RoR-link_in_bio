require "application_system_test_case"

class LandingpagesTest < ApplicationSystemTestCase
  setup do
    @landingpage = landingpages(:one)
  end

  test "visiting the index" do
    visit landingpages_url
    assert_selector "h1", text: "Landingpages"
  end

  test "should create landingpage" do
    visit landingpages_url
    click_on "New landingpage"

    fill_in "Url", with: @landingpage.url
    click_on "Create Landingpage"

    assert_text "Landingpage was successfully created"
    click_on "Back"
  end

  test "should update Landingpage" do
    visit landingpage_url(@landingpage)
    click_on "Edit this landingpage", match: :first

    fill_in "Url", with: @landingpage.url
    click_on "Update Landingpage"

    assert_text "Landingpage was successfully updated"
    click_on "Back"
  end

  test "should destroy Landingpage" do
    visit landingpage_url(@landingpage)
    click_on "Destroy this landingpage", match: :first

    assert_text "Landingpage was successfully destroyed"
  end
end
