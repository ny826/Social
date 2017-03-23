Rails.application.routes.draw do

  root 'home#index'
  devise_for :users
  get 'home/index'

  get '/'=>'home#index'

  post '/create'=>'home#create'

  post '/like'=>'home#like'

  post '/edit'=>'home#edit'

  post '/edit_tweet'=>'home#edit_tweet'

  post '/delete'=>'home#delete'

  get '/search'=>'home#search'

  post '/follow'=>'home#follow'

  get '/rate'=>'home#rate'

  get '/user'=>'home#user'

  post '/rate_submit'=>'home#rate_submit'

  get '/view_feedback'=>'home#view_feedback'

  
end
