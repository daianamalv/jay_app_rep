require 'test_helper'

class PlaceImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place_image = place_images(:one)
  end

  test "should get index" do
    get place_images_url
    assert_response :success
  end

  test "should get new" do
    get new_place_image_url
    assert_response :success
  end

  test "should create place_image" do
    assert_difference('PlaceImage.count') do
      post place_images_url, params: { place_image: { image: @place_image.image, place_id: @place_image.place_id } }
    end

    assert_redirected_to place_image_url(PlaceImage.last)
  end

  test "should show place_image" do
    get place_image_url(@place_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_place_image_url(@place_image)
    assert_response :success
  end

  test "should update place_image" do
    patch place_image_url(@place_image), params: { place_image: { image: @place_image.image, place_id: @place_image.place_id } }
    assert_redirected_to place_image_url(@place_image)
  end

  test "should destroy place_image" do
    assert_difference('PlaceImage.count', -1) do
      delete place_image_url(@place_image)
    end

    assert_redirected_to place_images_url
  end
end
