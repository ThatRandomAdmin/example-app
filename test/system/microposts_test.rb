require "application_system_test_case"

class Test < ApplicationSystemTestCase
  setup do
    @micropost = (:one)
  end

  test "visiting the index" do
    visit _url
    assert_selector "h1", text: ""
  end

  test "creating a Micropost" do
    visit _url
    click_on "New Micropost"

    fill_in "Content", with: @micropost.content
    fill_in "User", with: @micropost.user_id
    click_on "Create Micropost"

    assert_text "Micropost was successfully created"
    click_on "Back"
  end

  test "updating a Micropost" do
    visit _url
    click_on "Edit", match: :first

    fill_in "Content", with: @micropost.content
    fill_in "User", with: @micropost.user_id
    click_on "Update Micropost"

    assert_text "Micropost was successfully updated"
    click_on "Back"
  end

  test "destroying a Micropost" do
    visit _url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Micropost was successfully destroyed"
  end
end
