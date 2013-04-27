require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :date => "",
      :user => "",
      :comments => "",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "input#order_date[name=?]", "order[date]"
      assert_select "input#order_user[name=?]", "order[user]"
      assert_select "input#order_comments[name=?]", "order[comments]"
      assert_select "input#order_email[name=?]", "order[email]"
    end
  end
end
