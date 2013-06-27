class PetitionsController < ApplicationController
  def index
    @petition = Petition.all
  end

  def mypetitions
    if current_user.nil?
      redirect_to root_path
    end
    @petition = Petition.find_all_by_user_id session['user_id']
  end

  def new
    if current_user.nil?
      redirect_to root_path
    else
      @petition = Petition.new
      respond_to do |format|
        format.html
        format.json { render json: @petition }
      end
    end
  end

  def edit
    @petition = Petition.find(params[:id])
  end

  def create
    @petition = Petition.new(params[:petition])
    @petition.user_id = session['user_id']
    @petition.vote = 0
    respond_to do |format|
      if @petition.save
        format.html { redirect_to @petition, notice: 'Petition was successfully created.' }
        format.json { render json: @petition, status: :created, location: @petition }
      else
        format.html { render action: 'new' }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @petition = Petition.find(params[:id])
    @voted = false
    votes = Vote.find_all_by_petition_id(params[:id])
    votes.each do |vote|
      if vote.user_id == session['user_id']
        @voted = true
      end
    end

    respond_to do |format|
      format.html
      format.json { render json: @petition }
    end
  end

end
