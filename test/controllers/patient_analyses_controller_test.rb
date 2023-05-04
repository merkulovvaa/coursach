require "test_helper"

class PatientAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_analysis = patient_analyses(:one)
  end

  test "should get index" do
    get patient_analyses_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_analysis_url
    assert_response :success
  end

  test "should create patient_analysis" do
    assert_difference("PatientAnalysis.count") do
      post patient_analyses_url, params: { patient_analysis: { analysis_date: @patient_analysis.analysis_date, analysis_id: @patient_analysis.analysis_id } }
    end

    assert_redirected_to patient_analysis_url(PatientAnalysis.last)
  end

  test "should show patient_analysis" do
    get patient_analysis_url(@patient_analysis)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_analysis_url(@patient_analysis)
    assert_response :success
  end

  test "should update patient_analysis" do
    patch patient_analysis_url(@patient_analysis), params: { patient_analysis: { analysis_date: @patient_analysis.analysis_date, analysis_id: @patient_analysis.analysis_id } }
    assert_redirected_to patient_analysis_url(@patient_analysis)
  end

  test "should destroy patient_analysis" do
    assert_difference("PatientAnalysis.count", -1) do
      delete patient_analysis_url(@patient_analysis)
    end

    assert_redirected_to patient_analyses_url
  end
end
