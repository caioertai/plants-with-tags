class Plant < ApplicationRecord
  belongs_to :garden # adds a presence validation on the garden_id foreign key

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :name, presence: true
end
