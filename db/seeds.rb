# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

im = DiseaseCategory.create(name: "内科", is_active: true, is_empty: false, is_bottom: false, name_en: "Internal Medicine", en_acronym: "IM", name_py: "Nei Ke", py_acronym: "NK", children_count: 0)

cm = DiseaseCategory.create(name: "心血管内科", is_active: true, is_empty: false, is_bottom: false, name_en: "Cardiovascular Medicine", en_acronym: "CM", name_py: "Xin Xue Guan Nei Ke", py_acronym: "XXGNK", children_count: 0)
cm.move_to_child_of(im)

nm = DiseaseCategory.create(name: "神经内科", is_active: true, is_empty: false, is_bottom: false, name_en: "Neural Medicine", en_acronym: "NM", name_py: "Shen Jing Nei Ke", py_acronym: "SJNK", children_count: 0)
nm.move_to_child_of(im)

dim = DiseaseCategory.create(name: "消化内科", is_active: true, is_empty: false, is_bottom: false, name_en: "Digestion Internal Medicine", en_acronym: "DIM", name_py: "Xiao Hua Nei Ke", py_acronym: "XHNK", children_count: 0)
dim.move_to_child_of(im)

hd = DiseaseCategory.create(name: "心脏疾病", is_active: true, is_empty: false, is_bottom: true, name_en: "Heart Disease", en_acronym: "HD", name_py: "Xin Zang Ji Bing", py_acronym: "XZJB", children_count: 0)
hd.move_to_child_of(cm)

vd = DiseaseCategory.create(name: "血管疾病", is_active: true, is_empty: false, is_bottom: true, name_en: "Vascular Disease", en_acronym: "VD", name_py: "Xue Guan Ji Bing", py_acronym: "XGJB", children_count: 0)
vd.move_to_child_of(cm)

im.reload
cm.reload

s = DiseaseCategory.create(name: "外科", is_active: true, is_empty: false, is_bottom: false, name_en: "Surgery", en_acronym: "S", name_py: "Wai Ke", py_acronym: "WK", children_count: 0)
