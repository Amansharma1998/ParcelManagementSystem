# frozen_string_literal: true

class Parcel < ApplicationRecord
  belongs_to :train
  belongs_to :station_from, class_name: 'Station'
  belongs_to :station_to, class_name: 'Station'
  has_one_attached :image

  validates :name, :category, :weight, :station_to, :station_from, :date, :train_id, presence: true
end
