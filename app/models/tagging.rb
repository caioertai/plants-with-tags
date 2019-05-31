class Tagging < ApplicationRecord
  belongs_to :plant
  belongs_to :tag

  # We don't want the same tag associated multiple times to the same plant
  validates :tag, uniqueness: { scope: :plant }
end
