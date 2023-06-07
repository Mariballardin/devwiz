class CodeReview < ApplicationRecord
  belongs_to :prompt
  has_one_attached :file

  # enum status: { pending: 0, reviewed: 1, rejected: 2 } # Exemplo de uso de enum para o campo status

  validates :user_answer, presence: true
  validates :received_feedback, presence: true
end
