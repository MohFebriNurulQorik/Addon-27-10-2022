using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class CompleteAndFollowUpTask : EntityAction<Task>
	{
		public CompleteAndFollowUpTask(Task entity) : base(entity)
		{ }
		public CompleteAndFollowUpTask() : base()
		{ }
	}
}
