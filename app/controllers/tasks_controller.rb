class TasksController < ApplicationController
  
  before_filter :zero_authors_or_authenticated
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.order('id ASC').all
    @locations = Location.all
    @rooms = Room.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        @roam = Roam.new
        @roam.roamer_name = current_user.username
        @roam.task_id = @task.id
        @roam.user_id = current_user.id 
        @roam.save  
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if params[:task][:name].present?
        if @task.update_attributes(params[:task])
          format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      else
        if @task.update_attributes(params[:task])
          format.html { redirect_to :controller => 'rooms', :action => 'show', :id => @task.room_id}
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end  
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
