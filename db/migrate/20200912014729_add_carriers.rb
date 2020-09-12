class AddCarriers < ActiveRecord::Migration[6.0]
  def up
    Carrier.create(name: 'FEDEX')
  end

  def down
    Carrier.find_by(name: 'FEDEX').delete    
  end
end
