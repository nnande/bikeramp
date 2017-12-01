class AddReferenceTripsAddresses < ActiveRecord::Migration[5.1]
  def change
	%i[start_address_id destination_address_id].each do |column|
		add_column :trips, column, :integer
		add_index :trips, column
		add_foreign_key :trips, :addresses, column: column
	end
  end
end
