class CreateMutualLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :mutual_likes do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.references :match, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
