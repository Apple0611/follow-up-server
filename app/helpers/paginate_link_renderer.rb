class PaginateLinkRenderer < WillPaginate::ActionView::LinkRenderer

  def page_number(page)
    unless page == current_page
      link(page, page, {rel: rel_value(page), class: 'item'} )
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

end