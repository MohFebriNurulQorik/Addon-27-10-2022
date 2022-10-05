using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class PrepareSalesInvoice : EntityAction<SalesOrder>
	{
		public PrepareSalesInvoice(SalesOrder entity) : base(entity)
		{ }
		public PrepareSalesInvoice() : base()
		{ }
	}
}
