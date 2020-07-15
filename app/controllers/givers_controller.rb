class GiversController < ApplicationController
  def index

  end

  def show
    @giver = Giver.find(params[:id])
  end
end
