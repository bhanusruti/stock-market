class Following < ApplicationRecord
  belongs_to :user through: company
  belongs_to :company through: users
end
