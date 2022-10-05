using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class CreateContactFromOpportunity : EntityAction<Opportunity>
	{
		public CreateContactFromOpportunity(Opportunity entity) : base(entity)
		{ }
		public CreateContactFromOpportunity() : base()
		{ }
	}
}
