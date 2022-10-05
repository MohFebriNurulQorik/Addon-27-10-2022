using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ReleaseFromHoldInventoryReceipt : EntityAction<InventoryReceipt>
	{
		public ReleaseFromHoldInventoryReceipt(InventoryReceipt entity) : base(entity)
		{ }
		public ReleaseFromHoldInventoryReceipt() : base()
		{ }
	}
}
