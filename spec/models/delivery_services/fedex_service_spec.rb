require 'rails_helper'

RSpec.describe DeliveryServices::FedexService, type: :model do
  
  subject{ DeliveryServices::FedexService.new }

  tracking_number = '449044304137821'
  exception_number = '390322133714'

  describe '#tracking_status' do
    context 'when the number is in Fedex system' do
      it 'returns a TrackingNumber with the current status' do
        expect(subject.tracking_status(tracking_number)).to be_a(TrackingNumber)
      end
    end

    context 'when the number is not in Fedex system' do
      it 'returns a TrackingNumber with EXCEPTION status' do
        expect(subject.tracking_status(exception_number)).to be_a(TrackingNumber)
      end
    end
  end
end