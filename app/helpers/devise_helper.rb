## Helper to create semantic-ui warning message
## Override devise_error_messages! for views. http://git.io/vCL93
## Author: Mingdong Luo (https://github.com/mdluo)
## Date: Oct 09, 2015

module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    sentence = I18n.t 'errors.messages.error'
    message = resource.errors.messages.first[1][0]
    # message = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="ui warning message">
      <i class="close icon"></i>
      #{sentence}: #{message}
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end
