using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ULTSegmentValue : Entity
	{

		[DataMember(Name= "Active", EmitDefaultValue=false)]
		public BooleanValue Active { get; set; }

		[DataMember(Name= "Description", EmitDefaultValue=false)]
		public StringValue Description { get; set; }

		[DataMember(Name= "SegmentedKeyID", EmitDefaultValue=false)]
		public StringValue SegmentedKeyID { get; set; }

		[DataMember(Name= "SegmentID", EmitDefaultValue=false)]
		public ShortValue SegmentID { get; set; }

		[DataMember(Name= "SummaryDescription", EmitDefaultValue=false)]
		public StringValue SummaryDescription { get; set; }
		[DataMember(Name = "SummarySegmentedKeyID", EmitDefaultValue = false)]
		public StringValue SummarySegmentedKeyID { get; set; }
		[DataMember(Name = "SummarySegmentID", EmitDefaultValue = false)]
		public ShortValue SummarySegmentID { get; set; }
		[DataMember(Name = "Value", EmitDefaultValue = false)]
		public StringValue Value { get; set; }

	}
}