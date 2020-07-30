# frozen_string_literal: true

module UsersHelper
  def default_avatar_user(user)
    if user.avatar.blank?
      Settings.user_default_img
    else
      url_for(user.avatar)
    end
  end

  def regex_name_validate
    Settings.regex_name_vn
  end

  def users_size
    User.all.size
  end
end
