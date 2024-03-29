unit Unit1;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, Variants;

type
  TdmMy = class(TDataModule)
    DCOMConnection1: TDCOMConnection;
    cdsProvider: TClientDataSet;
    cdsProduct: TClientDataSet;
    cdsWaybill: TClientDataSet;
    cdsWaybillInfo: TClientDataSet;
    cdsReport: TClientDataSet;
    cdsProductID: TIntegerField;
    cdsProductName: TStringField;
    cdsProductUnit: TStringField;
    cdsProviderID: TIntegerField;
    cdsProviderName: TStringField;
    cdsProviderAddress: TStringField;
    cdsWaybillID: TIntegerField;
    cdsWaybillProviderID: TIntegerField;
    cdsWaybillTotalSum: TFloatField;
    cdsWaybillDate: TDateField;
    cdsWaybillisPaid: TIntegerField;
    cdsWaybillProviderName: TStringField;
    cdsWaybillProviderAddress: TStringField;
    cdsWaybillInfoWaybillID: TIntegerField;
    cdsWaybillInfoProductID: TIntegerField;
    cdsWaybillInfoQuantity: TFloatField;
    cdsWaybillInfoPrice: TFloatField;
    cdsWaybillInfoName: TStringField;
    cdsWaybillInfoUnit: TStringField;
    cdsWaybillInfoSum: TFloatField;
    cdsWaybillPaided: TStringField;
    procedure DataModulCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsWaybillCalcFields(DataSet: TDataSet);
    procedure cdsWaybillInfoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMy: TdmMy;

implementation

{$R *.dfm}

procedure TdmMy.DataModulCreate(Sender: TObject);
begin
  cdsProvider.Open;
  cdsProduct.Open;
  cdsWaybill.Open;
  cdsWaybillInfo.Open;
  cdsWaybill.AddIndex('indxID', 'ID', [], '', '');
  cdsWaybill.IndexFieldNames := 'ID';
  cdsWaybillInfo.AddIndex('indxID', 'WaybillID;ProductID', [], '', '');
  cdsWaybillInfo.IndexFieldNames := 'WaybillID;ProductID';
end;

procedure TdmMy.DataModuleDestroy(Sender: TObject);
begin
  DCOMConnection1.Close;
end;

procedure TdmMy.cdsWaybillCalcFields(DataSet: TDataSet);
begin
  if cdsProvider.Locate('ID', VarArrayOf([cdsWaybillProviderID.Value]), []) then
    begin
      cdsWaybillProviderName.Value := cdsProviderName.Value;
      cdsWaybillProviderAddress.Value := cdsProviderAddress.Value;
    end;
  if cdsWaybillisPaid.Value = 0 then
    cdsWaybillPaided.Value := '���'
  else
    cdsWaybillPaided.Value := '��'
end;

procedure TdmMy.cdsWaybillInfoCalcFields(DataSet: TDataSet);
begin
  cdsWaybillInfoSum.Value := cdsWaybillInfoQuantity.Value * cdsWaybillInfoPrice.Value;
end;

end.
