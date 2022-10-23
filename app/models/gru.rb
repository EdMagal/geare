class Gru < ApplicationRecord
  belongs_to :user, dependent: :destroy

  def initialize
    super
    self.status = "Pendente"
  end
end
