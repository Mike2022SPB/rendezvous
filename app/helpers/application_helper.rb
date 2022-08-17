module ApplicationHelper

  def user_avatar(user)
    asset_path('user.png')
  end

  def event_image(event)
    asset_path('event_thumb.png')
  end
end
