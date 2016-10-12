1. not sure if this will be helfpul.
<% @movies.each do |movie| %>
<h2><%=link_to(movie.name
HOW IS THE MEDIA RANKER EXAMPLE FLOATING ALL COLUMNS PROPERLY??

   movies_path(movie[:id])) %></h2>
<% end %>
<!-- <h1>Top Books</h1>
<h1>Top Albums</h1> -->
<div class="row">
<div class="col-md-4">
<h1>Top Movies</h1>
<h2> <a href="/movies/132">Cats are better</a> <small>Ranked: 137 </small></h2>
<h2> <a href="/movies/134">The Color Yellow</a> <small>Ranked: 101 </small></h2>
<h2> <a href="/movies/98">The Blues Brothers</a> <small>Ranked: 67 </small></h2>
<h2> <a href="/movies/154">Ur Mom 2</a> <small>Ranked: 58 </small></h2>
<h2> <a href="/movies/150">Jay &amp; Silent Bob Strike Back</a> <small>Ranked: 51 </small></h2>
<h2> <a href="/movies/131">Entity Relationships and You</a> <small>Ranked: 47 </small></h2>
<h2> <a href="/movies/136">Muppet Movies</a> <small>Ranked: 42 </small></h2>
<h2> <a href="/movies/108">Boogie Nights</a> <small>Ranked: 38 </small></h2>
<h2> <a href="/movies/118">freakin awesome!</a> <small>Ranked: 29 </small></h2>
<h2> <a href="/movies/87">Eternal Sunshine</a> <small>Ranked: 22 </small></h2>
<a href="/movies">View More Movies</a>
</div>
<div class="col-md-4">
<h1>Top Books</h1>
<h2> <a href="/books/58">Cien años de soledad</a> <small>Ranked: 25 </small></h2>
<h2> <a href="/books/54">Why Ada Rocks!</a> <small>Ranked: 20 </small></h2>
<h2> <a href="/books/55">Lord of the Rings</a> <small>Ranked: 13 </small></h2>
<h2> <a href="/books/44">where do i go</a> <small>Ranked: 10 </small></h2>
<h2> <a href="/books/38">How To Make Websites</a> <small>Ranked: 10 </small></h2>
<h2> <a href="/books/59">hello2</a> <small>Ranked: 4 </small></h2>
<h2> <a href="/books/53">Bebe</a> <small>Ranked: 3 </small></h2>
<h2> <a href="/books/43">just name</a> <small>Ranked: 2 </small></h2>
<h2> <a href="/books/56">Austin, Asten, Austine, who?</a> <small>Ranked: 2 </small></h2>
<h2> <a href="/books/51">new book</a> <small>Ranked: 1 </small></h2>
<a href="/books">View More Books</a>
</div>
<div class="col-md-4">
<h1>Top Albums</h1>
<h2> <a href="/albums/32">The White Album</a> <small>Ranked: 28 </small></h2>
<h2> <a href="/albums/47">Anything from the Beatles...duh!</a> <small>Ranked: 22 </small></h2>
<h2> <a href="/albums/45">The Sound of Ruby</a> <small>Ranked: 17 </small></h2>
<h2> <a href="/albums/21">Awakee</a> <small>Ranked: 17 </small></h2>
<h2> <a href="/albums/22">Fate&#39;s Brother: Greatest Hits</a> <small>Ranked: 11 </small></h2>
<h2> <a href="/albums/37">Merry Christmas, Happy Holidays</a> <small>Ranked: 10 </small></h2>
<h2> <a href="/albums/29">Sorry I&#39;m Late</a> <small>Ranked: 4 </small></h2>
<h2> <a href="/albums/46">newsies</a> <small>Ranked: 2 </small></h2>
<h2> <a href="/albums/48">The 12 days of Christmas</a> <small>Ranked: 0 </small></h2>
<a href="/albums">View More Albums</a>
</div>
</div>
