using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ProcessEmailProcessing : EntityAction<EmailProcessing>
	{
		public ProcessEmailProcessing(EmailProcessing entity) : base(entity)
		{ }
		public ProcessEmailProcessing() : base()
		{ }
	}
}
