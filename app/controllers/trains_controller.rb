# frozen_string_literal: true

class TrainsController < ApplicationController
  def index
    begin
      @trains = Train.all
      render json: @trains
    rescue
      render json: {message: "No data found"}
    end
  end

  def show
    begin
      @train = Train.find(params[:id])
      render json: @train
    rescue 
      render json: {message: "No data found"}
    end
  end

  def create
    @train = Train.new(train_params)
    if @train.save
      render json: { message: "Train Created", data: @train }
    else
      render json: {errors: @train.errors.full_messages}, status: unprocessable_entity
    end
  end

  def update
    begin
      @train = Train.find(params[:id])
      if @train.update(train_params)
        render json: { message: "Train updated", data: @train }
      else
        render json: {errors: @train.errors.full_messages},status: 422
      end
    rescue
      render json: {message:"no data founds"}
    end
  end

  def destroy
    begin
      @train = Train.find(params[:id])
      @train.destroy
      render json: { message: "Train deleted" }
    rescue
      render json: {message:"no data founds"}
    end
  end 

  private

  def train_params
    params.permit(:name, :capacity, :departure_time, :arrival_time, :station_from_id, :station_to_id)
  end
end
