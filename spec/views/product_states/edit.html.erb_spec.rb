require 'spec_helper'

describe "product_states/edit.html.erb" do
  before(:each) do
    @product_state = assign(:product_state, stub_model(ProductState,
      :name => "MyString"
    ))
  end

  it "renders the edit product_state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_states_path(@product_state), :method => "post" do
      assert_select "input#product_state_name", :name => "product_state[name]"
    end
  end
end
