using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class RestoreArchivedEmail : EntityAction<Email>
	{
		public RestoreArchivedEmail(Email entity) : base(entity)
		{ }
		public RestoreArchivedEmail() : base()
		{ }
	}
}
