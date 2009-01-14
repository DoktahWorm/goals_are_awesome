module GoalsHelper
  def show_links_for(thing, path)
    link_to("Edit", edit_goal_path(thing)) + " | " +
    link_to("Destroy", thing, :confirm => 'Are you sure?', :method => :delete) + " | " + 
    link_to("View All", path)
  end
end
