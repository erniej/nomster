# generic form code resides in application.html.erb lines 48 - 56
<%= form_tag(recipes_path, :method => "get", id: "search-form") do %>
    <%= text_field_tag :search, params[:search], placeholder: "Search Recipes" %>
    <%= submit_tag "Search", :name => nil %>
<% end %>









# generic no matches alert
<% if @recipes.blank? %>
  <h4>There are no recipes containing the term <%= params[:search] %>.</h4>
<% end %>
