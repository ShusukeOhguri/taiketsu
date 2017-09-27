class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates :user_id, null: false, foreign_key: true
  validates :opinion_id, null: false, foreign_key: true
end
