using Acumatica.Auth.Api;
using Acumatica.Auth.Model;
using Acumatica.ULT_18_200_001.Api;
using Acumatica.ULT_18_200_001.Model;
using Acumatica.RESTClient.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace AcumaticaRestApiExample
{
	public class RESTExample
	{
		public static void ExampleMethod(string siteURL, string username, string password, string tenant = null, string branch = null, string locale = null)
		{
			var authApi = new AuthApi(siteURL);
			
			try
			{
				var configuration = LogIn(authApi, siteURL, username, password, tenant, branch, locale);

                Console.WriteLine("Reading Tenants...");
                var tenantApi = new TenantApi(configuration);
                var tenants = tenantApi.GetList();
                foreach (var mytenant in tenants)
                {
                    Console.WriteLine($"Tenants: {mytenant.LoginName.Value};");
                }

                Console.WriteLine("Reading Warehouse...");
				var warehouseApi = new WarehouseApi(configuration);
				//var warehouses = warehouseApi.GetList(top: 5);
				var warehouses = warehouseApi.GetList(select: "WarehouseID,Description,Active");
				foreach (var warehouse in warehouses)
				{
					Console.WriteLine($"Warehouse: {warehouse.Description.Value};");
				}

                Console.WriteLine("Reading Vendor...");
				//Console.WriteLine("Reading Vendor by Keys...");
				var vendorApi = new VendorApi(configuration);
				//var vendor = vendorApi.GetByKeys(new List<string>() { "C18001" });
				//Console.WriteLine($"Vendor : {vendor.VendorID.Value} | {vendor.VendorName.Value}");
				var vendors = vendorApi.GetList();
				foreach (var vendor in vendors)
				{
					Console.WriteLine($"Vendor : {vendor.VendorID.Value} | {vendor.VendorName.Value}");
				}


				//var shipmentApi = new ShipmentApi(configuration);
				//var shipment= shipmentApi.GetByKeys(new List<string>() { "002805" });
				//Console.WriteLine("ConfirmShipment");
				//shipmentApi.WaitActionCompletion(shipmentApi.InvokeAction(new ConfirmShipment(shipment)));

				//Console.WriteLine("CorrectShipment");
				//shipmentApi.WaitActionCompletion(shipmentApi.InvokeAction(new CorrectShipment(shipment)));
			}
			catch (Exception e)
			{
				Console.WriteLine(e.Message);
			}
			finally
			{
				//we use logout in finally block because we need to always logut, even if the request failed for some reason
				authApi.AuthLogout();
				Console.WriteLine("Logged Out...");
			}
		}

		private static Configuration LogIn(AuthApi authApi, string siteURL, string username, string password, string tenant = null, string branch = null, string locale = null)
		{
			var cookieContainer = new CookieContainer();
			authApi.Configuration.ApiClient.RestClient.CookieContainer = cookieContainer;

			authApi.AuthLogin(new Credentials(username, password, tenant, branch, locale));
			Console.WriteLine("Logged In...");
			var configuration = new Configuration(siteURL + "/entity/ULT/18.200.001/");

			//share cookie container between API clients because we use different client for authentication and interaction with endpoint
			configuration.ApiClient.RestClient.CookieContainer = authApi.Configuration.ApiClient.RestClient.CookieContainer;
			return configuration;
		}
	}
}
