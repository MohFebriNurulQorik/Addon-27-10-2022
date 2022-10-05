using Acumatica.RESTClient.Api;
using Acumatica.RESTClient.Client;
using Acumatica.ULT_18_200_001.Model;

namespace Acumatica.ULT_18_200_001.Api
{
	public class ULTInventoryIssueApi : EntityAPI<ULTInventoryIssue>
	{
		public ULTInventoryIssueApi(Configuration configuration) : base(configuration)
		{ }
	}
}