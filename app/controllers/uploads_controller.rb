class UploadsController < ApplicationController


  def index
	if signed_in? and current_user.admin?
  
	  	 @uploads = Upload.all 
	elsif signed_in? 
		@uploads = current_user.uploads
	else
		redirect_to(root_path)
	end
  end

  def new
   @upload = Upload.new
  end

 def create
  @upload = current_user.uploads.create(params[:upload])
 	if @upload.save
		flash[:notice] = "your file has been uploaded"
		redirect_to uploads_path

	else
		render :action => 'new'
	end
 end

 def destroy
  @upload = Upload.find(params[:id])
  @upload.destroy
  flash[:notice] = "Sucessfully deleted your file"
  redirect_to uploads_path
 end


 def download
    upload = Upload.find(params[:id])
    #location = "#{Rails.root}" 
    
   # send_file  (@upload)
#send_file('public/test_file.pdf', :filename => 'Test File', :type => 'application/pdf', :disposition => 'attachment', :streaming => 'true', :buffer_size => '4096')
    send_file  upload.uploaded.path,
		:filename => upload.uploaded_file_name,
                :type => upload.uploaded_content_type,
		:disposition => 'attachment'
    flash[:notice] = "Your file has been downloaded"
 end


end
