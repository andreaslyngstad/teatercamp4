class Person < ApplicationRecord
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :medium, resize_to_limit: [300, 300]
    attachable.variant :medium2, resize_to_limit: [300, 300], crop: [0, 0, 300, 200]
  end
  has_rich_text :bio
  has_many :people_camps
  has_many :camps, through: :people_camps


end
