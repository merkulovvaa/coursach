require "application_system_test_case"

class OutpatientCardsTest < ApplicationSystemTestCase
  setup do
    @outpatient_card = outpatient_cards(:one)
  end

  test "visiting the index" do
    visit outpatient_cards_url
    assert_selector "h1", text: "Outpatient cards"
  end

  test "should create outpatient card" do
    visit outpatient_cards_url
    click_on "New outpatient card"

    fill_in "Appointment", with: @outpatient_card.appointment_id
    fill_in "Patient", with: @outpatient_card.patient_id
    click_on "Create Outpatient card"

    assert_text "Outpatient card was successfully created"
    click_on "Back"
  end

  test "should update Outpatient card" do
    visit outpatient_card_url(@outpatient_card)
    click_on "Edit this outpatient card", match: :first

    fill_in "Appointment", with: @outpatient_card.appointment_id
    fill_in "Patient", with: @outpatient_card.patient_id
    click_on "Update Outpatient card"

    assert_text "Outpatient card was successfully updated"
    click_on "Back"
  end

  test "should destroy Outpatient card" do
    visit outpatient_card_url(@outpatient_card)
    click_on "Destroy this outpatient card", match: :first

    assert_text "Outpatient card was successfully destroyed"
  end
end
