class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates :user_id, null: false
  validates :opinion_id, null: false
end
