class Artist < ApplicationRecord
  belongs_to :user
  has_many :photocards


end
