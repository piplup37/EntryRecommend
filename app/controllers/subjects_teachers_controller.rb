class SubjectsTeachersController < ApplicationController
  load_and_authorize_resource

  # GET /subjects_teachers
  # GET /subjects_teachers.json
  def index
    @subjects_teachers = SubjectsTeacher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects_teachers }
    end
  end

  # GET /subjects_teachers/1
  # GET /subjects_teachers/1.json
  def show
    @subjects_teacher = SubjectsTeacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subjects_teacher }
    end
  end

  # GET /subjects_teachers/new
  # GET /subjects_teachers/new.json
  def new
    @subjects_teacher = SubjectsTeacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subjects_teacher }
    end
  end

  # GET /subjects_teachers/1/edit
  def edit
    @subjects_teacher = SubjectsTeacher.find(params[:id])
  end

  # POST /subjects_teachers
  # POST /subjects_teachers.json
  def create
    @subjects_teacher = SubjectsTeacher.new(params[:subjects_teacher])
    @subjects_teacher.subject_id = params[:set_subject]
    @subjects_teacher.teacher_id = params[:set_teacher]

    respond_to do |format|
      if @subjects_teacher.save
        format.html { redirect_to @subjects_teacher, notice: 'Subjects teacher was successfully created.' }
        format.json { render json: @subjects_teacher, status: :created, location: @subjects_teacher }
      else
        format.html { render action: "new" }
        format.json { render json: @subjects_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subjects_teachers/1
  # PUT /subjects_teachers/1.json
  def update
    @subjects_teacher = SubjectsTeacher.find(params[:id])
    @subjects_teacher.subject_id = params[:set_subject]
    @subjects_teacher.teacher_id = params[:set_teacher]

    respond_to do |format|
      if @subjects_teacher.update_attributes(params[:subjects_teacher])
        format.html { redirect_to @subjects_teacher, notice: 'Subjects teacher was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @subjects_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects_teachers/1
  # DELETE /subjects_teachers/1.json
  def destroy
    @subjects_teacher = SubjectsTeacher.find(params[:id])
    @subjects_teacher.destroy

    respond_to do |format|
      format.html { redirect_to subjects_teachers_url }
      format.json { head :ok }
    end
  end
end
