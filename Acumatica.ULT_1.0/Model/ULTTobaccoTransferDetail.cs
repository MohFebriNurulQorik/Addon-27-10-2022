using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ULTTobaccoTransferDetail : Entity
	{

		[DataMember(Name= "Area", EmitDefaultValue=false)]
		public StringValue Area { get; set; }

		[DataMember(Name= "Color", EmitDefaultValue=false)]
		public StringValue Color { get; set; }

		[DataMember(Name= "CropYear", EmitDefaultValue=false)]
		public StringValue CropYear { get; set; }

		[DataMember(Name= "Fermentation", EmitDefaultValue=false)]
		public StringValue Fermentation { get; set; }

		[DataMember(Name = "Form", EmitDefaultValue = false)]
		public StringValue Form { get; set; }

		[DataMember(Name = "Grade", EmitDefaultValue = false)]
		public StringValue Grade { get; set; }

		[DataMember(Name = "InventoryID", EmitDefaultValue = false)]
		public StringValue InventoryID { get; set; }

		[DataMember(Name = "Length", EmitDefaultValue = false)]
		public StringValue Length { get; set; }

		[DataMember(Name = "LotNo", EmitDefaultValue = false)]
		public StringValue LotNo { get; set; }

		[DataMember(Name = "Process", EmitDefaultValue = false)]
		public StringValue Process { get; set; }

		[DataMember(Name = "QtyGross", EmitDefaultValue = false)]
		public DecimalValue QtyGross { get; set; }

		[DataMember(Name = "QtyNetto", EmitDefaultValue = false)]
		public DecimalValue QtyNetto { get; set; }

		[DataMember(Name = "QtyRope", EmitDefaultValue = false)]
		public DecimalValue QtyRope { get; set; }

		[DataMember(Name = "QtyShip", EmitDefaultValue = false)]
		public DecimalValue QtyShip { get; set; }

		[DataMember(Name = "QtyTare", EmitDefaultValue = false)]
		public DecimalValue QtyTare { get; set; }

		[DataMember(Name = "Source", EmitDefaultValue = false)]
		public StringValue Source { get; set; }

		[DataMember(Name = "Stage", EmitDefaultValue = false)]
		public StringValue Stage { get; set; }

		[DataMember(Name = "StalkPositions", EmitDefaultValue = false)]
		public StringValue StalkPositions { get; set; }

		[DataMember(Name = "Subitem", EmitDefaultValue = false)]
		public StringValue Subitem { get; set; }

		[DataMember(Name = "UnitCost", EmitDefaultValue = false)]
		public DecimalValue UnitCost { get; set; }

		[DataMember(Name = "UOM", EmitDefaultValue = false)]
		public StringValue UOM { get; set; }

		[DataMember(Name = "ExtCost", EmitDefaultValue = false)]
		public DecimalValue ExtCost { get; set; }

		[DataMember(Name = "BuyerName", EmitDefaultValue = false)]
		public StringValue BuyerName { get; set; }
	}
}