class RoamsController < ApplicationController
  # GET /roams
  # GET /roams.json
  def index
    @roams = Roam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roams }
    end
  end

  # GET /roams/1
  # GET /roams/1.json
  def show
    @roam = Roam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @roam }
      format.js
    end
  end

  # GET /roams/new
  # GET /roams/new.json
  def new
    @roam = Roam.new

    respond_to do |format|
      format.js
    end
  end

  # GET /roams/1/edit
  def edit
    @roam = Roam.find(params[:id])
  end

  # POST /roams
  # POST /roams.json
  def create
    @roam = Roam.new
    @roam.roamer_name = params[:roamer_name]
    @roam.task_id = params[:task_id] 
    @roam.user_id = params[:user_id] 
    @roam.save    

    respond_to do |format|
     format.html
     format.js
    end
  end

  # PUT /roams/1
  # PUT /roams/1.json
  def update
    @roam = Roam.find(params[:id])

    respond_to do |format|
      if @roam.update_attributes(params[:roam])
        format.html { redirect_to @roam, notice: 'Roam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @roam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roams/1
  # DELETE /roams/1.json
  def destroy
    @roam = Roam.find(params[:id])
    @roam.destroy

    respond_to do |format|
      format.html { redirect_to roams_url }
      format.json { head :no_content }
    end
  end
end
