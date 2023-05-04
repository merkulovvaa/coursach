require "application_system_test_case"

class SpecsTest < ApplicationSystemTestCase
  setup do
    @spec = specs(:one)
  end

  test "visiting the index" do
    visit specs_url
    assert_selector "h1", text: "Specs"
  end

  test "should create spec" do
    visit specs_url
    click_on "New spec"

    fill_in "Name spec", with: @spec.name_spec
    click_on "Create Spec"

    assert_text "Spec was successfully created"
    click_on "Back"
  end

  test "should update Spec" do
    visit spec_url(@spec)
    click_on "Edit this spec", match: :first

    fill_in "Name spec", with: @spec.name_spec
    click_on "Update Spec"

    assert_text "Spec was successfully updated"
    click_on "Back"
  end

  test "should destroy Spec" do
    visit spec_url(@spec)
    click_on "Destroy this spec", match: :first

    assert_text "Spec was successfully destroyed"
  end
end
