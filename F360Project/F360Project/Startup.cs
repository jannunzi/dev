using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(F360Project.Startup))]
namespace F360Project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
