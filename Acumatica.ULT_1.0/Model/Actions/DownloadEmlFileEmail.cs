using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class DownloadEmlFileEmail : EntityAction<Email>
	{
		public DownloadEmlFileEmail(Email entity) : base(entity)
		{ }
		public DownloadEmlFileEmail() : base()
		{ }
	}
}
