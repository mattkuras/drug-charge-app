Rails.application.routes.draw do
  post '/drug_charge', to: 'home#create'

  root 'home#index'

end
