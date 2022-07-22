require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    @category = Category.create(name: "Test Category")

    get category_tasks_path(@category.id)
    assert_response :success
  end

  test "should show task" do
    @category = Category.create(name: "Test Category")
    @task = Task.create(category_id: @category.id, name: "task test")

    get category_tasks_path(@category.id, @task.id)
    assert_response :success
  end

  test "should create a task" do
    @category = Category.create(name: "Test Category")
  
    post category_tasks_path(@category.id), params: { task: {name: "Task", description: "Test task"}}
    assert_response :redirect
  end


end  