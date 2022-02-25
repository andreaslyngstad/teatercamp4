class Post < ActiveRecord::Base


  # scope :eager_post, -> include  [:author, :categories],
  # :order => "created_at DESC", :conditions => "status = 'Offentlig'"

  belongs_to :author, :class_name => "User",
                      :foreign_key => "author_id"
  # has_many :comments, :order => "created_at ASC",
  #                     :dependent => :destroy
  # has_many :approved_comments, :class_name => "Comment",
  #          :conditions => "status = 'godkjent' OR status = 'nye'"

  # validates_presence_of :title
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :original, resize_to_limit: [1440, 956]
    attachable.variant :medium, resize_to_limit: [300, 300]
    attachable.variant :medium2, resize_to_limit: [300, 300], crop: [0, 0, 300, 200]
  end
  has_rich_text :content2
  has_rich_text :ingress2
  def self.search(search)
    if search
      find(:all, :include => [:author, :approved_comments],
      :order => "posts.created_at DESC",
      :conditions => ['title LIKE ? OR content LIKE ? OR lead LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])

    else
      @posts = Post.where(status: 'Offentlig').order("posts.created_at DESC")
    end
  end
  def self.eager_post
    order("created_at DESC").where("status = 'Offentlig'")
  end

end
