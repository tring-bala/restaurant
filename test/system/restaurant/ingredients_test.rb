require "application_system_test_case"

class Restaurant::IngredientsTest < ApplicationSystemTestCase
  setup do
    @restaurant_ingredient = restaurant_ingredients(:one)
  end

  test "visiting the index" do
    visit restaurant_ingredients_url
    assert_selector "h1", text: "Restaurant/Ingredients"
  end

  test "creating a Ingredient" do
    visit restaurant_ingredients_url
    click_on "New Restaurant/Ingredient"

    fill_in "Name", with: @restaurant_ingredient.name
    click_on "Create Ingredient"

    assert_text "Ingredient was successfully created"
    click_on "Back"
  end

  test "updating a Ingredient" do
    visit restaurant_ingredients_url
    click_on "Edit", match: :first

    fill_in "Name", with: @restaurant_ingredient.name
    click_on "Update Ingredient"

    assert_text "Ingredient was successfully updated"
    click_on "Back"
  end

  test "destroying a Ingredient" do
    visit restaurant_ingredients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ingredient was successfully destroyed"
  end
end
