require "application_system_test_case"

class UnitsTest < ApplicationSystemTestCase
  setup do
    @unit1 = units(:one)
    @unit2 = units(:two)
    @updated_unit1 = { name: 'l' }
  end

  test "visiting the index" do
    visit units_url
    assert_selector "h1", text: "Units"
  end

  test "creating a Unit" do
    visit units_url
    click_on "New Unit"

    fill_in "Name", with: @updated_unit1[:name]
    click_on "Create Unit"

    assert_text "Unit was successfully created"
    click_on "Back"
  end

  test "updating a Unit" do
    visit units_url
    click_on "Edit", match: :first

    fill_in "Name", with: @updated_unit1[:name]
    click_on "Update Unit"

    assert_text "Unit was successfully updated"
    click_on "Back"
  end

  test "destroying a Unit" do
    visit units_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unit was successfully destroyed"
  end
end
