using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class CompletePhysicalInventory : EntityAction<PhysicalInventoryReview>
	{
		public CompletePhysicalInventory(PhysicalInventoryReview entity) : base(entity)
		{ }
		public CompletePhysicalInventory() : base()
		{ }
	}
}
