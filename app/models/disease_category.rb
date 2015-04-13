require 'ruby-pinyin'

class DiseaseCategory < ActiveRecord::Base
  acts_as_nested_set

  validates :name, :name_en, :en_acronym, :name_py, :py_acronym, presence: true
  validates :name, :name_en, uniqueness: true

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