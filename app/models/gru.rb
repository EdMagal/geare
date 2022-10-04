class Gru < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
