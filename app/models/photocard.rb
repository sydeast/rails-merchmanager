class Photocard < ApplicationRecord
  belongs_to :user
  belongs_to :artist

  scope :listed_by_title, -> { order(:title) }
  scope :public_viewing, -> { where(status: "public") }

end
