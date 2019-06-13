require 'rails_helper'

RSpec.describe "sessionistes/show", type: :view do
  before(:each) do
    @sessioniste = assign(:sessioniste, Sessioniste.create!(
      :prenoms => "Prenoms",
      :nom => "Nom",
      :nombre_participation => 2,
      :age => 3,
      :classe => "Classe",
      :derniere_classe => "Derniere Classe",
      :paroise => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Prenoms/)
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Classe/)
    expect(rendered).to match(/Derniere Classe/)
    expect(rendered).to match(//)
  end
end
