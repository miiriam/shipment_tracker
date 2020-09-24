class Api::V1::TrackingStatusesController < ApplicationController
  include ActionView::Layouts

  before_action :parse_request, only: [:send_tracking_numbers]

  # POST /api/v1/tracking_statuses/send_tracking_numbers
  def send_tracking_numbers
    tracker = Tracker.new
    response = tracker.status_info(@request)
    render json: response
  end

  # GET /api/v1/tracking_statuses/get_tracking_status
  def get_tracking_status
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