using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ULTItemAttribute : Entity
	{

		[DataMember(Name="CodeID", EmitDefaultValue=false)]
		public StringValue CodeID { get; set; }

		[DataMember(Name="CodeType", EmitDefaultValue=false)]
		public StringValue CodeType { get; set; }

		[DataMember(Name="CodeDescription", EmitDefaultValue=false)]
		public StringValue CodeDescription { get; set; }

		[DataMember(Name="Active", EmitDefaultValue=false)]
		public BooleanValue Active { get; set; }

		[DataMember(Name="CreatedDateTime", EmitDefaultValue=false)]
		public DateTimeValue CreatedDateTime { get; set; }

		[DataMember(Name="LastModifiedDateTime", EmitDefaultValue=false)]
		public DateTimeValue LastModifiedDateTime { get; set; }

	}
}