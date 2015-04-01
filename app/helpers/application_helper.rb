module ApplicationHelper

  def output_with_nil_handler(object, default)
    if object.nil?
      default
    else
      object
    end
  end
  
end
