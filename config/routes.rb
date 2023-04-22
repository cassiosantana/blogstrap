Rails.application.routes.draw do
  # definindo a página inicial do rails como a index sem precisar ficar digitando manualmente o localhost:3000/articles
  root 'articles#index'
  #articles#index significa: controller articles na action index
  # get '/articles', to: 'articles#index'

  # get '/articles/:id', to: 'articles#show'

  resources :articles
end
