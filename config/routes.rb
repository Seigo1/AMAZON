Rails.application.routes.draw do
  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations',
      users:         'users/show'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :users do
    get 'users/index' => 'users/users#index'
    get 'users/show/:id' => 'users/users#show', as: 'show'
    get 'users/edit:id' => 'users/users#edit', as: 'edit'
    get 'users/chargeEdit:id' => 'users/users#chargeEdit', as: 'chargeEdit'
    patch 'users/charge' => 'users/users#charge', as: 'charge'
    patch 'users/update' => 'users/users#update'
    get 'users/unsubscribe/:id' => 'users/users#unsubscribe', as: 'unsubscribe'
    patch 'users/unsubscribe' => 'users/users#destroy', as: 'destroy'
  end
  root to: 'homes#top'
end
