using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ValidateLeadAddress : EntityAction<Lead>
	{
		public ValidateLeadAddress(Lead entity) : base(entity)
		{ }
		public ValidateLeadAddress() : base()
		{ }
	}
}
