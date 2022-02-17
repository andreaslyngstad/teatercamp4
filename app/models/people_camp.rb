class PeopleCamp < ApplicationRecord
  belongs_to :person
  belongs_to :camp
  accepts_nested_attributes_for :person
end
