Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "jobs#index"
  resources :users do
    resources :jobs
  end
  resources :jobs do
    resources :job_applications
  end
  resources :job_applications, only: [:index, :show, :edit]
end
