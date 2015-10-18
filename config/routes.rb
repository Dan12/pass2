Rails.application.routes.draw do
  root "application#home"
  
  get "/auth/:provider/callback" => "user#create_from_callback"
  get "/auth/failure" => redirect("/")
  get "/users/signout" => "user#signout"
end
