using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class AddPOReceiptBill : EntityActionWithParameters<Bill, AddPOReceiptBillParameters>
	{
		public AddPOReceiptBill() : base()
		{ }
		public AddPOReceiptBill(Bill entity, AddPOReceiptBillParameters parameters) : base(entity, parameters)
		{ }

		public StringValue ReceiptNbr
		{
			get { return Parameters.ReceiptNbr; }
			set { Parameters.ReceiptNbr = value; }
		}
	}
}