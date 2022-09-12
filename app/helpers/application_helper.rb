module ApplicationHelper
  def admin?
    if current_user.present?
      current_user.admin?
    end
  end

  def user_name
    if current_user.present?
      current_user.first_name
    else
      'Changemaker'
    end
  end
end
