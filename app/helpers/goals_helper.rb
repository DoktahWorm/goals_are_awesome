module GoalsHelper

  def show_links_for(thing, path)
    link_to("New", new_goal_path) + " | " +
    link_to("Edit", edit_goal_path(thing)) + " | " +
    link_to("Destroy", thing, :confirm => 'Are you sure?', :method => :delete) + " | " + 
    link_to("View All", path)
  end

  def show_buttons(goal)
    out = "<div id='action_buttons'><ul>"
    out += "<li>#{link_to('New', :action => :new)}</li>"
    unless goal.blank?
      if goal.id
        out += "<li>#{link_to_unless_current('Edit', :action => :edit, :id => goal)}</li>"
        out += "<li>#{link_to('Destroy', goal, :confirm => 'Are you sure?', :method => :delete)}</li>"
      end
    end
    out += "<li>#{link_to_unless_current('View All', :action => :index)}</li>"
    out += "</ul></div><p class='br'/>"
  end

  def action_links(goal)
    out = "#{link_to('New', :action => :new)} | "
    unless goal.blank?
      if goal.id
        out += "#{link_to_unless_current('Edit', :action => :edit, :id => goal)} | "
        out += "#{link_to('Destroy', goal, :confirm => 'Are you sure?', :method => :delete)} | "
      end
    end
    out += "#{link_to_unless_current('View All', :action => :index)}"
  end
  
end
