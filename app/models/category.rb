require 'ruby-pinyin'

class Category < ActiveRecord::Base

  validates :name, :name_py, :py_abbr, presence: {
    message: "分类名称必填"
  }
  validates :name, uniqueness: {
    message: "分类名称必须唯一"
  }
  validates :name, length: { in: 1..255 }

  acts_as_nested_set

  has_many :departments, foreign_key: :category_id

  def add_to_child_of(parent)
    self.move_to_child_of(parent)
    parent[:children_count] += 1
    parent.save
    self.category = parent
    self.save
  end

  protected
  before_validation do
    self.name_py = PinYin.of_string(name).join(' ')
    self.py_abbr = abbr(name_py)
  end

  before_create do
    self.children_count = 0
  end

  def abbr(string)
    string.scan(/\b\w/).join
  end
end