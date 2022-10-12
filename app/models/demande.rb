class Demande < ApplicationRecord
  enum status: [:inprogress, :accepted, :refused]
  belongs_to :motif
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', optional: true
end
