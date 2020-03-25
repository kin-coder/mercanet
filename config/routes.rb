Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/affichage_format', to: 'mercanets#affichage_format', as: 'affichage_format'
  post "/retour_transaction", to: 'mercanets#reponse_transaction'

end
