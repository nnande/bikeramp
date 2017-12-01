class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
	t.string :line, null: false
	t.string :city, null: false
	t.string :country, null: false
    end
  end
end
