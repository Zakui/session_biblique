Rails.application.routes.draw do
  root 'sessionistes#index'
  resources :sessionistes
  resources :print_tables, only: [:index]
  resources :paroises
  resources :batiments do
    resources :dortoirs
  end
  resources :sessionistes_imports, only: [:new, :create]
  devise_for :users

  match 'enregistrer-la-selection', to: 'print_tables#save_selection', as: 'print_tables_save_selection', via: [:post]
  match 'enregistrer-l-exportation', to: 'print_tables#save_export', as: 'print_tables_save_export', via: [:post]
  get 'generation-de-badge/:id', to: 'sessionistes#badge', as: 'sessionistes_generation_badge'
  get 'loger-les-sessionistes', to: 'sessionistes#loger', as: 'sessionistes_loger'
  get 'exporter-en-excel/:id', to: 'sessionistes#exporter_excel', as: 'sessionistes_exporter_excel'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
