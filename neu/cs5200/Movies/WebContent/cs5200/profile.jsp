<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5200.*,java.io.*"%>
    
    <script src="js/jquery.js"></script>

    <h1>Profile</h1>
    
    Hello
    <%
    	User user = (User)session.getAttribute("currentUser");
    	out.println(user.getUsername());
    %>
    
    <br/>
    
    <input id="movieName" value="star wars"/>
    <button id="searchMovie">Search</button>
    
    <ol id="movieList">
    </ol>
    
    <script>
    	jQuery(init);
    	
    	function init() {
			jQuery("#searchMovie").click(searchMovieClicked);
    	}
    	
    	function searchMovieClicked() {
    		var movieName = jQuery("#movieName").val();
    		
    		var key = "umgs9aw92awmyuw6qvmgqkgv";
    		
    		jQuery.ajax({
    			url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey="+key+"&q="+movieName+"&page_limit=10",
    			dataType: "jsonp",
    			success: handleResponse
    		});
    		// http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=[your_api_key]&q=Jack&page_limit=1
    	}
    	
    	function handleResponse(response) {
    		var movies = response.movies;
    		
    		var list = jQuery("#movieList");
    		list.empty();

			var liStr = '<li id="1234"><img height="100" src="http://content8.flixster.com/movie/10/94/47/10944718_mob.jpg"/><span class="title">Star Wars Episode V</span><button class="likeButton">Like</button></li>';
    		
    		for(var m=0; m<movies.length; m++) {
    			var movie = movies[m];
    			var title = movie.title;
    			var id = movie.id;
    			var thumbnail = movie.posters.thumbnail;
    			console.log([id, title, thumbnail]);
    			
    			var li = jQuery(liStr);
    			
    			li.attr("id", id);
    			li.find("img").attr("src", thumbnail);
    			li.find(".title").html(title);
    			
    			list.append(li);
    		}
    	}
    	
    </script>