using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class CancelSendingEmail : EntityAction<Email>
	{
		public CancelSendingEmail(Email entity) : base(entity)
		{ }
		public CancelSendingEmail() : base()
		{ }
	}
}
