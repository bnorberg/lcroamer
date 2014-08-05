module ApplicationHelper

  def location_nav
    output = '<ul class="nav" id="locations">'
    puts "HELPER"
    puts params[:controller]
    Location.find_each do |location|
      if params[:controller] == 'locations'
        item_css_class = (current_page?location_path(location)) ? "nav-item active" : "nav-item"
      elsif params[:controller] == 'rooms'
        current = params[:id] ? Room.find_by_id(params[:id]) : nil
        item_css_class = (current && current.location_id == location.id) ? "nav-item active" : "nav-item"
      elsif params[:controller] == 'tasks'
        current = params[:id] ? Task.find_by_id(params[:id]) : nil
        item_css_class = (current && current.room && current.room.location_id == location.id) ? "nav-item active" : "nav-item"
      end

      output << "<li class=\"#{item_css_class}\">#{ link_to location.name, location_path(location.id) }</li>"
    end
    output += '</ul>'
    output.html_safe
  end

  # <%  %>  
  #             <% if params[:controller] == 'locations' %>
  #               <% if current_page?location_path(location) %>
  #                 <li class="active"><%= link_to location.name, location_path(location.id) %></li>  
  #               <% else %>  
  #                 <li><%= link_to location.name, location_path(location.id) %></li>
  #               <% end %>
              
  #             <% elsif params[:controller] == 'rooms' %>
  #               <% if (params[:id])%>
  #                 <% current = Room.find_by_id(params[:id])%>
  #                   <% if current.location_id == location.id %>
  #                     <li class="active"><%= link_to location.name, location_path(location.id) %></li>  
  #                   <% else %>  
  #                     <li><%= link_to location.name, location_path(location.id) %></li>
  #                   <% end %>
  #               <% else %>
  #                 <li><%= link_to location.name, location_path(location.id) %></li>
  #               <% end %> 
              
  #             <% elsif params[:controller] == 'tasks' %>
  #               <% if (params[:id]) %>
  #                 <% current = Task.find_by_id(params[:id])%>
  #                   <% c = Room.find_by_id(current.room_id)%>
  #                   <% if c.location_id == location.id %>
  #                     <li class="active"><%= link_to location.name, location_path(location.id) %></li>  
  #                   <% else %>  
  #                     <li><%= link_to location.name, location_path(location.id) %></li>
  #                   <% end %>
  #               <% else %>
  #                 <li><%= link_to location.name, location_path(location.id) %></li>
  #               <% end %> 
              
  #             <% else %>
  #               <li><%= link_to location.name, location_path(location.id) %></li> 
  #             <% end %>


end
