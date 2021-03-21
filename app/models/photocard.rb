class Photocard < ApplicationRecord
  belongs_to :user
  belongs_to :artist

  scope :listed_by_title, -> { order(:title) }


end
