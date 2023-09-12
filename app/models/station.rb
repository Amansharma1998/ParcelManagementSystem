# frozen_string_literal: true

class Station < ApplicationRecord
  has_many :trains, foreign_key: 'station_from_id', class_name: 'Train'
  has_many :trains, foreign_key: 'station_to_id', class_name: 'Train'
  has_many :parcels, foreign_key: 'station_from_id', class_name: 'Parcel'
  has_many :parcels, foreign_key: 'station_to_id', class_name: 'Parcel'
  validates :name, presence: true
end
