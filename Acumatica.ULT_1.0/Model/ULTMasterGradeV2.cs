using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ULTMasterGradeV2 : Entity
	{

		[DataMember(Name= "Grade", EmitDefaultValue=false)]
		public StringValue Grade { get; set; }

		[DataMember(Name= "InventoryID", EmitDefaultValue=false)]
		public StringValue InventoryID { get; set; }

		[DataMember(Name= "ProcessID", EmitDefaultValue=false)]
		public StringValue ProcessID { get; set; }

		[DataMember(Name= "ReclassGrade", EmitDefaultValue=false)]
		public StringValue ReclassGrade { get; set; }

		[DataMember(Name= "Warehouse", EmitDefaultValue=false)]
		public StringValue Warehouse { get; set; }

	}
}