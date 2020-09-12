json.array! @trackings do |tracking_number|
  json.carrier         tracking_number.carrier.name
  json.tracking_number tracking_number.number
  json.status           tracking_number.tracking_status.name
end