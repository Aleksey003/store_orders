require 'spec_helper'

describe "product_states/show.html.erb" do
  before(:each) do
    @product_state = assign(:product_state, stub_model(ProductState,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
