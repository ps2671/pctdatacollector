class TaskProgressesController < ApplicationController
  before_action :set_task_progress, only: [:show, :edit, :update, :destroy]

  # GET /task_progresses
  # GET /task_progresses.json
  def index
    @task_progresses = TaskProgress.all
  end

  # GET /task_progresses/1
  # GET /task_progresses/1.json
  def show
  end

  # GET /task_progresses/new
  def new
    @task_progress = TaskProgress.new
  end

  # GET /task_progresses/1/edit
  def edit
  end

  # POST /task_progresses
  # POST /task_progresses.json
  def create
    @task_progress = TaskProgress.new(task_progress_params)

    respond_to do |format|
      if @task_progress.save
        format.html { redirect_to @task_progress, notice: 'Task progress was successfully created.' }
        format.json { render :show, status: :created, location: @task_progress }
      else
        format.html { render :new }
        format.json { render json: @task_progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_progresses/1
  # PATCH/PUT /task_progresses/1.json
  def update
    respond_to do |format|
      if @task_progress.update(task_progress_params)
        format.html { redirect_to @task_progress, notice: 'Task progress was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_progress }
      else
        format.html { render :edit }
        format.json { render json: @task_progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_progresses/1
  # DELETE /task_progresses/1.json
  def destroy
    @task_progress.destroy
    respond_to do |format|
      format.html { redirect_to task_progresses_url, notice: 'Task progress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_progress
      @task_progress = TaskProgress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_progress_params
      params.require(:task_progress).permit(:task_id, :user_id, :done)
    end
end
