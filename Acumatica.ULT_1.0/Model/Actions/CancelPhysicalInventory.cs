using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class CancelPhysicalInventory : EntityAction<PhysicalInventoryReview>
	{
		public CancelPhysicalInventory(PhysicalInventoryReview entity) : base(entity)
		{ }
		public CancelPhysicalInventory() : base()
		{ }
	}
}
