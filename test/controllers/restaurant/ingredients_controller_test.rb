require 'test_helper'

class Restaurant::IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant_ingredient = restaurant_ingredients(:one)
  end

  test "should get index" do
    get restaurant_ingredients_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_ingredient_url
    assert_response :success
  end

  test "should create restaurant_ingredient" do
    assert_difference('Restaurant::Ingredient.count') do
      post restaurant_ingredients_url, params: { restaurant_ingredient: { name: @restaurant_ingredient.name } }
    end

    assert_redirected_to restaurant_ingredient_url(Restaurant::Ingredient.last)
  end

  test "should show restaurant_ingredient" do
    get restaurant_ingredient_url(@restaurant_ingredient)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_ingredient_url(@restaurant_ingredient)
    assert_response :success
  end

  test "should update restaurant_ingredient" do
    patch restaurant_ingredient_url(@restaurant_ingredient), params: { restaurant_ingredient: { name: @restaurant_ingredient.name } }
    assert_redirected_to restaurant_ingredient_url(@restaurant_ingredient)
  end

  test "should destroy restaurant_ingredient" do
    assert_difference('Restaurant::Ingredient.count', -1) do
      delete restaurant_ingredient_url(@restaurant_ingredient)
    end

    assert_redirected_to restaurant_ingredients_url
  end
end
