using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ULTMasterGrade : Entity
	{

		[DataMember(Name= "Grade", EmitDefaultValue=false)]
		public StringValue Grade { get; set; }

		[DataMember(Name= "InventoryCD", EmitDefaultValue=false)]
		public StringValue InventoryCD { get; set; }

		[DataMember(Name= "ProcessID", EmitDefaultValue=false)]
		public StringValue ProcessID { get; set; }

		[DataMember(Name= "ReclassGrade", EmitDefaultValue=false)]
		public StringValue ReclassGrade { get; set; }

		[DataMember(Name= "WarehouseCD", EmitDefaultValue=false)]
		public StringValue WarehouseCD { get; set; }

	}
}