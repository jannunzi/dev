using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WamApplication.Startup))]
namespace WamApplication
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
