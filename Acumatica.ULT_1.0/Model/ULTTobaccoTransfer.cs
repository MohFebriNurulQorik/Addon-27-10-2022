using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class ULTTobaccoTransfer : Entity
	{
		[DataMember(Name= "AddOnNbr", EmitDefaultValue=false)]
		public StringValue AddOnNbr { get; set; }

		[DataMember(Name= "Details", EmitDefaultValue=false)]
		public List<ULTTobaccoTransferDetail> Details { get; set; }

		[DataMember(Name = "DispatchDate", EmitDefaultValue = false)]
		public DateTimeValue DispatchDate { get; set; }

		[DataMember(Name= "DispatchFrom", EmitDefaultValue=false)]
		public StringValue DispatchFrom { get; set; }

		[DataMember(Name= "DispatchNote", EmitDefaultValue=false)]
		public StringValue DispatchNote { get; set; }

		[DataMember(Name = "DispatchTo", EmitDefaultValue = false)]
		public StringValue DispatchTo { get; set; }

		[DataMember(Name = "IssueRefNbr", EmitDefaultValue = false)]
		public StringValue IssueRefNbr { get; set; }

		[DataMember(Name = "ReceiptRefNbr", EmitDefaultValue = false)]
		public StringValue ReceiptRefNbr { get; set; }

		[DataMember(Name = "TotalCost", EmitDefaultValue = false)]
		public DecimalValue TotalCost { get; set; }

		[DataMember(Name = "TotalQty", EmitDefaultValue = false)]
		public DecimalValue TotalQty { get; set; }

		[DataMember(Name = "TranType", EmitDefaultValue = false)]
		public StringValue TranType { get; set; }

		[DataMember(Name = "LogisticService", EmitDefaultValue = false)]
		public StringValue LogisticService { get; set; }

		[DataMember(Name = "LisencePlate", EmitDefaultValue = false)]
		public StringValue LisencePlate { get; set; }


	}
}