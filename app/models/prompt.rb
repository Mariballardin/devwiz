class Prompt < ApplicationRecord
  LANGUAGES = %w(C C++ C# Go Java JavaScript Kotlin MATLAB PHP Python R Ruby Rust Swift TypeScript)
  belongs_to :user
  has_many :code_reviews
  validates :programming_language, presence: true
  validates :level, presence: true
  validates :job_title, presence: true
  validates :job_field, presence: true
end
