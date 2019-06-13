require 'rails_helper'

RSpec.describe "sessionistes/edit", type: :view do
  before(:each) do
    @sessioniste = assign(:sessioniste, Sessioniste.create!(
      :prenoms => "MyString",
      :nom => "MyString",
      :nombre_participation => 1,
      :age => 1,
      :classe => "MyString",
      :derniere_classe => "MyString",
      :paroise => nil
    ))
  end

  it "renders the edit sessioniste form" do
    render

    assert_select "form[action=?][method=?]", sessioniste_path(@sessioniste), "post" do

      assert_select "input[name=?]", "sessioniste[prenoms]"

      assert_select "input[name=?]", "sessioniste[nom]"

      assert_select "input[name=?]", "sessioniste[nombre_participation]"

      assert_select "input[name=?]", "sessioniste[age]"

      assert_select "input[name=?]", "sessioniste[classe]"

      assert_select "input[name=?]", "sessioniste[derniere_classe]"

      assert_select "input[name=?]", "sessioniste[paroise_id]"
    end
  end
end
