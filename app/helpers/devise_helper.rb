module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    sentence = I18n.t 'errors.messages.error'
    message = resource.errors.messages.first[1][0]

    html = <<-HTML
    <div class="ui warning message">
      #{sentence}: #{message}
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end
