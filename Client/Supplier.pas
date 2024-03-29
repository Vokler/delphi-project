unit Supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, Menus;

type
  TfmSupplier = class(TForm)
    MainMenu1: TMainMenu;
    miAdd: TMenuItem;
    miChange: TMenuItem;
    miDelete: TMenuItem;
    miClose: TMenuItem;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miCloseClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure miChangeClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    IDSupplier : Integer;
    { Public declarations }
  end;

var
  fmSupplier: TfmSupplier;

implementation

uses Unit1, SupplierAction;

{$R *.dfm}

procedure TfmSupplier.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet := dmMy.cdsProvider;
end;

procedure TfmSupplier.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IDSupplier := dmMy.cdsProviderID.Value;
  DataSource1.DataSet := nil;
end;

procedure TfmSupplier.miCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSupplier.miAddClick(Sender: TObject);
begin
  with fmNewSupplier do
  begin
    edName.Text := '';
    edAddress.Text := '';
    ShowModal;
    if ModalResult = mrOk then
    begin
      try
        dmMy.DCOMConnection1.AppServer.smUpdateProvider(0, edName.Text, edAddress.Text);
      except
        MessageDlg('������ ������ � ��', mtError, [mbOk], 0)
      end;
      dmMy.cdsProvider.Refresh;
    end;
  end;
end;

procedure TfmSupplier.miChangeClick(Sender: TObject);
begin
  with fmNewSupplier do
  begin
    edName.Text := dmMy.cdsProviderName.Value;
    edAddress.Text := dmMy.cdsProviderAddress.Value;
    ShowModal;
    if ModalResult = mrOk then
    begin
      try
        dmMy.DCOMConnection1.AppServer.smUpdateProvider(
        dmMy.cdsProviderID.Value, edName.Text, edAddress.Text);
      except
        MessageDlg('������ ������ � ��', mtError, [mbOk], 0)
      end;
      dmMy.cdsProvider.Refresh;
    end;
  end;
end;

procedure TfmSupplier.miDeleteClick(Sender: TObject);
begin
  if (dmMy.cdsProvider.RecordCount > 0) and
  (MessageDlg('������� ����������'''+dmMy.cdsProviderName.AsString+'''?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dmMy.DCOMConnection1.AppServer.smDeleteProvider(dmMy.cdsProviderID.Value);
    dmMy.cdsProvider.Refresh;
  end;
end;

end.
