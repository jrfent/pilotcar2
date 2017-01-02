require 'test_helper'

class LoadsControllerTest < ActionController::TestCase
  setup do
    @load = loads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create load" do
    assert_difference('Load.count') do
      post :create, load: { current_status: @load.current_status, delivery_datetime: @load.delivery_datetime, destination_city: @load.destination_city, destination_country: @load.destination_country, destination_state: @load.destination_state, destination_zipcode: @load.destination_zipcode, distance: @load.distance, fee: @load.fee, fee_type: @load.fee_type, origin_city: @load.origin_city, origin_country: @load.origin_country, origin_state: @load.origin_state, origin_zipcode: @load.origin_zipcode, pickup_datetime: @load.pickup_datetime, pilotcar_count: @load.pilotcar_count, polecar_needed: @load.polecar_needed, special_notes: @load.special_notes }
    end

    assert_redirected_to load_path(assigns(:load))
  end

  test "should show load" do
    get :show, id: @load
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @load
    assert_response :success
  end

  test "should update load" do
    patch :update, id: @load, load: { current_status: @load.current_status, delivery_datetime: @load.delivery_datetime, destination_city: @load.destination_city, destination_country: @load.destination_country, destination_state: @load.destination_state, destination_zipcode: @load.destination_zipcode, distance: @load.distance, fee: @load.fee, fee_type: @load.fee_type, origin_city: @load.origin_city, origin_country: @load.origin_country, origin_state: @load.origin_state, origin_zipcode: @load.origin_zipcode, pickup_datetime: @load.pickup_datetime, pilotcar_count: @load.pilotcar_count, polecar_needed: @load.polecar_needed, special_notes: @load.special_notes }
    assert_redirected_to load_path(assigns(:load))
  end

  test "should destroy load" do
    assert_difference('Load.count', -1) do
      delete :destroy, id: @load
    end

    assert_redirected_to loads_path
  end
end
