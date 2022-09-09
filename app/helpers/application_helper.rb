module ApplicationHelper
  def admin?
    current_user.admin?
  end

  def user_name
    if current_user.present?
      current_user.first_name
    else
      'Changemaker'
    end
  end
end
