require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_creating
    @category = Category.new

    assert_not @category.save, true
  end

  def test_task_association
    @category = Category.create(name: "Personal")

    assert_equal(@category.tasks.length, 0)
  end
end
