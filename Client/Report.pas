unit Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, ExtCtrls, ComCtrls;

type
  TfmReport = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    listName: TListBox;
    listID: TListBox;
    btnAddSupplier: TButton;
    btnRemoveSupplier: TButton;
    btnReport: TButton;
    btnClearReport: TButton;
    Label1: TLabel;
    Label2: TLabel;
    dtStart: TDateTimePicker;
    dtEnd: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    btnReportExcel: TButton;
    procedure btnAddSupplierClick(Sender: TObject);
    procedure btnRemoveSupplierClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure btnClearReportClick(Sender: TObject);
    procedure btnReportExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReport: TfmReport;

implementation

uses Supplier, Unit1, ComObj;

{$R *.dfm}

procedure TfmReport.btnAddSupplierClick(Sender: TObject);
var
  i : Integer;
  isFound : Boolean;
begin
  fmSupplier.ShowModal;
  if dmMy.cdsProvider.FindKey([fmSupplier.IDSupplier]) then
    isFound := false;
    for i := 0 to listId.Count-1 do
      isFound := isFound or (StrToInt(listID.Items[i]) = fmSupplier.IDSupplier);
    if not isFound then
    begin
      listID.Items.Add(IntToStr(fmSupplier.IDSupplier));
      listName.Items.Add(dmMy.cdsProviderName.AsString);
    end;
  begin
  end;
end;

procedure TfmReport.btnRemoveSupplierClick(Sender: TObject);
begin
  listID.Clear;
  listName.Clear;
end;

procedure TfmReport.btnReportClick(Sender: TObject);
var
  i : Integer;
  waybillDate : TDateTime;
begin
  for i := 0 to listID.Count-1 do
  begin
    dmMy.cdsReport.ProviderName := 'dspTMP';
    dmMy.cdsReport.Open;
    dmMy.cdsReport.AddIndex('indxID', 'ProductID', [], '', '');
    dmMy.cdsReport.IndexFieldNames := 'ProductID';
    dmMy.cdsWaybill.AddIndex('repID', 'ProviderID;ID', [], '', '');
    dmMy.cdsWaybill.IndexFieldNames := 'ProviderID;ID';
    dmMy.cdsWaybill.SetRange([listID.Items[i]], [listID.Items[i]]);
    dmMy.cdsWaybill.First;
    while not dmMy.cdsWaybill.Eof do
    begin
      if dmMy.cdsReport.FindKey([StrToInt(listID.Items[i])]) then
      begin
        dmMy.cdsReport.Edit;
      end
      else
      begin
        dmMy.cdsReport.Append;
        dmMy.cdsReport.FieldByName('ProductID').Value := listID.Items[i];
        dmMy.cdsReport.FieldByName('AllTotalSum').Value := 0;
        dmMy.cdsReport.FieldByName('OutstandingSum').Value := 0;
      end;
      waybillDate := dmMy.cdsWaybillDate.Value;
      if (waybillDate > dtStart.Date) and (waybillDate < dtEnd.Date) then
      begin
        dmMy.cdsReport.FieldByName('AllTotalSum').Value := dmMy.cdsReport.FieldByName('AllTotalSum').Value + dmMy.cdsWaybillTotalSum.Value;
        if dmMy.cdsWaybillisPaid.Value = 0 then
          dmMy.cdsReport.FieldByName('OutstandingSum').Value := dmMy.cdsReport.FieldByName('OutstandingSum').Value + dmMy.cdsWaybillTotalSum.Value;
      end;
      dmMy.cdsReport.Post;
      dmMy.cdsWaybill.Next;
    end;
    dmMy.cdsReport.FieldByName('ProductID').DisplayLabel := '№';
    dmMy.cdsReport.FieldByName('AllTotalSum').DisplayLabel := 'Обороты';
    dmMy.cdsReport.FieldByName('OutstandingSum').DisplayLabel := 'Неоплаченная сумма';
    fmReport.DataSource1.DataSet := dmMy.cdsReport;
    dmMy.cdsWaybill.IndexFieldNames := 'ID';
    btnClearReport.Enabled := dmMy.cdsReport.RecordCount > 0;
    btnReportExcel.Enabled := dmMy.cdsReport.RecordCount > 0;
    btnAddSupplier.Enabled := false;
  end;
end;

procedure TfmReport.btnClearReportClick(Sender: TObject);
begin
  dmMy.cdsReport.CancelUpdates;
  dmMy.cdsReport.Close;
  btnClearReport.Enabled := false;
  btnReportExcel.Enabled := false;
  btnAddSupplier.Enabled := true;
end;

procedure TfmReport.btnReportExcelClick(Sender: TObject);
var
  MSE : Variant;
  line : Integer;
begin
  MSE := CreateOleObject('Excel.Application');
  MSE.Visible := true;
  MSE.WorkBooks.Add;
  MSE.ActiveWorkbook.Sheets.Item[1].Columns.ColumnWidth := 15;
  MSE.ActiveWorkbook.Sheets.Item[1].Columns['A'].ColumnWidth := 25;
  MSE.ActiveWorkbook.Sheets.Item[1].Columns['C'].ColumnWidth := 18;
  MSE.ActiveWorkbook.Sheets.Item[1].Range['A1'] := 'Отчёт за период ' + DateToStr(dtStart.Date) + ' - ' + DateToStr(dtEnd.Date);
  MSE.ActiveWorkbook.Sheets.Item[1].Range['A1:C1'].MergeCells := true;
  MSE.ActiveWorkbook.Sheets.Item[1].Range['A1:C1'].HorizontalAlignment := 3;
  MSE.ActiveWorkbook.Sheets.Item[1].Range['A1:C1'].Font.Bold := true;
  MSE.ActiveWorkbook.Sheets.Item[1].Range['A3'] := 'Номер поставщика';
  MSE.ActiveWorkbook.Sheets.Item[1].Range['B3'] := 'Обороты';
  MSE.ActiveWorkbook.Sheets.Item[1].Range['C3'] := 'Неоплаченная сумма';
  MSE.ActiveWorkbook.Sheets.Item[1].Range['A3:C3'].HorizontalAlignment := 3;
  MSE.ActiveWorkBook.Sheets.Item[1].Range['A3:C3'].Font.Bold := true;
  line := 4;
  dmMy.cdsReport.First;
  while not dmMy.cdsReport.Eof do
  begin
    MSE.ActiveWorkBook.Sheets.Item[1].Range['A'+IntToStr(line)] := dmMy.cdsReport.Fields[0].Value;
    MSE.ActiveWorkBook.Sheets.Item[1].Range['B'+IntToStr(line)] := dmMy.cdsReport.Fields[1].Value;
    MSE.ActiveWorkBook.Sheets.Item[1].Range['C'+IntToStr(line)] := dmMy.cdsReport.Fields[2].Value;
    dmMy.cdsReport.Next;
    Inc(line);
  end;
  MSE.ActiveWorkBook.Sheets.Item[1].Range['A3:C'+IntToStr(line)].Borders.LineStyle := 2;
end;

end.
