class CreatePassengers < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.references :booking, null: false, foreign_key: true
      t.text :name
      t.integer :age
      t.text :suffix
      t.text :email

      t.timestamps
    end
  end
end
