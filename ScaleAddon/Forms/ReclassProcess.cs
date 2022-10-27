﻿using Acumatica.Auth.Api;
using Acumatica.Auth.Model;
using Acumatica.RESTClient.Client;
using Acumatica.ULT_18_200_001.Api;
using Acumatica.ULT_18_200_001.Model;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Windows.Forms;

namespace ScaleAddon.Forms
{
    public partial class ReclassProcess : Form
    {
        public WarehouseModel Warehouse { get; set; }
        public string ConnectionString { get; set; }
        public AcumaticaCredModel AcumaticaCred { get; set; }
        public ScaleComModel ScaleCom { get; set; }
        public UserModel Userlog { get; set; }
        public FiscalInfo FiscalInfo { get; set; }
        public DateTime currentDate { get; set; }
        public string DocNumber { get; set; }
        private int lastIncrementValue = -1;
        private int lastLotIncrementValue = 0;

        private DataTable dtLot;
        private DataTable dtEntryGrade;
        private DataTable dtDetail;
        private DataTable dtEntry;
        private string LotStockItem = null;
        private string tempPO;
        private string tempKontrak;
        private string tempBuyerName;

        public ReclassProcess()
        {
            InitializeComponent();
        }

        private void ReclassProcess_Load(object sender, EventArgs e)
        {
            if (DocNumber == "<NEW>")
            {
                resetScreen();
            }
            else
            {
                loadProcess();
                resetEntry();
            }
            chkLblPrint.Checked = true;
            optLblSticker.Checked = true;
        }

        #region ThreadSafe

        public delegate void addTextCallback(string someText, Control tb);

        public delegate void setTextCallback(string someText, Control tb);

        public void addText(string someText, Control tb)
        {
            if (tb.InvokeRequired)
            {
                var d = new addTextCallback(addText);
                this.Invoke(d, new object[] { someText, tb });
            }
            else
            {
                tb.Text += someText;
            }
        }

        public void setText(string someText, Control tb)
        {
            if (tb.InvokeRequired)
            {
                var d = new setTextCallback(setText);
                this.Invoke(d, new object[] { someText, tb });
            }
            else
            {
                tb.Text = someText;
            }
        }

        #endregion ThreadSafe

        private void resetScreen()
        {
            currentDate = DateTime.Now;
            tbProcessDate.Text = currentDate.Date.ToString("yyyy-MM-dd");
            DocNumber = "<NEW>";
            checkHold.Checked = true;

            this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}]";

            tbDocNumber.Text = DocNumber;
            tbStatus.Text = "";
            tbTotalCost.Text = "0";
            tbWarehouse.Text = Warehouse.WarehouseID;
            tbAcumaticaIssue.Text = "";
            tbAcumaticaReceipt.Text = "";
            tbBuyerName.Text = "";

            loadComboLot();
            //tempVendorID = "";
            //tempInventoryID = "";
            //tempPO = "";
            //tempPOType = "";
            //tempKontrak = "";
            //tempInventoryID = "";

