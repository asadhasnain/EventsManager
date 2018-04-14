using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EventsManager.Startup))]
namespace EventsManager
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
