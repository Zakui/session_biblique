class Dortoir < ApplicationRecord
    belongs_to :batiment

    has_many :sessionistes

    def get_nom
        Batiment.find(batiment_id).abbreger + ' ' + abbreger
    end

    def get_nom_complet
        Batiment.find(batiment_id).abbreger + ' ' + nom
    end
end