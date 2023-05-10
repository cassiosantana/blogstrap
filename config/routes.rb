Rails.application.routes.draw do
  # definindo a página inicial do rails como a index sem precisar ficar digitando manualmente o localhost:3000/articles
  root 'articles#index'
  # get '/articles', to: 'articles#index'

  # articles#index significa: controller articles na action index
  # get '/articles/:id', to: 'articles#show'

  resources :articles
  resources :categories, except: [:show]
end
