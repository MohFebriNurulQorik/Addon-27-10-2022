using Acumatica.Auth.Api;
using Acumatica.Auth.Model;
using Acumatica.ULT_18_200_001.Api;
using Acumatica.RESTClient.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace AcumaticaRestApiExample
{
	class Program
	{
		const string SiteURL = "https://universalleaf.acumatica.com";
		const string Username = "wahyu-sunartha";
		const string Password = "Demo1234";
		const string Tenant = "Prototype 4.1 For Development";
		const string Branch = null;
		const string Locale = null;

		static void Main(string[] args)
		{
			Console.WriteLine("REST API example");
			RESTExample.ExampleMethod(SiteURL, Username, Password, Tenant, Branch, Locale);

			Console.ReadLine();
		}

	}
}
