unit Unit2;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, StoreAppServer_TLB, StdVcl, IBStoredProc, Provider, DB,
  IBDatabase, IBTable, IBCustomDataSet, IBQuery;

type
  TStoreServer = class(TRemoteDataModule, IStoreServer)
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    ibtProvider: TIBTable;
    ibtProduct: TIBTable;
    ibtWaybill: TIBTable;
    ibtWaybillInfo: TIBTable;
    ibtTMP: TIBTable;
    IBDatabase1: TIBDatabase;
    dspProvider: TDataSetProvider;
    dspProduct: TDataSetProvider;
    dspWaybill: TDataSetProvider;
    dspWaybillInfo: TDataSetProvider;
    dspTMP: TDataSetProvider;
    dspQuery: TDataSetProvider;
    ibspUpdateProvider: TIBStoredProc;
    ibspDeleteProvider: TIBStoredProc;
    ibspUpdateProduct: TIBStoredProc;
    ibspDeleteProduct: TIBStoredProc;
    ibspUpdateWaybill: TIBStoredProc;
    ibspDeleteWaybill: TIBStoredProc;
    ibspUpdateWaybillInfo: TIBStoredProc;
    ibspDeleteWaybillInfo: TIBStoredProc;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure smUpdateProvider(ID: Integer; const Name, Address: WideString);
      safecall;
    procedure smDeleteProvider(ID: Integer); safecall;
    procedure smUpdateProduct(ID: Integer; const Name, Unit_: WideString);
      safecall;
    procedure smDeleteProduct(ID: Integer); safecall;
    procedure smUpdateWaybill(ID, ProviderID: Integer; TotalSum: Double;
      Date: TDateTime; isPaid: Integer); safecall;
    procedure smDeleteWaybill(ID: Integer); safecall;
    procedure smUpdateWaybillInfo(WaybillID, ProductID: Integer; Quantity,
      Price: Double); safecall;
    procedure smDeleteWaybillInfo(WaybillID, ProductID: Integer); safecall;
    procedure smSQLClear; safecall;
    procedure smSQLAddString(const s: WideString); safecall;
    procedure smSQLExecute; safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TStoreServer.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TStoreServer.smUpdateProvider(ID: Integer; const Name,
  Address: WideString);
begin
if ibspUpdateProvider.Transaction.InTransaction then
  ibspUpdateProvider.Transaction.Commit;
  ibspUpdateProvider.Params[0].Value := ID;
  ibspUpdateProvider.Params[1].Value := Name;
  ibspUpdateProvider.Params[2].Value := Address;
  ibspUpdateProvider.ExecProc;
  if ibspUpdateProvider.Transaction.InTransaction then
    ibspUpdateProvider.Transaction.Commit;
end;

procedure TStoreServer.smDeleteProvider(ID: Integer);
begin
if ibspDeleteProvider.Transaction.InTransaction then
  ibspDeleteProvider.Transaction.Commit;
  ibspDeleteProvider.Params[0].Value := ID;
  ibspDeleteProvider.ExecProc;
  if ibspDeleteProvider.Transaction.InTransaction then
    ibspDeleteProvider.Transaction.Commit;
end;

procedure TStoreServer.smUpdateProduct(ID: Integer; const Name,
  Unit_: WideString);
begin
if ibspUpdateProduct.Transaction.InTransaction then
  ibspUpdateProduct.Transaction.Commit;
  ibspUpdateProduct.Params[0].Value := ID;
  ibspUpdateProduct.Params[1].Value := Name;
  ibspUpdateProduct.Params[2].Value := Unit_;
  ibspUpdateProduct.ExecProc;
  if ibspUpdateProduct.Transaction.InTransaction then
    ibspUpdateProduct.Transaction.Commit;
end;

procedure TStoreServer.smDeleteProduct(ID: Integer);
begin
if ibspDeleteProduct.Transaction.InTransaction then
  ibspDeleteProduct.Transaction.Commit;
  ibspDeleteProduct.Params[0].Value := ID;
  ibspDeleteProduct.ExecProc;
  if ibspDeleteProduct.Transaction.InTransaction then
    ibspDeleteProduct.Transaction.Commit;
end;

procedure TStoreServer.smUpdateWaybill(ID, ProviderID: Integer;
  TotalSum: Double; Date: TDateTime; isPaid: Integer);
begin
if ibspUpdateWaybill.Transaction.InTransaction then
  ibspUpdateWaybill.Transaction.Commit;
  ibspUpdateWaybill.Params[0].Value := ID;
  ibspUpdateWaybill.Params[1].Value := ProviderID;
  ibspUpdateWaybill.Params[2].Value := TotalSum;
  ibspUpdateWaybill.Params[3].Value := Date;
  ibspUpdateWaybill.Params[4].Value := isPaid;
  ibspUpdateWaybill.ExecProc;
  if ibspUpdateWaybill.Transaction.InTransaction then
    ibspUpdateWaybill.Transaction.Commit;
end;

procedure TStoreServer.smDeleteWaybill(ID: Integer);
begin
if ibspDeleteWaybill.Transaction.InTransaction then
  ibspDeleteWaybill.Transaction.Commit;
  ibspDeleteWaybill.Params[0].Value := ID;
  ibspDeleteWaybill.ExecProc;
  if ibspDeleteWaybill.Transaction.InTransaction then
    ibspDeleteWaybill.Transaction.Commit;
end;

procedure TStoreServer.smUpdateWaybillInfo(WaybillID, ProductID: Integer;
  Quantity, Price: Double);
begin
if ibspUpdateWaybillInfo.Transaction.InTransaction then
  ibspUpdateWaybillInfo.Transaction.Commit;
  ibspUpdateWaybillInfo.Params[0].Value := WaybillID;
  ibspUpdateWaybillInfo.Params[1].Value := ProductID;
  ibspUpdateWaybillInfo.Params[2].Value := Quantity;
  ibspUpdateWaybillInfo.Params[3].Value := Price;
  ibspUpdateWaybillInfo.ExecProc;
  if ibspUpdateWaybillInfo.Transaction.InTransaction then
    ibspUpdateWaybillInfo.Transaction.Commit;
end;

procedure TStoreServer.smDeleteWaybillInfo(WaybillID, ProductID: Integer);
begin
if ibspDeleteWaybillInfo.Transaction.InTransaction then
  ibspDeleteWaybillInfo.Transaction.Commit;
  ibspDeleteWaybillInfo.Params[0].Value := WaybillID;
  ibspDeleteWaybillInfo.Params[1].Value := ProductID;
  ibspDeleteWaybillInfo.ExecProc;
  if ibspDeleteWaybillInfo.Transaction.InTransaction then
    ibspDeleteWaybillInfo.Transaction.Commit;
end;

procedure TStoreServer.smSQLClear;
begin
if IBQuery1.Transaction.InTransaction then
  IBQuery1.Transaction.Commit;
  IBQuery1.Close;
  IBQuery1.SQL.Clear;
end;

procedure TStoreServer.smSQLAddString(const s: WideString);
begin
  IBQuery1.SQL.Add(s);
end;

procedure TStoreServer.smSQLExecute;
begin
IBQuery1.Open;
  if IBQuery1.Transaction.InTransaction then
    IBQuery1.Transaction.Commit;
end;

initialization
  TComponentFactory.Create(ComServer, TStoreServer,
    Class_StoreServer, ciMultiInstance, tmSingle);
end.
