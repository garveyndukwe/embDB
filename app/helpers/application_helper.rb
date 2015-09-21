module ApplicationHelper
  # Returns the full title on a per-page basis.

  def full_title(page_title)
    base_title = "EmmDB WebApp"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def Messageflash (sym_type, msg)
    sym_type=':' << sym_type
    sym_type.to_sym
    flash[sym_type]= msg
  end
# Creates a submit button with the given name with a cancel link
# Accepts two arguments: Form object and the cancel link name
  def submit_or_cancel(form, name='Cancel')
    form.submit + " or " +
        link_to(name, 'javascript:history.go(-1);', :class => 'cancel')
  end

  def concatenate(int_src, int_dest)
     return_str=""
     if (int_src.nil?)
       return_str.strip!
     else
       return_str << number_to_human(int_src) << '-'
     end
     if  (int_dest.nil?)
       return_str.strip!
     else
       return_str  << number_to_human(int_dest)
     end
  end

  def increment(int)
    if int.nil?
      int= 1
    else
      int= int +1
    end
  end
end
