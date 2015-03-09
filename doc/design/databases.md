
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

--------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------

### `disease_attribute_schema` 疾病属性键值对

属性名           | 类型     | 注释
--------------- | ------- | -----
`<disease_id>`  | integer | 疾病ID
`key`           | string  | 键
`value`         | string  | 值

--------------------------------------------------------------------------------

### `disease_attribute_record` 疾病属性具体值 \<Join Table\>

属性名           | 类型     | 注释
--------------- | ------- | -----
`<disease_id>`  | integer |
`<disease_attribute_schema_id>` | integer |
`value`         | text    | 值

--------------------------------------------------------------------------------

### `disease_detail_schema` 疾病详细键值对

属性名           | 类型     | 注释
--------------- | ------- | -----
`<disease_id>`  | integer | 疾病ID
`key`           | string  | 键
`type`          | integer | 类型
`value`         | string  | 值

--------------------------------------------------------------------------------

### `disease_detail_record` 疾病详细具体值 \<Join Table\>

属性名           | 类型     | 注释
--------------- | ------- | -----
`<disease_id>`  | integer |
`<disease_detail_schema_id>`  | integer |
`value`         | text    |

--------------------------------------------------------------------------------

### `disease_reference` 疾病参考文献

属性名           | 类型     | 注释
--------------- | ------- | -----
`<disease_id>`  | integer |
`author`        | string  |
`title`         | string  |
`link`          | string  |
`detail`        | string  |

--------------------------------------------------------------------------------

### `disease_history` 疾病编辑历史

--------------------------------------------------------------------------------

### `treatment` 治疗方案

属性名           | 类型     | 注释
--------------- | ------- | -----
`<disease_id>`  | integer | 疾病ID
`title`         | string  | 标题
`<user_id>`     | integer | 医生ID

--------------------------------------------------------------------------------

### `treatment_patient` 治疗方案的病人 \<Join Table\>

属性名           | 类型     | 注释
--------------- | ------- | -----
`<treatment_id>`| integer | 方案ID
`<user_id>`     | integer | 病人ID

--------------------------------------------------------------------------------

### `medicine` 药物

属性名           | 类型     | 注释
--------------- | ------- | -----
`name`          | string  | 名称
`name_en`       | string  | 英文名
`description`   | text    | 描述

--------------------------------------------------------------------------------

### `pharmacy` 用药方案

属性名           | 类型     | 注释
--------------- | ------- | -----
`<user_id>`     | integer | 医生ID
`description`   | text    | 描述

--------------------------------------------------------------------------------

### `pharmacy_medicine` 用药方案药物 \<Join Table\>

属性名           | 类型     | 注释
--------------- | ------- | -----
`<pharmacy_id>` | integer | 用药方案ID
`<medicine_id>` | integer | 药物ID
`amount`        | float   | 用药量
`unit`          | string  | 用药单位
`repeat`        | integer | 重复用药次数
`repeat_type`   | integer | 重复类型（固定间隔、间隔递增、间隔递减、自定义间隔）
`interval`      | integer | 间隔时间（秒）
`interval_increment`  | integer | 间隔时间增量（秒）

--------------------------------------------------------------------------------

### `pharmacy_medicine_interval` 用药方案药物使用间隔

属性名           | 类型     | 注释
--------------- | ------- | -----
`<pharmacy_medicine_id>`  | integer | 用药方案药物ID
`cycle`         | integer | 周期数
`interval`      | integer | 间隔

--------------------------------------------------------------------------------

### `questionnaire` 问卷

属性名           | 类型     | 注释
--------------- | ------- | -----
`title`         | string  | 题目
`description`   | text    | 描述
`tips`          | text    | 建议
`direction`     | text    | 指导

--------------------------------------------------------------------------------

### `survey` 随访调查  

属性名           | 类型     | 注释
--------------- | ------- | -----
`<questionnaire_id>`  | integer | 问卷ID
`<user_id>`     | integer | 医生ID

--------------------------------------------------------------------------------

### `survey_patient` 参加随访的病人 \<Join Table\>

属性名           | 类型     | 注释
--------------- | ------- | -----
`<survey_id>`   | integer | 随访调查ID
`<user_id>`     | integer | 病人ID
`date`          | date    | 推送时间
`repeat`        | integer | 随访重复次数
`interval`      | integer | 间隔时间（秒）

--------------------------------------------------------------------------------

### `survey_question_section` 问卷题目分段

属性名           | 类型     | 注释
--------------- | ------- | -----
`<questionnaire_id>`  | integer | 问卷ID
title           | string  | 标题
description     | text    | 描述

--------------------------------------------------------------------------------

### `survey_question` 问卷题目

属性名           | 类型     | 注释
--------------- | ------- | -----
`<questionnaire_id>`  | integer | 问卷ID
`<survey_question_section_id>`  | integer | 问卷题目分段ID

--------------------------------------------------------------------------------

### `survey_question_option` 问卷选项

### `survey_answer` 问卷答案

### `user` 用户

### `user_group` 组用户（医院、科室）

### `notification` 通知、提醒、提示等

### `message` 留言消息


## Android Client


## Windows Phone Client
