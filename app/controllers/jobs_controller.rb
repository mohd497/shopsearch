class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  def jobs_accepted
    @jobs = Job.where(accepted: true)
    render json: @jobs
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    job = Job.where("device_token = ? and created_at > ?", params[:device_token], 1.days.ago)
    if job.count > 0
      render json: {error: "Already contains data!"}
    else
        @job = Job.create(title: params[:title], description: params[:description], salary_range: params[:salary_range], email: params[:email], device_token: params[:device_token])
        if @job.save
          render json: {success: "Saved!"}
        else
          render json: {error: "Not saved!"}
        end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :salary_range, :email)
    end
end
