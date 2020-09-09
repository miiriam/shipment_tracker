class Tracker
  def initialize
    @fedex = DeliveryServices::FedexService.new
  end

  def status_info(tracking_numbers)
    statuses = []
    tracking_numbers.each do |tracking_number|
      case tracking_number['carrier']
      when 'FEDEX'
        statuses << @fedex.tracking_status(tracking_number['tracking_number'])
      end
    end
    statuses
  end
end
