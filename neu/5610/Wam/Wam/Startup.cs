using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Wam.Startup))]
namespace Wam
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
