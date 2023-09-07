# frozen_string_literal: true

class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.string :name
      t.integer :capacity
      t.time :departure_time
      t.time :arrival_time
      t.integer :station_from_id
      t.integer :station_to_id

      t.timestamps
    end
  end
end
