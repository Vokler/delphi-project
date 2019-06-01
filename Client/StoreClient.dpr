program StoreClient;

uses
  Forms,
  MyClient in 'MyClient.pas' {fmMain},
  Unit1 in 'Unit1.pas' {dmMy: TDataModule},
  Product in 'Product.pas' {fmProduct},
  ProductAction in 'ProductAction.pas' {fmNewProduct},
  Supplier in 'Supplier.pas' {fmSupplier},
  SupplierAction in 'SupplierAction.pas' {fmNewSupplier},
  Report in 'Report.pas' {fmReport};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmMy, dmMy);
  Application.CreateForm(TfmProduct, fmProduct);
  Application.CreateForm(TfmNewProduct, fmNewProduct);
  Application.CreateForm(TfmSupplier, fmSupplier);
  Application.CreateForm(TfmNewSupplier, fmNewSupplier);
  Application.CreateForm(TfmReport, fmReport);
  Application.Run;
end.
