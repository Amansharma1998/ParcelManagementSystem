# frozen_string_literal: true

class TrainsController < ApplicationController
  def index
    @trains = Train.all
    render json: @trains
  end

  def show
    @train = Train.find(params[:id])
    render json: @train
  end

  def create
    @train = Train.new(train_params)
    if @train.valid?
      @train.save
      render plain: 'Train was successfully created.'
    else
      render json: @train.errors, status: 422
    end
  end

  def update
    @train = Train.find(params[:id])
    if @train.update(train_params)
      render plain: 'Train was successfully updated.'
    else
      render :edit, status: 422
    end
  end

  def destroy
    @train = Train.find(params[:id])
    @train.destroy
    render plain: 'Train was successfully destroyed.'
  end

  private

  def train_params
    params.permit(:name, :capacity, :departure_time, :arrival_time, :station_from_id, :station_to_id)
  end
end
