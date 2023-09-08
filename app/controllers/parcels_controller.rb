# frozen_string_literal: true

class ParcelsController < ApplicationController
  def index
    @parcels = Parcel.all
    render json: @parcels
  end

  def show
    @parcel = Parcel.find(params[:id])
    render json: @parcel
  end

  def create 
    @train = Train.find(params[:train_id])
    @parcel = Parcel.new(parcel_params)
    if @train.train_departure
      if @train.add_parcel(@parcel)
         @parcel.train = @train
          if @parcel.save
            render plain: 'Parcel was successfully created.'
          else
            ender json: @parcel.errors, status: 422
          end
      else
        render plain: 'Parcel was capacity exceeds we cannot add'
      end
         
    else 
      render plain: 'Train has already departed cannot add parcel in it.'
       
    end 
  end 

  def update
    @parcel = Parcel.find(params[:id])
    if @parcel.update(parcel_params)
      render plain: 'Parcel was successfully updated.'
    else
      render :edit, status: 422
    end
  end

  def destroy
    @parcel = Parcel.find(params[:id])
    @parcel.destroy
    render plain: 'Parcel was successfully destroyed.'
  end

  private

  def parcel_params
    params.permit(:name, :category, :weight, :station_to_id, :station_from_id, :date, :train_id ,:image)
  end
end
