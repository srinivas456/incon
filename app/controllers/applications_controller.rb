class ApplicationsController < ApplicationController
  # GET /applications
  # GET /applications.json
  before_filter :authenticate_user!

  
  def index
    @applications = Application.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applications }
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/new
  # GET /applications/new.json
  def new

    @application = Application.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find_by_id(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = ProjectManager.new(params[:application])

    respond_to do |format|
      if @application.save
        format.html { redirect_to action: "new", notice: 'Application was successfully created.' }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render action: "new", notice: 'Application was successfully created.' }
        format.json { render json: @application.errors, status: :unprocessable_entity  }
      end
    end
  end

  # PUT /applications/1
  # PUT /applications/1.json
  def update
    @application = Application.find_by_id(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application = ProjectManager.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to action: "new" }
      format.json { head :no_content }
    end
  end
end
