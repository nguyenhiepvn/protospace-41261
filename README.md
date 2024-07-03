### create model and migration 
 ## users
rails generate model user email:string:uniq encrypted_password:string name:string profile:text occupation:text position:text --skip-test-framework 
 ## prototypes
 rails generate model prototype title:string catch_copy:text concept:text --skip-test-framework  
 ## comments
  rails generate model comment content:text --skip-test-framework 
 ## note
  t.references :model_name, options
  has_many :associated_models, options