class Tracker
  def initialize
    @fedex = DeliveryServices::FedexService.new
  end

  def status_info(tracking_numbers)
    statuses = []
    tracking_numbers.each do |tracking_number|
      case tracking_number['carrier']
      when 'FEDEX'
        status = @fedex.tracking_status(tracking_number['tracking_number'])
        statuses << formater_response(tracking_number, status)
      end
    end
    statuses
  end

  def formater_response(tracking_number, status)
    {
      carrier: tracking_number['carrier'],
      tracking_number: tracking_number['tracking_number'],
      status: status
    }
  end
end
