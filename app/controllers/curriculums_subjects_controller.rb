class CurriculumsSubjectsController < ApplicationController
  # GET /curriculums_subjects
  # GET /curriculums_subjects.json
  def index
    @curriculums_subjects = CurriculumsSubject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @curriculums_subjects }
    end
  end

  # GET /curriculums_subjects/1
  # GET /curriculums_subjects/1.json
  def show
    @curriculums_subject = CurriculumsSubject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @curriculums_subject }
    end
  end

  # GET /curriculums_subjects/new
  # GET /curriculums_subjects/new.json
  def new
    @curriculums_subject = CurriculumsSubject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @curriculums_subject }
    end
  end

  # GET /curriculums_subjects/1/edit
  def edit
    @curriculums_subject = CurriculumsSubject.find(params[:id])
  end

  # POST /curriculums_subjects
  # POST /curriculums_subjects.json
  def create
    @curriculums_subject = CurriculumsSubject.new(params[:curriculums_subject])

    respond_to do |format|
      if @curriculums_subject.save
        format.html { redirect_to @curriculums_subject, notice: 'Curriculums subject was successfully created.' }
        format.json { render json: @curriculums_subject, status: :created, location: @curriculums_subject }
      else
        format.html { render action: "new" }
        format.json { render json: @curriculums_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /curriculums_subjects/1
  # PUT /curriculums_subjects/1.json
  def update
    @curriculums_subject = CurriculumsSubject.find(params[:id])

    respond_to do |format|
      if @curriculums_subject.update_attributes(params[:curriculums_subject])
        format.html { redirect_to @curriculums_subject, notice: 'Curriculums subject was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @curriculums_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculums_subjects/1
  # DELETE /curriculums_subjects/1.json
  def destroy
    @curriculums_subject = CurriculumsSubject.find(params[:id])
    @curriculums_subject.destroy

    respond_to do |format|
      format.html { redirect_to curriculums_subjects_url }
      format.json { head :ok }
    end
  end
end
