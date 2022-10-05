using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class SalesInvoiceAutoApply : EntityAction<SalesInvoice>
	{
		public SalesInvoiceAutoApply(SalesInvoice entity) : base(entity)
		{ }
		public SalesInvoiceAutoApply() : base()
		{ }
	}
}
