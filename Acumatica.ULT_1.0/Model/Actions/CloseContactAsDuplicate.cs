using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class CloseContactAsDuplicate : EntityAction<Contact>
	{
		public CloseContactAsDuplicate(Contact entity) : base(entity)
		{ }
		public CloseContactAsDuplicate() : base()
		{ }
	}
}
