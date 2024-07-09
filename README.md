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