require 'sidekiq/web'

class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w[www admin]
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :schools

  constraints SubdomainConstraint do
    resources :students
    resources :parents
    resources :users
    resources :blasts, only: [ :index, :show, :new, :create ]
    resources :messages

    root to: 'schools#home'
  end

  root to: 'schools#index', as: nil



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
