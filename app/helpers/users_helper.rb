module UsersHelper
  def show_non_blank_field(label, value)
    "<p>#{label}: #{h value}</p>" if !value.blank?
  end
end
