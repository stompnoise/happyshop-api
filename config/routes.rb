HappyShop::Application.routes.draw do

  root to: "application#not_found"

  jsonapi_resources :products

end
