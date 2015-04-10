# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   
#   rake db:drop db:create db:migrate db:seed

im = DiseaseCategory.create(name: "内科", name_en: "Internal Medicine", common: true)

cm = DiseaseCategory.create(name: "心血管内科", name_en: "Cardiovascular Medicine", common: true)
cm.add_to_child_of(im)

nm = DiseaseCategory.create(name: "神经内科", name_en: "Neural Medicine", common: true)
nm.add_to_child_of(im)

dim = DiseaseCategory.create(name: "消化内科", name_en: "Digestion Internal Medicine", common: true)
dim.add_to_child_of(im)

hd = DiseaseCategory.create(name: "心脏疾病", name_en: "Heart Disease", common: true)
hd.add_to_child_of(cm)

vd = DiseaseCategory.create(name: "血管疾病", name_en: "Vascular Disease", common: true)
vd.add_to_child_of(cm)

s = DiseaseCategory.create(name: "外科", name_en: "Surgery", common: true)