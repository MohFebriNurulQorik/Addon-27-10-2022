using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class RejectExpenseClaim : EntityAction<ExpenseClaim>
	{
		public RejectExpenseClaim(ExpenseClaim entity) : base(entity)
		{ }
		public RejectExpenseClaim() : base()
		{ }
	}
}
