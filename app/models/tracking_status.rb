class TrackingStatus < ApplicationRecord
  has_many :tracking_numbers, class_name: "TrackingNumber"
end
