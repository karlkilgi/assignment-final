class VotesController < ApplicationController
  def create
    @petition = Petition.find(params[:petition_id])
    vote = Vote.new
    vote.petition_id = params[:petition_id]
    vote.user_id = session['user_id']
    vote.save
    redirect_to petition_path(@petition)
  end
end
