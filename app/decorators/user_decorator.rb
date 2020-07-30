# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    if first_name.blank? && last_name.blank?
      'No name is provided'
    else
      "#{first_name} #{last_name}"
    end
  end

  def default_avatar_user
    if avatar.blank?
      Settings.user_default_img
    else
      avatar
    end
  end
end
