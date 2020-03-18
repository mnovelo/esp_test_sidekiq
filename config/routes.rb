class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w[www admin]
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  resources :schools

  constraints SubdomainConstraint do
    resources :students
    resources :parents
    resources :users
    resources :blasts
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
