class TrackingNumber < ApplicationRecord
  belongs_to :tracking_status, class_name: "TrackingStatus", foreign_key: "tracking_status_id"
  belongs_to :carrier, class_name: "Carrier", foreign_key: "carrier_id"
end
