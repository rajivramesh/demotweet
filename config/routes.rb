Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }
    get 'users/get_profile', to: 'users#profile'
    get 'users/tweets', to: 'users#tweets'

    resources :followers,only: [] do
      collection do
        post :follow
        delete :unfollow
      end
    end

    resources :tweets
  end
end