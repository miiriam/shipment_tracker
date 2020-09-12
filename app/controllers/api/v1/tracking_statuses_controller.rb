class Api::V1::TrackingStatusesController < ApplicationController
  include ActionView::Layouts

  before_action :parse_request

  # POST /api/v1/tracking_status/tracking_status
  def tracking_status
    tracker = Tracker.new
    response = tracker.status_info(@request)
    render json: response
  end

  # GET /api/v1/tracking_statuses/tracking_numbers
  def tracking_numbers
    @trackings = TrackingNumber.all
    respond_to do |format|
      format.json
    end
  end

  private

  def parse_request
    @request = JSON.parse(request.body.read)
  end
end