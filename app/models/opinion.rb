class Opinion < ApplicationRecord
  belongs_to :theme
  belongs_to :user
  has_many :assessments

  validates :text, presence: true
end
