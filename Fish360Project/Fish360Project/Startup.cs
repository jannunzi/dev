using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Fish360Project.Startup))]
namespace Fish360Project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
