# frozen_string_literal: true

module HomeHelper
  def check_flash(key)
    key == 'notice' ? 'success ' : 'warning'
  end
end
