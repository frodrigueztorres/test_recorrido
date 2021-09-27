require 'rails_helper'

RSpec.describe "alerts/new", type: :view do
  before(:each) do
    assign(:alert, Alert.new(
      name: "MyString",
      city_origin: "MyString",
      city_destination: "MyString",
      bus_class: 1,
      price: 1
    ))
  end

  it "renders new alert form" do
    render

    assert_select "form[action=?][method=?]", alerts_path, "post" do

      assert_select "input[name=?]", "alert[name]"

      assert_select "input[name=?]", "alert[city_origin]"

      assert_select "input[name=?]", "alert[city_destination]"

      assert_select "input[name=?]", "alert[bus_class]"

      assert_select "input[name=?]", "alert[price]"
    end
  end
end
