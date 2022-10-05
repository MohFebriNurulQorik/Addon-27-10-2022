using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class InviteAllEvent : EntityAction<Event>
	{
		public InviteAllEvent(Event entity) : base(entity)
		{ }
		public InviteAllEvent() : base()
		{ }
	}
}
