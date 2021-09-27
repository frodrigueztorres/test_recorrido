require 'rails_helper'

RSpec.describe "alerts/edit", type: :view do
  before(:each) do
    @alert = assign(:alert, Alert.create!(
      name: "MyString",
      city_origin: "MyString",
      city_destination: "MyString",
      bus_class: 1,
      price: 1
    ))
  end

  it "renders the edit alert form" do
    render

    assert_select "form[action=?][method=?]", alert_path(@alert), "post" do

      assert_select "input[name=?]", "alert[name]"

      assert_select "input[name=?]", "alert[city_origin]"

      assert_select "input[name=?]", "alert[city_destination]"

      assert_select "input[name=?]", "alert[bus_class]"

      assert_select "input[name=?]", "alert[price]"
    end
  end
end
