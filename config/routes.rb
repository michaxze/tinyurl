Rails.application.routes.draw do
#  get 'home/index'
  post 'generate', to: "home#generate"
  get '/:token', to: "home#show", as: :show
  get '/:token/info', to: "home#info", as: :info

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
