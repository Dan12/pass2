Rails.application.routes.draw do
  root "application#home"
  
  #user
  #google auth callback
  get "/auth/:provider/callback" => "user#create_from_callback"
  get "/auth/failure" => redirect("/")
  #signout
  get "/users/signout" => "user#signout"
  #view
  get "/users/view/:id" => "user#view"
  #change type
  get "/users/change_user_type" => "user#change_user_type"
  
  #course
  #create
  get "/courses/create" => "course#create"
  #view
  get "/courses/view/:id" => "course#view"
  #edit
  get "/courses/edit/:id" => "course#edit"
  #update
  get "/courses/update/:id" => "course#update"
  #other
  get "/courses/add_student" => "course#add_student"
  get "/courses/remove_student" => "course#remove_student"
  get "/courses/unenroll" => "course#unenroll"
  get "/courses/enable_join_code" => "course#enable_join_code"
  get "/courses/disable_join_code" => "course#disable_join_code"
  
  #pass
  #create
  get "/passes/create" => "pass#create"
  #view
  get "/passes/view/:id" => "pass#view"
  get "/passes/index" => "pass#index"
  #verify
  get "/passes/verify" => "pass#verify"
  get "/passes/destroy" => "pass#destroy"
end
