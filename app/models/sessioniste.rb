class Sessioniste < ApplicationRecord
  belongs_to :chambre, optional: true
  belongs_to :paroise
end
