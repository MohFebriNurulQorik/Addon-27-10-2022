using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class FinishCountingPhysicalInventory : EntityAction<PhysicalInventoryReview>
	{
		public FinishCountingPhysicalInventory(PhysicalInventoryReview entity) : base(entity)
		{ }
		public FinishCountingPhysicalInventory() : base()
		{ }
	}
}
