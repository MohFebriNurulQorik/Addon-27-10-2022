using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class CreateLeadFromEmail : EntityAction<Email>
	{
		public CreateLeadFromEmail(Email entity) : base(entity)
		{ }
		public CreateLeadFromEmail() : base()
		{ }
	}
}
