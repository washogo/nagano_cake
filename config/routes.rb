Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    devise_for :customers
    root to: 'homes#top'
    get '/about',to:'homes#about'
  end
  
  namespace :admin do
    resources :sessions,only:[:new,:create,:destroy]
    resources :genres,only:[:index,:create,:edit,:update]
    resources :items,except:[:destroy]
    resources :customers,only:[:show,:index,:edit,:update]
  end
end
