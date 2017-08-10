class Theme < ApplicationRecord
  has_many :opinions
  belongs_to :user
end
