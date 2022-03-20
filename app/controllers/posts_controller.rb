class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  before_action :set_all_categories

  def index
    @posts = Post.all.order(created_at:"DESC")
    if params[:id].blank?
    @post = Post.last
      if !current_user.nil?
      @user = current_user.full_name
      end
  else
    @post = Post.find(params[:id])
  end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
      format.rss
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @posts = Post.all
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end



  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    @user = current_user
    @all_categories = get_all_categories
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @all_categories = get_all_categories
  end

  # POST /posts
  # POST /posts.xml
  def create
    @user = current_user.id
    @post = Post.new(post_params)
    @post.author = current_user

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Innlegget ble lagt inn.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        @user = get_user_list

        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update

    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        flash[:notice] = 'Innlegget ble oppdatert.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        @user = get_user_list
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Innlegget ble slettet.'
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  private

  def get_user_list
    return User.find(:all).collect {|user| [user.full_name, user.id]}
  end

  def get_all_categories
    return Category.order( 'name ASC')
  end

  def get_categories_from(cat_list)
    cat_list = [] if cat_list.blank?
    return cat_list.collect {|cid| Category.find_by_id(cid.to_i)}.compact
  end

  def post_params
      params.require(:post).permit(:title,:content, :content2, :ingress2, :image ,:author_id,:status,:created_at,:lead, :front, :color)
    end

end
