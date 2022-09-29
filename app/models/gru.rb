class Gru < ApplicationRecord
  belongs_to :user, dependent: :destroys
end
