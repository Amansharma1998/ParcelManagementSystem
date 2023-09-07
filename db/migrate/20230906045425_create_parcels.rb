# frozen_string_literal: true

class CreateParcels < ActiveRecord::Migration[7.0]
  def change
    create_table :parcels do |t|
      t.string :name
      t.string :category
      t.float :weight
      t.integer :station_to_id
      t.integer :station_from_id
      t.date :date

      t.timestamps
    end
  end
end
