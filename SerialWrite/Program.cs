using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SerialWrite
{
    class Program
    {
        private static  SerialPort port = new SerialPort("COM5", 9600, Parity.None, 8, StopBits.One);

        [STAThread]
        static void Main(string[] args)
        {
            port.DataReceived += new SerialDataReceivedEventHandler(port_DataReceived);

            // Begin com
            Console.WriteLine("Opening Com Port...");
            port.Open();

            System.Random random = new System.Random();

            while (true)
            {
                decimal pre = Math.Round(new decimal(random.NextDouble() * 20));
                if(pre > 10)
                {

                    byte[] MyMessage = System.Text.Encoding.UTF8.GetBytes($"UT{Math.Round(new decimal(random.NextDouble() * 200 + 200), 2)} KG\n");
                    port.Write(MyMessage, 0, MyMessage.Length);
                }
                else
                {

                    byte[] MyMessage = System.Text.Encoding.UTF8.GetBytes($"ST{Math.Round(new decimal(random.NextDouble() * 200 + 200), 2)} KG\n");
                    port.Write(MyMessage, 0, MyMessage.Length);
                }


                TimeSpan ts = new TimeSpan(0, 0, 0,0,50);
                Thread.Sleep(ts);
            }

            Console.ReadLine();
        }

        private static void port_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            // Show all the incoming data in the port's buffer
            Console.WriteLine(port.ReadExisting());
        }
    }
}
