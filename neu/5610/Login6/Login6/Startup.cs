using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Login6.Startup))]
namespace Login6
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
