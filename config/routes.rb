Rails.application.routes.draw do
  #articles#index significa: controller articles na action index
  get '/articles', to: 'articles#index'
end
