class Camp < ActiveRecord::Base
  has_many :registrations
  # validates :name, :description, :age1, :age2, :begin, :end, presence: true
  validates_presence_of :name, :age1, :age2, :begin, :end


  # validates_length_of :ingress, :maximum => 440, :allow_blank => true
  has_many :pricings, inverse_of: :camp
  has_many :products, :through => :pricings
  accepts_nested_attributes_for :pricings

  has_many :people_camps
  has_many :people, :through =>  :people_camps

  has_one_attached :cover_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :medium, resize_to_limit: [300, 300]
    attachable.variant :medium2, resize_to_limit: [300, 300], crop: [0, 0, 300, 200]
  end
  has_rich_text :description2
  has_rich_text :ingress2

   def total_eks_vat
     a = 0
     products.each do |p|
       a += p.eks_vat
     end
     a
   end
   def total_vat
     products.sum(:total_price) - total_eks_vat
   end
end
