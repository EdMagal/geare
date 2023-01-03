class Gru < ApplicationRecord
  belongs_to :user, dependent: :destroy

  # Everytime a GRU is created the status is set to 'pending'
  after_initialize :set_default_status, if: :new_record?

  # Validations
  validates :user, presence: true
  validates :status, presence: true

  private

  def set_default_status
    self.status ||= 'pending'
  end
end
