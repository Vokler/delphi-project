unit Product;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, Menus;

type
  TfmProduct = class(TForm)
    MainMenu1: TMainMenu;
    miAdd: TMenuItem;
    miDelete: TMenuItem;
    miClose: TMenuItem;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miCloseClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProduct: TfmProduct;

implementation

uses Unit1, ProductAction;

{$R *.dfm}

procedure TfmProduct.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet := dmMy.cdsProduct;
end;

procedure TfmProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataSource1.DataSet := nil;
end;

procedure TfmProduct.miCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProduct.miAddClick(Sender: TObject);
begin
  fmNewProduct.ShowModal;
  if fmNewProduct.ModalResult = mrOk then
  begin
    try
      dmMy.DCOMConnection1.AppServer.smUpdateProduct(
      0,
      fmNewProduct.edName.Text,
      fmNewProduct.edUnit.Text);
    except
      MessageDlg('Ошибка записи в БД', mtError, [mbOk], 0)
    end;
    dmMy.cdsProduct.Refresh;
  end;
end;

procedure TfmProduct.miDeleteClick(Sender: TObject);
begin
if (dmMy.cdsProduct.RecordCount > 0) and
  (MessageDlg('Удалить продукт'''+dmMy.cdsProductName.AsString+'''?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dmMy.DCOMConnection1.AppServer.smDeleteProduct(dmMy.cdsProductID.Value);
    dmMy.cdsProduct.Refresh;
  end;
end;

end.
