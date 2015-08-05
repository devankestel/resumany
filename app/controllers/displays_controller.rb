class DisplaysController < ApplicationController
  def show
    @resume = Resume.find(params[:resume_id])
    @display = @resume.displays.all
  end

  def edit
    @resume = Resume.find(params[:resume_id])
    @displays = @resume.displays.all
  end
  def update
    @resume = Resume.find(params[:resume_id])
    @displays = @resume.displays.update(display_params)
  end
  def download_params
     params.require(:display).permit(:id, :resume_id, :category, :placement)
  end
end
