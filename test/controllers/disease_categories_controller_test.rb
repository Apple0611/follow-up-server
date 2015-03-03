require 'test_helper'

class DiseaseCategoriesControllerTest < ActionController::TestCase
  setup do
    @disease_category = disease_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disease_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disease_category" do
    assert_difference('DiseaseCategory.count') do
      post :create, disease_category: { description: @disease_category.description, is_active: @disease_category.is_active, is_bottom: @disease_category.is_bottom, is_empty: @disease_category.is_empty, level: @disease_category.level, name: @disease_category.name, parent: @disease_category.parent }
    end

    assert_redirected_to disease_category_path(assigns(:disease_category))
  end

  test "should show disease_category" do
    get :show, id: @disease_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disease_category
    assert_response :success
  end

  test "should update disease_category" do
    patch :update, id: @disease_category, disease_category: { description: @disease_category.description, is_active: @disease_category.is_active, is_bottom: @disease_category.is_bottom, is_empty: @disease_category.is_empty, level: @disease_category.level, name: @disease_category.name, parent: @disease_category.parent }
    assert_redirected_to disease_category_path(assigns(:disease_category))
  end

  test "should destroy disease_category" do
    assert_difference('DiseaseCategory.count', -1) do
      delete :destroy, id: @disease_category
    end

    assert_redirected_to disease_categories_path
  end
end
