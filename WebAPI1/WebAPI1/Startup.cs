using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebAPI1.Startup))]
namespace WebAPI1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
