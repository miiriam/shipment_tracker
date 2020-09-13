Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :tracking_statuses do
        post :send_tracking_numbers
        get :get_tracking_status
      end
    end
  end
end
