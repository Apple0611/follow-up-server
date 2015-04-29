module ApplicationHelper

  def output_with_nil_handler(object, default)
    if object.nil?
      default
    else
      object
    end
  end

  def render_page_title
    site_name = Setting.app_name
    title = @page_title ? "#{@page_title} | #{site_name}" : site_name rescue "SITE_NAME"
  end

end
