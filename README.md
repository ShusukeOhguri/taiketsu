# DB設計

## users table
|Column |Type   |Option                                 |
|:------|------:|:-------------------------------------:|
|name   |string |null: false, unique: true, index: true |
|mail   |string |null: false, unique: true              |
|pass   |string |null: false                            |
### Association
・has_many :opinions
・has_many :themes

## opinion table
|Column   |Type     |Option                           |
|:--------|--------:|:-------------------------------:|
|text     |text     |null: false,                     |
|side     |integer  |null: false, 0 = red, 1 = blue   |
|agree    |integer  |                                 |
|opposite |integer  |                                 |
|user_id  |integer  |null: false, foreign_key: true   |
|theme_id |integer  |null: false, foreign_key: true   |
### Association
・belongs_to :theme
・belongs_to :user

## theme table
|Column   |Type     |Option                         |
|:--------|--------:|:-----------------------------:|
|user_id  |integer  |null: false, foreign_key: true |
|red      |string   |null: false                    |
|blue     |string   |null: false                    |
### Association
・has_many :opinions
・belongs_to :user
