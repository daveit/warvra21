Rails.application.routes.draw do
  
  #get 'residents/index'

  resources :miscellaneous_contacts
  resources :contacts_categories
  resources :inews
  resources :acc_trans
  resources :acc_logs
  resources :acc_settings
  resources :acc_types
  resources :app_settings
  resources :acc_accounts
  resources :acc_bank_accounts
  resources :regions
  resources :ivillages
  resources :ireceipts
  resources :contacts
  resources :vreceipts
  resources :associate_payments
  
  resources :residents do
    collection { post :import }
  end

  resources :associates do
    collection { post :import }
    resources :associate_payments
  end

  resources :individuals do
    collection do
      get :financial
      get :notfinancial
      get :cancelled
    end
    resources :ireceipts
  end

  resources :icats
  resources :vreceipts
  resources :pay_types
  resources :notices
  resources :titles
  resources :positions

  resources :villages do
    collection do
      get :financial
      get :notfinancial
      get :prospect
      get :cancelled
    end
    resources :contacts
    resources :vreceipts
    resources :reminders
  end

  resources :village_categories
  resources :statuses
  resources :suburbs

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
