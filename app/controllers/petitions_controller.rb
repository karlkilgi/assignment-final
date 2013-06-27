class PetitionsController < ApplicationController
  def index
    @petition = Petition.all
  end

  def mypetitions
  end

  def new
    @petition = Petition.new

    respond_to do |format|
      format.html
      format.json { render json: @petition }
    end
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

    respond_to do |format|
      format.html
      format.json { render json: @petition }
    end
  end

end
