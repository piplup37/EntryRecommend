class ScoresController < ApplicationController
  load_and_authorize_resource
  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scores }
    end
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
    @score = Score.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @score }
    end
  end

  # GET /scores/new
  # GET /scores/new.json
  def new
    @score = Score.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @score }
    end
  end

  # GET /scores/1/edit
  def edit
    @score = Score.find(params[:id])
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.new(params[:score])
    if params[:set_user] and params[:set_sub]
      @score.user_id = params[:set_user]
      @score.subject_id = params[:set_sub]
    end
    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
        format.json { render json: @score, status: :created, location: @score }
      else
        format.html { render action: "new" }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scores/1
  # PUT /scores/1.json
  def update
    @score = Score.find(params[:id])
    if params[:set_user] and params[:set_sub]
			@score.user_id = params[:set_user]
			@score.subject_id = params[:set_sub]
		end
		
    respond_to do |format|
      if @score.update_attributes(params[:score])
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score = Score.find(params[:id])
    @score.destroy

    respond_to do |format|
      format.html { redirect_to scores_url }
      format.json { head :ok }
    end
  end

end
