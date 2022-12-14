using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ProjectBillingProcess : EntityAction<ProjectBilling>
	{
		public ProjectBillingProcess(ProjectBilling entity) : base(entity)
		{ }
		public ProjectBillingProcess() : base()
		{ }
	}
}
