using System;
using System.IO;
using System.Web;
using System.Net;

namespace edu.neu.ccis.rasala
{
    public class SimpleProxy : IHttpHandler
    {

        /*
         * Returns the HttpWebResponse from executing a
         * WebRequest using the given url.
         * 
         * May return null if a serious error occurs.
         * 
         * May return a response with a status code that
         * is other than 200 for OK.
         * 
         * 
         * This static method may be used standalone if
         * you wish to process a web response in C# code
         * on the server.
         */
        public static HttpWebResponse GetResponse(string url)
        {
            HttpWebResponse response = null;

            if (StringTools.IsTrivial(url))
                return response;

            try
            {
                Uri uri = new Uri(url);

                HttpWebRequest request =
                    WebRequest.Create(uri) as HttpWebRequest;

                request.Date = DateTime.Now;

                response =
                    request.GetResponse() as HttpWebResponse;
            }
            catch
            {

            }

            return response;
        }


        /*
         * Returns the content from executing a WebRequest
         * using the given url.
         * 
         * May return an empty string if a serious error
         * occurs or if there happens to be no content.
         * 
         * 
         * This static method may be used standalone if
         * you wish to process a web response in C# code
         * on the server.
         */
        public static string GetResponseContent(string url)
        {
            HttpWebResponse response = GetResponse(url);

            if (response == null)
                return "";

            try
            {
                using (Stream stream = response.GetResponseStream())
                {
                    using (StreamReader reader = new StreamReader(stream))
                    {
                        string content = reader.ReadToEnd();

                        return content ?? "";
                    }
                }
            }
            catch
            {
                return "";
            }

        }


        /*
         * Returns an embedded parameter with introduction string
         * param if one exists within the query string of the
         * given url.
         * 
         * The conventions of
         * 
         *     StringTools.FindParameter
         * 
         * should be followed.
         */
        public static string GetEmbeddedParameter
            (string url, string param, bool unescape)
        {
            if (StringTools.IsTrivial(url) || StringTools.IsTrivial(param))
                return "";
            
            int qmark = url.IndexOf('?');

            if (qmark < 0)
                return "";

            string query = url.Substring(qmark + 1);

            if (query.Length == 0)
                return "";

            return StringTools.FindParameter(query, param, unescape);
        }


        /*
         * Returns true if the url has a query string that
         * begins with precisely the string "pre".
         */
        public static bool usePreTag(string url)
        {
            if (StringTools.IsTrivial(url))
                return false;

            int qmark = url.IndexOf('?');

            if (qmark < 0)
                return false;

            string query = url.Substring(qmark + 1);

            if (query.Length < 3)
                return false;

            query = query.Substring(0, 3);

            return (query == "pre");
        }


        /*
         * Returns true if the url has a query string that
         * begins with precisely the string "xml".
         */
        public static bool useXml(string url)
        {
            if (StringTools.IsTrivial(url))
                return false;

            int qmark = url.IndexOf('?');

            if (qmark < 0)
                return false;

            string query = url.Substring(qmark + 1);

            if (query.Length < 3)
                return false;

            query = query.Substring(0, 3);

            return (query == "xml");
        }


        /*
         * Provide error content to the HttpContext Response object.
         * 
         * The embeddedUrl is the url that was being processed.
         * 
         * The message is any additional information  to provide.
         */
        void ProcessRequestError
            (HttpContext context, string embeddedUrl, string message)
        {
            context.Response.Write("<!DOCTYPE html>\n");
            context.Response.Write("<html>\n");
            context.Response.Write("<head><title>SimpleProxy</title></head>\n");
            context.Response.Write("<body><h1>SimpleProxy Error</h1>\n");

            if (StringTools.IsTrivial(embeddedUrl))
            {
                context.Response.Write("<h2>Needs an embedded Url in the query string</h2>\n");

                context.Response.Write("<pre style='color: blue; font-size: 150%; margin-left: 5%'><b>");
                context.Response.Write("?url=\"...\"");
                context.Response.Write("</b></pre>\n");

                context.Response.Write("<h2>where ... is the url embedded between the delimiters.</h2>");
                context.Response.Write("<h2>The delimiters may be single quote, double quote, or vertical bar.</h2>");

                context.Response.Write("<h2>Documentation is <a href=");
                context.Response.Write("'http://net4.ccs.neu.edu/home/rasala/simpleproxy/'");
                context.Response.Write(" target='_blank' style='text-decoration: none'>here</a>.</h2>\n");
            }
            else
            {
                context.Response.Write("<h2>Embedded Url:</h2>\n");

                embeddedUrl = StringTools.HtmlEncode(embeddedUrl);

                context.Response.Write("<pre style='color: blue; font-size: 150%; margin-left: 5%'><b>");
                context.Response.Write(embeddedUrl);
                context.Response.Write("</b></pre>\n");
            }

            if (!StringTools.IsTrivial(message))
            {
                context.Response.Write("<div>");
                context.Response.Write(message);
                context.Response.Write("</div>\n");
            }

            context.Response.Write("</body>\n");
            context.Response.Write("</html>\n");
        }


        /*
         * The main method of this IHttpHandler.
         */
        public void ProcessRequest(HttpContext context)
        {
            string url = context.Request.Url.OriginalString;

            string embeddedUrl = GetEmbeddedParameter(url, "url=", true);

            HttpWebResponse response = null;

            if (!StringTools.IsTrivial(embeddedUrl))
                response = GetResponse(embeddedUrl);

            if (response == null)
            {
                ProcessRequestError(context, embeddedUrl, "");
                return;
            }


            int status = (int)response.StatusCode;
            context.Response.StatusCode = status;

            if ((status < 200) || (status > 299))
            {
                ProcessRequestError(context, embeddedUrl, "Status = " + status);
            }
           

            string host = response.Headers.Get("Host");

            if (StringTools.IsTrivial(host))
            {
                try
                {
                    Uri uri = new Uri(embeddedUrl);
                    host = uri.Host;
                }
                catch { }
            }

            if (!StringTools.IsTrivial(host))
                context.Response.AppendHeader("Host", host);


            try
            {
                using (Stream stream = response.GetResponseStream())
                {
                    using (StreamReader reader = new StreamReader(stream))
                    {
                        string content = reader.ReadToEnd();

                        if (!StringTools.IsTrivial(content))
                        {
                            if (usePreTag(url))
                            {
                                context.Response.ContentType = "text/html";
                                content = HTML_Tools.FeedbackData(content);
                            }
                            else
                            if (useXml(url))
                            {
                                context.Response.ContentType = "text/xml";

                            }
                            else
                            {
                                context.Response.ContentType = "text/plain";
                            }

                            context.Response.Write(content);
                        }
                        else
                        {
                            context.Response.ContentType = "text/plain";
                            context.Response.Write("");
                        }
                    }
                }
            }
            catch
            {
                ProcessRequestError(context, embeddedUrl, "Error in reading Url content");
            }
        }


        /*
         * The required IsReusable property.
         * 
         * Here returns false to avoid reuse.
         */
        public bool IsReusable { get { return false; } }

    }
}