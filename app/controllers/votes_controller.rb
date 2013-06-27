class VotesController < ApplicationController
  def create
    @petition = Petition.find(params[:petition_id])
 ##
    redirect_to petition_path(@petition)
  end
end
