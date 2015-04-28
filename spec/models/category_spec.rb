require 'rails_helper'

RSpec.describe Category, type: :model do

  it "add_to_child_of works" do
    parent = create(:category)
    old_children_count = parent[:children_count]

    child = create(:dcategory)
    child.add_to_child_of(parent)

    expect(old_children_count + 1).to eq parent[:children_count]
  end
end
