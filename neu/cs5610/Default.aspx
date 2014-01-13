<!DOCTYPE html>
<html>
<head>
    <title>CS5610 Web Development</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        div.main.container {
            margin-top : 55px;
        }
    </style>
</head>
<body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">CS5610</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Links <span class="caret"></span></a>
                        <ul class="dropdown-menu" aria-labelledby="themes">
                            <li><a tabindex="-1" href="sitestatistics/" target="_blank">SiteStatistics</a></li>
                            <li><a tabindex="-1" href="statistics/" target="_blank">Statistics</a></li>
                            <li><a tabindex="-1" href="source/" target="_blank">Source</a></li>
                            <li><a tabindex="-1" href="search/" target="_blank">Search</a></li>
                            <li><a tabindex="-1" href="searchtree/" target="_blank">SearchTree</a></li>
                            <li><a tabindex="-1" href="textview/" target="_blank">TextView</a></li>
                            <li><a tabindex="-1" href="filelist.aspx" target="_blank">FileList</a></li>
                            <li><a tabindex="-1" href="autofile.aspx" target="_blank">AutoFile</a></li>
                            <li><a tabindex="-1" href="images/autoimage.aspx" target="_blank">Images</a></li>
                            <li><a tabindex="-1" href="blog/" target="_blank">Blog</a></li>
                            <li><a tabindex="-1" href="http://net4.ccs.neu.edu/home/rasala/utility/TextToHTMLLite.aspx" target="_blank">HTML encoder utility</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div><!-- container -->
    </div>

    <div class="main container"><!-- main container -->

        <div class="row">
            <div class="col-lg-6">
                <h2>Essential Files</h2>
                <p>
                    <b>
                        This demo page shows the navigation links that should appear
                        on the home page.
                    </b>
                    It is not necessary that these links be at the top of the page
                    but they should be displayed nicely and be easy to find.  You
                    may alter the CSS on the page to change the placement and the
                    size of the links.
                </p>

                <hr />

                <p>
                    The home page may show some interesting content but its main
                    purpose should be to <i>provide navigation</i> to other pages
                    on your site.
                </p>

                <hr />

                <p>
                    It would be helpful if your home page shows your name and a
                    photo of yourself.  This will help us to get to know you.
                </p>

                <hr />

                <p>
                    Here is a link to the
                    <a href="story/index.htm" target="_blank">Story Utility</a>
                    on this site so that you may explore this tool.
                </p>

                <p>
                    Here is a link to the
                    <a href="http://www.northeastern.edu/rasala/webstories.htm"
                       target="_blank">Web Development Stories</a>
                    so that you may see a good collection of online documentation.
                </p>

                <p>
                    This provides a model for using stories for documentation and
                    for collections of experiments.
                </p>

                <hr />

                <p>
                    None of the hints given above needs to be on your home page
                    downstream but it is convenient to have them here at startup.
                </p>
            </div><!-- col -->
            <div class="col-lg-6">
                <h2>Examples</h2>
                <ul>
                    <li><a href="story/index.htm?../experiments/appstore/story.txt" target="_blank">App Store</a></li>
                    <li><a href="story/index.htm?../experiments/responsive/story.txt" target="_blank">Responsive Design</a></li>
                    <li><a href="story/index.htm?../experiments/asp/helloWorld/story.txt" target="_blank">ASP Hello World Web Pages</a></li>
                    <li><a href="story/index.htm?../experiments/asp/requestParameters/story.txt" target="_blank">ASP Parse Request Parameters</a></li>
                    <li><a href="story/index.htm?../experiments/asp/filesAndDirectories/story.txt" target="_blank">ASP Files and Directories</a></li>
                    <li><a href="jquery/events/clicking.html" target="_blank">Clicking</a></li>
                    <li><a href="jquery/draggable/index.html" target="_blank">Draggable</a></li>
                    <li><a href="jquery/sortable/index.html" target="_blank">Sortable Lists</a></li>
                    <li><a href="jquery/sortable/1-axis.html" target="_blank">Sortable on an Axis</a></li>
                    <li><a href="story/index.htm?../jquery/story.txt" target="_blank">jQuery</a></li>
                    <li><a href="story/index.htm?../experiments/animation/story.txt" target="_blank">Animation</a></li>
                    <li><a href="story/index.htm?../experiments/pageEditor/story.txt" target="_blank">Page Editor</a></li>
                    <li><a href="story/index.htm?../experiments/grids/story.txt" target="_blank">Fluid Grid Systems</a></li>
                    <li><a href="story/index.htm?../experiments/movies/story.txt" target="_blank">Movies Restful APIs</a></li>
                    <li><a href="story/index.htm?../json/story.txt" target="_blank">JSON Web Services</a></li>
                    <li><a href="story/index.htm?../experiments/webservices/weather/story.txt" target="_blank">Weather Restful JSONP APIs</a></li>
                    <li><a href="story/index.htm?../experiments/phonegap/story.txt" target="_blank">Phonegap and jQuery</a></li>
                    <li><a href="http://net4.ccs.neu.edu/home/jga/experiments/phonegap/fish360/" target="_blank">Fish 360</a></li>
                    <li><a href="https://github.com/jannunzi/UserLoginPrefs.git" target="_blank">User Login &amp; Preferences</a></li>
                    <li><a href="story/index.htm?../experiments/dao/story.txt" target="_blank">Data Access Object</a></li>
                </ul>
            </div><!-- col -->
        </div><!-- row -->
    </div><!-- main container -->

    <script src="javascript/jquery-2.0.3.min.js"></script>
    <script src="javascript/bootstrap.js"></script>

</body>
</html>