using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class CompleteTimeEntry : EntityAction<TimeEntry>
	{
		public CompleteTimeEntry(TimeEntry entity) : base(entity)
		{ }
		public CompleteTimeEntry() : base()
		{ }
	}
}
