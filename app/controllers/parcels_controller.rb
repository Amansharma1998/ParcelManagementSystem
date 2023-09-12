# frozen_string_literal: true

class ParcelsController < ApplicationController
  def index
    @parcels = Parcel.all
    if @parcels.present?
      render json: @parcels
    else 
      render json: {message: "No data found"}
    end
  end

  def show
    @parcel = Parcel.find(params[:id])
    if @parcel.present?
      render json: @parcel
    else 
      render json: {message: "No data found"}
    end 
  end

  def create 
    @train = Train.find(params[:train_id])
    @parcel = Parcel.new(parcel_params)
    if @train.train_departure
      if @train.add_parcel(@parcel)
         @parcel.train = @train
          if @parcel.save
            render json: { message: "Parcel Created", data: @parcel }
          else
            render json: @parcel.errors, status: 422
          end
      else
        render json: { message: "Parcel was capacity exceeds we cannot add." }
      end
         
    else 
      render json: { message: "Train has already departed cannot add parcel in it." }
    end 
  end 

  def update
    @parcel = Parcel.find(params[:id])
    if @parcel.present?
      if @parcel.update(parcel_params)
        render json: { message: "Parcel updated", data: @parcel }
      else
        render json: {errors: @parcel.errors.full_messages},status: 422
      end
    else 
      render json: {message: "No data found"}
    end 
  end

  def destroy
    @parcel = Parcel.find(params[:id])
    if @parcel.present?
      @parcel.destroy
      render json: { message: "Parcel deleted" }
    else 
      render json: {message: "No data found"}
    end 
  end

  private

  def parcel_params
    params.permit(:name, :category, :weight, :station_to_id, :station_from_id, :date, :train_id ,:image)
  end
end
