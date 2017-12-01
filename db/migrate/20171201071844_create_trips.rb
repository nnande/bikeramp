class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
	t.decimal :price, scale: 2, precision: 5, null: false
	t.datetime :date, index: true, null: false
	t.decimal :distance, scale: 2, precision: 5, null: false 
    end	
  end
end
