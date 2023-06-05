class Prompt < ApplicationRecord
  LANGUAGES = %w(C C++ C# Go Java JavaScript Kotlin MATLAB PHP Python R Ruby Rust Swift TypeScript)
  belongs_to :user
  has_many :code_reviews
end
