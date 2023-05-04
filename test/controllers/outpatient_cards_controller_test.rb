require "test_helper"

class OutpatientCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outpatient_card = outpatient_cards(:one)
  end

  test "should get index" do
    get outpatient_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_outpatient_card_url
    assert_response :success
  end

  test "should create outpatient_card" do
    assert_difference("OutpatientCard.count") do
      post outpatient_cards_url, params: { outpatient_card: { appointment_id: @outpatient_card.appointment_id, patient_id: @outpatient_card.patient_id } }
    end

    assert_redirected_to outpatient_card_url(OutpatientCard.last)
  end

  test "should show outpatient_card" do
    get outpatient_card_url(@outpatient_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_outpatient_card_url(@outpatient_card)
    assert_response :success
  end

  test "should update outpatient_card" do
    patch outpatient_card_url(@outpatient_card), params: { outpatient_card: { appointment_id: @outpatient_card.appointment_id, patient_id: @outpatient_card.patient_id } }
    assert_redirected_to outpatient_card_url(@outpatient_card)
  end

  test "should destroy outpatient_card" do
    assert_difference("OutpatientCard.count", -1) do
      delete outpatient_card_url(@outpatient_card)
    end

    assert_redirected_to outpatient_cards_url
  end
end
