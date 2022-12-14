using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ReportingGroup : Entity
	{

		[DataMember(Name="GroupType", EmitDefaultValue=false)]
		public StringValue GroupType { get; set; }

		[DataMember(Name="LastModifiedDateTime", EmitDefaultValue=false)]
		public DateTimeValue LastModifiedDateTime { get; set; }

		[DataMember(Name="Name", EmitDefaultValue=false)]
		public StringValue Name { get; set; }

	}
}