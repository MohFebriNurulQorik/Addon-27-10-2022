using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ULTInventoryIssueDetail : Entity
	{

		[DataMember(Name= "Description", EmitDefaultValue=false)]
		public StringValue Description { get; set; }

		[DataMember(Name= "InventoryID", EmitDefaultValue=false)]
		public StringValue InventoryID { get; set; }

		[DataMember(Name= "Location", EmitDefaultValue=false)]
		public StringValue Location { get; set; }

		[DataMember(Name= "LotSerialNbr", EmitDefaultValue=false)]
		public StringValue LotSerialNbr { get; set; }

		[DataMember(Name= "Quantity", EmitDefaultValue=false)]
		public DecimalValue Quantity { get; set; }

		[DataMember(Name = "Subitem", EmitDefaultValue = false)]
		public StringValue Subitem { get; set; }

		[DataMember(Name = "UOM", EmitDefaultValue = false)]
		public StringValue UOM { get; set; }

		[DataMember(Name = "Warehouse", EmitDefaultValue = false)]
		public StringValue Warehouse { get; set; }

		[DataMember(Name = "ReasonCode", EmitDefaultValue = false)]
		public StringValue ReasonCode { get; set; }
		[DataMember(Name = "UnitCost", EmitDefaultValue = false)]
		public DecimalValue UnitCost { get; set; }
		[DataMember(Name = "ExtCost", EmitDefaultValue = false)]
		public DecimalValue ExtCost { get; set; }
		[DataMember(Name = "Branch", EmitDefaultValue = false)]
		public StringValue Branch { get; set; }


	}
}