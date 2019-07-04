class Sessioniste < ApplicationRecord
  include Friendlyable
  belongs_to :dortoir, optional: true
  belongs_to :paroise

  def loger_sessioniste(dortoir)
    self.dortoir = dortoir
    self.save

    dortoir.place_disponible = dortoir.place_disponible - 1
    dortoir.save
    true
  end

  def ajouter_a_une_communaute(communaute)
    self.communaute = communaute
    self.save
    true
  end
end
