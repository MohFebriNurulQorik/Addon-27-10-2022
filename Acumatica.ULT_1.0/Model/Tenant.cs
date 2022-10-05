using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class Tenant : Entity
	{

		[DataMember(Name="TenantName", EmitDefaultValue=false)]
		public StringValue TenantName { get; set; }

		[DataMember(Name= "TenantID", EmitDefaultValue=false)]
		public IntValue TenantID { get; set; }

		[DataMember(Name = "LoginName", EmitDefaultValue = false)]
		public StringValue LoginName { get; set; }

		[DataMember(Name = "Status", EmitDefaultValue = false)]
		public StringValue Status { get; set; }

	}
}