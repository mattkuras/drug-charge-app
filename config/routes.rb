Rails.application.routes.draw do
  get '/drug_charge', to: 'home#show'

  root 'home#index'

end
