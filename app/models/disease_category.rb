class DiseaseCategory < ActiveRecord::Base
  validates :name, :name_en, :en_acronym, :name_py, :py_acronym, presence: true
  validates :name, :name_en, uniqueness: true

  acts_as_nested_set
end
