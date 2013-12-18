require 'spec_helper'

describe "entities/index" do
  before(:each) do
    assign(:entities, [
      stub_model(Entity,
        :image => "",
        :latitude => "Latitude",
        :longitude => "Longitude",
        :mine_type => "Mine Type",
        :filename => "Filename"
      ),
      stub_model(Entity,
        :image => "",
        :latitude => "Latitude",
        :longitude => "Longitude",
        :mine_type => "Mine Type",
        :filename => "Filename"
      )
    ])
  end

  it "renders a list of entities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
    assert_select "tr>td", :text => "Mine Type".to_s, :count => 2
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
  end
end
