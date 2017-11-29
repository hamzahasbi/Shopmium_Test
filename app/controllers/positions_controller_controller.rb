class PositionsControllerController < ApplicationController

  def index
    @list = Shop.all
  end

  def new
  end

  def delete
  end

  def edit
    @target = Shop.find_by_id(params[:id])

  end
end
