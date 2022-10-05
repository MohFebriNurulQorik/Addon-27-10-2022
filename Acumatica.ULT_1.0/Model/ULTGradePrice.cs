using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ULTGradePrice : Entity
	{

		[DataMember(Name= "Area", EmitDefaultValue=false)]
		public StringValue Area { get; set; }

		[DataMember(Name= "CropYear", EmitDefaultValue=false)]
		public StringValue CropYear { get; set; }

		[DataMember(Name= "EffectiveDate", EmitDefaultValue=false)]
		public DateTimeValue EffectiveDate { get; set; }

		[DataMember(Name= "Form", EmitDefaultValue=false)]
		public StringValue Form { get; set; }

		[DataMember(Name= "GradeID", EmitDefaultValue=false)]
		public StringValue GradeID { get; set; }

		[DataMember(Name = "InventoryIDInventoryID", EmitDefaultValue = false)]
		public StringValue InventoryIDInventoryID { get; set; }

		[DataMember(Name = "Price", EmitDefaultValue = false)]
		public DecimalValue Price { get; set; }

		[DataMember(Name = "Source", EmitDefaultValue = false)]
		public StringValue Source { get; set; }

		

	}
}