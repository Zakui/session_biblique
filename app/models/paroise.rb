class Paroise < ApplicationRecord
    include Friendlyable
    has_many :sessionistes

    def get_nom
        nom
    end

    def get_sessionistes
        self.sessionistes
    end

    def pick_one_sessioniste(sexe)
        sess = self.sessionistes.where(dortoir: nil, sexe: sexe)
        if sess.length > 0
            sess.first
        else
            nil
        end
    end
    def pick_one_sessioniste_sans_communaute
        sess = self.sessionistes.where(communaute: nil)
        if sess.length > 0
            sess.first
        else
            nil
        end
    end
end