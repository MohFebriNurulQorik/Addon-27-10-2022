using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class VendorContract : Entity
	{

		[DataMember(Name="VendorID", EmitDefaultValue=false)]
		public StringValue VendorID { get; set; }

		[DataMember(Name="Active", EmitDefaultValue=false)]
		public BooleanValue Active { get; set; }

		[DataMember(Name="Area", EmitDefaultValue=false)]
		public StringValue Area { get; set; }

		[DataMember(Name="SubArea", EmitDefaultValue=false)]
		public StringValue SubArea { get; set; }

		[DataMember(Name="Seri", EmitDefaultValue=false)]
		public StringValue Seri { get; set; }

		[DataMember(Name="InventoryID", EmitDefaultValue=false)]
		public StringValue InventoryID { get; set; }

		[DataMember(Name="NoKontrak", EmitDefaultValue=false)]
		public StringValue NoKontrak { get; set; }

		[DataMember(Name="NoKTP", EmitDefaultValue=false)]
		public StringValue NoKTP { get; set; }

		[DataMember(Name = "FarmerID", EmitDefaultValue = false)]
		public StringValue FarmerID { get; set; }

		[DataMember(Name = "VolumeTotal", EmitDefaultValue = false)]
		public DecimalValue VolumeTotal { get; set; }

		[DataMember(Name = "VolumePercentage", EmitDefaultValue = false)]
		public DecimalValue VolumePercentage { get; set; }

		[DataMember(Name = "VolumeVariable", EmitDefaultValue = false)]
		public DecimalValue VolumeVariable { get; set; }

	}
}