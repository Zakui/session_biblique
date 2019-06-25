class Batiment < ApplicationRecord
    include Friendlyable
    has_many :dortoirs

    def get_capacite
        @capacite = 0
        self.dortoirs.each do |dortoir|
            @capacite = @capacite + dortoir.capacite
        end
        @capacite
    end

    def get_place_disponible
        @place_disponible = 0
        self.dortoirs.each do |dortoir|
            @place_disponible = @place_disponible + dortoir.place_disponible
        end
        @place_disponible
    end
end