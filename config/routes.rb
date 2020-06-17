Rails.application.routes.draw do

# 顧客用トップページ
  	root to: 'customers/home#top'

# 顧客用トップページ
  	get 'admins' => 'admins/home#top'

# 管理者用認証機能
  	devise_for :admins, controllers: {
  		registrations: 'admins/registrations',
  		sessions: 'admins/sessions',
  		passwords: 'admins/passwords'
  	}

# 顧客用認証機能
  	devise_for :users, controllers: {
  		registrations: 'users/registrations',
  		sessions: 'users/sessions',
  		passwords: 'users/passwords'
  	}

# 顧客表示部分
  	namespace :customers do
  		resources :users, only: [:show, :edit, :update] do
  			member do
  				get :unsubscribe
  				patch :leave
  			end
  		end

  		resources :products, only: [:index, :show]

  		resources :cart_items, only: [:index, :create, :update, :destroy] do
  			member do
  				delete :destroy_all
  			end
  		end

  		resources :orders, only: [:index, :show, :new, :create] do
  			member do
  				get :thanks
  				post :confirm
  			end
  		end

  		resources :delivery_infos, except: [:new, :show]
 	end

# 管理者表示部分
  	namespace :admins do
  		resources :users, only: [:index, :show, :update, :edit]

  		resources :products, except: [:destroy]

  		resources :genres, only: [:index, :edit, :create, :update]

  		resources :order, only: [:index, :show, :update]

  		resources :order_details, only: [:update]
  	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
