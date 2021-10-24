Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    devise_for :customers
    root to: 'homes#top'
    get '/about',to:'homes#about'
    get '/current_customer',to:'customers#show'
    get '/current_customer/edit',to:'customers#edit'
    patch '/current_customer',to:'customers#update'
    get '/current_customer/cancel',to:'customers#cancel'
    patch '/current_customer/quit',to:'customers#quit'
    resources :addresses,only:[:index,:create,:edit,:update,:destroy]
    resources :items,only:[:show,:index]
  end

  namespace :admin do
    resources :sessions,only:[:new,:create,:destroy]
    resources :genres,only:[:index,:create,:edit,:update]
    resources :items,except:[:destroy]
    resources :customers,only:[:show,:index,:edit,:update]
  end
end
