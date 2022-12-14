using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class PutOnHoldExpenseReceipt : EntityAction<ExpenseReceipt>
	{
		public PutOnHoldExpenseReceipt(ExpenseReceipt entity) : base(entity)
		{ }
		public PutOnHoldExpenseReceipt() : base()
		{ }
	}
}
