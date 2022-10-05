using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class applyRepaymentBill : EntityAction<Bill>
	{
		public applyRepaymentBill(Bill entity) : base(entity)
		{ }
		public applyRepaymentBill() : base()
		{ }
	}
}
