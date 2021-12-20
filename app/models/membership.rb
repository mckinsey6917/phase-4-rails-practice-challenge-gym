class Membership < ApplicationRecord
  belongs_to :client
  belongs_to :gym

  validates :client_id, uniqueness: {scope: :gym_id}
  validates :gym_id, presence: true
  validates :client_id, presence: true
  validates :charge, presence: true
end
