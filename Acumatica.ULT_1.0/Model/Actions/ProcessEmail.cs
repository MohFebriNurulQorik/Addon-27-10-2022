using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ProcessEmail : EntityAction<Email>
	{
		public ProcessEmail(Email entity) : base(entity)
		{ }
		public ProcessEmail() : base()
		{ }
	}
}
