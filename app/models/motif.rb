class Motif < ApplicationRecord
    validates_presence_of :reason
    has_many :demandes
    validates_uniqueness_of   :reason
  end