Rails.application.routes.draw do
	scope 'api/stats', defaults: { format: :json } do
		get 'weekly', to: 'stats#weekly'
		get 'monthly', to: 'stats#monthly'
	end
end
