using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;

namespace edu.neu.ccis.rasala
{

    public class Http
    {

        /// <summary>
        /// Returns a string array with the two standard HTTP
        /// schemes: "http" and "https".
        /// </summary>
        public static string[] GetHttpSchemes()
        {
            return new string[] { "http", "https" };
        }


        /// <summary>
        /// Returns a string array with all Http headers both
        /// for request and response.
        /// 
        /// Valid on 2011-04-12.
        /// </summary>
        public static string[] GetHttpHeaders()
        {
            return new string[]
                {
                    "Accept",
                    "Accept-Charset",
                    "Accept-Encoding",
                    "Accept-Language",
                    "Accept-Ranges",
                    "Age",
                    "Allow",
                    "Authorization",
                    "Cache-Control",
                    "Connection",
                    "Content-Base",
                    "Content-Disposition",
                    "Content-Encoding",
                    "Content-Language",
                    "Content-Length",
                    "Content-Location",
                    "Content-MD5",
                    "Content-Range",
                    "Content-Type",
                    "Cookie",
                    "Date",
                    "ETag",
                    "Expect",
                    "Expires",
                    "From",
                    "Host",
                    "If-Match",
                    "If-Modified-Since",
                    "If-None-Match",
                    "If-Range",
                    "If-Unmodified-Since",
                    "Last-Modified",
                    "Link",
                    "Location",
                    "Max-Forwards",
                    "P3P",
                    "Pragma",
                    "Proxy-Authenticate",
                    "Proxy-Authorization",
                    "Range",
                    "Referer",
                    "Refresh",
                    "Retry-After",
                    "Server",
                    "Set-Cookie",
                    "TE",
                    "Trailer",
                    "Transfer-Encoding",
                    "Upgrade",
                    "User-Agent",
                    "Vary",
                    "Via",
                    "Warn",
                    "Warning",
                    "WWW-Authenticate",

                };
        }


        /// <summary>
        /// Returns the response category as one of three values
        ///   FileTools.TEXT
        ///   FileTools.IMAGE
        ///   FileTools.OTHER
        /// 
        /// First tests the response object.
        /// 
        /// If response.ContentType determines that the value is
        /// TEXT or IMAGE then that value is returned.
        /// 
        /// Otherwise, uri.FileExtension is tested using
        ///   FileTools.GetFileCategory
        /// 
        /// If that determines the answer then that is returned.
        /// 
        /// Otherwise, FileTools.OTHER is returned.
        /// 
        /// Assumption: The response is the result of requesting
        /// the uri.
        /// </summary>
        /// <param name="uri">The uri to request</param>
        /// <param name="response">The response to the request</param>
        public static int ResponseCategory
            (UriPlus uri, HttpWebResponse response)
        {
            int category = FileTools.OTHER;

            // First test response.ContentType

            if (response != null)
            {
                string contentType = response.ContentType;

                if (!StringTools.IsTrivial(contentType))
                {
                    if (contentType.StartsWith("text"))
                        category = FileTools.TEXT;
                    else if (contentType.StartsWith("image"))
                        category = FileTools.IMAGE;
                    else if (contentType.Contains("javascript"))
                        category = FileTools.TEXT;
                    else if (contentType.Contains("json"))
                        category = FileTools.TEXT;
                    else if (contentType.Contains("htm"))
                        category = FileTools.TEXT;
                    else if (contentType.StartsWith("application/xml"))
                        category = FileTools.TEXT;
                }
            }

            // Only test uri.FileExtension if category did not change

            if (category == FileTools.OTHER)
            {
                if (uri != null)
                {
                    string extension = uri.FileExtension;

                    if (!StringTools.IsTrivial(extension))
                    {
                        category = FileTools.GetFileCategory(extension);
                    }
                }
            }

            return category;
        }

        /// <summary>
        /// Returns true if response.ContentType contains "htm".
        /// 
        /// This should pick out just the media types:
        ///   text/html
        ///   application/xhtml+xml
        /// 
        /// We do not pass a uri since we will only consider a
        /// response to be HTML if its server asserts that.
        /// </summary>
        /// <param name="response">The response to a request</param>
        public static bool IsHtml(HttpWebResponse response)
        {
            if (response != null)
            {
                string contentType = response.ContentType;

                if (!StringTools.IsTrivial(contentType))
                {
                    if (contentType.Contains("htm"))
                        return true;
                }
            }

            return false;
        }
    }
}
