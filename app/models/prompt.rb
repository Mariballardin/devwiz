class Prompt < ApplicationRecord
  FIELDS = [
    'Agriculture',
    'Arts',
    'Construction',
    'Consumer Goods',
    'Corporate Services',
    'Design',
    'Education',
    'Energy & Mining',
    'Entertainment',
    'Finance',
    'Hardware & Networking',
    'Health Care',
    'Legal',
    'Manufacturing',
    'Media & Communications',
    'Nonprofit',
    'Public Administration',
    'Public Safety',
    'Real Estate',
    'Recreation & Travel',
    'Retail',
    'Software & IT Services',
    'Transportation & Logistics',
    'Wellness & Fitness'
  ]
  JOBS = [
    "Artificial Intelligence Engineer",
    "Backend Java Engineer",
    "Back-end Developer",
    "Blockchain Specialist",
    "Cloud Computing Specialist",
    "Cybersecurity Engineer",
    "Data Analyst",
    "Data Engineer",
    "Data Infrastructure Engineer",
    "Data Scientist",
    "DevOps Engineer",
    "Front-end Developer",
    "Frontend JavaScript Engineer",
    "Full Stack Developer",
    "IoT (Internet of Things) Engineer",
    "Machine Learning Engineer",
    "Network Engineer",
    "Product Owner",
    "Robotics Engineer",
    "Software Architect",
    "Software Developer",
    "Software Engineer",
    "Software Project Manager",
    "Software Quality Analyst",
    "Systems Analyst",
    "Systems Engineer",
    "Test Automation Engineer",
    "Test Engineer",
    "UX/UI Designer",
    "Virtual Reality/Augmented Reality Engineer"
  ]

  LANGUAGES = %w(C C++ C# Go JavaScript PHP Python R Ruby Swift)
  belongs_to :user
  has_many :code_reviews, dependent: :destroy

  validates :programming_language, presence: true
  validates :level, presence: true
  validates :job_title, presence: true
  validates :job_field, presence: true
end
