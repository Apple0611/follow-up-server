require 'ruby-pinyin'

class DiseaseCategory < ActiveRecord::Base

  validates :name, :name_en, :en_acronym, :name_py, :py_acronym, presence: {
    message: "分类名称必填"
  }
  validates :name, :name_en, uniqueness: {
    message: "分类名称必须唯一"
  }

  acts_as_nested_set

  has_many :diseases
  has_and_belongs_to_many :departments

  def add_to_child_of(parent)
    self.move_to_child_of(parent)
    parent[:children_count] += 1
    parent.save
  end

  def common
    DiseaseCategory.where({parent_id: self.id, common: true})
  end

  protected
  before_validation do
    self.en_acronym = acronym(name_en)
    self.name_py = PinYin.of_string(name).join(' ')
    self.py_acronym = acronym(name_py)
  end

  before_create do
    self.children_count = 0
    self.viewed = 0
  end

  def acronym(string)
    string.scan(/\b\w/).join
  end
end