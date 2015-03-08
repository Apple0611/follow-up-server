
> 非正式版，正在更新中 ...

## Server

### `disease_category` 疾病分类

属性名           | 类型     | 注释
--------------- | ------- | -----
`name`          | string  | 疾病分类名
`description`   | text    | 描述
`parent`        | integer | 父级分类ID
`level`         | integer | 层级
`is_active`     | boolean | 是否可用
`is_empty`      | boolean | 是否为空
`is_bottom`     | boolean | 是否为最底层

```bash
rails g scaffold DiseaseCategory name:string description:text parent:integer level:integer is_active:boolean is_empty:boolean is_bottom:boolean
```

### `disease` 疾病基本

属性名           | 类型     | 注释
--------------- | ------- | -----
`<category_id>` | integer | 分类ID
`name`          | string  | 疾病名称
`summary`       | text    | 概况
`overview`      | text    | 综述

```bash
rails g scaffold Disease name:string summary:text overview:text
```

### `disease_attribute_schema` 疾病属性键值对

属性名           | 类型     | 注释
--------------- | ------- | -----
`<disease_id>`  | integer | 疾病ID
`key`           | string  | 键
`value`         | string  | 值

### `disease_attribute_record` 疾病属性具体值 \<Join Table\>

属性名           | 类型     | 注释
--------------- | ------- | -----
`<disease_id>`  | integer |
`<disease_attribute_schema_id>` | integer |
`value`         | text    | 值

### `disease_detail_schema` 疾病详细键值对

属性名           | 类型     | 注释
--------------- | ------- | -----
`<disease_id>`  | integer | 疾病ID
`key`           | string  | 键
`type`          | integer | 类型
`value`         | string  | 值

### `disease_detail_record` 疾病详细具体值 \<Join Table\>

属性名           | 类型     | 注释
--------------- | ------- | -----
`<disease_id>`  | integer |
`<disease_detail_schema_id>`  | integer |
`value`         | text    | 

disease_reference   疾病参考文献
<disease_id>
author
title
link
detail


disease_history   疾病编辑历史


treatment   治疗方案
<disease_id>
title


treatment_doctor   医生参加治疗方案记录 <Join Table>
<treatment_id>   方案ID
<user_id>    医生ID


treatment_patient   病人参加治疗方案记录 <Join Table>
<treatment_id>   方案ID
<user_id>    病人ID


medicine   药物
name
name_en
description


pharmacy   用药方案
<user_id>   医生ID
description


pharmacy_medicine   用药方案药物 <Join Table>
<pharmacy_id>
<medicine_id>
amount   用药量
unit   用药单位
repeat   重复用药次数
repeat_type   重复类型（固定间隔、间隔递增、间隔递减、自定义间隔）
interval   间隔时间（秒）
interval_increment   间隔时间增量（秒）


pharmacy_medicine_interval   用药方案药物使用间隔
<pharmacy_medicine_id>
cycle   周期数
interval   间隔


questionnaire   问卷
title   题目
description   描述
tips   建议
direction   指导


survey   随访调查  
<questionnaire_id>
<user_id>   医生ID


survey_patient   参加随访的病人 <Join Table>
<survey_id>
<user_id>  病人ID
<date>   推送时间
<repeat>   随访重复次数
frequency   间隔时间（天）


survey_question_section    问卷题目分段
<questionnaire_id>
title
description



survey_question   问卷题目
<questionnaire_id>
<survey_question_section_id>



survey_question_option   问卷选项



survey_answer   问卷答案


user   用户
user_group   组用户（医院、科室）
user_individual   独立用户（医生、病人）
notification   通知、提醒、提示等
message   留言消息



Android Client
user   用户




Windows Phone Client
