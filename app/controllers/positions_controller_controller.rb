class PositionsControllerController < ApplicationController
  require 'geokit'
  def index
    @list = Shop.all
  end
  def new
  end
  def add
    @new_Shop = Shop.new
    @new_Shop.chain = params[:chain] if(params[:chain] != nil and params[:chain] != "")
    @new_Shop.name = params[:name] if(params[:name] != nil and params[:name] != "")
    @new_Shop.zip = params[:zip] if(params[:zip] != nil and params[:zip] != "")
    @new_Shop.adress = params[:adress] if(params[:adress] != nil and params[:adress] != "")
    @new_Shop.latitude = params[:latitude].to_f if(params[:latitude] != nil and params[:latitude] != "")
    @new_Shop.longitude = params[:longitude].to_f if(params[:longitude] != nil and params[:longitude] != "")
    @new_Shop.city = params[:city] if(params[:city] != nil and params[:city] != "")
    @new_Shop.phone = params[:phone] if(params[:phone] != nil and params[:phone] != "")
    @new_Shop.country_code = params[:country_code] if(params[:country_code] != nil and params[:country_code] != "")

    if @new_Shop.save() then redirect_to ({:action => "index"})
    else redirect_to ({:action => "new"})
    end
  end

  def delete
    @cible = Shop.find_by_id(params[:id])
    @cible.destroy
    puts "done"
    redirect_to ({:action => "index"})
  end

  def edit
    @target = Shop.find_by_id(params[:id])
  end
  def update
    @update_target = Shop.find(params[:id])
    @update_target.chain = params[:chain] if(params[:chain] != nil and params[:chain] != "")
    @update_target.name = params[:name] if(params[:name] != nil and params[:name] != "")
    @update_target.zip = params[:zip] if(params[:zip] != nil and params[:zip] != "")
    @update_target.adress = params[:adress] if(params[:adress] != nil and params[:adress] != "")
    @update_target.latitude = params[:latitude].to_f if(params[:latitude] != nil and params[:latitude] != "")
    @update_target.longitude = params[:longitude].to_f if(params[:longitude] != nil and params[:longitude] != "")
    @update_target.city = params[:city] if(params[:city] != nil and params[:city] != "")
    @update_target.phone = params[:phone] if(params[:phone] != nil and params[:phone] != "")
    @update_target.country_code = params[:country_code] if(params[:country_code] != nil and params[:country_code] != "")

    @update_target.save()
    redirect_to ({:action => "index"})
  end

  def search
  end

  def filtre
    if params[:longitude] == "" or params[:latitude] == "" or params[:nombre] == "" then redirect_to({:action => 'search'})
    else
      lon = params[:longitude].to_f
      lat = params[:latitude].to_f
      current_location = Geokit::LatLng.new(lat,lon)
      @list_of_shops = Shop.all
      @valid_list = Array.new
      @list_of_shops.each do |item|
        destination = item.latitude.to_s + "," +item.longitude.to_s
        @valid_list << item if current_location.distance_to(destination) <= params[:nombre].to_f
      end
    end
  end
end
