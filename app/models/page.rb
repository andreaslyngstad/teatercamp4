class Page < ActiveRecord::Base

  # has_attached_file :nav_photo, :styles => { :small => "200x150#" }
  # has_attached_file :main_photo, :styles => { :small => "250x250>" }
  # acts_as_nested_set
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :proposed_parent_id
  has_rich_text :content

end
