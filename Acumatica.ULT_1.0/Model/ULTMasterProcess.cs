using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ULTMasterProcess : Entity
	{

		[DataMember(Name="ProcessCode", EmitDefaultValue=false)]
		public StringValue ProcessCode { get; set; }

		[DataMember(Name= "ProcessName", EmitDefaultValue=false)]
		public StringValue ProcessName { get; set; }

	}
}