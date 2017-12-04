Rails.application.routes.draw do
  scope 'api', defaults: { format: :json } do
    resources :trips, only: :create

    scope 'stats' do
      get 'weekly', to: 'stats#weekly'
      get 'monthly', to: 'stats#monthly'
    end
  end
end
