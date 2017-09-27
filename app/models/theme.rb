class Theme < ApplicationRecord
  has_many :opinions
  belongs_to :user
  validate :add_error_sample

  def add_error_sample
    if red.blank? || blue.blank?
      errors[:red] << "お題は必ず両方入力して下さい"
      errors[:blue] << "お題は必ず両方入力して下さい"
    end
  end
end
