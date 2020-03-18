require "application_system_test_case"

class BlastsTest < ApplicationSystemTestCase
  setup do
    @blast = blasts(:one)
  end

  test "visiting the index" do
    visit blasts_url
    assert_selector "h1", text: "Blasts"
  end

  test "creating a Blast" do
    visit blasts_url
    click_on "New Blast"

    fill_in "Delivery attempts", with: @blast.delivery_attempts
    fill_in "Message", with: @blast.message_id
    fill_in "Recipients", with: @blast.recipients
    fill_in "Send at", with: @blast.send_at
    click_on "Create Blast"

    assert_text "Blast was successfully created"
    click_on "Back"
  end

  test "updating a Blast" do
    visit blasts_url
    click_on "Edit", match: :first

    fill_in "Delivery attempts", with: @blast.delivery_attempts
    fill_in "Message", with: @blast.message_id
    fill_in "Recipients", with: @blast.recipients
    fill_in "Send at", with: @blast.send_at
    click_on "Update Blast"

    assert_text "Blast was successfully updated"
    click_on "Back"
  end

  test "destroying a Blast" do
    visit blasts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blast was successfully destroyed"
  end
end
