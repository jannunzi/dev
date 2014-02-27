using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(f360.Startup))]
namespace f360
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
