class CreateTrackingNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :tracking_numbers do |t|
      t.string :number
      t.belongs_to :carrier, foreing_key: true
      t.belongs_to :tracking_status, foreing_key: true

      t.timestamps
    end
  end
end
