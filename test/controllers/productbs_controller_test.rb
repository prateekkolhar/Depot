require 'test_helper'

class ProductbsControllerTest < ActionController::TestCase
  setup do
    @productb = productbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productb" do
    assert_difference('Productb.count') do
      post :create, productb: { description: @productb.description, image_url: @productb.image_url, price: @productb.price, string: @productb.string, title: @productb.title }
    end

    assert_redirected_to productb_path(assigns(:productb))
  end

  test "should show productb" do
    get :show, id: @productb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productb
    assert_response :success
  end

  test "should update productb" do
    patch :update, id: @productb, productb: { description: @productb.description, image_url: @productb.image_url, price: @productb.price, string: @productb.string, title: @productb.title }
    assert_redirected_to productb_path(assigns(:productb))
  end

  test "should destroy productb" do
    assert_difference('Productb.count', -1) do
      delete :destroy, id: @productb
    end

    assert_redirected_to productbs_path
  end
end
