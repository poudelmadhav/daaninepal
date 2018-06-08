require 'test_helper'

class DonorformsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @donorform = donorforms(:one)
  end

  test "should get index" do
    get donorforms_url
    assert_response :success
  end

  test "should get new" do
    get new_donorform_url
    assert_response :success
  end

  test "should create donorform" do
    assert_difference('Donorform.count') do
      post donorforms_url, params: { donorform: { amount: @donorform.amount, approve: @donorform.approve, deadline: @donorform.deadline, description: @donorform.description, promises: @donorform.promises, reject: @donorform.reject, title: @donorform.title, user_id: @donorform.user_id } }
    end

    assert_redirected_to donorform_url(Donorform.last)
  end

  test "should show donorform" do
    get donorform_url(@donorform)
    assert_response :success
  end

  test "should get edit" do
    get edit_donorform_url(@donorform)
    assert_response :success
  end

  test "should update donorform" do
    patch donorform_url(@donorform), params: { donorform: { amount: @donorform.amount, approve: @donorform.approve, deadline: @donorform.deadline, description: @donorform.description, promises: @donorform.promises, reject: @donorform.reject, title: @donorform.title, user_id: @donorform.user_id } }
    assert_redirected_to donorform_url(@donorform)
  end

  test "should destroy donorform" do
    assert_difference('Donorform.count', -1) do
      delete donorform_url(@donorform)
    end

    assert_redirected_to donorforms_url
  end
end
