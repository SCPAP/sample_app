require 'spec_helper'

describe "entities/new" do
  before(:each) do
    assign(:entity, stub_model(Entity,
      :image => "",
      :latitude => "MyString",
      :longitude => "MyString",
      :mine_type => "MyString",
      :filename => "MyString"
    ).as_new_record)
  end

  it "renders new entity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entities_path, "post" do
      assert_select "input#entity_image[name=?]", "entity[image]"
      assert_select "input#entity_latitude[name=?]", "entity[latitude]"
      assert_select "input#entity_longitude[name=?]", "entity[longitude]"
      assert_select "input#entity_mine_type[name=?]", "entity[mine_type]"
      assert_select "input#entity_filename[name=?]", "entity[filename]"
    end
  end
end
