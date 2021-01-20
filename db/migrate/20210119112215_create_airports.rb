class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports do |t|
      t.text :name
      t.text :code

      t.timestamps
    end
  end
end
