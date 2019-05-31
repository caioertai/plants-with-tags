class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :plants, through: :taggings
end
