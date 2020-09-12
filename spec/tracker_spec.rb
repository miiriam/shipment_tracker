require 'rails_helper'

RSpec.describe Tracker, type: :model do
  subject{ Tracker.new }

  request = 
    [
      {"tracking_number"=>"449044304137821", "carrier"=>"FEDEX"},
      {"tracking_number"=>"920241085725456", "carrier"=>"FEDEX"}
    ]

  describe 'status_info' do
    context 'when is FEDEX' do
      it 'returns status information' do
        expect(subject.status_info(request)).to eq(
          [
            {
              carrier: "FEDEX",
              job_status: "queued",
              tracking_number: "449044304137821"},
            {
              carrier: "FEDEX",
              job_status: "queued",
              tracking_number: "920241085725456"
            }
          ]
        )
      end
    end
  end

end
