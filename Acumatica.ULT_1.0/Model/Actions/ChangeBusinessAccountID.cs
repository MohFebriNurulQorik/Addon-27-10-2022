using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ChangeBusinessAccountID : EntityActionWithParameters<BusinessAccount, ChangeBusinessAccountIDParameters>
	{
		public ChangeBusinessAccountID() : base()
		{ }
		public ChangeBusinessAccountID(BusinessAccount entity, ChangeBusinessAccountIDParameters parameters) : base(entity, parameters)
		{ }

		public StringValue BusinessAccountID
		{
			get { return Parameters.BusinessAccountID; }
			set { Parameters.BusinessAccountID = value; }
		}
	}
}