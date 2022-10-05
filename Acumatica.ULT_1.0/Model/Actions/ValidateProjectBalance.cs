using Acumatica.RESTClient.Model;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ValidateProjectBalance : EntityAction<Project>
	{
		public ValidateProjectBalance(Project entity) : base(entity)
		{ }
		public ValidateProjectBalance() : base()
		{ }
	}
}
