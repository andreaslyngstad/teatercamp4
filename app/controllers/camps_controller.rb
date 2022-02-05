class CampsController < ApplicationController
  # GET /camps
  # GET /camps.xml
  layout "application"
    def index
    @camps = Camp.order("public DESC").includes(:registrations)
    if request.get? && !params[:id].blank?
      @camp = Camp.find(params[:id])
      elsif request.get? && params[:id].blank?
      @camp = Camp.new
      elsif request.post? && !params[:id].blank?
      @camp = Camp.find(params[:id])
      if params[:commit] == "oppdater"
        respond_to do |format|
          if @camp.update_attributes(params[:camp])
            flash[:notice] = 'Kurset ble oppdatert'
            format.html { redirect_to(:action => "index") }
            format.xml  { head :ok }
          else
            format.html { render :action => "index" }
            format.xml  { render :xml => @camp.errors }
          end
      end
      end
    end
  end

 def new
   @camp = Camp.new
   @products = Product.all
 end
 def edit
   @camp = Camp.find(params[:id])
   @products = Product.all
 end
  # GET /camps/1
  # GET /camps/1.xml
  def show
    @camp = Camp.find(params[:id])
    @camps = Camp.all

    respond_to do |format|
      format.html { render :action => "show" }
      format.xml  { render :xml => @camp }
    end
  end


  def create
    @camp = Camp.new(camp_params)
    @camps = Camp.all
    @products = Product.all
    respond_to do |format|
      if @camp.save
        flash[:notice] = 'Kurset ble laget.'
        format.html { redirect_to(camps_path) }
        format.xml  { render :xml => @camp, :status => :created, :location => @camp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @camp.errors, :status => :unprocessable_entity }
      end
    end
  end
 def update
   @camp = Camp.find(params[:id])
   @products = Product.all
    params[:camp][:product_ids] ||= []

    respond_to do |format|
      if @camp.update(camp_params)

        flash[:notice] = 'Campen ble oppdatert.'
        format.html { redirect_to(camps_path) }
        format.xml  { head :ok }
      else
        flash[:notice] = 'Feil'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
 end

  # DELETE /camps/1
  # DELETE /camps/1.xml
  def destroy
    @camp = Camp.find(params[:id])
    @camp.destroy

    respond_to do |format|
        flash[:notice] = 'Kurset er slettet'
      format.html { redirect_to(camps_url) }
      format.xml  { head :ok }
    end
  end
  private
  def camp_params
    params.require(:camp).permit(:name,:description,
      :age1,:age2,:begin,:end,:participants,:public,:ingress, :product_ids =>[] )
  end
end
