using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ProjectBillingProcessAll : EntityAction<ProjectBilling>
	{
		public ProjectBillingProcessAll(ProjectBilling entity) : base(entity)
		{ }
		public ProjectBillingProcessAll() : base()
		{ }
	}
}
