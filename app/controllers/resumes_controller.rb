class ResumesController < ApplicationController
before_action :authenticate_user!
  def index

  end 
  def new
    @job=Job.find(params[:job_id])
    @resume=Resume.new
  end
  def create
    @job=Job.find(params[:job_id])
    @resume=Resume.new(resume_params)
    if @resume.save
       redirect_to root_path
    else
       render :new
    end
  end
private

def resume_params
   params.require(:resume).permit(:content,:attachment)
end
end
