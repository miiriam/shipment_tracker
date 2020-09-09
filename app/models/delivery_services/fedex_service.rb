module DeliveryServices
  class FedexService

    def initialize
      @fedex_client = fedex_client
    end

    def tracking_status(tracking_number)
      begin 
        tracking = fedex_client.track(tracking_number: tracking_number)
        tracking.first.status
      rescue Fedex::RateError
        'EXCEPTION'
      end
    end
  
    def fedex_client
      Fedex::Shipment.new(
        key: ENV['FEDEX_KEY'],
        password: ENV['FEDEX_PASSWORD'],
        account_number: ENV['FEDEX_ACCOUNT_NUMBER'],
        meter: ENV['FEDEX_METER'],
        mode: ENV['FEDEX_MODE']
      )
    end
  end
end
