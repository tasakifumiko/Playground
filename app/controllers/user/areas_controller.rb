class User::AreasController < ApplicationController
  
  def show
    @area = Area.find(params[:id])
  end
end
