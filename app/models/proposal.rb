class Proposal < ApplicationRecord
  has_one :solution_proposal, dependent: :destroy
end
