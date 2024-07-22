# usersテーブル
| title              | Type   | Options                   |
| ------------------ | ----- | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |
| occupation         | text   | null: false               |
| position           | text   | null: false               |
 
# Association
has_many :prototypes
has_many :comments
 
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
# prototypesテーブル
| title      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
 
# Association
  has_one_attached :image
  validates :image, presence: true
  belongs_to :user
  has_many :comments
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
# commentsテーブル
| title     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
 
# Association
  belongs_to :user
  belongs_to :prototype



 
### create model and migration 
 ## users
rails generate model user email:string:uniq encrypted_password:string name:string profile:text occupation:text position:text --skip-test-framework 
 ## prototypes
 rails generate model prototype title:string catch_copy:text concept:text --skip-test-framework  
 ## comments
  rails generate model comment content:text --skip-test-framework 
 ## note
  1.t.references :model_name, options
  2.has_many :associated_models, options
  3.after configuring  mini_magick ,you need to run "rails active_storage:install" to create the necessary  tables in database

  data: { turbo_method: :delete }
  method: :delete
