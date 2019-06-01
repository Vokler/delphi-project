program StoreAppServer;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  StoreAppServer_TLB in 'StoreAppServer_TLB.pas',
  Unit2 in 'Unit2.pas' {StoreServer: TRemoteDataModule} {StoreServer: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
