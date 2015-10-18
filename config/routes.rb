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
end
