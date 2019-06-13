class Chambre < ApplicationRecord
    belongs_to :batiment

    has_many :sessionistes

    def get_nom
        Batiment.find(batiment_id).abbreger + ' ' + abbreger
    end
end