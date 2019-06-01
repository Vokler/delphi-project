unit MyClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls;

type
  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    miData: TMenuItem;
    miProduct: TMenuItem;
    miProvider: TMenuItem;
    miReport: TMenuItem;
    miReportMSWord: TMenuItem;
    miClose: TMenuItem;
    pnlWaybill: TPanel;
    pnlWaybillInfo: TPanel;
    pnlWaybillModify: TPanel;
    dbgWaybill: TDBGrid;
    pnlWaybillInfoModify: TPanel;
    dbgWaybillInfo: TDBGrid;
    btnNewWaybill: TButton;
    btnDeleteWaybill: TButton;
    dsWaybill: TDataSource;
    dsWaybillInfo: TDataSource;
    btnAddProduct: TButton;
    btnDeleteProduct: TButton;
    btnProductSelect: TButton;
    gbNumbers: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edQuantity: TEdit;
    edPrice: TEdit;
    lbProduct: TLabel;
    dtWaybill: TDateTimePicker;
    Label3: TLabel;
    btnPay: TButton;
    procedure miProductClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure miProviderClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewWaybillClick(Sender: TObject);
    procedure btnDeleteWaybillClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProductSelectClick(Sender: TObject);
    procedure edQuantityChange(Sender: TObject);
    procedure btnAddProductClick(Sender: TObject);
    procedure btnDeleteProductClick(Sender: TObject);
    procedure dsWaybillDataChange(Sender: TObject; Field: TField);
    procedure btnPayClick(Sender: TObject);
    procedure miReportMSWordClick(Sender: TObject);
  private
    ProductID: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses Product, Supplier, Unit1, Report;

{$R *.dfm}

procedure TfmMain.miProductClick(Sender: TObject);
begin
  fmProduct.ShowModal;
end;

procedure TfmMain.miCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.miProviderClick(Sender: TObject);
begin
  fmSupplier.ShowModal;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  pnlWaybill.Height := fmMain.ClientHeight div 2;
  dsWaybill.DataSet := dmMy.cdsWaybill;
  dsWaybillInfo.DataSet := dmMy.cdsWaybillInfo;
  dmMy.cdsWaybillInfo.MasterSource := dsWaybill;
  dmMy.cdsWaybillInfo.MasterFields := 'ID';
  btnDeleteWaybill.Enabled := dmMy.cdsWaybill.RecordCount > 0;
  pnlWaybillInfoModify.Visible := btnDeleteWaybill.Enabled;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmMy.cdsWaybillInfo.MasterFields := '';
  dmMy.cdsWaybillInfo.MasterSource := nil;
  dsWaybill.DataSet := nil;
  dsWaybillInfo.DataSet := nil;
end;

procedure TfmMain.btnNewWaybillClick(Sender: TObject);
begin
  fmSupplier.ShowModal;
  if dmMy.cdsProvider.RecordCount > 0 then
    dmMy.DCOMConnection1.AppServer.smUpdateWaybill(
    0, dmMy.cdsProviderID.Value, 0, dtWaybill.Date, 0);
  dmMy.cdsWaybill.Refresh;
  btnDeleteWaybill.Enabled := dmMy.cdsProvider.RecordCount > 0;
  pnlWaybillInfoModify.Visible := btnDeleteWaybill.Enabled;
end;

procedure TfmMain.btnDeleteWaybillClick(Sender: TObject);
begin
  if MessageDlg(
  'Вы действительно хотите удалить накладную № '+dmMy.cdsWaybillID.AsString+'?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      dmMy.DCOMConnection1.AppServer.smDeleteWaybill(dmMy.cdsWaybillID.Value);
      dmMy.cdsWaybill.Refresh;
      btnDeleteWaybill.Enabled := dmMy.cdsWaybill.RecordCount > 0;
      pnlWaybillInfoModify.Visible := btnDeleteWaybill.Enabled;
    end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  ProductID := 0;
end;

procedure TfmMain.btnProductSelectClick(Sender: TObject);
begin
  fmProduct.ShowModal;
  ProductID := 0;
  lbProduct.Caption := '';
  if dmMy.cdsProduct.RecordCount > 0 then
  begin
    ProductID := dmMy.cdsProductID.Value;
    lbProduct.Caption := dmMy.cdsProductName.AsString;
  end;
  gbNumbers.Visible := ProductID > 0;
  edPrice.Text := '';
  edQuantity.Text:='';
  btnAddProduct.Enabled := false;
end;

procedure TfmMain.edQuantityChange(Sender: TObject);
begin
  if (edPrice.Text <> '') and (edQuantity.Text <> '') then
    btnAddProduct.Enabled := true
  else
    btnAddProduct.Enabled := false;
end;

procedure TfmMain.btnAddProductClick(Sender: TObject);
var quantity, price : double;
begin
  if TryStrToFloat(edQuantity.Text, quantity) and TryStrToFloat(edPrice.Text, price) then
  begin
    dmMy.DCOMConnection1.AppServer.smUpdateWaybillInfo(
      dmMy.cdsWaybillID.Value, ProductID,
      StrToFloat(edQuantity.Text),
      StrToFloat(edPrice.Text));
      dmMy.cdsWaybill.Refresh;
      dmMy.cdsWaybillInfo.Refresh;
      edPrice.Text := '';
      edQuantity.Text:='';
      lbProduct.Caption := '';
  end
  else
    ShowMessage('Введенные значения не являются числами.');
end;

procedure TfmMain.btnDeleteProductClick(Sender: TObject);
var
  waybillTotalSum : Double;
begin
  if MessageDlg('Удалить продукт '''+dmMy.cdsWaybillInfoName.AsString+'''?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmMy.DCOMConnection1.AppServer.smDeleteWaybillInfo(
    dmMy.cdsWaybillInfoWaybillID.Value,
    dmMy.cdsWaybillInfoProductID.Value);

    // Пересчитываем TotalSum для Waybill
    waybillTotalSum := dmMy.cdsWaybillTotalSum.Value - dmMy.cdsWaybillInfoSum.Value;
    dmMy.DCOMConnection1.AppServer.smUpdateWaybill(dmMy.cdsWaybillID.Value,
      dmMy.cdsWaybillProviderID.Value, waybillTotalSum, dmMy.cdsWaybillDate.Value, 1);

    dmMy.cdsWaybillInfo.Refresh;
    dmMy.cdsWaybill.Refresh;
  end;
end;

procedure TfmMain.dsWaybillDataChange(Sender: TObject; Field: TField);
begin
  btnDeleteProduct.Enabled := dmMy.cdsWaybillInfo.RecordCount > 0;
end;

procedure TfmMain.btnPayClick(Sender: TObject);
var
  currentDate, waybillDate : TDateTime;
  DaysF : Extended;
  Days, paymentTerm : Integer;
begin
  paymentTerm := 90;
  currentDate := Now;
  waybillDate := dmMy.cdsWaybillDate.Value;
  DaysF := currentDate - waybillDate;
  Days := Trunc(DaysF);
  if Days < paymentTerm then
  begin
    dmMy.DCOMConnection1.AppServer.smUpdateWaybill(dmMy.cdsWaybillID.Value,
    dmMy.cdsWaybillProviderID.Value, dmMy.cdsWaybillTotalSum.Value, dmMy.cdsWaybillDate.Value, 1);
    dmMy.cdsWaybill.Refresh;
  end
  else
    ShowMessage('Данную накладную оплатить невозможно, так как прошло больше трёх месяцев.');
end;

procedure TfmMain.miReportMSWordClick(Sender: TObject);
var ProviderID : Integer;
begin
  fmReport.ShowModal;
end;

end.
