using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class InventoryReceiptDetail : Entity
	{

		[DataMember(Name="Allocations", EmitDefaultValue=false)]
		public List<InventoryReceiptDetailAllocation> Allocations { get; set; }

		[DataMember(Name="CostCode", EmitDefaultValue=false)]
		public StringValue CostCode { get; set; }

		[DataMember(Name="Description", EmitDefaultValue=false)]
		public StringValue Description { get; set; }

		[DataMember(Name="ExpirationDate", EmitDefaultValue=false)]
		public DateTimeValue ExpirationDate { get; set; }

		[DataMember(Name="ExtCost", EmitDefaultValue=false)]
		public DecimalValue ExtCost { get; set; }

		[DataMember(Name="InventoryID", EmitDefaultValue=false)]
		public StringValue InventoryID { get; set; }

		[DataMember(Name="LineNumber", EmitDefaultValue=false)]
		public IntValue LineNumber { get; set; }

		[DataMember(Name="Location", EmitDefaultValue=false)]
		public StringValue Location { get; set; }

		[DataMember(Name="LotSerialNbr", EmitDefaultValue=false)]
		public StringValue LotSerialNbr { get; set; }

		[DataMember(Name="Project", EmitDefaultValue=false)]
		public StringValue Project { get; set; }

		[DataMember(Name="ProjectTask", EmitDefaultValue=false)]
		public StringValue ProjectTask { get; set; }

		[DataMember(Name="Qty", EmitDefaultValue=false)]
		public DecimalValue Qty { get; set; }

		[DataMember(Name="Subitem", EmitDefaultValue=false)]
		public StringValue Subitem { get; set; }

		[DataMember(Name="UnitCost", EmitDefaultValue=false)]
		public DecimalValue UnitCost { get; set; }

		[DataMember(Name="UOM", EmitDefaultValue=false)]
		public StringValue UOM { get; set; }

		[DataMember(Name="WarehouseID", EmitDefaultValue=false)]
		public StringValue WarehouseID { get; set; }

		[DataMember(Name = "ReasonCode", EmitDefaultValue = false)]
		public StringValue ReasonCode { get; set; }
		[DataMember(Name = "Branch", EmitDefaultValue = false)]
		public StringValue Branch { get; set; }

	}
}