class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :email
      t.date :birthdate
      t.integer :gender
      t.string :location_country
      t.string :location_state
      t.string :location_city
      t.string :school
      t.text :bio
      t.integer :gender_interest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
