<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    // @new
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            var url = Request.Params["url"];
            if (url != null && url != "")
            {
                SqlDataSource1.Insert();
            }
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Experiment</title>
    <link rel="stylesheet" type="text/css" href="~/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="~/css/wam.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Rotten Tomatoes Movie REST API</h1>

        <div class="row">
            <div class="col-sm-12">
                <div class="input-group">
                  <input type="text" class="form-control wam-movie-title" placeholder="Search Movie" value="Star Trek"/>
                  <span class="input-group-btn">
                    <button class="btn btn-default wam-go" type="button">Go</button>
                  </span>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <h2>Search Results</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Date</th>
                            <th>Audience</th>
                            <th>Critics</th>
                            <th>Poster</th>
                        </tr>
                    </thead>
                    <tbody class="wam-results">

                    </tbody>
                </table>

            </div>
            <div class="col-sm-6">
                <h2>Images</h2>
                <p>
                    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:ImageField DataImageUrlField="url">
                            </asp:ImageField>
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:wamConnectionString1 %>" DeleteCommand="DELETE FROM [Image] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Image] ([url]) VALUES (@url)" ProviderName="<%$ ConnectionStrings:wamConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [url] FROM [Image]" UpdateCommand="UPDATE [Image] SET [url] = @url WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:FormParameter Name="url" FormField="url" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="url" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>

            </div>
        </div>
    </div>
    </form>
    <script src="../../../javascript/jquery-min.js"></script>
    <script src="../../../javascript/jquery-ui.min.js"></script>
    <script src="../../../javascript/wam.js"></script>
    <script src="../../../javascript/cs5610.js"></script>
    <script>
        $(function () {
            $(".wam-go").click(searchForMovies);
        });

        function searchForMovies() {
            var movieTitle = $(".wam-movie-title").val();
            if (movieTitle === "" || movieTitle === null || typeof movieTitle === "undefined")
                return;
            cs5610.rottenTomatoes.searchMovieTitle(movieTitle, renderResults);
        }

        function renderResults(response) {
            console.log(response);
            var movies = response.movies;
            var table = $(".wam-results");
            table.empty();
            for (var i in movies) {

                var movie = movies[i];

                var title = movie.title;
                var id = movie.id;
                var year = movie.year;
                var thumb = movie.posters.thumbnail;
                var audience = movie.ratings.audience_score;
                var critics = movie.ratings.critics_score;

                var tr = $("<tr>");

                var titleLink = $("<button name='url'>");
                titleLink.attr("value", thumb);
                titleLink.append(title);

                var td = $("<td>");
                td.append(titleLink);
                tr.append(td);

                td = $("<td>");
                td.append(year);
                tr.append(td);

                td = $("<td>");
                td.append(audience);
                tr.append(td);

                td = $("<td>");
                td.append(critics);
                tr.append(td);

                var img = $("<img>");
                img.attr("src", thumb);
                img.height(91);
                td = $("<td>");
                td.append(img);
                tr.append(td);

                table.append(tr);
            }
        }

    </script>
</body>
</html>
