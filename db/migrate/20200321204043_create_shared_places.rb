class CreateSharedPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :shared_places do |t|
	  t.integer :user_id
	  t.string :shared_to
	  t.decimal :shared_latitude, precision: 11, scale: 8
	  t.decimal :shared_longitude, precision: 11, scale: 8
      t.timestamps
    end
  end
end
