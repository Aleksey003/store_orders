require 'spec_helper'

describe "product_categories/index.html.erb" do
  before(:each) do
    assign(:product_categories, [
      stub_model(ProductCategory,
        :name => "Name"
      ),
      stub_model(ProductCategory,
        :name => "Name"
      )
    ])
  end

  it "renders a list of product_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
