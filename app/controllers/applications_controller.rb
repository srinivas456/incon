class ApplicationsController < ApplicationController
  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
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

   session[:application_params] ||= {}
  @application = Application.new(session[:application_params])
   @application.project_manager_id = params[:project_manager_id]
  @application.current_step = session[:application_step]
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find_by_id(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
  session[:application_params].deep_merge!(params[:application]) if params[:application]
  @application = Application.new(session[:application_params])
  @application.current_step = session[:application_step]
  if @application.valid?
    if params[:back_button]
      @application.previous_step
    elsif @application.last_step?
      @application.save if @application.all_valid?
    else
      @application.next_step
    end
    session[:application_step] = @application.current_step
  end
  if @application.new_record?
    render "new"
  else
    session[:application_step] = session[:application_params] = nil
    flash[:notice] = "application saved!"
    redirect_to @application
  end
  end

  # PUT /applications/1
  # PUT /applications/1.json
  def update
    @application = Application.find(params[:id])
    #@application = Application.find_by_project_manager_id(params[:project_manager_id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to @application, notice: 'Project manager was successfully updated.' }
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
    @application = Application.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :no_content }
    end
  end
end
