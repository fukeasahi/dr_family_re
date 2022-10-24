Rails.application.routes.draw do
  devise_for :patients, controllers: { 
    sessions:     'patients/sessions',
    registrations: 'patients/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :medical_examination_reports
  resources :physical_conditions
end
