# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   
#   rake db:drop db:create db:migrate db:seed
#   

ActiveRecord::Base.transaction do

  a = Category.create(name: "头部疾病")
  aa = Department.create(name: "神经外科")
  aa.add_to_child_of(a)
  ab = Department.create(name: "神经内科")
  ab.add_to_child_of(a)

  b = Category.create(name: "眼部疾病")
  ba = Department.create(name: "眼科")
  ba.add_to_child_of(b)

  c = Category.create(name: "耳鼻喉-头颈疾病")
  d = Category.create(name: "甲状腺疾病")
  e = Category.create(name: "食道疾病")
  f = Category.create(name: "肺、呼吸道疾病")
  f = Category.create(name: "心脏、血管疾病")
  f = Category.create(name: "乳腺疾病")
  f = Category.create(name: "肝、胆、胰腺疾病")
  f = Category.create(name: "胃肠道疾病")

  g = Category.create(name: "肾脏、生殖系统疾病")
  ga = Department.create(name: "泌尿外科")
  ga.add_to_child_of(g)
  gaa = Disease.create(name: "泌尿外科", department: ga)

  20.times do |i|
    Treatment.create(name: "泌尿外科治疗方案#{i}", description: "泌尿外科治疗方案详细描述#{i}", disease: gaa)
  end

  Disease.create(name: "肾移植", department: ga)
  Disease.create(name: "泌尿肾移植", department: ga)
  Disease.create(name: "泌尿肿瘤", department: ga)
  Disease.create(name: "肿瘤/腔道微创治疗/男科学", department: ga)
  Disease.create(name: "妇科泌尿/神经泌尿", department: ga)
  Disease.create(name: "泌尿系结石", department: ga)
  Disease.create(name: "泌尿系结石/尿道狭窄", department: ga)
  Disease.create(name: "泌尿外科普通门诊", department: ga)

  gb = Department.create(name: "肾脏内科")
  gb.add_to_child_of(g)

  h = Category.create(name: "血液疾病")
  i = Category.create(name: "骨骼、关节疾病")
  j = Category.create(name: "皮肤疾病")
  k = Category.create(name: "内分泌代谢疾病")
  l = Category.create(name: "风湿免疫疾病")
  m = Category.create(name: "精神、心理疾病")
  n = Category.create(name: "传染、感染性疾病")
  o = Category.create(name: "疼痛治疗")
  p = Category.create(name: "中西医结合治疗")
  q = Category.create(name: "老年医学")
  r = Category.create(name: "肿瘤疾病")
  s = Category.create(name: "儿童外科（14周岁以下）")
  t = Category.create(name: "睡眠疾病")
  u = Category.create(name: "遗传咨询")
  v = Category.create(name: "营养咨询")
  w = Category.create(name: "麻醉咨询")
  x = Category.create(name: "普通内科")
  y = Category.create(name: "疾病分诊")
end