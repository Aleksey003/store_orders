# encoding: utf-8
class OrderMail < ActionMailer::Base
  default from: 'Shop <mailshoptest123@gmail.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mail.received.subject
  #
  def received(order)
    @greeting = "Здраствуйте!"
    @order = order
    mail to: @order.email, subject: "Заказ №#{@order.id} от #{@order.order_date.strftime("%d/%m/%Y")}"
  end
end
