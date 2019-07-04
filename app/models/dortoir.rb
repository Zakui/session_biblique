class Dortoir < ApplicationRecord
    include Friendlyable
    belongs_to :batiment

    has_many :sessionistes

    def get_nom
        Batiment.friendly.find(batiment_id).abbreger + ' ' + abbreger
    end

    def get_nom_complet
        Batiment.friendly.find(batiment_id).abbreger + ' ' + nom
    end

    def get_pourcentage
        loger = capacite - place_disponible
        @pourcentage = (loger * 100) / capacite
    end
end