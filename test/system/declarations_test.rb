require "application_system_test_case"

class DeclarationsTest < ApplicationSystemTestCase
  setup do
    @declaration = declarations(:one)
  end

  test "visiting the index" do
    visit declarations_url
    assert_selector "h1", text: "Declarations"
  end

  test "should create declaration" do
    visit declarations_url
    click_on "New declaration"

    fill_in "Doctor", with: @declaration.doctor_id
    fill_in "Patient", with: @declaration.patient_id
    fill_in "Start date", with: @declaration.start_date
    click_on "Create Declaration"

    assert_text "Declaration was successfully created"
    click_on "Back"
  end

  test "should update Declaration" do
    visit declaration_url(@declaration)
    click_on "Edit this declaration", match: :first

    fill_in "Doctor", with: @declaration.doctor_id
    fill_in "Patient", with: @declaration.patient_id
    fill_in "Start date", with: @declaration.start_date
    click_on "Update Declaration"

    assert_text "Declaration was successfully updated"
    click_on "Back"
  end

  test "should destroy Declaration" do
    visit declaration_url(@declaration)
    click_on "Destroy this declaration", match: :first

    assert_text "Declaration was successfully destroyed"
  end
end
