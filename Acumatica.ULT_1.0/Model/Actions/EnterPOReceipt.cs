using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class EnterPOReceipt : EntityAction<PurchaseOrder>
	{
		public EnterPOReceipt(PurchaseOrder entity) : base(entity)
		{ }
		public EnterPOReceipt() : base()
		{ }
	}
}
