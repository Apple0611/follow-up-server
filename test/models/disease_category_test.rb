require 'test_helper'

class DiseaseCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "add_to_child_of works" do
      child = disease_categories(:add_to_child_of_child)
      puts child.id
      parent = disease_categories(:add_to_child_of_parent)
      puts parent.id
      old_children_count = parent[:children_count]
      child.add_to_child_of(parent)
      assert old_children_count + 1 == parent[:children_count]
  end

end
