Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :sessions,only:[:new,:create,:destroy]
    resources :genres,only:[:index,:create,:edit,:update]
    resources :items,except:[:destroy]
  end
  
  root to: 'homes#top'
  get '/about',to:'homes#about'
 
  namespace :public do
  end 
  
end
