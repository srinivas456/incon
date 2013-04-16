class ProjectManagersController < ApplicationController
  # GET /project_managers
  # GET /project_managers.json
  def index
    @project_managers = ProjectManager.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_managers }
    end
  end

  # GET /project_managers/1
  # GET /project_managers/1.json
  def show
    @project_manager = ProjectManager.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_manager }
    end
  end

  # GET /project_managers/new
  # GET /project_managers/new.json
  def new
    @project_manager = ProjectManager.new
    @project_manager.applications.build

    @project_managers = ProjectManager.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_manager }
    end
  end

  # GET /project_managers/1/edit
  def edit
    @application = Application.find_by_id(params[:id])
  end

  # POST /project_managers
  # POST /project_managers.json
  def create
    @project_manager = ProjectManager.new(params[:project_manager])

    respond_to do |format|
      if @project_manager.save
        format.html { redirect_to action: "new", notice: 'Project manager was successfully created.' }
        format.json { render json: @project_manager, status: :created, location: @project_manager }
      else
        format.html { render action: "new", notice: 'Project manager was successfully created.' }
        format.json { render json: @project_manager.errors, status: :unprocessable_entity  }
      end
    end
  end

  # PUT /project_managers/1
  # PUT /project_managers/1.json
  def update
    @project_manager = ProjectManager.find(params[:id])
    @application = Application.find_by_id(params[:id])

    respond_to do |format|
      if @project_manager.update_attributes(params[:project_manager])
        format.html { redirect_to @project_manager, notice: 'Project manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_managers/1
  # DELETE /project_managers/1.json
  def destroy
    @project_manager = ProjectManager.find(params[:id])
    @project_manager.destroy

    respond_to do |format|
      format.html { redirect_to project_managers_url }
      format.json { head :no_content }
    end
  end
end
