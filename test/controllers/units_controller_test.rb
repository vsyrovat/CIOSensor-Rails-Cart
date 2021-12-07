require "test_helper"

class UnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit1 = units(:one)
    @updated_unit1 = { name: 'l' }
  end

  test "should get index" do
    get units_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_url
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post units_url, params: { unit: { name: @updated_unit1[:name] } }
    end

    assert_redirected_to unit_url(Unit.last)
  end

  test "should show unit" do
    get unit_url(@unit1)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_url(@unit1)
    assert_response :success
  end

  test "should update unit" do
    patch unit_url(@unit1), params: { unit: { name: @updated_unit1[:name] } }
    assert_redirected_to unit_url(@unit1)
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete unit_url(@unit1)
    end

    assert_redirected_to units_url
  end
end
