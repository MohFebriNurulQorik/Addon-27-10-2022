using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class MarkLeadAsValidated : EntityAction<Lead>
	{
		public MarkLeadAsValidated(Lead entity) : base(entity)
		{ }
		public MarkLeadAsValidated() : base()
		{ }
	}
}
