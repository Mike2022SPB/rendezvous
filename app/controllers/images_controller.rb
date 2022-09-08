class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :set_image, only: %i[destroy]

  def create
    @new_image = @event.images.build(image_params)
    @new_image.user = current_user

    if @new_image.save
      redirect_to @event, notice: t('controllers.created')
    else
      render 'events/show', alert: t('controllers.error')
    end
  end

  def destroy
    message = {notice: t('controllers.destroyed')}

    if current_user_can_edit?(@image)
      @image.destroy!
    else
      message = {alert: t('controllers.error')}
    end

    redirect_to @event, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_image
    @image = @event.images.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image)
  end

  def notify_images(event, image)
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq

    all_emails.each do |mail|
      EventMailer.image(event, image, mail).deliver_now
    end
  end
end
