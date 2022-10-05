using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ValidateBusinessAccountAddresses : EntityAction<BusinessAccount>
	{
		public ValidateBusinessAccountAddresses(BusinessAccount entity) : base(entity)
		{ }
		public ValidateBusinessAccountAddresses() : base()
		{ }
	}
}
