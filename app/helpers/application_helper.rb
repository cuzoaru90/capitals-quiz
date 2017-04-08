module ApplicationHelper

  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?

    content_tag :div, capture(&block), class: css_class
  end

  def submitted_quiz
    User.find_by(id: session[:user_id]).submitted_quiz
  end
  
end
