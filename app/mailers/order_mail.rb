class OrderMail < ActionMailer::Base
  default from: 'Order Store <alekseylks@gmail.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mail.received.subject
  #
  def received(order)
    @greeting = "Hi"
    @order = order
    mail to: @order.email, subject: "Order #{@order.id} from #{@order.order_date}"
  end
end
