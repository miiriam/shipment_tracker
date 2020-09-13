module DeliveryServices
  class FedexService

    STATUS_LIST = {
      CREATED:
       ['Shipment information sent to FedEx',
        'At destination sort facility',
        'At Pickup'],
      ON_TRANSIT: [
        'Departed FedEx location',
        'On FedEx vehicle for delivery',
        'At FedEx destination facility'
      ],
      DELIVERED: [
        'Delivered'
      ]
    }

    def initialize
      @fedex_client = fedex_client
      @status_list = STATUS_LIST
    end

    def tracking_status(tracking_number)
      begin
        tracking = fedex_client.track(tracking_number: tracking_number)
        fedex_status = tracking.first.status
        result = homologate_status(fedex_status)
        information_tracking(result, tracking_number)
      rescue Fedex::RateError
        result = 'EXCEPTION'
        information_tracking(result, tracking_number)
      end
    end
  
    private 

    def fedex_client
      Fedex::Shipment.new(
        key: ENV['FEDEX_KEY'],
        password: ENV['FEDEX_PASSWORD'],
        account_number: ENV['FEDEX_ACCOUNT_NUMBER'],
        meter: ENV['FEDEX_METER'],
        mode: ENV['FEDEX_MODE']
      )
    end

    def homologate_status(fedex_status)
      @status_list.each do |status|
        return status[0].to_s if status[1].include?(fedex_status)
      end
    end

    def information_tracking(result, tracking_number)
      if TrackingNumber.exists?(number: tracking_number)
        TrackingNumber.find_by(number: tracking_number).update_attributes(
          tracking_status: TrackingStatus.find_by(name: result)
        )
      else
        TrackingNumber.create(
          tracking_status: TrackingStatus.find_by(name: result),
          number: tracking_number,
          carrier: Carrier.find_by(name: 'FEDEX')
        )
      end
    end
  end  
end
