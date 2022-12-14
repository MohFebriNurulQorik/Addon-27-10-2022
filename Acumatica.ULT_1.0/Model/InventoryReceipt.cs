using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class InventoryReceipt : Entity
	{

		[DataMember(Name="ControlCost", EmitDefaultValue=false)]
		public DecimalValue ControlCost { get; set; }

		[DataMember(Name="ControlQty", EmitDefaultValue=false)]
		public DecimalValue ControlQty { get; set; }

		[DataMember(Name="Date", EmitDefaultValue=false)]
		public DateTimeValue Date { get; set; }

		[DataMember(Name="Description", EmitDefaultValue=false)]
		public StringValue Description { get; set; }

		[DataMember(Name="Details", EmitDefaultValue=false)]
		public List<InventoryReceiptDetail> Details { get; set; }

		[DataMember(Name="Hold", EmitDefaultValue=false)]
		public BooleanValue Hold { get; set; }

		[DataMember(Name="PostPeriod", EmitDefaultValue=false)]
		public StringValue PostPeriod { get; set; }

		[DataMember(Name="ReferenceNbr", EmitDefaultValue=false)]
		public StringValue ReferenceNbr { get; set; }

		[DataMember(Name="Status", EmitDefaultValue=false)]
		public StringValue Status { get; set; }

		[DataMember(Name="TotalCost", EmitDefaultValue=false)]
		public DecimalValue TotalCost { get; set; }

		[DataMember(Name="TotalQty", EmitDefaultValue=false)]
		public DecimalValue TotalQty { get; set; }

		[DataMember(Name="TransferNbr", EmitDefaultValue=false)]
		public StringValue TransferNbr { get; set; }

		[DataMember(Name = "ExternalRef", EmitDefaultValue = false)]
		public StringValue ExternalRef { get; set; }
		[DataMember(Name = "Branch", EmitDefaultValue = false)]
		public StringValue Branch { get; set; }

	}
}