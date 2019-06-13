require 'rails_helper'

RSpec.describe "sessionistes/index", type: :view do
  before(:each) do
    assign(:sessionistes, [
      Sessioniste.create!(
        :prenoms => "Prenoms",
        :nom => "Nom",
        :nombre_participation => 2,
        :age => 3,
        :classe => "Classe",
        :derniere_classe => "Derniere Classe",
        :paroise => nil
      ),
      Sessioniste.create!(
        :prenoms => "Prenoms",
        :nom => "Nom",
        :nombre_participation => 2,
        :age => 3,
        :classe => "Classe",
        :derniere_classe => "Derniere Classe",
        :paroise => nil
      )
    ])
  end

  it "renders a list of sessionistes" do
    render
    assert_select "tr>td", :text => "Prenoms".to_s, :count => 2
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Classe".to_s, :count => 2
    assert_select "tr>td", :text => "Derniere Classe".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
