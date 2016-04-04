require 'test_helper'

class SupermarketsControllerTest < ActionController::TestCase
  setup do
    @supermarket = supermarkets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supermarkets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supermarket" do
    assert_difference('Supermarket.count') do
      post :create, supermarket: { address_id: @supermarket.address_id, email: @supermarket.email, name: @supermarket.name, owner_id: @supermarket.owner_id, telefone: @supermarket.telefone }
    end

    assert_redirected_to supermarket_path(assigns(:supermarket))
  end

  test "should show supermarket" do
    get :show, id: @supermarket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supermarket
    assert_response :success
  end

  test "should update supermarket" do
    patch :update, id: @supermarket, supermarket: { address_id: @supermarket.address_id, email: @supermarket.email, name: @supermarket.name, owner_id: @supermarket.owner_id, telefone: @supermarket.telefone }
    assert_redirected_to supermarket_path(assigns(:supermarket))
  end

  test "should destroy supermarket" do
    assert_difference('Supermarket.count', -1) do
      delete :destroy, id: @supermarket
    end

    assert_redirected_to supermarkets_path
  end
end
