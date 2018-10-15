class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_job, only: [:show, :update, :destroy]
  def index
    authorize
  end

  def show
    authorize job
  end

  def create
    job = Job.new(job_params)
    authorize job
    if job.save
      redirect_to job, alert: "Job posting successfully created."
    else
      render new_job_path, alert: "Failed to create job posting, try again!"
    end
  end

  def update
    authorize job
    if job.update(job_params)
      redirect_to job, alert: "Job posting successfully updated."
    else
      render new_job_path, alert: "Failed to update job posting, try again!"
    end
  end

  def destroy
    authorize job
    job.destroy
    redirect_to root_path, alert: "Job offer succesfully deleted"
  end

  private

  def find_job
    job = Job.find(params[:id] || params[:job_id])
  end

  def job_parmas
    params.permit(:title, :description, :user_id)
  end
end
