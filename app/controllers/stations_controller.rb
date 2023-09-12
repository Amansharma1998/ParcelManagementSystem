# frozen_string_literal: true

class StationsController < ApplicationController
  def index
    @stations = Station.all
    if @stations.present?
      render json: @stations
    else 
      render json: {message: "No data found"}
    end
  end

  def show
    @station = Station.find(params[:id])
    if @station.present?
      render json: @station
    else 
      render json: {message: "no data found"}
    end
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      render json: { message: "Station Created", data: @station }
    else
      render json: {errors: @station.errors.full_messages}, status: unprocessable_entity
    end
  end

  def update
    @station = Station.find(params[:id])
    if @station.present?
      if @station.update(station_params)
        render json: { message: "Station Updated", data: @station }
      else
        render json: {errors: @station.errors.full_messages},status: 422
      end
    else 
      render json: {message:"no data founds"}
    end
  end

  def destroy
    @station = Station.find(params[:id])
    if @station.present?
      @station.destroy
      render json: { message: "Station Deleted"}
    else 
      render json: {message: "no data found"}
    end
  end

  private

  def station_params
    params.permit(:name)
  end
end
