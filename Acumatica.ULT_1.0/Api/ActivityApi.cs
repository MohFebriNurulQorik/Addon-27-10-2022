using Acumatica.RESTClient.Api;
using Acumatica.RESTClient.Client;
using Acumatica.ULT_18_200_001.Model;

namespace Acumatica.ULT_18_200_001.Api
{
	public class ActivityApi : EntityAPI<Activity>
	{
		public ActivityApi(Configuration configuration) : base(configuration)
		{ }
	}
}