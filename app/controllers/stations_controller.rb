# frozen_string_literal: true

class StationsController < ApplicationController
  def index
    begin
      @stations = Station.all
      render json: @stations
    rescue
      render json: {message: "No data found"}
    end
  end

  def show
    begin
      @station = Station.find(params[:id])
      render json: @station
    rescue
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
    begin
      @station = Station.find(params[:id])
      if @station.update(station_params)
        render json: { message: "Station Updated", data: @station }
      else
        render json: {errors: @station.errors.full_messages},status: 422
      end
    rescue
      render json: {message:"no data founds"}
    end
  end

  def destroy
    begin
      @station = Station.find(params[:id])
      @station.destroy
      render json: { message: "Station Deleted"}
    rescue
      render json: {message: "no data found"}
    end
  end

  private

  def station_params
    params.permit(:name)
  end
end
