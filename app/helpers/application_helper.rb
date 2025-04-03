module ApplicationHelper
  def active_class(path)
    "active" if request.path.start_with?(path)
  end

  def body_class
    if current_user.nil?
      "guest-page"
    end
  end
end
