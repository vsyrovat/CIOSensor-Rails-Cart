module ApplicationHelper
  def text_or_link_to(name, url)
    if current_page? url
      name
    else
      link_to name, url
    end
  end
end
