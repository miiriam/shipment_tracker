class Api::V1::TrackingStatusController < ApplicationController
  before_action :parse_request
  # POST /api/v1/tracking_status/tracking_status
  def tracking_status
    tracker = Tracker.new
    response = tracker.status_info(@request)
    render json: response
  end

  private

  def parse_request
    @request = JSON.parse(request.body.read)
  end
end