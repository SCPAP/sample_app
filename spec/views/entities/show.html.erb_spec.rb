require 'spec_helper'

describe "entities/show" do
  before(:each) do
    @entity = assign(:entity, stub_model(Entity,
      :image => "",
      :latitude => "Latitude",
      :longitude => "Longitude",
      :mine_type => "Mine Type",
      :filename => "Filename"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Latitude/)
    rendered.should match(/Longitude/)
    rendered.should match(/Mine Type/)
    rendered.should match(/Filename/)
  end
end
