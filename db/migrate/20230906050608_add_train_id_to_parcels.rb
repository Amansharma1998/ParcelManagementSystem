# frozen_string_literal: true

class AddTrainIdToParcels < ActiveRecord::Migration[7.0]
  def change
    add_column :parcels, :train_id, :integer
  end
end
