class Admin::HomesController < ApplicationController
  #before_action :authenticate_admin!

  def top
    @reviews = Review.all
  end
end