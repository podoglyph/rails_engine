Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/find_all', to: "find#index"
        get '/find', to: "find#show"
      end

      namespace :customers do
        get '/find_all', to: "find#index"
        get '/find', to: "find#show"
      end

      namespace :transactions do
        get '/find_all', to: "find#index"
        get '/find', to: "find#show"
      end

      resources :merchants, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
    end
  end

end
