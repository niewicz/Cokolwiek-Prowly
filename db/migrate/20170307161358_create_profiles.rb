class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :city
      t.string :address
      t.integer :number

      t.timestamps
    end
  end
end
