require "application_system_test_case"

class PlaceImagesTest < ApplicationSystemTestCase
  setup do
    @place_image = place_images(:one)
  end

  test "visiting the index" do
    visit place_images_url
    assert_selector "h1", text: "Place Images"
  end

  test "creating a Place image" do
    visit place_images_url
    click_on "New Place Image"

    fill_in "Image", with: @place_image.image
    fill_in "Place", with: @place_image.place_id
    click_on "Create Place image"

    assert_text "Place image was successfully created"
    click_on "Back"
  end

  test "updating a Place image" do
    visit place_images_url
    click_on "Edit", match: :first

    fill_in "Image", with: @place_image.image
    fill_in "Place", with: @place_image.place_id
    click_on "Update Place image"

    assert_text "Place image was successfully updated"
    click_on "Back"
  end

  test "destroying a Place image" do
    visit place_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Place image was successfully destroyed"
  end
end
