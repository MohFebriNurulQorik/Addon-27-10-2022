using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ReleaseInventoryIssue : EntityAction<ULTInventoryIssue>
	{
		public ReleaseInventoryIssue(ULTInventoryIssue entity) : base(entity)
		{ }
		public ReleaseInventoryIssue() : base()
		{ }
	}
}
