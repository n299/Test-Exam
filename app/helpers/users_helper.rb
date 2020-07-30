# frozen_string_literal: true

module UsersHelper
  def regex_name_validate
    Settings.regex_name_vn
  end

  def users_size
    User.all.size
  end
end
