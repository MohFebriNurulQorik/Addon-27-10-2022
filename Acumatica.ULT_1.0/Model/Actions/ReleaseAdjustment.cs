using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ReleaseAdjustment : EntityAction<Adjustment>
	{
		public ReleaseAdjustment(Adjustment entity) : base(entity)
		{ }
		public ReleaseAdjustment() : base()
		{ }
	}
}
