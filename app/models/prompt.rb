class Prompt < ApplicationRecord
  belongs_to :user
  has_many :code_reviews
end
