class Paroise < ApplicationRecord
    has_many :sessionistes

    def get_nom
        nom
    end
end