require "application_system_test_case"

class UserAccountsTest < ApplicationSystemTestCase
  setup do
    @user_account = user_accounts(:one)
  end

  test "visiting the index" do
    visit user_accounts_url
    assert_selector "h1", text: "User Accounts"
  end

  test "creating a User account" do
    visit user_accounts_url
    click_on "New User Account"

    fill_in "Address1", with: @user_account.address1
    fill_in "Address2", with: @user_account.address2
    fill_in "City", with: @user_account.city
    fill_in "Date of birth", with: @user_account.date_of_birth
    fill_in "Designation", with: @user_account.designation
    fill_in "First name", with: @user_account.first_name
    check "Gender" if @user_account.gender
    fill_in "Last name", with: @user_account.last_name
    fill_in "Phone number", with: @user_account.phone_number
    check "Relation status" if @user_account.relation_status
    fill_in "State", with: @user_account.state
    fill_in "User", with: @user_account.user_id
    fill_in "Zipcode", with: @user_account.zipcode
    click_on "Create User account"

    assert_text "User account was successfully created"
    click_on "Back"
  end

  test "updating a User account" do
    visit user_accounts_url
    click_on "Edit", match: :first

    fill_in "Address1", with: @user_account.address1
    fill_in "Address2", with: @user_account.address2
    fill_in "City", with: @user_account.city
    fill_in "Date of birth", with: @user_account.date_of_birth
    fill_in "Designation", with: @user_account.designation
    fill_in "First name", with: @user_account.first_name
    check "Gender" if @user_account.gender
    fill_in "Last name", with: @user_account.last_name
    fill_in "Phone number", with: @user_account.phone_number
    check "Relation status" if @user_account.relation_status
    fill_in "State", with: @user_account.state
    fill_in "User", with: @user_account.user_id
    fill_in "Zipcode", with: @user_account.zipcode
    click_on "Update User account"

    assert_text "User account was successfully updated"
    click_on "Back"
  end

  test "destroying a User account" do
    visit user_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User account was successfully destroyed"
  end
end
