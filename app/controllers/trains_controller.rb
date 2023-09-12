# frozen_string_literal: true

class TrainsController < ApplicationController
  def index
    @trains = Train.all
    if @stations.present?
      render json: @trains
    else 
      render json: {message: "No data found"}
    end
  end

  def show
    @train = Train.find(params[:id])
    if @stations.absent?
      render json: {message: "No data found"}
    else
      render json: @train
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
    @train = Train.find(params[:id])
    if @train.present?
      if @train.update(train_params)
        render json: { message: "Train updated", data: @train }
      else
        render json: {errors: @train.errors.full_messages},status: 422
      end
    else 
      render json: {message:"no data founds"}
    end
  end

  def destroy
    @train = Train.find(params[:id])
    if @train.present?
      @train.destroy
      render json: { message: "Train deleted" }
    else 
      render json: {message:"no data founds"}
    end
  end 

  private

  def train_params
    params.permit(:name, :capacity, :departure_time, :arrival_time, :station_from_id, :station_to_id)
  end
end
