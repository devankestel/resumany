class DownloadsController < ApplicationController
  def new
    @resume = Resume.find(params[:resume_id])
    @download = @resume.downloads.new()
  end

  def create
    @resume = Resume.find(params[:resume_id])
    @download = @resume.downloads.create(download_params)
    write_and_attach_files(@download, @resume)
    redirect_to resume_downloads_path(@resume)
  end
  
  def show
    @resume = Resume.find(params[:resume_id])
    @download = @resume.downloads.first
  end

  def edit
    @resume = Resume.find(params[:resume_id])
    @download = @resume.downloads.first
  end

  def update
    @resume = Resume.find(params[:resume_id])
    @download = @resume.downloads.first
    @download.update_attributes(download_params)
    destroy_currently_attached_files(@resume)
    write_and_attach_files(@download, @resume)
    redirect_to resume_downloads_path(@resume)
  end

  private

  def destroy_currently_attached_files(resume)
    resume.pdf.destroy
    resume.txt.destroy
    resume.docx.destroy
  end

  def write_and_attach_files(download, resume)
    if download.pdf
      resume.write_and_attach_pdf(download.route)
    end
    if download.txt
      resume.write_and_attach_txt(download.route)
    end
    if download.docx
      resume.write_and_attach_docx(download.route)
    end
  end

  def download_params
     params.require(:download).permit(:id, :resume_id, :route, :header_font, :prose_font, :pdf, :txt, :docx)
  end
end
