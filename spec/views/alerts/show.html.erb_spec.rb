require 'rails_helper'

RSpec.describe "alerts/show", type: :view do
  before(:each) do
    @alert = assign(:alert, Alert.create!(
      name: "Name",
      city_origin: "City Origin",
      city_destination: "City Destination",
      bus_class: 2,
      price: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/City Origin/)
    expect(rendered).to match(/City Destination/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
