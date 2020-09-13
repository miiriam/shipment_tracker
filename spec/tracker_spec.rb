require 'rails_helper'

RSpec.describe Tracker, type: :model do
  subject{ Tracker.new }

  describe 'status_info' do
    context 'when is FEDEX' do
      fedex_carrier = 
        [
          {"tracking_number"=>"449044304137821", "carrier"=>"FEDEX"},
          {"tracking_number"=>"920241085725456", "carrier"=>"FEDEX"}
        ]

      it 'returns status information' do
        expect(subject.status_info(fedex_carrier)).to eq(
          [
            {
              carrier: "FEDEX",
              job_status: "queued",
              tracking_number: "449044304137821"
            },
            {
              carrier: "FEDEX",
              job_status: "queued",
              tracking_number: "920241085725456"
            }
          ]
        )
      end
    end

    context 'when the carrier does not exist' do
      other_carrier = 
        [
          {"tracking_number"=>"449044304137821", "carrier"=>"UPS"},
          {"tracking_number"=>"920241085725456", "carrier"=>"DHL"}
        ]

      it 'returns Carrier not found ' do
        expect(subject.status_info(other_carrier)).to eq(
          [
            {
              carrier: "UPS",
              job_status: "Carrier not found",
              tracking_number: "449044304137821"
            },
            {
              carrier: "DHL",
              job_status: "Carrier not found",
              tracking_number: "920241085725456"
            }
          ]
        )
      end
    end
    
  end

end
