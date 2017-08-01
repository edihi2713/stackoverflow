class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :votable_type
      t.string :string
      t.integer :votable_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
