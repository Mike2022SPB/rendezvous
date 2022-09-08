class EventMailer < ApplicationMailer
  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail to: @event.user.email, subject: default_i18n_subject(event: @event.title)
  end

  def comment(comment, email)
    @comment = comment
    @event = comment.event

    mail to: email, subject: default_i18n_subject(event: @event.title)
  end

  def image(image, email)
    @image = image
    @event = image.event

    mail to: email, subject: default_i18n_subject(event: @event.title)
  end
end
