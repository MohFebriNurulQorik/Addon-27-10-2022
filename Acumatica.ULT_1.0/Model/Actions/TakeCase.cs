using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class TakeCase : EntityAction<Case>
	{
		public TakeCase(Case entity) : base(entity)
		{ }
		public TakeCase() : base()
		{ }
	}
}
