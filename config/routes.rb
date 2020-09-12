Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :tracking_statuses do
        post :tracking_status
        get :tracking_numbers
      end
    end
  end
end
