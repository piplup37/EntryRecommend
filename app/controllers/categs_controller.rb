class CategsController < ApplicationController
	load_and_authorize_resource
  # GET /categs
  # GET /categs.json
  def index
    @categs = Categ.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categs }
    end
  end

  # GET /categs/1
  # GET /categs/1.json
  def show
    @categ = Categ.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categ }
    end
  end

  # GET /categs/new
  # GET /categs/new.json
  def new
    @categ = Categ.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categ }
    end
  end

  # GET /categs/1/edit
  def edit
    @categ = Categ.find(params[:id])
  end

  # POST /categs
  # POST /categs.json
  def create
    @categ = Categ.new(params[:categ])

    respond_to do |format|
      if @categ.save
        format.html { redirect_to @categ, notice: 'Categ was successfully created.' }
        format.json { render json: @categ, status: :created, location: @categ }
      else
        format.html { render action: "new" }
        format.json { render json: @categ.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categs/1
  # PUT /categs/1.json
  def update
    @categ = Categ.find(params[:id])

    respond_to do |format|
      if @categ.update_attributes(params[:categ])
        format.html { redirect_to @categ, notice: 'Categ was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @categ.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categs/1
  # DELETE /categs/1.json
  def destroy
    @categ = Categ.find(params[:id])
    @categ.destroy

    respond_to do |format|
      format.html { redirect_to categs_url }
      format.json { head :ok }
    end
  end
end
