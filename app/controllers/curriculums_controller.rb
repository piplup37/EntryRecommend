class CurriculumsController < ApplicationController
  load_and_authorize_resource
  # GET /curriculums
  # GET /curriculums.json
  def index
    @curriculums = Curriculum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @curriculums }
    end
  end

  # GET /curriculums/1
  # GET /curriculums/1.json
  def show
    @curriculum = Curriculum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @curriculum }
    end
  end

  # GET /curriculums/new
  # GET /curriculums/new.json
  def new
    @curriculum = Curriculum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @curriculum }
    end
  end

  # GET /curriculums/1/edit
  def edit
    @curriculum = Curriculum.find(params[:id])
  end

  # POST /curriculums
  # POST /curriculums.json
  def create
    @curriculum = Curriculum.new(params[:curriculum])
    @curriculum.user = current_user

    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to @curriculum, notice: 'Curriculum was successfully created.' }
        format.json { render json: @curriculum, status: :created, location: @curriculum }
      else
        format.html { render action: "new" }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /curriculums/1
  # PUT /curriculums/1.json
  def update
    @curriculum = Curriculum.find(params[:id])

    respond_to do |format|
      if @curriculum.update_attributes(params[:curriculum])
        format.html { redirect_to @curriculum, notice: 'Curriculum was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculums/1
  # DELETE /curriculums/1.json
  def destroy
    @curriculum = Curriculum.find(params[:id])
    @curriculum.destroy

    respond_to do |format|
      format.html { redirect_to curriculums_url }
      format.json { head :ok }
    end
  end

  def add_select
    @curriculums = Curriculum.where('user_id = ?',current_user.id)
    @subject = Subject.find(params[:add_subject])
  end

  def add_subject
    @subject = Subject.find(params[:add_subject])
    params[:cul].each do |cul|
      @cul = Curriculum.find(cul)
      @cul.subjects << @subject
    end
    redirect_to @subject
  end

  def remove_subject
    @curriculum = Curriculum.find(params[:curriculum])
    @subject = Subject.find(params[:remove_subject])
    @curriculum.subjects.delete(@subject)
    redirect_to @curriculum
  end

end
