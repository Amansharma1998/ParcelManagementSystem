# frozen_string_literal: true

class Train < ApplicationRecord
  belongs_to :station_from, class_name: 'Station', foreign_key: 'station_from_id'
  belongs_to :station_to, class_name: 'Station' , foreign_key: 'station_to_id'
  has_many :parcels

  validates :name, :capacity, :departure_time, :arrival_time, presence: true
  validate  :unique_departure_time

  def add_parcel(parcel)
    parcels_weight = parcels.sum(:weight)
    remaining_capacity = capacity - parcels_weight
    remaining_capacity >= parcel.weight
  end

  def train_departure
    departure_time <= Time.now
  end

  def unique_departure_time
    existing_train = Train.find_by(departure_time: departure_time, station_from_id: station_from_id,
                                   station_to_id: station_to_id)
    return unless existing_train

    errors.add(:departure_time, 'Another train with the same time and stations already exists.')
  end
end
