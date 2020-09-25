class FedexStatusWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  sidekiq_options retry: false, dead: false

  def perform(params)
    fedex = DeliveryServices::FedexService.new
    tracking_status = fedex.tracking_status(params)
    store tracking_status: tracking_status
    status = retrieve :tracking_status 
  end
end
