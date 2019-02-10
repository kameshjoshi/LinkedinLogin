class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :contact_number
      t.string :email_id
      t.string :current_city
      t.timestamps
    end
  end
end
