require 'spec_helper'

describe "product_states/index.html.erb" do
  before(:each) do
    assign(:product_states, [
      stub_model(ProductState,
        :name => "Name"
      ),
      stub_model(ProductState,
        :name => "Name"
      )
    ])
  end

  it "renders a list of product_states" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
