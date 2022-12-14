using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class EmailChangeOrder : EntityAction<ChangeOrder>
	{
		public EmailChangeOrder(ChangeOrder entity) : base(entity)
		{ }
		public EmailChangeOrder() : base()
		{ }
	}
}
