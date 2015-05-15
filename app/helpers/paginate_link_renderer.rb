class PaginateLinkRenderer < WillPaginate::ActionView::LinkRenderer

  def page_number(page)
    unless page == current_page
      link(page, page, {rel: rel_value(page), class: 'item'})
    else
      tag(:div, page, class: 'item active')
    end
  end

  def previous_page
    num = @collection.current_page > 1 && @collection.current_page - 1
    html = '<i class="chevron left icon"></i>'
    if num
      link(html, num, class: 'item')
    else
      tag(:div, html, class: 'item')
    end
  end

  def next_page
    num = @collection.current_page < total_pages && @collection.current_page + 1
    html = '<i class="chevron right icon"></i>'
    if num
      link(html, num, class: 'item')
    else
      tag(:div, html, class: 'item')
    end
  end

  def link(text, target, attributes = {})
    if target.is_a? Fixnum
      attributes[:rel] = rel_value(target)
      target = url(target)
    end
    if @options[:fragment]
      target += '#/' + @options[:fragment]
    end
    attributes[:href] = target
    tag(:a, text, attributes)
  end

  def add_current_page_param(url_params, page)
    unless param_name.index(/[^\w-]/)
      url_params[param_name.to_sym] = page
    else
      page_param = parse_query_parameters("#{param_name}/#{page}")
      symbolized_update(url_params, page_param)
    end
  end

end