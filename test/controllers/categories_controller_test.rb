require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should create a category" do
    assert_difference("Category.count", 1) do
      post categories_path, params: { category: {name: "Test Category"}}
      assert_response :redirect
    end
    
    # post categories_path, params: { category: {name: "Test Category"}}
    # assert_response :success
  end

  test "should show category" do
    get categories_path(1)
    assert_response :success
  end

  test "should not save category without name" do
    category  = Category.new
    assert_not category.save, "Saved the category without a name"
  end

  test "should report error" do
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

  test "should edit category" do
    @category = Category.create(name: "Edit Category")
    get edit_category_path(@category)
    assert_response :success
  end

  test "should update category" do
    @category = Category.create(name: "Update Category")

    patch category_path(@category), params: { category: {name: "Update Category"}}

    assert Category.find(@category.id).name == "Update Category"
    assert_redirected_to category_path(@category)
  end

  test "should destroy category" do
    @category = Category.create(name: "Delete Category")

    assert_difference("Category.count", -1) do
      delete category_path(@category)
    end

    assert_redirected_to categories_path
  end
end 