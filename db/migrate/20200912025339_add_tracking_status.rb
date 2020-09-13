class AddTrackingStatus < ActiveRecord::Migration[6.0]
  def up
    TrackingStatus.create(name: 'CREATED')
    TrackingStatus.create(name: 'ON_TRANSIT')
    TrackingStatus.create(name: 'DELIVERED')
    TrackingStatus.create(name: 'EXCEPTION')
  end

  def down 
    TrackingStatus.find_by(name: 'CREATED').delete
    TrackingStatus.find_by(name: 'ON_TRANSIT').delete
    TrackingStatus.find_by(name: 'DELIVERED').delete
    TrackingStatus.find_by(name: 'EXCEPTION').delete
  end
end
