require 'test_helper'

class CarClassesControllerTest < ActionController::TestCase
  setup do
    @car_class = car_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:car_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create car_class" do
    assert_difference('CarClass.count') do
      post :create, car_class: @car_class.attributes
    end

    assert_redirected_to car_class_path(assigns(:car_class))
  end

  test "should show car_class" do
    get :show, id: @car_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @car_class
    assert_response :success
  end

  test "should update car_class" do
    put :update, id: @car_class, car_class: @car_class.attributes
    assert_redirected_to car_class_path(assigns(:car_class))
  end

  test "should destroy car_class" do
    assert_difference('CarClass.count', -1) do
      delete :destroy, id: @car_class
    end

    assert_redirected_to car_classes_path
  end
end
