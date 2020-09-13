class Tracker
  def status_info(tracking_numbers)
    statuses = []
    tracking_numbers.each do |tracking_number|
      case tracking_number['carrier']
      when 'FEDEX'
        worker = FedexStatusWorker.perform_async(tracking_number['tracking_number'])
        status =  Sidekiq::Status::get worker, :status
        statuses << formater_response(tracking_number, status)
      else
        status = 'Carrier not found'
        statuses << formater_response(tracking_number, status)
      end
    end
    statuses
  end

  private

  def formater_response(tracking_number, status)
    {
      carrier: tracking_number['carrier'],
      tracking_number: tracking_number['tracking_number'],
      job_status: status
    }
  end
end
