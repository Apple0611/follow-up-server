FactoryGirl.define do
  factory :disease_category do
    sequence(:name) { |n| "疾病 #{n}" }
    description     "Lorem ipsum"
    sequence(:name_en) { |n| "DiseaseCategoryName #{n}" }
    en_acronym      "Lorem ipsum"
    name_py         "Lorem ipsum"
    py_acronym      "Lorem ipsum"
    children_count  0
  end
end