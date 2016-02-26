require 'test_helper'

class DonesControllerTest < ActionController::TestCase
  setup do
    @done = dones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create done" do
    assert_difference('Done.count') do
      post :create, done: { content: @done.content, user_id: @done.user_id }
    end

    assert_redirected_to done_path(assigns(:done))
  end

  test "should show done" do
    get :show, id: @done
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @done
    assert_response :success
  end

  test "should update done" do
    patch :update, id: @done, done: { content: @done.content, user_id: @done.user_id }
    assert_redirected_to done_path(assigns(:done))
  end

  test "should destroy done" do
    assert_difference('Done.count', -1) do
      delete :destroy, id: @done
    end

    assert_redirected_to dones_path
  end
end
