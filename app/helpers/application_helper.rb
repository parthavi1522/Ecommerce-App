module ApplicationHelper
  def active_class(path)
    "active" if request.path.start_with?(path)
  end
end
