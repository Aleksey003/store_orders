require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :date => "",
        :user => "",
        :comments => "",
        :email => "Email"
      ),
      stub_model(Order,
        :date => "",
        :user => "",
        :comments => "",
        :email => "Email"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
