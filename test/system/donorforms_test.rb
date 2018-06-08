require "application_system_test_case"

class DonorformsTest < ApplicationSystemTestCase
  setup do
    @donorform = donorforms(:one)
  end

  test "visiting the index" do
    visit donorforms_url
    assert_selector "h1", text: "Donorforms"
  end

  test "creating a Donorform" do
    visit donorforms_url
    click_on "New Donorform"

    fill_in "Amount", with: @donorform.amount
    fill_in "Approve", with: @donorform.approve
    fill_in "Deadline", with: @donorform.deadline
    fill_in "Description", with: @donorform.description
    fill_in "Promises", with: @donorform.promises
    fill_in "Reject", with: @donorform.reject
    fill_in "Title", with: @donorform.title
    fill_in "User", with: @donorform.user_id
    click_on "Create Donorform"

    assert_text "Donorform was successfully created"
    click_on "Back"
  end

  test "updating a Donorform" do
    visit donorforms_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @donorform.amount
    fill_in "Approve", with: @donorform.approve
    fill_in "Deadline", with: @donorform.deadline
    fill_in "Description", with: @donorform.description
    fill_in "Promises", with: @donorform.promises
    fill_in "Reject", with: @donorform.reject
    fill_in "Title", with: @donorform.title
    fill_in "User", with: @donorform.user_id
    click_on "Update Donorform"

    assert_text "Donorform was successfully updated"
    click_on "Back"
  end

  test "destroying a Donorform" do
    visit donorforms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Donorform was successfully destroyed"
  end
end
