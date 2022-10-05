using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ReleaseFromHoldInventoryIssue : EntityAction<ULTInventoryIssue>
	{
		public ReleaseFromHoldInventoryIssue(ULTInventoryIssue entity) : base(entity)
		{ }
		public ReleaseFromHoldInventoryIssue() : base()
		{ }
	}
}
