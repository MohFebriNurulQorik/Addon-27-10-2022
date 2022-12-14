using Acumatica.RESTClient.Api;
using Acumatica.RESTClient.Client;
using Acumatica.ULT_18_200_001.Model;

namespace Acumatica.ULT_18_200_001.Api
{
	public class PaymentMethodApi : EntityAPI<PaymentMethod>
	{
		public PaymentMethodApi(Configuration configuration) : base(configuration)
		{ }
	}
}