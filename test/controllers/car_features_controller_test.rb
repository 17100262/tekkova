require 'test_helper'

class CarFeaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_feature = car_features(:one)
  end

  test "should get index" do
    get car_features_url
    assert_response :success
  end

  test "should get new" do
    get new_car_feature_url
    assert_response :success
  end

  test "should create car_feature" do
    assert_difference('CarFeature.count') do
      post car_features_url, params: { car_feature: { name: @car_feature.name } }
    end

    assert_redirected_to car_feature_url(CarFeature.last)
  end

  test "should show car_feature" do
    get car_feature_url(@car_feature)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_feature_url(@car_feature)
    assert_response :success
  end

  test "should update car_feature" do
    patch car_feature_url(@car_feature), params: { car_feature: { name: @car_feature.name } }
    assert_redirected_to car_feature_url(@car_feature)
  end

  test "should destroy car_feature" do
    assert_difference('CarFeature.count', -1) do
      delete car_feature_url(@car_feature)
    end

    assert_redirected_to car_features_url
  end
end
