require 'rails_helper'

RSpec.describe "alerts/index", type: :view do
  before(:each) do
    assign(:alerts, [
      Alert.create!(
        name: "Name",
        city_origin: "City Origin",
        city_destination: "City Destination",
        bus_class: 2,
        price: 3
      ),
      Alert.create!(
        name: "Name",
        city_origin: "City Origin",
        city_destination: "City Destination",
        bus_class: 2,
        price: 3
      )
    ])
  end

  it "renders a list of alerts" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "City Origin".to_s, count: 2
    assert_select "tr>td", text: "City Destination".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
