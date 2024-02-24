class Fine < ApplicationRecord
  belongs_to :member
  belongs_to :fee_type
end
