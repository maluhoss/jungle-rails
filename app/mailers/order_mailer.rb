class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirmation_email(order)
    @order = order
    mail(to: @order.email, subject: "Thank you for ordering from Jungle! Order ##{@order.id}")
  end
end
