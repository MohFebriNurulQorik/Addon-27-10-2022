using Acumatica.RESTClient.Model;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Acumatica.ULT_18_200_001.Model
{
	[DataContract]
	public class DiscountCustomerDetail : Entity
	{

		[DataMember(Name="CustomerID", EmitDefaultValue=false)]
		public StringValue CustomerID { get; set; }

		[DataMember(Name="CustomerName", EmitDefaultValue=false)]
		public StringValue CustomerName { get; set; }

	}
}