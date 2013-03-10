require 'spec_helper'

describe "products/edit.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :title => "MyString",
      :description => "MyText",
      :product_state => "",
      :product_category => ""
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_title", :name => "product[title]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_product_state", :name => "product[product_state]"
      assert_select "input#product_product_category", :name => "product[product_category]"
    end
  end
end
