using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AcumaticaSync.com.acumatica.universalleaf;
using System.Timers;
using System.Threading;
using System.Globalization;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Data;

namespace AcumaticaSync
{
    class Program
    {
        //define some var
        private static CultureInfo usCultureInfo = CultureInfo.CreateSpecificCulture("en-US");
        private static DateTime lastSyncDate = DateTime.UtcNow;
        private static Screen context = new Screen();


        private static System.Timers.Timer syncTimer;


        //credentials
        private static string WSUser =Properties.Settings.Default.WSUser;
        private static string WSPassword = Properties.Settings.Default.WSPassword;
        private static string WSUrl = Properties.Settings.Default.WSUrl;
        private static string ConnectionString = $"Data Source={Properties.Settings.Default.DBServer}; Initial Catalog={Properties.Settings.Default.DBCatalog};" +
            $"user={Properties.Settings.Default.DBUser }; Password={Properties.Settings.Default.DBPassword};";

        private static StringCollection SyncDay = Properties.Settings.Default.SyncDay;
        private static StringCollection SyncTime = Properties.Settings.Default.SyncTime;


        static void Main(string[] args)
        {
            Console.Title = "Acumatica Sync service [IMPORTANT - DO NOT CLOSE!]";
            Thread.CurrentThread.CurrentCulture = usCultureInfo;
            Thread.CurrentThread.CurrentUICulture = usCultureInfo;

            lastSyncDate = lastSyncDate.AddDays(-14);

            context.CookieContainer = new System.Net.CookieContainer();
            context.AllowAutoRedirect = true;
            context.EnableDecompression = true;
            context.Timeout = 1000000;
            context.Url = WSUrl;

            // Create timer
            syncTimer = new System.Timers.Timer(2000);
            // Hook up the Elapsed event for the timer. 
            syncTimer.Elapsed += OnTimedEvent;
            syncTimer.AutoReset = false;
            syncTimer.Enabled = true;


            Console.WriteLine("\nPress the Enter key to exit the application...\n");
            Console.WriteLine($"The application started at {DateTime.Now.DayOfWeek} - {DateTime.Now.ToString("HH:mm:ss")}");
            Console.ReadLine();
            syncTimer.Stop();
            syncTimer.Dispose();

            Console.WriteLine("Terminating the application...");

                
        }

        private static void OnTimedEvent(Object source, ElapsedEventArgs e)
        {
            syncTimer.Stop();


            string currentDay = DateTime.Now.DayOfWeek.ToString();
            if (SyncDay.Contains(currentDay))
            {
                TimeSpan start = new TimeSpan(int.Parse(SyncTime[0]), 0, 0);
                TimeSpan end = new TimeSpan(int.Parse(SyncTime[1]), 0, 0);
                TimeSpan now = e.SignalTime.TimeOfDay;

                if (now >= start && now <= end)
                {
                    Console.WriteLine($"The Elapsed event was raised at {currentDay} - {e.SignalTime.ToString("HH:mm:ss")}");
                    Console.WriteLine("Syncing Vendor data");
                    SyncVendor();
                }
                else
                {
                    Console.WriteLine($"{now} is outside the sync schedule");
                }
            }
            else
            {
                Console.WriteLine($"{currentDay} is outside the sync schedule");
            }

            syncTimer = new System.Timers.Timer(100000);
            syncTimer.Start();
        }




        #region "utils"
        //cipher - TO DO
        #endregion