            resetEntry();
        }

        private void resetEntry()
        {
            loadDetail();

            groupEntry.Text = "Lot Entry [<NEW>]";
            groupEntry.BackgroundImage = null;

            tbEntryLot.Text = "";
            tbEntryInv.Text = "";
            tbEntrySource.Text = "";
            tbEntryStage.Text = "";
            tbEntryForm.Text = "";
            tbEntryCropYear.Text = "";
            tbEntryArea.Text = "";
            tbEntryColor.Text = "";
            tbEntryFerment.Text = "";
            tbEntryLength.Text = "";
            tbEntryStalk.Text = "";
            tbEntryOldDocumentID.Text = "";
            tbEntryOldLot.Text = "";
            tbEntryOldGrade.Text = "";
            tbEntryOldProcess.Text = "";

            tbEntryWeightRope.Text = "";
            tbEntryWeightShipping.Text = "";
            tbEntryWeightReceive.Text = "";
            tbEntryWeightTare.Text = "";
            tbEntryWeightNetto.Text = "";
            tbEntryRemark.Text = "";
            cbEntryGrade.SelectedIndex = -1;

            switch (tbStatus.Text)
            {
                case "OPEN":
                    btnAcumatica.Enabled = true;
                    btnSave.Enabled = true;
                    if (tbDocNumber.Text != "<NEW>") { btnSaveLot.Enabled = true; } else { btnSaveLot.Enabled = false; }
                    checkHold.Enabled = true;
                    btnPrintDoc.Enabled = true;
                    btnPrintDocSum.Enabled = true;
                    if (Userlog.UserRoles.Contains("SUPERVISOR"))
                    {
                        unsyncing.Visible = true;
                        unsyncing.Enabled = false;
                    }
                    else
                    {
                        unsyncing.Visible = false;
                    }
                    break;

                case "SYNCED":
                    btnAcumatica.Enabled = false;
                    btnSave.Enabled = false;
                    btnSaveLot.Enabled = false;
                    checkHold.Enabled = false;
                    btnPrintDoc.Enabled = true;
                    btnPrintDocSum.Enabled = true;
                    if (Userlog.UserRoles.Contains("SUPERVISOR"))
                    {
                        unsyncing.Visible = true;
                        unsyncing.Enabled = true;
                    }
                    else
                    {
                        unsyncing.Visible = false;
                    }
                    break;

                default:
                    btnAcumatica.Enabled = false;
                    btnSave.Enabled = true;
                    if (tbDocNumber.Text != "<NEW>") { btnSaveLot.Enabled = true; } else { btnSaveLot.Enabled = false; }
                    checkHold.Enabled = true;
                    btnPrintDoc.Enabled = false;
                    btnPrintDocSum.Enabled = false;
                    if (Userlog.UserRoles.Contains("SUPERVISOR"))
                    {
                        unsyncing.Visible = true;
                        unsyncing.Enabled = false;
                    }
                    else
                    {
                        unsyncing.Visible = false;
                    }
                    break;
            }



            btnPrintLot.Enabled = false;
        }

        private void loadProcess()
        {
            tbProcessDate.Text = currentDate.Date.ToString("yyyy-MM-dd");
            tbDocNumber.Text = DocNumber;

            this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}]";

            //loadComboLot();

            getDocLastIncrement();

            //load buying registration
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                DataTable dt = new DataTable();
                try
                {
                    string query = $"select * from ReclassProcessLine where DocumentID = '{DocNumber}' and DocumentDate = '{currentDate.Date.ToString("yyyy-MM-dd")}'";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();
                        tbStatus.Text = reader.GetValue(3).ToString();
                        tbTotalCost.Text = Convert.ToDecimal(reader.GetValue(4)).ToString("N2");
                        tbWarehouse.Text = reader.GetValue(2).ToString();
                        tbAcumaticaIssue.Text = reader.GetValue(5).ToString();
                        tbAcumaticaReceipt.Text = reader.GetValue(6).ToString();
                        tbBuyerName.Text = reader.GetValue(7).ToString();
                        checkHold.Checked = Convert.ToBoolean(reader.GetValue(3).ToString() == "HOLD" ? 1 : 0);

                        loadComboLot();
                    }
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.ToString());
                }
            }
        }

        private void loadDetail()
        {
            //load data untuk grid
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                //create new dt
                dtDetail = new DataTable();
                try
                {
                    //string query = $"SELECT * from BuyingRegistration where RegistrationDate = '{currentDate.ToString()}'";

                    string query = $@"SELECT *
                                        FROM
	                                        ReclassProcessLineDetail
                                        WHERE
	                                        DocumentID = '{DocNumber}' ";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();

                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(dtDetail);
                    dgvDetail.DataSource = dtDetail;

                    //Header Text
                    dgvDetail.Columns[0].HeaderText = "Document ID";
                    dgvDetail.Columns[0].Visible = false;
                    dgvDetail.Columns[1].HeaderText = "Inventory ID";
                    dgvDetail.Columns[2].HeaderText = "Sub Item";
                    dgvDetail.Columns[3].HeaderText = "Lot Number";
                    dgvDetail.Columns[4].HeaderText = "Source";
                    dgvDetail.Columns[5].HeaderText = "Stage";
                    dgvDetail.Columns[5].Visible = false;
                    dgvDetail.Columns[6].HeaderText = "Form";
                    dgvDetail.Columns[6].Visible = false;
                    dgvDetail.Columns[7].HeaderText = "Crop Year";
                    dgvDetail.Columns[7].Visible = false;
                    dgvDetail.Columns[8].HeaderText = "Grade";
                    dgvDetail.Columns[8].Visible = false;
                    dgvDetail.Columns[9].HeaderText = "Area";
                    dgvDetail.Columns[10].HeaderText = "Color";
                    dgvDetail.Columns[11].HeaderText = "Fermentation";
                    dgvDetail.Columns[12].HeaderText = "Length";
                    dgvDetail.Columns[13].HeaderText = "Stalk";
                    dgvDetail.Columns[14].HeaderText = "Rope";
                    dgvDetail.Columns[14].DefaultCellStyle.Format = "N2";
                    dgvDetail.Columns[15].HeaderText = "Shipping";
                    dgvDetail.Columns[15].DefaultCellStyle.Format = "N2";
                    dgvDetail.Columns[16].HeaderText = "Receive";
                    dgvDetail.Columns[16].DefaultCellStyle.Format = "N2";
                    dgvDetail.Columns[17].HeaderText = "Tare";
                    dgvDetail.Columns[17].DefaultCellStyle.Format = "N2";
                    dgvDetail.Columns[18].HeaderText = "Netto";
                    dgvDetail.Columns[18].DefaultCellStyle.Format = "N2";
                    dgvDetail.Columns[19].HeaderText = "UoM";
                    dgvDetail.Columns[20].HeaderText = "Unit Price";
                    dgvDetail.Columns[20].DefaultCellStyle.Format = "N2";
                    dgvDetail.Columns[20].Visible = false;
                    dgvDetail.Columns[21].HeaderText = "Remark";
                    dgvDetail.Columns[22].HeaderText = "Synced";
                    dgvDetail.Columns[23].HeaderText = "Old Document ID";
                    dgvDetail.Columns[24].HeaderText = "Old Lot Number";
                    dgvDetail.Columns[25].HeaderText = "Old grade";
                    dgvDetail.Columns[26].HeaderText = "Buyer Name";
                    dgvDetail.Columns[26].Visible = false;

                    dgvDetail.ClearSelection();

                    if (dtDetail.Rows.Count > 0)
                    {
                        int countLot = Convert.ToInt32(dtDetail.Compute("COUNT(LotNbr)", string.Empty));
                        tbDetailLot.Text = countLot.ToString();
                        decimal sumWShipping = Convert.ToDecimal(dtDetail.Compute("SUM(WeightShipping)", string.Empty));
                        tbDetailWShipping.Text = sumWShipping.ToString("N2");
                        decimal sumWReceive = Convert.ToDecimal(dtDetail.Compute("SUM(WeightReceive)", string.Empty));
                        tbDetailWReceive.Text = sumWReceive.ToString("N2");
                        decimal sumWTare = Convert.ToDecimal(dtDetail.Compute("SUM(WeightTare)", string.Empty));
                        tbDetailWTare.Text = sumWTare.ToString("N2");
                        decimal sumWNetto = Convert.ToDecimal(dtDetail.Compute("SUM(WeightNetto)", string.Empty));
                        tbDetailWNetto.Text = sumWNetto.ToString("N2");

                        //tbBuyerName.ReadOnly = true;
                        //tbBuyerName.BackColor = System.Drawing.SystemColors.Info;
                    }
                    else
                    {
                        //tbBuyerName.ReadOnly = false;
                        //tbBuyerName.BackColor = System.Drawing.SystemColors.Window;
                        tbBuyerName.Text = "";
                    }
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.ToString());
                }
            }
        }

        private void loadEntry(string LotNbr)
        {
            //load data untuk grid
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                //create new dt
                dtEntry = new DataTable();
                try
                {
                    //string query = $"SELECT * from BuyingRegistration where RegistrationDate = '{currentDate.ToString()}'";

                    string query = $@"SELECT *
                                        FROM
	                                        StockItem
                                        WHERE
	                                        LotNbr = '{LotNbr}'
                                        AND StatusStock = 1";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();

                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(dtEntry);
                    Console.WriteLine(dtEntry.Rows[0].ItemArray[13].ToString());
                    tbEntryOldDocumentID.Text = dtEntry.Rows[0].ItemArray[0].ToString();
                    tbEntryOldLot.Text = dtEntry.Rows[0].ItemArray[3].ToString();
                    tbEntryOldGrade.Text = dtEntry.Rows[0].ItemArray[8].ToString();
                    tbEntryOldProcess.Text = dtEntry.Rows[0].ItemArray[13].ToString();

                    tbEntryLot.Text = dtEntry.Rows[0].ItemArray[3].ToString();
                    tbEntryInv.Text = dtEntry.Rows[0].ItemArray[1].ToString();
                    tbEntrySource.Text = dtEntry.Rows[0].ItemArray[4].ToString();
                    tbEntryStage.Text = dtEntry.Rows[0].ItemArray[5].ToString();
                    tbEntryForm.Text = dtEntry.Rows[0].ItemArray[6].ToString();
                    tbEntryCropYear.Text = dtEntry.Rows[0].ItemArray[7].ToString();
                    //cbEntryGrade.SelectedIndex = cbEntryGrade.FindStringExact(dtEntry.Rows[0].ItemArray[8].ToString());
                    tbEntryArea.Text = dtEntry.Rows[0].ItemArray[9].ToString();
                    tbEntryColor.Text = dtEntry.Rows[0].ItemArray[10].ToString();
                    tbEntryFerment.Text = dtEntry.Rows[0].ItemArray[11].ToString();
                    tbEntryLength.Text = dtEntry.Rows[0].ItemArray[12].ToString();
                    tbEntryStalk.Text = dtEntry.Rows[0].ItemArray[14].ToString();

                    tbEntryWeightRope.Text = dtEntry.Rows[0].ItemArray[15].ToString();
                    tbEntryWeightShipping.Text = dtEntry.Rows[0].ItemArray[16].ToString();
                    tbEntryWeightReceive.Text = dtEntry.Rows[0].ItemArray[17].ToString();
                    tbEntryWeightTare.Text = dtEntry.Rows[0].ItemArray[18].ToString();
                    tbEntryWeightNetto.Text = dtEntry.Rows[0].ItemArray[19].ToString();
                    tbEntryWeightUoM.Text = dtEntry.Rows[0].ItemArray[20].ToString();

                    tbEntryRemark.Text = dtEntry.Rows[0].ItemArray[21].ToString();
                    tempBuyerName = dtEntry.Rows[0].ItemArray[24].ToString();
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.ToString());
                }
            }
        }

        private void setDocNumber()
        {
            getDocLastIncrement();

            if (lastIncrementValue >= 0)
            {

                var currentIncrement = lastIncrementValue + 1;
                //tbDocNumber.Text = $"{currentDate.ToString("yy")}{Warehouse.WarehouseID}-RC/IN-{currentIncrement.ToString().PadLeft(4, '0')}";
                //tbDocNumber.Text = $"{Math.Abs(FiscalInfo.CurrentFiscalYear) % 100}{Warehouse.WarehouseID}-RC/IN-{currentIncrement.ToString().PadLeft(4, '0')}";
                var docNbr = $"{Math.Abs(FiscalInfo.CurrentFiscalYear) % 100}{Warehouse.WarehouseID}-RC/IN-{currentIncrement.ToString().PadLeft(4, '0')}";

                if (!checkDocNbrExist(docNbr))
                {
                    tbDocNumber.Text = docNbr;
                }
                else
                {
                    tbDocNumber.Text = "<NEW>";
                    MessageBox.Show($"Document number {docNbr} already exist, or unable to check existing document number!", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }


            }

        }

        private bool checkDocNbrExist(string docNbr)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                //clear
                try
                {
                    string query = $"IF EXISTS ( SELECT * FROM ReclassProcessLine WHERE DocumentID = '{docNbr}' ) BEGIN SELECT 1 END ELSE BEGIN SELECT 0 END";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();
                        int exist = Convert.ToInt32(reader.GetValue(0).ToString());
                        //if (currentDate.Year == dbDate.Year)
                        if (exist == 1)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return true;
                    }
                }
                catch (Exception e)
                {
                    return true;
                    //MessageBox.Show(e.ToString());
                }
            }
        }

        private void setLotNbr()
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                //clear
                DataTable dt = new DataTable();
                try
                {
                    string query = "select * from NumberingSetting where NumberingID = 'RC/LOT'";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();

                        DateTime dbDate = Convert.ToDateTime(reader.GetValue(2).ToString());
                        int dbIncrement = Convert.ToInt32(reader.GetValue(1).ToString());
                        //if (currentDate.Year == dbDate.Year)
                        if (currentDate.AddMonths(-FiscalInfo.StartingFiscalMonth).AddMonths(1).Year == dbDate.AddMonths(-FiscalInfo.StartingFiscalMonth).AddMonths(1).Year)
                        {
                            lastLotIncrementValue = dbIncrement;
                        }
                        else
                        {
                            lastLotIncrementValue = 0;
                        }
                    }
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.ToString());
                }
            }
            var currentLotIncrement = lastLotIncrementValue + 1;

            string lotnbr = $"{Math.Abs(FiscalInfo.CurrentFiscalYear) % 100}{Warehouse.WarehouseID}-{tbEntryInv.Text}{tbEntrySource.Text}RC{tbEntryForm.Text}{currentLotIncrement.ToString().PadLeft(5, '0')}";
            tbEntryLot.Text = lotnbr.Trim();
        }

        private void getDocLastIncrement()
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                //clear
                DataTable dt = new DataTable();
                try
                {
                    string query = "select * from NumberingSetting where NumberingID = 'RC/IN'";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();

                        DateTime dbDate = Convert.ToDateTime(reader.GetValue(2).ToString());
                        int dbIncrement = Convert.ToInt32(reader.GetValue(1).ToString());
                        //if (currentDate.Year == dbDate.Year)
                        if (currentDate.AddMonths(-FiscalInfo.StartingFiscalMonth).AddMonths(1).Year == dbDate.AddMonths(-FiscalInfo.StartingFiscalMonth).AddMonths(1).Year)
                        {
                            lastIncrementValue = dbIncrement;
                        }
                        else
                        {
                            lastIncrementValue = 0;
                        }
                    }
                    else
                    {
                        lastIncrementValue = 0;
                    }
                }
                catch (Exception e)
                {
                    lastIncrementValue = -1;
                    MessageBox.Show(e.ToString());
                }
            }
        }

        private void loadComboLot()
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                //clear combo
                //cbFarmer.DataSource = null;
                dtLot = new DataTable();
                try
                {
                    string query = $@"SELECT
	                                    StockItem.LotNbr
                                    FROM
	                                    dbo.StockItem
                                    WHERE
	                                    StockItem.StatusStock = 1
                                    AND DocumentID != '{DocNumber}'
                                    AND BuyerName like '%{tempBuyerName}%'";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();

                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(dtLot);
                    string[] arrray = dtLot.Rows.OfType<DataRow>().Select(k => k[0].ToString()).ToArray();

                    //new AutoCompleteBehavior(cbLot);
                    cbLot.Items.Clear();
                    cbLot.Items.AddRange(arrray);
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.ToString());
                }
            }
        }

        private void loadComboGrade()
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                //clear combo
                //cbFarmer.DataSource = null;
                cbEntryGrade.SelectedIndex = -1;

                dtEntryGrade = new DataTable();
                try
                {
                    string query = $"select * from TobaccoGrade where InventoryID = '{tbEntryInv.Text}' and ProcessID = 'RC' and WarehouseID = '{tbWarehouse.Text}'";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();

                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(dtEntryGrade);
                    string[] arrray = dtEntryGrade.Rows.OfType<DataRow>().Select(k => k[3].ToString()).ToArray();

                    //new AutoCompleteBehavior(cbEntryGrade);
                    cbEntryGrade.Items.Clear();
                    cbEntryGrade.Items.AddRange(arrray);
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.ToString());
                }
            }
        }

        private void saveDocument()
        {
            bool incrementError = false;
            int OperationType = 1;

            if (DocNumber == "<NEW>")
            {
                incrementError = true;
                OperationType = 0;
                setDocNumber();
                //tbStatus.Text = "OPEN";

                if (DocNumber != "<NEW>" && lastIncrementValue >= 0)
                {
                    incrementError = false;

                    if (checkHold.Checked)
                    {
                        tbStatus.Text = "HOLD";
                    }
                    else
                    {
                        tbStatus.Text = "OPEN";
                    }
                    lastIncrementValue = lastIncrementValue + 1;
                    //DocNumber = tbDocNumber.Text;

                }


            }
            bool insertError = false;

            if (!incrementError)
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    try
                    {
                        if (connection.State != ConnectionState.Open)
                        {
                            connection.Open();
                        }

                        using (SqlCommand command = new SqlCommand("Insert_ReclassProcessLine_v2", connection))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@DocumentID", tbDocNumber.Text);
                            command.Parameters.AddWithValue("@DocumentDate", tbProcessDate.Text);
                            command.Parameters.AddWithValue("@WarehouseID", tbWarehouse.Text);
                            command.Parameters.AddWithValue("@Status", tbStatus.Text);
                            command.Parameters.AddWithValue("@TotalCost", tbTotalCost.Text.Replace(",", ""));
                            command.Parameters.AddWithValue("@AcumaticaIssueRefNbr", tbAcumaticaIssue.Text);
                            command.Parameters.AddWithValue("@AcumaticaReceiptRefNbr", tbAcumaticaReceipt.Text);
                            command.Parameters.AddWithValue("@BuyerName", tbBuyerName.Text);
                            command.Parameters.AddWithValue("@CreatorID", Userlog.UserName);
                            command.Parameters.AddWithValue("@OperationType", OperationType);

                            command.ExecuteNonQuery();
                        }
                    }
                    catch (Exception e_update)
                    {
                        MessageBox.Show($"--Insert error! {e_update.Message}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        insertError = true;
                        tbDocNumber.Text = "<NEW>";
                    }
                    //finally
                    //{
                    //    if (!insertError)
                    //    {
                    //        this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}]";

                    //        using (SqlCommand command = new SqlCommand("Insert_NumberingSetting", connection))
                    //        {
                    //            command.CommandType = CommandType.StoredProcedure;
                    //            command.Parameters.AddWithValue("@NumberingID", "RC/IN");
                    //            command.Parameters.AddWithValue("@LastIncrementValue", lastIncrementValue);
                    //            command.Parameters.AddWithValue("@NumberingDate", currentDate);

                    //            command.ExecuteNonQuery();
                    //        }

                    //        //MessageBox.Show("Save complete...", "Information", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    //    }
                    //}

                    try
                    {
                        if (connection.State != ConnectionState.Open)
                        {
                            connection.Open();
                        }

                        if (!insertError && this.Text.Contains("<NEW>"))
                        {
                            this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}]";

                            using (SqlCommand command = new SqlCommand("Insert_NumberingSetting", connection))
                            {
                                command.CommandType = CommandType.StoredProcedure;
                                command.Parameters.AddWithValue("@NumberingID", "RC/IN");
                                command.Parameters.AddWithValue("@LastIncrementValue", lastIncrementValue);
                                command.Parameters.AddWithValue("@NumberingDate", currentDate);

                                command.ExecuteNonQuery();
                            }

                            MessageBox.Show("Save complete...", "Information", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }

                    }
                    catch (Exception e_update)
                    {
                        MessageBox.Show($"Update numbering setting failed, please contact IT", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        insertError = true;
                    }

                }
            }
            else
            {
                MessageBox.Show($"Failed to get numbering setting, please check database connection and try to save again", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }



            if (tbStatus.Text == "OPEN" && !checkHold.Checked)
            {
                btnAcumatica.Enabled = true;
            }
            else
            {
                btnAcumatica.Enabled = false;
            }
            if (tbStatus.Text == "OPEN" || tbStatus.Text == "SYNCED")
            {
                btnPrintDoc.Enabled = true;
                btnPrintDocSum.Enabled = true;
            }
            else
            {
                btnPrintDoc.Enabled = false;
                btnPrintDocSum.Enabled = false;
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            saveDocument();
            loadDetail();
            resetEntry();
        }

        private void cbLot_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbLot.SelectedIndex >= 0)
            {
                loadEntry(cbLot.SelectedItem.ToString());

                loadComboGrade();

                cbEntryGrade.SelectedIndex = cbEntryGrade.FindStringExact(tbEntryOldGrade.Text);
                setLotNbr();
            }
        }

        private void saveLot(int OperationType)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                bool insertError = false;
                try
                {
                    if (connection.State != ConnectionState.Open)
                    {
                        connection.Open();
                    }

                    var tempGrade = cbEntryGrade.SelectedItem.ToString().Split('|')[0].Trim();

                    using (SqlCommand command = new SqlCommand("Insert_ReclassProcessLineDetail_v2", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@DocumentID", DocNumber);
                        command.Parameters.AddWithValue("@InventoryID", tbEntryInv.Text);
                        command.Parameters.AddWithValue("@SubItem", $"{tbEntryStage.Text}.{tbEntryForm.Text}.{tbEntryCropYear.Text}.{tempGrade}");
                        command.Parameters.AddWithValue("@LotNbr", tbEntryLot.Text);
                        command.Parameters.AddWithValue("@Source", tbEntrySource.Text);
                        command.Parameters.AddWithValue("@Stage", tbEntryStage.Text);
                        command.Parameters.AddWithValue("@tForm", tbEntryForm.Text);
                        command.Parameters.AddWithValue("@CropYear", tbEntryCropYear.Text);
                        command.Parameters.AddWithValue("@Grade", tempGrade);
                        command.Parameters.AddWithValue("@Area", tbEntryArea.Text);
                        command.Parameters.AddWithValue("@Color", tbEntryColor.Text);
                        command.Parameters.AddWithValue("@Fermentation", tbEntryFerment.Text);
                        command.Parameters.AddWithValue("@Length", tbEntryLength.Text);
                        command.Parameters.AddWithValue("@StalkPosition", tbEntryStalk.Text);
                        command.Parameters.AddWithValue("@WeightRope", Convert.ToDecimal(tbEntryWeightRope.Text == "" ? "0" : tbEntryWeightRope.Text.Replace(",", "")));
                        command.Parameters.AddWithValue("@WeightShipping", Convert.ToDecimal(tbEntryWeightShipping.Text == "" ? "0" : tbEntryWeightShipping.Text.Replace(",", "")));
                        command.Parameters.AddWithValue("@WeightReceive", Convert.ToDecimal(tbEntryWeightReceive.Text == "" ? "0" : tbEntryWeightReceive.Text.Replace(",", "")));
                        command.Parameters.AddWithValue("@WeightTare", Convert.ToDecimal(tbEntryWeightTare.Text == "" ? "0" : tbEntryWeightTare.Text.Replace(",", "")));
                        command.Parameters.AddWithValue("@WeightNetto", Convert.ToDecimal(tbEntryWeightNetto.Text == "" ? "0" : tbEntryWeightNetto.Text.Replace(",", "")));
                        command.Parameters.AddWithValue("@UoM", tbEntryWeightUoM.Text);
                        command.Parameters.AddWithValue("@CostUnit", 0);
                        command.Parameters.AddWithValue("@Remark", tbEntryRemark.Text);
                        command.Parameters.AddWithValue("@SyncDetail", 0);
                        command.Parameters.AddWithValue("@OldDocumentID", tbEntryOldDocumentID.Text);
                        command.Parameters.AddWithValue("@OldLotNbr", tbEntryOldLot.Text);
                        command.Parameters.AddWithValue("@OldGrade", tbEntryOldGrade.Text);
                        command.Parameters.AddWithValue("@OldProcess", tbEntryOldProcess.Text);
                        command.Parameters.AddWithValue("@BuyerName", tempBuyerName ?? "");
                        command.Parameters.AddWithValue("@OperationType", OperationType);

                        command.ExecuteNonQuery();
                    }
                }
                catch (Exception e_update)
                {
                    MessageBox.Show($"--Insert error! {e_update.Message}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    insertError = true;
                }
                finally
                {
                    //if (!groupEntry.Text.Contains(tbEntryLot.Text))
                    //{
                    //    groupEntry.Text = $"Lot Entry [{tbEntryLot.Text}]";
                    //    lastLotIncrementValue = lastLotIncrementValue + 1;

                    //    using (SqlCommand command = new SqlCommand("Insert_NumberingSetting", connection))
                    //    {
                    //        command.CommandType = CommandType.StoredProcedure;
                    //        command.Parameters.AddWithValue("@NumberingID", "RC/LOT");
                    //        command.Parameters.AddWithValue("@LastIncrementValue", lastLotIncrementValue);
                    //        command.Parameters.AddWithValue("@NumberingDate", currentDate);

                    //        command.ExecuteNonQuery();
                    //    }
                    //}

                    //tbBuyerName.Text = tempBuyerName;
                    ////MessageBox.Show("Save lot complete...", "Information", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    ////resetEntry();

                    //var lotNbr = tbEntryLot.Text;
                    //loadDetail();
                    ////fix selected row
                    //foreach (DataGridViewRow row in dgvDetail.Rows)
                    //{
                    //    if (row.Cells[3].Value.ToString() == lotNbr)
                    //        row.Selected = true;
                    //}

                    //if (!groupEntry.Text.Contains("<NEW>"))
                    //{

                    //    //groupEntry.Text = $"Lot Entry [{tbEntryLot.Text}]";
                    //    btnPrintLot.Enabled = true;
                    //    //trigger print
                    //    btnPrintLot.PerformClick();

                    //    cbLot.SelectedIndex = -1;
                    //    resetEntry();
                    //    loadComboLot();
                    //}

                }

                try
                {
                    if (connection.State != ConnectionState.Open)
                    {
                        connection.Open();
                    }

                    if (!insertError)
                    {

                        if (!groupEntry.Text.Contains(tbEntryLot.Text))
                        {
                            groupEntry.Text = $"Lot Entry [{tbEntryLot.Text}]";
                            lastLotIncrementValue = lastLotIncrementValue + 1;

                            using (SqlCommand command = new SqlCommand("Insert_NumberingSetting", connection))
                            {
                                command.CommandType = CommandType.StoredProcedure;
                                command.Parameters.AddWithValue("@NumberingID", "RC/LOT");
                                command.Parameters.AddWithValue("@LastIncrementValue", lastLotIncrementValue);
                                command.Parameters.AddWithValue("@NumberingDate", currentDate);

                                command.ExecuteNonQuery();
                            }
                        }

                        tbBuyerName.Text = tempBuyerName;
                        //MessageBox.Show("Save lot complete...", "Information", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        //resetEntry();

                        var lotNbr = tbEntryLot.Text;
                        loadDetail();
                        //fix selected row
                        foreach (DataGridViewRow row in dgvDetail.Rows)
                        {
                            if (row.Cells[3].Value.ToString() == lotNbr)
                                row.Selected = true;
                        }

                        if (!groupEntry.Text.Contains("<NEW>"))
                        {

                            //groupEntry.Text = $"Lot Entry [{tbEntryLot.Text}]";
                            btnPrintLot.Enabled = true;
                            //trigger print
                            btnPrintLot.PerformClick();

                            cbLot.SelectedIndex = -1;
                            resetEntry();
                            loadComboLot();
                        }
                    }

                    //MessageBox.Show("Save lot complete...", "Information", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    //resetEntry();

                }
                catch (Exception e_update)
                {
                    MessageBox.Show($"Update numbering setting failed, please contact IT", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    insertError = true;
                }



            }
        }

        private void btnSaveLot_Click(object sender, EventArgs e)
        {
            if (tbEntryLot.Text !="" && cbEntryGrade.SelectedIndex >=0  )
            {
                if (DocNumber == "<NEW>")
                {
                    saveDocument();
                }

                if (DocNumber != "<NEW>")
                {
                    if (groupEntry.Text.Contains("<NEW>"))
                    {
                        if (tbEntryInv.Text != "")
                        {
                            setLotNbr();

                            string lotnbr = tbEntryLot.Text;

                            if (!checkLotNbrExist(lotnbr))
                            {
                                tbEntryLot.Text = lotnbr.Trim();

                                saveLot(0);
                                tbLot.Text = "";
                                tbLot.Focus();
                            }
                            else
                            {
                                MessageBox.Show($"Lot number {lotnbr} already exist, or unable to check existing lot number!", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            }
                        }
                        else
                        {
                            MessageBox.Show($"Please select inventory first!", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }

                    }
                    else
                    {
                        saveLot(1);
                        tbLot.Text = "";
                    }
                }

            }
            else
            {
                MessageBox.Show($"Data not valid, please choose a lot and/or grade!", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }

        }

        private bool checkLotNbrExist(string lotnbr)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                //clear
                try
                {
                    string query = $"IF EXISTS ( SELECT * FROM StockItem WHERE LotNbr = '{lotnbr}' ) BEGIN SELECT 1 END ELSE BEGIN SELECT 0 END";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();
                        int exist = Convert.ToInt32(reader.GetValue(0).ToString());
                        //if (currentDate.Year == dbDate.Year)
                        if (exist == 1)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return true;
                    }
                }
                catch (Exception e)
                {
                    return true;
                    //MessageBox.Show(e.ToString());
                }
            }
        }
        private void dgvDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvDetail.SelectedRows.Count > 0)
            {
                var lotNbr = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[3].Value.ToString();
                if (checkLotNbrInSTock(lotNbr))
                {
                    Console.WriteLine(11);
                    tbEntryInv.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[1].FormattedValue.ToString();
                    tbEntrySource.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[4].FormattedValue.ToString();
                    tbEntryStage.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[5].FormattedValue.ToString();
                    tbEntryForm.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[6].FormattedValue.ToString();
                    tbEntryCropYear.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[7].FormattedValue.ToString();
                    //cbEntryGrade.SelectedIndex = cbEntryGrade.FindStringExact(dtEntry.Rows[0].ItemArray[8].ToString());
                    loadComboGrade();
                    cbEntryGrade.SelectedIndex = cbEntryGrade.FindStringExact(dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[8].FormattedValue.ToString());
                    tbEntryArea.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[9].FormattedValue.ToString();
                    tbEntryColor.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[10].FormattedValue.ToString();
                    tbEntryFerment.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[11].FormattedValue.ToString();
                    tbEntryLength.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[12].FormattedValue.ToString();
                    tbEntryStalk.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[13].FormattedValue.ToString();

                    tbEntryWeightRope.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[14].Value.ToString();
                    tbEntryWeightShipping.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[15].Value.ToString();
                    tbEntryWeightReceive.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[16].Value.ToString();
                    tbEntryWeightTare.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[17].Value.ToString();
                    tbEntryWeightNetto.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[18].Value.ToString();
                    tbEntryWeightUoM.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[19].Value.ToString();
                    tbEntryRemark.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[22].Value.ToString();

                    tbEntryOldDocumentID.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[23].FormattedValue.ToString();
                    tbEntryOldLot.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[24].FormattedValue.ToString();
                    tbEntryOldGrade.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[25].FormattedValue.ToString();
                    tbEntryOldProcess.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[27].FormattedValue.ToString();

                    //var lotNbr = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[3].Value.ToString();
                    groupEntry.Text = $"Lot Entry [{dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[3].Value.ToString()}]";
                    groupEntry.BackgroundImage = Properties.Resources.editMode;
                    tbEntryLot.Text = lotNbr;
                    if (tbStatus.Text == "SYNCED")
                    {
                        btnSaveLot.Enabled = false;
                        groupEntry.BackgroundImage = Properties.Resources.viewMode;
                        btnPrintLot.Enabled = true;
                    }
                    else
                    {
                        btnSaveLot.Enabled = true;
                        btnPrintLot.Enabled = false;
                    }


                   
                }
                else
                {
                    tbEntryInv.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[1].FormattedValue.ToString();
                    tbEntrySource.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[4].FormattedValue.ToString();
                    tbEntryStage.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[5].FormattedValue.ToString();
                    tbEntryForm.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[6].FormattedValue.ToString();
                    tbEntryCropYear.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[7].FormattedValue.ToString();
                    //cbEntryGrade.SelectedIndex = cbEntryGrade.FindStringExact(dtEntry.Rows[0].ItemArray[8].ToString());
                    loadComboGrade();
                    cbEntryGrade.SelectedIndex = cbEntryGrade.FindStringExact(dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[8].FormattedValue.ToString());
                    tbEntryArea.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[9].FormattedValue.ToString();
                    tbEntryColor.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[10].FormattedValue.ToString();
                    tbEntryFerment.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[11].FormattedValue.ToString();
                    tbEntryLength.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[12].FormattedValue.ToString();
                    tbEntryStalk.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[13].FormattedValue.ToString();

                    tbEntryWeightRope.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[14].Value.ToString();
                    tbEntryWeightShipping.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[15].Value.ToString();
                    tbEntryWeightReceive.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[16].Value.ToString();
                    tbEntryWeightTare.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[17].Value.ToString();
                    tbEntryWeightNetto.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[18].Value.ToString();
                    tbEntryWeightUoM.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[19].Value.ToString();
                    tbEntryRemark.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[22].Value.ToString();

                    tbEntryOldDocumentID.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[23].FormattedValue.ToString();
                    tbEntryOldLot.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[24].FormattedValue.ToString();
                    tbEntryOldGrade.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[25].FormattedValue.ToString();
                    tbEntryOldProcess.Text = dgvDetail.Rows[dgvDetail.SelectedRows[0].Index].Cells[27].FormattedValue.ToString();

                    tbEntryLot.Text = lotNbr;
                    groupEntry.BackgroundImage = Properties.Resources.viewMode;
                    tbEntryLot.Text = lotNbr;
                    btnSaveLot.Enabled = false;
                    btnPrintLot.Enabled = true;
                }


            }
        }


        private void tbDocNumber_TextChanged(object sender, EventArgs e)
        {
            DocNumber = ((TextBox)sender).Text;
        }

        private void btnAcumatica_Click(object sender, EventArgs e)
        {
            this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}] - Syncing with Acumatica, please wait!";
            bool syncError = false;
            bool allSynced = true;
            string msalahdocNbr = "";
            string docNbr = "";
            string referenceIssueNbr = tbAcumaticaIssue.Text ?? "";
            string referenceReceiptNbr = tbAcumaticaReceipt.Text ?? "";
            var docBranch = GetBranch(tbWarehouse.Text, 2);

            loadDetail();
            DataView dv_filter = new DataView(dtDetail, $"SyncDetail = 0", "LotNbr Asc", DataViewRowState.CurrentRows);

            //issue
            ULTInventoryIssue inventoryIssue = new ULTInventoryIssue();
            inventoryIssue.Date = Convert.ToDateTime(tbProcessDate.Text);
            inventoryIssue.Description = $"{tbWarehouse.Text} Reclass Transaction Issue";
            inventoryIssue.ExternalRef = tbDocNumber.Text;
            //inventoryIssue.Hold = false;

            List<ULTInventoryIssueDetail> issueDetails = new List<ULTInventoryIssueDetail>();

            //receipt
            InventoryReceipt inventoryReceipt = new InventoryReceipt();
            inventoryReceipt.Date = Convert.ToDateTime(tbProcessDate.Text);
            inventoryReceipt.Branch = docBranch;
            inventoryReceipt.Description = $"{tbWarehouse.Text} Reclass Transaction Receipt";
            inventoryReceipt.ExternalRef = tbDocNumber.Text;
            inventoryReceipt.Hold = false;

            List<InventoryReceiptDetail> receiptDetails = new List<InventoryReceiptDetail>();

            ////document details
            foreach (DataRowView rowView in dv_filter)
            {
                //check if doc buying already synced
                if (docNbr != rowView[23].ToString())
                {
                    docNbr = rowView[23].ToString();
                    if (!checkDocumentSync(docNbr))
                    {
                        msalahdocNbr= rowView[23].ToString();
                        allSynced = false;
                    }
                }

                var oldSubItem = $"{ rowView[5].ToString()}{ rowView[6].ToString()}{ rowView[7].ToString()}{ rowView[25].ToString()}";
                ULTInventoryIssueDetail issueDetail = new ULTInventoryIssueDetail();
                issueDetail.InventoryID = rowView[1].ToString();
                issueDetail.Branch = docBranch;
                issueDetail.Location = AcumaticaCred.AcumaticaInvLocation;
                issueDetail.Subitem = oldSubItem;
                issueDetail.Quantity = Convert.ToDecimal(rowView[18]);
                issueDetail.Description = rowView[24].ToString();
                issueDetail.Warehouse = tbWarehouse.Text;
                issueDetail.UOM = rowView[19].ToString();
                issueDetail.ReasonCode = "ISSUERECLASS";
                //issueDetail.LotSerialNbr = "";

                issueDetails.Add(issueDetail);

            }

            inventoryIssue.Details = issueDetails;
            //inventoryReceipt.Details = receiptDetails;

            if (!allSynced && tbAcumaticaIssue.Text == "")
            {
                MessageBox.Show($"Documents {msalahdocNbr} for bale is not synced to Acumatica!\nPlease sync Buying documents first", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                var authApi = new AuthApi(AcumaticaCred.AcumaticaSiteURL);
                var configuration = LogIn(authApi, AcumaticaCred.AcumaticaSiteURL, AcumaticaCred.AcumaticaUser, AcumaticaCred.AcumaticaPassword, AcumaticaCred.AcumaticaTenant, AcumaticaCred.AcumaticaBranch, AcumaticaCred.AcumaticaLocale);
                try
                {


                    var inventoryIssueApi = new ULTInventoryIssueApi(configuration);
                    if (referenceIssueNbr == "")
                    {
                        var responseIssue = inventoryIssueApi.PutEntity(inventoryIssue);
                        referenceIssueNbr = responseIssue.ReferenceNbr.ToString();
                        tbAcumaticaIssue.Text = referenceIssueNbr;
                        saveDocument();


                        ReleaseFromHoldInventoryIssue releaseFromHoldInventoryIssue = new ReleaseFromHoldInventoryIssue((ULTInventoryIssue)responseIssue);
                        inventoryIssueApi.InvokeAction(releaseFromHoldInventoryIssue);

                        ////throw new InvalidOperationException("error");
                        ReleaseInventoryIssue releaseInventoryIssue = new ReleaseInventoryIssue((ULTInventoryIssue)responseIssue);
                        inventoryIssueApi.InvokeAction(releaseInventoryIssue);

                    }
                    else
                    {
                        var responseIssue = inventoryIssueApi.GetList(select: "ReferenceNbr", filter: $"ReferenceNbr eq '{referenceIssueNbr}'");



                        if (responseIssue[0].Status.Value == "Balanced")
                        {
                            ReleaseInventoryIssue releaseInventoryIssue = new ReleaseInventoryIssue((ULTInventoryIssue)responseIssue[0]);
                            inventoryIssueApi.InvokeAction(releaseInventoryIssue);

                        }

                        if (responseIssue[0].Status.Value == "On Hold")
                        {
                            ReleaseFromHoldInventoryIssue releaseFromHoldInventoryIssue = new ReleaseFromHoldInventoryIssue((ULTInventoryIssue)responseIssue[0]);
                            inventoryIssueApi.InvokeAction(releaseFromHoldInventoryIssue);

                            ReleaseInventoryIssue releaseInventoryIssue = new ReleaseInventoryIssue((ULTInventoryIssue)responseIssue[0]);
                            inventoryIssueApi.InvokeAction(releaseInventoryIssue);
                        }
                    }

                }
                catch (Exception ePut)
                {
                    MessageBox.Show($"--Sync error! {ePut.Message}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    syncError = true;
                }
                finally
                {

                    if (!syncError)
                    {
                        tbTotalCost.Text = checkTotalReleaseCost(referenceIssueNbr, configuration).ToString("N2");
                    }

                    authApi.AuthLogout();
                    if (!syncError)
                    {
                        this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}]";
                        //tbStatus.Text = "SYNCED";
                        //saveDocument();
                        //MessageBox.Show($"--Sync Complete!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                        using (SqlConnection connection = new SqlConnection(ConnectionString))
                        {
                            try
                            {
                                if (connection.State != ConnectionState.Open)
                                {
                                    connection.Open();
                                }

                                foreach (DataRowView rowView in dv_filter)
                                {
                                    var rowDocNumber = rowView[0].ToString();
                                    var rowLotNumber = rowView[3].ToString();

                                    using (SqlCommand command = new SqlCommand("Update_ReclassProcessLineDetail_Sync", connection))
                                    {
                                        command.CommandType = CommandType.StoredProcedure;
                                        command.Parameters.AddWithValue("@DocumentID", rowDocNumber);
                                        command.Parameters.AddWithValue("@LotNbr", rowLotNumber);
                                        command.Parameters.AddWithValue("@SyncDetail", 1);

                                        command.ExecuteNonQuery();
                                    }
                                }
                            }
                            catch (Exception e_update)
                            {
                                MessageBox.Show($"--Update sync status error! {e_update.Message}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            }
                        }
                        resetEntry();
                        saveDocument();
                    }
                }
            }//end if

            if (tbAcumaticaIssue.Text != "")
            {
                this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}] - Syncing with Acumatica, please wait!";

                loadDetail();

                foreach (DataRow row in dtDetail.Rows)
                {
                    InventoryReceiptDetail receiptDetail = new InventoryReceiptDetail();
                    receiptDetail.InventoryID = row[1].ToString();
                    receiptDetail.Branch = docBranch;
                    receiptDetail.Location = AcumaticaCred.AcumaticaInvLocation;
                    receiptDetail.Subitem = row[2].ToString().Replace(".", "");
                    receiptDetail.Qty = Convert.ToDecimal(row[18]);
                    receiptDetail.Description = row[3].ToString();
                    receiptDetail.WarehouseID = tbWarehouse.Text;
                    receiptDetail.UnitCost = Convert.ToDecimal(row[20]);
                    receiptDetail.UOM = row[19].ToString();
                    receiptDetail.ReasonCode = "RECEIPTRECLASS";
                    //receiptDetail.LotSerialNbr = "";

                    receiptDetails.Add(receiptDetail);
                }

                inventoryReceipt.Details = receiptDetails;

                var authApi = new AuthApi(AcumaticaCred.AcumaticaSiteURL);
                var configuration = LogIn(authApi, AcumaticaCred.AcumaticaSiteURL, AcumaticaCred.AcumaticaUser, AcumaticaCred.AcumaticaPassword, AcumaticaCred.AcumaticaTenant, AcumaticaCred.AcumaticaBranch, AcumaticaCred.AcumaticaLocale);
                try
                {

                    var inventoryReceiptApi = new InventoryReceiptApi(configuration);
                    if (referenceReceiptNbr == "")
                    {
                        var responseReceipt = inventoryReceiptApi.PutEntity(inventoryReceipt);

                        referenceReceiptNbr = responseReceipt.ReferenceNbr.ToString();
                        tbAcumaticaReceipt.Text = referenceReceiptNbr;
                        saveDocument();

                        //throw new InvalidOperationException("error");
                        ReleaseInventoryReceipt releaseInventoryReceipt = new ReleaseInventoryReceipt((InventoryReceipt)responseReceipt);
                        inventoryReceiptApi.InvokeAction(releaseInventoryReceipt);

                    }
                    else
                    {
                        var responseReceipt = inventoryReceiptApi.GetList(select: "ReferenceNbr", filter: $"ReferenceNbr eq '{referenceReceiptNbr}'");

                        ReleaseInventoryReceipt releaseInventoryReceipt = new ReleaseInventoryReceipt((InventoryReceipt)responseReceipt[0]);
                        inventoryReceiptApi.InvokeAction(releaseInventoryReceipt);
                    }
                }
                catch (Exception ePut)
                {
                    MessageBox.Show($"--Sync error! {ePut.Message}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    syncError = true;
                }
                finally
                {
                    authApi.AuthLogout();
                    tbStatus.Text = "SYNCED";
                    saveDocument();

                    if (!syncError)
                    {
                        this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}]";
                        //tbStatus.Text = "SYNCED";
                        saveDocument();
                        MessageBox.Show($"--Sync Complete!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                        resetEntry();
                        saveDocument();
                    }
                }
            }
        }


        /* private void btnAcumatica_Click(object sender, EventArgs e)
         {
             this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}] - Syncing with Acumatica, please wait!";
             bool syncError = false;
             bool allSynced = true;
             string docNbr = "";
             string referenceIssueNbr = "";
             string referenceReceiptNbr = "";
             var docBranch = GetBranch(tbWarehouse.Text,2);

             loadDetail();
             DataView dv_filter = new DataView(dtDetail, $"SyncDetail = 0", "LotNbr Asc", DataViewRowState.CurrentRows);

             //issue
             ULTInventoryIssue inventoryIssue = new ULTInventoryIssue();
             inventoryIssue.Date = Convert.ToDateTime(tbProcessDate.Text);
             inventoryIssue.Description = $"{tbWarehouse.Text} Reclass Transaction Issue";
             inventoryIssue.ExternalRef = tbDocNumber.Text;
             //inventoryIssue.Hold = false;

             List<ULTInventoryIssueDetail> issueDetails = new List<ULTInventoryIssueDetail>();

             //receipt
             InventoryReceipt inventoryReceipt = new InventoryReceipt();
             inventoryReceipt.Date = Convert.ToDateTime(tbProcessDate.Text);
             inventoryReceipt.Branch = docBranch;
             inventoryReceipt.Description = $"{tbWarehouse.Text} Reclass Transaction Receipt";
             inventoryReceipt.ExternalRef = tbDocNumber.Text;
             inventoryReceipt.Hold = false;

             List<InventoryReceiptDetail> receiptDetails = new List<InventoryReceiptDetail>();

             ////document details
             foreach (DataRowView rowView in dv_filter)
             {
                 //check if doc buying already synced
                 if (docNbr != rowView[23].ToString())
                 {
                     docNbr = rowView[23].ToString();
                     if (!checkDocumentSync(docNbr))
                     {
                         allSynced = false;
                     }
                 }

                 var oldSubItem = $"{ rowView[5].ToString()}{ rowView[6].ToString()}{ rowView[7].ToString()}{ rowView[25].ToString()}";
                 ULTInventoryIssueDetail issueDetail = new ULTInventoryIssueDetail();
                 issueDetail.InventoryID = rowView[1].ToString();
                 issueDetail.Branch = docBranch;
                 issueDetail.Location = AcumaticaCred.AcumaticaInvLocation;
                 issueDetail.Subitem = oldSubItem;
                 issueDetail.Quantity = Convert.ToDecimal(rowView[18]);
                 issueDetail.Description = rowView[24].ToString();
                 issueDetail.Warehouse = tbWarehouse.Text;
                 issueDetail.UOM = rowView[19].ToString();
                 issueDetail.ReasonCode = "ISSUERECLASS";
                 //issueDetail.LotSerialNbr = "";

                 issueDetails.Add(issueDetail);

                 //InventoryReceiptDetail receiptDetail = new InventoryReceiptDetail();
                 //receiptDetail.InventoryID = rowView[1].ToString();
                 //receiptDetail.Location = AcumaticaCred.AcumaticaInvLocation;
                 //receiptDetail.Subitem = rowView[2].ToString().Replace(".", "");
                 //receiptDetail.Qty = Convert.ToDecimal(rowView[18]);
                 //receiptDetail.Description = rowView[3].ToString();
                 //receiptDetail.WarehouseID = tbWarehouse.Text;
                 //receiptDetail.UnitCost = Convert.ToDecimal(rowView[21]);
                 //receiptDetail.UOM = rowView[19].ToString();
                 //receiptDetail.ReasonCode = "RECEIPTRECLASS";
                 ////receiptDetail.LotSerialNbr = "";

                 //receiptDetails.Add(receiptDetail);
             }

             inventoryIssue.Details = issueDetails;
             //inventoryReceipt.Details = receiptDetails;

             if (!allSynced && tbAcumaticaIssue.Text == "")
             {
                 MessageBox.Show($"Documents for bale is not synced to Acumatica!\nPlease sync Buying documents first", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
             }
             else
             {
                 var authApi = new AuthApi(AcumaticaCred.AcumaticaSiteURL);
                 var configuration = LogIn(authApi, AcumaticaCred.AcumaticaSiteURL, AcumaticaCred.AcumaticaUser, AcumaticaCred.AcumaticaPassword, AcumaticaCred.AcumaticaTenant, AcumaticaCred.AcumaticaBranch, AcumaticaCred.AcumaticaLocale);


                 try
                 {
                     var inventoryIssueApi = new ULTInventoryIssueApi(configuration);

                     Console.WriteLine("Naga Satu123");
                     Console.WriteLine(inventoryIssue);
                     var responseIssue = inventoryIssueApi.PutEntity(inventoryIssue);
                     Console.WriteLine(responseIssue);
                     ReleaseInventoryIssue releaseInventoryIssue = new ReleaseInventoryIssue((ULTInventoryIssue)responseIssue);
                     inventoryIssueApi.InvokeAction(releaseInventoryIssue);

                     //var inventoryReceiptApi = new InventoryReceiptApi(configuration);
                     //var responseReceipt = inventoryReceiptApi.PutEntity(inventoryReceipt);
                     //ReleaseInventoryReceipt releaseInventoryReceipt = new ReleaseInventoryReceipt((InventoryReceipt)responseReceipt);
                     //inventoryReceiptApi.InvokeAction(releaseInventoryReceipt);

                     referenceIssueNbr = responseIssue.ReferenceNbr.ToString();
                     tbAcumaticaIssue.Text = referenceIssueNbr;

                     //referenceReceiptNbr = responseReceipt.ReferenceNbr.ToString();
                     //tbAcumaticaReceipt.Text = referenceReceiptNbr;
                 }
                 catch (Exception ePut)
                 {
                     MessageBox.Show($"--Sync error! {ePut.Message}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                     syncError = true;
                 }
                 finally
                 {
                     tbTotalCost.Text = checkTotalReleaseCost(referenceIssueNbr, configuration).ToString("N2");

                     authApi.AuthLogout();
                     if (!syncError)
                     {
                         this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}]";
                         //tbStatus.Text = "SYNCED";
                         //saveDocument();
                         //MessageBox.Show($"--Sync Complete!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                         using (SqlConnection connection = new SqlConnection(ConnectionString))
                         {
                             try
                             {
                                 if (connection.State != ConnectionState.Open)
                                 {
                                     connection.Open();
                                 }

                                 foreach (DataRowView rowView in dv_filter)
                                 {
                                     var rowDocNumber = rowView[0].ToString();
                                     var rowLotNumber = rowView[3].ToString();

                                     using (SqlCommand command = new SqlCommand("Update_ReclassProcessLineDetail_Sync", connection))
                                     {
                                         command.CommandType = CommandType.StoredProcedure;
                                         command.Parameters.AddWithValue("@DocumentID", rowDocNumber);
                                         command.Parameters.AddWithValue("@LotNbr", rowLotNumber);
                                         command.Parameters.AddWithValue("@SyncDetail", 1);

                                         command.ExecuteNonQuery();
                                     }
                                 }
                             }
                             catch (Exception e_update)
                             {
                                 MessageBox.Show($"--Update sync status error! {e_update.Message}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                             }
                         }
                         resetEntry();
                         saveDocument();
                     }
                 }
             }//end if

             if (tbAcumaticaIssue.Text != "")
             {
                 this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}] - Syncing with Acumatica, please wait!";

                 loadDetail();

                 foreach (DataRow row in dtDetail.Rows)
                 {
                     InventoryReceiptDetail receiptDetail = new InventoryReceiptDetail();
                     receiptDetail.InventoryID = row[1].ToString();
                     receiptDetail.Branch = docBranch;
                     receiptDetail.Location = AcumaticaCred.AcumaticaInvLocation;
                     receiptDetail.Subitem = row[2].ToString().Replace(".", "");
                     receiptDetail.Qty = Convert.ToDecimal(row[18]);
                     receiptDetail.Description = row[3].ToString();
                     receiptDetail.WarehouseID = tbWarehouse.Text;
                     receiptDetail.UnitCost = Convert.ToDecimal(row[20]);
                     receiptDetail.UOM = row[19].ToString();
                     receiptDetail.ReasonCode = "RECEIPTRECLASS";
                     //receiptDetail.LotSerialNbr = "";

                     receiptDetails.Add(receiptDetail);
                 }

                 inventoryReceipt.Details = receiptDetails;

                 var authApi = new AuthApi(AcumaticaCred.AcumaticaSiteURL);
                 var configuration = LogIn(authApi, AcumaticaCred.AcumaticaSiteURL, AcumaticaCred.AcumaticaUser, AcumaticaCred.AcumaticaPassword, AcumaticaCred.AcumaticaTenant, AcumaticaCred.AcumaticaBranch, AcumaticaCred.AcumaticaLocale);
                 try
                 {
                     var inventoryReceiptApi = new InventoryReceiptApi(configuration);
                     var responseReceipt = inventoryReceiptApi.PutEntity(inventoryReceipt);
                     ReleaseInventoryReceipt releaseInventoryReceipt = new ReleaseInventoryReceipt((InventoryReceipt)responseReceipt);
                     inventoryReceiptApi.InvokeAction(releaseInventoryReceipt);

                     referenceReceiptNbr = responseReceipt.ReferenceNbr.ToString();
                     tbAcumaticaReceipt.Text = referenceReceiptNbr;
                 }
                 catch (Exception ePut)
                 {
                     MessageBox.Show($"--Sync error! {ePut.Message}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                     syncError = true;
                 }
                 finally
                 {
                     authApi.AuthLogout();
                     tbStatus.Text = "SYNCED";
                     saveDocument();

                     if (!syncError)
                     {
                         this.Text = $"Universal Leaf [{Warehouse.Descr}] - Regrade [{DocNumber}]";
                         //tbStatus.Text = "SYNCED";
                         saveDocument();
                         MessageBox.Show($"--Sync Complete!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                         resetEntry();
                         saveDocument();
                     }
                 }
             }
         }*/

        private Configuration LogIn(AuthApi authApi, string siteURL, string username, string password, string tenant = null, string branch = null, string locale = null)
        {
            var cookieContainer = new CookieContainer();
            authApi.Configuration.ApiClient.RestClient.CookieContainer = cookieContainer;

            authApi.AuthLogin(new Credentials(username, password, tenant, branch, locale));
            Console.WriteLine("Logged In...");
            var configuration = new Configuration($"{AcumaticaCred.AcumaticaSiteURL}/entity/{AcumaticaCred.AcumaticaEndpointName}/{AcumaticaCred.AcumaticaEndpointVersion}/");

            //share cookie container between API clients because we use different client for authentication and interaction with endpoint
            configuration.ApiClient.RestClient.CookieContainer = authApi.Configuration.ApiClient.RestClient.CookieContainer;
            return configuration;
        }

        private decimal checkTotalReleaseCost(string referenceNbr, Configuration configuration)
        {
            var inventoryIssueApi = new ULTInventoryIssueApi(configuration);
            decimal totalCost = 0;
            while (true)
            {
                var response = inventoryIssueApi.GetByKeys(new List<string>() { referenceNbr }, expand: "Details");

                if (response.Status == "Released")
                {
                    totalCost = (decimal)response.TotalCost.Value;

                    using (SqlConnection connection = new SqlConnection(ConnectionString))
                    {
                        try
                        {
                            if (connection.State != ConnectionState.Open)
                            {
                                connection.Open();
                            }

                            foreach (var detail in response.Details)
                            {
                                using (SqlCommand command = new SqlCommand("Update_ReclassProcessLineDetail_Cost", connection))
                                {
                                    command.CommandType = CommandType.StoredProcedure;
                                    command.Parameters.AddWithValue("@DocumentID", DocNumber);
                                    command.Parameters.AddWithValue("@OldLotNbr", detail.Description.Value.ToString());
                                    command.Parameters.AddWithValue("@CostUnit", Convert.ToDecimal(detail.UnitCost.Value.ToString()));

                                    command.ExecuteNonQuery();
                                }
                            }
                        }
                        catch (Exception e_update)
                        {
                            MessageBox.Show($"--Update sync status error! {e_update.Message}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                    }

                    break;
                }
            }

            return totalCost;
        }

        private bool checkDocumentSync(string docNbr)
        {
            var docStatus = "";
            //load buying registration
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                DataTable dt = new DataTable();
                try
                {
                    if (connection.State != ConnectionState.Open)
                    {
                        connection.Open();
                    }

                    using (SqlCommand command = new SqlCommand("Select_Status", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@DocumentID", docNbr);

                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            reader.Read();
                            docStatus = reader.GetValue(0).ToString();
                        }
                    }
                }
                catch (Exception e)
                {
                    MessageBox.Show(e.ToString());
                }
            }

            if (docStatus == "SYNCED")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            resetScreen();
        }

        private void tbBuyerName_TextChanged(object sender, EventArgs e)
        {
            tempBuyerName = ((TextBox)sender).Text;
        }

        private void checkHold_CheckedChanged(object sender, EventArgs e)
        {
            if (checkHold.Checked)
            {
                tbStatus.Text = "HOLD";
            }
            else
            {
                tbStatus.Text = "OPEN";
            }
        }

        private void btnPrintLot_Click(object sender, EventArgs e)
        {
            //if (!groupEntry.Text.Contains("<NEW>") && !tbDocNumber.Text.Contains("<NEW>"))
            if (!tbDocNumber.Text.Contains("<NEW>"))
            {
                if (chkLblPrint.Checked)
                { 
                    QRCoder.QRCodeGenerator qRCodeGenerator = new QRCoder.QRCodeGenerator();
                    QRCodeData qrCodeData = qRCodeGenerator.CreateQrCode($"{tbEntryLot.Text}", QRCodeGenerator.ECCLevel.Q);
                    QRCode qrCode = new QRCode(qrCodeData);
                    Bitmap qrCodeImage = qrCode.GetGraphic(20);

                    string QRImage = ImageToBase64(qrCodeImage, System.Drawing.Imaging.ImageFormat.Bmp);

                    if (optLblSticker.Checked)
                    {
                        GenericLotPrint lotPrint = new GenericLotPrint
                        {
                            LotNumber = tbEntryLot.Text,
                            Source = tbEntrySource.Text,
                            StalkPos = tbEntryStalk.Text,
                            Ferment = tbEntryFerment.Text,
                            Buyer = tbBuyerName.Text,
                            InventoryID = tbEntryInv.Text,
                            Process = "RC",
                            Grade = cbEntryGrade.SelectedItem.ToString().Split('|')[0].Trim(),
                            Color = tbEntryColor.Text,
                            Weight = tbEntryWeightNetto.Text,
                            Length = tbEntryLength.Text,
                            Warehouse = tbWarehouse.Text,
                            Date = tbProcessDate.Text,
                            Remark = tbEntryRemark.Text,
                            Area = tbEntryArea.Text.Substring(0, 2),
                            QRImage = QRImage,
                            StrCrop = StrCrop(Convert.ToInt32(tbEntryCropYear.Text.Substring(0, 1))) + StrCrop(Convert.ToInt32(tbEntryCropYear.Text.Substring(1, 1))),
                            Forms = tbEntryForm.Text
                        };
                        lotPrint.ShowDialog();
                    }
                    else
                    {
                        GenericLotPrintThermal lotPrint = new GenericLotPrintThermal
                        {
                            LotNumber = tbEntryLot.Text,
                            Source = tbEntrySource.Text,
                            StalkPos = tbEntryStalk.Text,
                            Ferment = tbEntryFerment.Text,
                            Buyer = tbBuyerName.Text,
                            InventoryID = tbEntryInv.Text,
                            Process = "RC",
                            Grade = cbEntryGrade.SelectedItem.ToString().Split('|')[0].Trim(),
                            Color = tbEntryColor.Text,
                            Weight = tbEntryWeightNetto.Text,
                            Length = tbEntryLength.Text,
                            Warehouse = tbWarehouse.Text,
                            Date = tbProcessDate.Text,
                            Remark = tbEntryRemark.Text,
                            Area = tbEntryArea.Text.Substring(0, 2),
                            QRImage = QRImage,
                            Forms = tbEntryForm.Text
                        };
                        lotPrint.ShowDialog();
                    }
                }
            }
            else
            {
                MessageBox.Show("Create a bale/lot first", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private string ImageToBase64(Image image, System.Drawing.Imaging.ImageFormat format)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                // Convert Image to byte[]
                image.Save(ms, format);
                byte[] imageBytes = ms.ToArray();

                // Convert byte[] to Base64 String
                string base64String = Convert.ToBase64String(imageBytes);
                return base64String;
            }
        }

        private void btnPrintDoc_Click(object sender, EventArgs e)
        {

            DataSetAddon myDoc = new DataSetAddon();

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                try
                {

                    string query = $@"SELECT
                                            *
                                        FROM
	                                        ReclassProcessLineDetail
	                                    WHERE
		                                    ReclassProcessLineDetail.DocumentID = '{DocNumber}'
                                        ORDER BY
	                                        ReclassProcessLineDetail.LotNbr";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();

                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(myDoc.ReclassProcessLineDetail);

                }
                catch (Exception e1)
                {
                    MessageBox.Show(e1.ToString());
                }
            }

            ReclassProcessDocPrint reclassProcessDocPrint = new ReclassProcessDocPrint
            {
                Company = Warehouse.Company,
                Warehouse = Warehouse.Descr,
                Address = GetBranch(Warehouse.WarehouseID,3),
                Phone = GetBranch(Warehouse.WarehouseID, 4),
                DocNumber = tbDocNumber.Text,
                DocType = "REGRADE",
                DocDate = tbProcessDate.Text,
                DocStatus = tbStatus.Text,
                DocDetails = myDoc
            };
            reclassProcessDocPrint.ShowDialog();
        }

        private void tbLot_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == '\r' || e.KeyChar == '\n')
            {
                LotStockItem = tbLot.Text;
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    //clear
                    DataTable dt = new DataTable();
                    try
                    {
                        string query = $"SELECT LotNbr, StatusStock  FROM StockItem  WHERE LotNbr = '{tbLot.Text}' AND StatusStock = 1";

                        connection.Open();
                        SqlDataReader reader;
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            reader = command.ExecuteReader();
                        }

                        if (reader.HasRows)
                        {
                            reader.Read();

                            LotStockItem = reader.GetValue(0).ToString();
                            if (Convert.ToInt32(reader.GetValue(1)) == 1)
                            {
                                int index = cbLot.FindStringExact(tbLot.Text);

                                if (index >= 0)
                                {
                                    cbLot.SelectedIndex = index;
                                    if (e.KeyChar == '\r')
                                    {
                                        if (this.ActiveControl != null)
                                        {
                                            this.SelectNextControl(this.ActiveControl, true, true, true, true);
                                        }
                                        e.Handled = true; // Mark the event as handled
                                    }

                                }
                                else
                                {
                                    MessageBox.Show($"Lot number tidak tersedia !");
                                }
                            }

                        }
                        else
                        {
                            MessageBox.Show($"Lot number {LotStockItem} tidak tersedia !", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        }

                    }
                    catch (Exception e2)
                    {
                        MessageBox.Show($"Lot number {LotStockItem} tidak tersedia !", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
            }
        }

        private void btnToogle_Click(object sender, EventArgs e)
        {
            if (tbLot.Visible)
            {
                tbLot.Visible = false;
                cbLot.Visible = true;
            }
            else
            {
                tbLot.Visible = true;
                cbLot.Visible = false;
            }
        }


        private string GetBranch(string warehouseID, int wData)
        {
            var warehouseName = "";
            var branch = "";
            var address = "";
            var phone = "Telp : ";
            //load data untuk grid
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                //create new dt
                DataTable dtWarehouse = new DataTable();
                try
                {
                    //string query = $"SELECT * from BuyingRegistration where RegistrationDate = '{currentDate.ToString()}'";

                    string query = $@"SELECT *
                                        FROM
	                                        WarehouseSite
                                        WHERE
	                                        WarehouseID = '{warehouseID}'";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();

                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(dtWarehouse);

                    warehouseName = dtWarehouse.Rows[0].ItemArray[1].ToString();
                    branch = dtWarehouse.Rows[0].ItemArray[8].ToString();
                    if (dtWarehouse.Rows[0].ItemArray[4].ToString().Length > 0)
                    {
                        address = dtWarehouse.Rows[0].ItemArray[4].ToString();
                    }
                    if (dtWarehouse.Rows[0].ItemArray[5].ToString().Length > 0)
                    {
                        address = address + Environment.NewLine + dtWarehouse.Rows[0].ItemArray[5].ToString();
                    }
                    if (dtWarehouse.Rows[0].ItemArray[6].ToString().Length > 0)
                    {
                        phone = phone + dtWarehouse.Rows[0].ItemArray[6].ToString();
                    }

                    if (dtWarehouse.Rows[0].ItemArray[6].ToString().Length > 0 && dtWarehouse.Rows[0].ItemArray[7].ToString().Length > 0)
                    {
                        phone = phone + " ," + dtWarehouse.Rows[0].ItemArray[7].ToString();
                    }
                    else
                    {
                        phone = phone + dtWarehouse.Rows[0].ItemArray[7].ToString();
                    }

                }
                catch (Exception e)
                {
                    MessageBox.Show(e.ToString());
                }
            }

            switch (wData)
            {
                case 1:
                    return warehouseName;
                    break;
                case 2:
                    return branch;
                    break;
                case 3:
                    return address;
                    break;
                case 4:
                    return phone;
                    break;
                default:
                    return warehouseName;
                    break;
            }

        }

        private bool checkLotNbrInSTock(string lotnbr)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                //clear
                try
                {
                    string query = $"IF EXISTS ( SELECT * FROM StockItem WHERE LotNbr = '{lotnbr}' and StatusStock = 1 ) BEGIN SELECT 1 END ELSE BEGIN SELECT 0 END";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();
                        int exist = Convert.ToInt32(reader.GetValue(0).ToString());
                        //if (currentDate.Year == dbDate.Year)
                        if (exist == 1)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return true;
                    }
                }
                catch (Exception e)
                {
                    return true;
                    //MessageBox.Show(e.ToString());
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DataSetAddon myDoc = new DataSetAddon();

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                try
                {

                    string query = $@"SELECT
                                            DocumentID,InventoryID,SubItem, Grade, OldGrade, Remark, 
											COUNT(LotNbr) AS WeightTare, SUM(ReclassProcessLineDetail.WeightNetto) AS WeightNetto
                                        FROM
	                                        ReclassProcessLineDetail
	                                    WHERE
		                                    ReclassProcessLineDetail.DocumentID = '{DocNumber}'
										GROUP BY
                                            DocumentID,InventoryID,SubItem, Grade, OldGrade, Remark
                                        ORDER BY
	                                        InventoryID,SubItem";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();

                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(myDoc.ReclassProcessLineDetail);

                }
                catch (Exception e1)
                {
                    MessageBox.Show(e1.ToString());
                }
            }

            ReclassProcessDocPrintSum reclassProcessDocPrintSum = new ReclassProcessDocPrintSum
            {
                Company = Warehouse.Company,
                Warehouse = Warehouse.Descr,
                Address = GetBranch(Warehouse.WarehouseID, 3),
                Phone = GetBranch(Warehouse.WarehouseID, 4),
                DocNumber = tbDocNumber.Text,
                DocType = "Summary REGRADE",
                DocDate = tbProcessDate.Text,
                DocStatus = tbStatus.Text,
                DocDetails = myDoc
            };
            reclassProcessDocPrintSum.ShowDialog();

        }

        private void chkLblPrint_CheckedChanged(object sender, EventArgs e)
        {
            if (chkLblPrint.Checked)
            {
                optLblSticker.Enabled = true;
                optLblThermal.Enabled = true;
            }
            else
            {
                optLblSticker.Enabled = false;
                optLblThermal.Enabled = false;
            }
        }

        private void tbEntryRemark_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == '\r')
            {
                if (this.ActiveControl != null)
                {
                    this.SelectNextControl(this.ActiveControl, true, true, true, true);
                }
                e.Handled = true; // Mark the event as handled
            }
        }

        private void unsyncing_Click(object sender, EventArgs e)
        {
            if (dtDetail.Rows.Count > 0)
            {
                loadDetail();
                DataView dv_filter = new DataView(dtDetail, $"SyncDetail = 1", "LotNbr Asc", DataViewRowState.CurrentRows);

                if (true)
                {
                    this.Text = $"Universal Leaf [{Warehouse.Descr}] - Dispatch IN Process [{DocNumber}]";
                    tbStatus.Text = "OPEN";
                    tbAcumaticaIssue.Text = "";
                    saveDocument();


                    //Update Item Sync status
                    using (SqlConnection connection = new SqlConnection(ConnectionString))
                    {
                        try
                        {
                            if (connection.State != ConnectionState.Open)
                            {
                                connection.Open();
                            }

                            foreach (DataRowView rowView in dv_filter)
                            {
                                var rowDocNumber = rowView[0].ToString();
                                var rowLotNumber = rowView[3].ToString();

                                using (SqlCommand command = new SqlCommand("Update_ReclassProcessLineDetail_Sync", connection))
                                {
                                    command.CommandType = CommandType.StoredProcedure;
                                    command.Parameters.AddWithValue("@DocumentID", rowDocNumber);
                                    command.Parameters.AddWithValue("@LotNbr", rowLotNumber);
                                    command.Parameters.AddWithValue("@SyncDetail", 0);

                                    command.ExecuteNonQuery();
                                }
                            }
                        }
                        catch (Exception e_update)
                        {
                            MessageBox.Show($"--Update sync status error! {e_update.Message}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                    }

                    resetEntry();
                    saveDocument();
                }
            }
            else
            {
                MessageBox.Show($"Tidak Singkron Salah", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        private string StrCrop(int mnumber)
        {
            switch (mnumber)
            {
                case 1:
                    return "A";
                    break;
                case 2:
                    return "B";
                    break;
                case 3:
                    return "C";
                    break;
                case 4:
                    return "D";
                    break;
                case 5:
                    return "E";
                    break;
                case 6:
                    return "F";
                    break;
                case 7:
                    return "G";
                    break;
                case 8:
                    return "H";
                    break;
                case 9:
                    return "I";
                    break;
                case 0:
                    return "J";
                    break;

                default:
                    return "";
                    break;
            }
        }


        //end of file
    }
}