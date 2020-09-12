class FedexStatusWorker
  include Sidekiq::Worker

  sidekiq_options retry: 5

  def perform(params)
    fedex = DeliveryServices::FedexService.new
    fedex.tracking_status(params)
  end
end