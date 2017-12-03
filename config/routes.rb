Rails.application.routes.draw do
	scope 'api/stats', defaults: { format: :json } do
		get 'weekly', to: 'stats#weekly'
	end
end
