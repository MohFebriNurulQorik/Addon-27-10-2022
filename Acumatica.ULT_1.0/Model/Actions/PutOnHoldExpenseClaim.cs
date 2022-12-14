using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class PutOnHoldExpenseClaim : EntityAction<ExpenseClaim>
	{
		public PutOnHoldExpenseClaim(ExpenseClaim entity) : base(entity)
		{ }
		public PutOnHoldExpenseClaim() : base()
		{ }
	}
}
