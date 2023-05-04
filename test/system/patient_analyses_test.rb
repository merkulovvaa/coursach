require "application_system_test_case"

class PatientAnalysesTest < ApplicationSystemTestCase
  setup do
    @patient_analysis = patient_analyses(:one)
  end

  test "visiting the index" do
    visit patient_analyses_url
    assert_selector "h1", text: "Patient analyses"
  end

  test "should create patient analysis" do
    visit patient_analyses_url
    click_on "New patient analysis"

    fill_in "Analysis date", with: @patient_analysis.analysis_date
    fill_in "Analysis", with: @patient_analysis.analysis_id
    click_on "Create Patient analysis"

    assert_text "Patient analysis was successfully created"
    click_on "Back"
  end

  test "should update Patient analysis" do
    visit patient_analysis_url(@patient_analysis)
    click_on "Edit this patient analysis", match: :first

    fill_in "Analysis date", with: @patient_analysis.analysis_date
    fill_in "Analysis", with: @patient_analysis.analysis_id
    click_on "Update Patient analysis"

    assert_text "Patient analysis was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient analysis" do
    visit patient_analysis_url(@patient_analysis)
    click_on "Destroy this patient analysis", match: :first

    assert_text "Patient analysis was successfully destroyed"
  end
end
