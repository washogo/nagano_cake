Rails.application.routes.draw do
  # devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :customers, path: 'customers', controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }

  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about',to:'homes#about'
    get '/current_customer',to:'customers#show'
    get '/current_customer/edit',to:'customers#edit'
    patch '/current_customer',to:'customers#update'
    get '/current_customer/cancel',to:'customers#cancel'
    patch '/current_customer/quit',to:'customers#quit'
    resources :addresses,only:[:index,:create,:edit,:update,:destroy]
    resources :items,only:[:show,:index]
    resources :cart_items,except:[:new,:show,:edit]
    delete '/cart_items/destroy_all',to:'cart_items#destroy_all'
    resources :orders,only:[:new,:create,:index,:show] do
      collection do
        post 'confirmation'
        get 'completed'
      end
    end
    get '/orders/completed',to:'orders#completed'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :genres,only:[:index,:create,:edit,:update]
    resources :items,except:[:destroy]
    resources :customers,only:[:show,:index,:edit,:update]
    resources :orders,only:[:show,:update]
  end
end
