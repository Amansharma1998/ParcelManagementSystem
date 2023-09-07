# frozen_string_literal: true

class StationsController < ApplicationController
  def index
    @stations = Station.all
    render json: @stations
  end

  def show
    @station = Station.find(params[:id])
    render json: @station
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      render plain: 'Station was successfully created.'
    else
      render json: @station.errors, status: 422
    end
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      render plain: 'Station was successfully updated.'
    else
      render :edit, status: 422
    end
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    render plain: 'Station was successfully destroyed.'
  end

  private

  def station_params
    params.permit(:name)
  end
end
