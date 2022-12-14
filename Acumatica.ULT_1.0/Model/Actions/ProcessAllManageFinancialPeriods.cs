using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ProcessAllManageFinancialPeriods : EntityAction<ManageFinancialPeriods>
	{
		public ProcessAllManageFinancialPeriods(ManageFinancialPeriods entity) : base(entity)
		{ }
		public ProcessAllManageFinancialPeriods() : base()
		{ }
	}
}
