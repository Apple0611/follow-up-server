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

  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => PaginateLinkRenderer
    end
    super *[collection_or_options, options].compact
  end

end
