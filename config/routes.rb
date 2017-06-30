Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/find_all', to: "find#index"
        get '/find', to: "find#show"
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/revenue', to: 'single_revenue#show'
        get '/revenue', to: 'revenue#show'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/:id/favorite_customer', to: 'favorite_customer#show'
        get '/:id/customers_with_pending_invoices', to: 'customers_with_pending_invoices#index'
      end

      namespace :customers do
        get '/find_all', to: "find#index"
        get '/find', to: "find#show"
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/favorite_merchant', to: 'favorite_merchant#show'
      end

      namespace :transactions do
        get '/find_all', to: "find#index"
        get '/find', to: "find#show"
        get '/:id/invoice', to: 'invoice#show'
      end

      namespace :items do
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/merchant', to: "merchant#show"
        get '/most_revenue', to: "most_revenue#index"
        get '/:id/best_day', to: 'best_day#show'
        get '/most_items', to: 'most_items#index'
      end

      namespace :invoices do
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/:id/transactions', to: "transactions#index"
        get '/:id/invoice_items', to: "invoice_items#index"
        get '/:id/items', to: "items#index"
        get '/:id/customer', to: "customer#show"
        get '/:id/merchant', to: "merchant#show"
      end

      namespace :invoice_items do
        get '/find', to: "find#show"
        get '/find_all', to: "find#index"
        get '/:id/item', to: "item#show"
        get '/:id/invoice', to: "invoice#show"
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
