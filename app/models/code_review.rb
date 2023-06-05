class CodeReview < ApplicationRecord
  belongs_to :prompt
  has_one_attached :file
end
