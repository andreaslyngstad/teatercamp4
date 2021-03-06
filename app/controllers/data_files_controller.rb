class DataFilesController < ApplicationController

    def index
    @images = DataFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images }
    end
  end

  def new
    @image = DataFile.new
  end
  def create
    @image = DataFile.new(data_file)
    @images = DataFile.all
    respond_to do |format|
      if @image.save
        flash[:notice] = 'Bildet ble lastet opp'
        format.html { redirect_to(data_files_path) }

      else
        format.html { render :action => "index" }

      end
    end
  end

  def update
    @image = DataFile.find(params[:id])
    respond_to do |format|
      if DataFile.all.each do |t|
        t.update_attributes(:use => false)
      @image.update_attributes(:use => true)

        end
        flash[:notice] = "Du bruker:  #{@image.photo_file_name}."
        format.html { redirect_to(data_files_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
      end
  end
  def destroy
    @image = DataFile.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(data_files_path) }
      format.xml  { head :ok }
    end
  end
  def data_file
    params.require(:data_file).permit(:photo, :photo_file_name,:photo_content_type,
      :photo_file_size,
      :photo_updated_at,
      :use)
  end
end
