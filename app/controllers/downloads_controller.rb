class DownloadsController < ApplicationController
  def new
    @resume = Resume.find(params[:resume_id])
    @download = @resume.downloads.new()
  end

  def create
    @resume = Resume.find(params[:resume_id])
    @download = @resume.downloads.create(download_params)
    if @download.pdf
      @resume.write_pdf(@download.route)
    end
    if @download.txt
      @resume.write_txt(@download.route)
    end
    if @download.docx
      @resume.write_docx(@download.route)
    end
    redirect_to resume_download_path(@resume, @download)
  end
  
  def show
    @download = Download.find(params[:id])
  end

  private

  def download_params
     params.require(:download).permit(:route, :header_font, :prose_font, :pdf, :txt, :docx)
  end
end