        #region "Vendor"
        //sync vendor
        private static void SyncVendor()
        {

            try
            {
                LoginResult result = context.Login(WSUser, WSPassword);
                if (result.Code == ErrorCode.OK)
                {

                    AP303000Content AP303000 = context.AP303000GetSchema();
                    context.AP303000Clear();

                    //get vendor
                    string[][] VendorData = context.AP303000Export
                        (
                           new Command[]
                           {
                        AP303000.VendorSummary.ServiceCommands.EveryVendorID,
                        AP303000.VendorSummary.VendorID,
                        AP303000.VendorSummary.VendorName,
                        AP303000.VendorSummary.Status,
                        AP303000.GeneralInfoMainContact.CompanyName ,
                        AP303000.GeneralInfoMainContact.Phone1 ,
                        AP303000.GeneralInfoMainContact.Phone2 ,
                        AP303000.GeneralInfoMainAddress.AddressLine1,
                        AP303000.GeneralInfoMainAddress.AddressLine2,
                        AP303000.GeneralInfoMainAddress.City,
                        AP303000.GeneralInfoMainAddress.Country,
                        AP303000.GeneralInfoMainAddress.State,
                        AP303000.GeneralInfoMainAddress.PostalCode,
                        AP303000.GeneralInfoFinancialSettings.VendorClass,
                        new Field {  ObjectName = AP303000.VendorSummary.VendorID.ObjectName, FieldName = "LastModifiedDateTime"}
                            },
                           new Filter[]
                           {
                         new Filter
                         {
                            Field = new Field { ObjectName = AP303000.VendorSummary.VendorID.ObjectName, FieldName = "LastModifiedDateTime" },
                            Condition = FilterCondition.Greater, Value = lastSyncDate.ToLongDateString()
                         }
                            },
                           0, false, false
                         );
                    Console.Write($"--Get {VendorData.Length} new / modified vendor item(s)."); 
                    
                    //insert vendor 
                    using (SqlConnection connection = new SqlConnection(ConnectionString))
                    {
                        int synced_count = 0;
                        for (int i = 0; i < VendorData.Length; i++)
                        {
                            try
                            {
                                if (connection.State != ConnectionState.Open)
                                {
                                    connection.Open();
                                }

                                using (SqlCommand command = new SqlCommand("Insert_VendorData", connection))
                                {
                                    command.CommandType = CommandType.StoredProcedure;
                                    command.Parameters.AddWithValue("@VendorID", VendorData[i][0]);
                                    command.Parameters.AddWithValue("@VendorName", VendorData[i][1]);
                                    command.Parameters.AddWithValue("@Status", VendorData[i][2]);
                                    command.Parameters.AddWithValue("@CompanyName", VendorData[i][3]);
                                    command.Parameters.AddWithValue("@Phone1", VendorData[i][4]);
                                    command.Parameters.AddWithValue("@Phone2", VendorData[i][5]);
                                    command.Parameters.AddWithValue("@AddressLine1", VendorData[i][6]);
                                    command.Parameters.AddWithValue("@AddressLine2", VendorData[i][7]);
                                    command.Parameters.AddWithValue("@City", VendorData[i][8]);
                                    command.Parameters.AddWithValue("@Country", VendorData[i][9]);
                                    command.Parameters.AddWithValue("@State", VendorData[i][10]);
                                    command.Parameters.AddWithValue("@PostalCode", VendorData[i][11]);
                                    command.Parameters.AddWithValue("@VendorClass", VendorData[i][12]);
                                    command.Parameters.AddWithValue("@LastModifiedDateTime", VendorData[i][13]);

                                    command.ExecuteNonQuery();
                                }
                                synced_count += 1;
                            }
                            catch (Exception e)
                            {
                                Console.WriteLine($"--Insert error! {e.Message}");
                            }
                        }
                        Console.WriteLine($" | {synced_count} data synced");

                    }


                    //get attribute process
                    string[][] VendorAttributes = context.AP303000Export
                        (
                           new Command[]
                           {
                            AP303000.VendorSummary.ServiceCommands.EveryVendorID,
                            AP303000.VendorSummary.VendorID,
                            AP303000.Attributes.Attribute,
                            AP303000.Attributes.Value,
                            new Field {  ObjectName = AP303000.VendorSummary.VendorID.ObjectName, FieldName = "LastModifiedDateTime"}
                                },
                               new Filter[]
                               {
                             new Filter
                             {
                                Field = new Field { ObjectName = AP303000.VendorSummary.VendorID.ObjectName, FieldName = "LastModifiedDateTime" },
                                Condition = FilterCondition.Greater, Value = lastSyncDate.ToLongDateString()
                             }
                                },
                               0, false, false
                         );
                    Console.Write($"--Get {VendorAttributes.Length} new / modified attribute(s).");

                    //insert vendor attribute
                    using (SqlConnection connection = new SqlConnection(ConnectionString))
                    {
                        int synced_count = 0;
                        for (int i = 0; i < VendorAttributes.Length; i++)
                        {
                            try
                            {
                                if (connection.State != ConnectionState.Open)
                                {
                                    connection.Open();
                                }

                                using (SqlCommand command = new SqlCommand("Insert_VendorAttribute", connection))
                                {
                                    command.CommandType = CommandType.StoredProcedure;
                                    command.Parameters.AddWithValue("@VendorID", VendorAttributes[i][0]);
                                    command.Parameters.AddWithValue("@AttributeName", VendorAttributes[i][1]);
                                    command.Parameters.AddWithValue("@AttributeValue", VendorAttributes[i][2]);

                                    command.ExecuteNonQuery();
                                }
                                synced_count += 1;
                            }
                            catch (Exception e)
                            {
                                Console.WriteLine($"--Insert error! {e.Message}");
                            }
                        }
                        Console.WriteLine($" | {synced_count} data synced");

                    }



                    context.Logout();

                }
                else
                {
                    Console.WriteLine("Acumatica login Failed.");
                }

            }
            catch (Exception e)
            {
                context.Logout();
                Console.WriteLine("==============================");
                Console.WriteLine("Acumatica logout Due to Error!!!.");
                Console.WriteLine(e.Message);
            }


        } //end sync warehouse
        #endregion

    }
}
