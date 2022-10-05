using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class SubmitExpenseReceipt : EntityAction<ExpenseReceipt>
	{
		public SubmitExpenseReceipt(ExpenseReceipt entity) : base(entity)
		{ }
		public SubmitExpenseReceipt() : base()
		{ }
	}
}
