require 'spec_helper'

describe "product_states/new.html.erb" do
  before(:each) do
    assign(:product_state, stub_model(ProductState,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new product_state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_states_path, :method => "post" do
      assert_select "input#product_state_name", :name => "product_state[name]"
    end
  end
end
