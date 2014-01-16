<!DOCTYPE html>
<html>
<head>
    <title>CS5610 Web Development</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            padding-top : 55px;
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
                            <li><a tabindex="-1" href="story/index.htm" target="_blank">Story Utility</a></li>
                            <li><a tabindex="-1" href="http://www.northeastern.edu/rasala/webstories.htm" target="_blank">Web Development Stories</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div><!-- container -->
    </div>

    <div class="main container"><!-- main container -->

        <div class="row">
            <div class="col-sm-8">
                <h2>Welcome</h2>
                
                <img src="images/gaitas.jpg" style="float:left; margin-right:20px; max-width:30%"/>
            <p>
                Hi everyone, welcome to CS 5610 Web Development.
                My name is Jose Annunziato and together we will be learning lots of cool Web technologies.
                We will be looking behind the scenes of all those cool Web sites.
                We'll learn about generating dynamic Web content, responsive design, HTML 5, jQuery,
                and lots of the hottest Web technologies relevant in the current job market.
                We will disect Web applications that use advanced techniques while applying industry
                best practices and software engineering principles.
            </p>
            <p>
                While the course is full of exciting topics, the success of the course is entirely in your hands.
                Throughout the course you need to proactively participate in your own success.
                We will help you through the technical details and general direction and guidelines,
                but it is your constant dedication to the course that will really make it a success.
                The course has lots of useful examples, references and plenty of instructors and assistants to help you be successful.
                Please make use of all these resources to demonstrate your constant progress towards a successful semester.
            </p>
            <p>
                A little about my self. I am currently working as a principle software engineer at <a href="http://americantower.com" target="_blank">American Tower</a>.
                They own some 40,000+ telecommunication towers world wide and lease space on these towers to broadcasters,
                cell phone providers, and the government, among others. I'm currently building a Web based GIS application
                to help clients locate and plan tower locations across the US. It's a very exciting project using lots
                of mapping Web services, back end databases, and rich, dynamic interfaces. Before that I worked for
                <a href="http://percussion.com/" target="_blank">Percussion Software</a> for a couple of years developing
                <a href="http://percussion.com/products/cm1/video-demo/index" target="_blank">CM1</a>, their flagship Web based Content Management
                System (CMS). Also a very dynamic Web application with lots of sophisticated user interfaces.
                For the last 15 years I've had the luck of working on a diverse number of projects in a variety of industries
                including financial, medical, defense, education, manufacturing, retail, and telecommunication.
            </p>
            </div><!-- col -->
            <div class="col-sm-4">
                <h2>Experiments</h2>
                <h3>Responsive Design</h3>
                <ul>
                    <li><a href="story/index.htm?../experiments/bootstrap/story.txt" target="_blank">Bootstrap</a></li>
                    <li><a href="story/index.htm?../experiments/grids/story.txt" target="_blank">Fluid Grid Systems</a></li>
                    <li><a href="story/index.htm?../experiments/responsive/story.txt" target="_blank">Responsive Design</a></li>
                </ul>
                <h3>jQuery</h3>
                <ul>
                    <li><a href="story/index.htm?../jquery/story.txt" target="_blank">jQuery Story</a></li>
                    <li><a href="jquery/events/clicking.html" target="_blank">Event Handling</a></li>
                    <li><a href="jquery/draggable/index.html" target="_blank">Draggable</a></li>
                    <li><a href="jquery/sortable/index.html" target="_blank">Sortable Lists</a></li>
                    <li><a href="jquery/sortable/1-axis.html" target="_blank">Sortable on an Axis</a></li>
                    <li><a href="story/index.htm?../experiments/animation/story.txt" target="_blank">Animation</a></li>
                </ul>
                <h3>Web Services</h3>
                <ul>
                    <li><a href="story/index.htm?../experiments/movies/story.txt" target="_blank">Movies Restful APIs</a></li>
                    <li><a href="story/index.htm?../json/story.txt" target="_blank">JSON Web Services</a></li>
                    <li><a href="story/index.htm?../experiments/webservices/weather/story.txt" target="_blank">Weather Restful JSONP APIs</a></li>
                </ul>
                <h3>ASPX.NET</h3>
                <ul>
                    <li><a href="story/index.htm?../experiments/asp/helloWorld/story.txt" target="_blank">ASP Hello World Web Pages</a></li>
                    <li><a href="story/index.htm?../experiments/asp/filesAndDirectories/story.txt" target="_blank">ASP Files and Directories</a></li>
                    <li><a href="story/index.htm?../experiments/asp/requestParameters/story.txt" target="_blank">ASP Parse Request Parameters</a></li>
                </ul>
                <h3>Mobile Web Applications</h3>
                <ul>
                    <li><a href="story/index.htm?../experiments/phonegap/story.txt" target="_blank">Phonegap and jQuery</a></li>
                    <li><a href="http://net4.ccs.neu.edu/home/jga/experiments/phonegap/fish360/" target="_blank">Fish 360</a></li>
                </ul>
                <h3>Project</h3>
                <ul>
                    <li><a href="story/index.htm?../experiments/pageEditor/story.txt" target="_blank">Page Editor</a></li>
                    <li><a href="story/index.htm?../experiments/appstore/story.txt" target="_blank">App Store</a></li>
                </ul>
                <!--
                <h3>Databases</h3>
                <ul>
                    <li><a href="https://github.com/jannunzi/UserLoginPrefs.git" target="_blank">User Login &amp; Preferences</a></li>
                    <li><a href="story/index.htm?../experiments/dao/story.txt" target="_blank">Data Access Object</a></li>
                </ul>-->
            </div><!-- col -->
        </div><!-- row -->
    </div><!-- main container -->

    <script src="javascript/jquery-2.0.3.min.js"></script>
    <script src="javascript/bootstrap.js"></script>

</body>
</html>