using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class CheckForBusinessAccountDuplicates : EntityAction<BusinessAccount>
	{
		public CheckForBusinessAccountDuplicates(BusinessAccount entity) : base(entity)
		{ }
		public CheckForBusinessAccountDuplicates() : base()
		{ }
	}
}
