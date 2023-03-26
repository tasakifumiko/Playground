class Admin::AreasController < ApplicationController
  def create
    @area = Area.new(area_params)
    if @area.save
      redirect_to admin_areas_path
    else
      @areas = Area.all
      render :index
    end
  end
  
  def new
    @area = Area.new
  end
  
  def index
    @areas = Area.all
    @area = Area.new
  end

  def edit
    @area = Area.find(params[:id])
  end
  
  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      redirect_to admin_areas_path
    else
      render :edit
    end
  end
  
  def area_params
    params.require(:area).permit(:name)
  end
  
end
