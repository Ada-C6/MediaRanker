1. not sure if this will be helfpul.
<% @movies.each do |movie| %>
<h2><%=link_to(movie.name, movies_path(movie[:id])) %></h2>
<% end %>
<!-- <h1>Top Books</h1>
<h1>Top Albums</h1> -->
