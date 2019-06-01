unit ProductAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmNewProduct = class(TForm)
    lbName: TLabel;
    lbUnit: TLabel;
    edName: TEdit;
    edUnit: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure edNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNewProduct: TfmNewProduct;

implementation

{$R *.dfm}

procedure TfmNewProduct.FormActivate(Sender: TObject);
var i : Integer;
begin
  for i := 0 to ComponentCount-1 do
    if Components[i] is TEdit then
      (Components[i] as TEdit).Text := '';
  btnOK.Enabled := False;
end;

procedure TfmNewProduct.edNameChange(Sender: TObject);
var i : Integer;
begin
  btnOK.Enabled := True;
  for i := 0 to ComponentCount-1 do
    if Components[i] is TEdit then
      btnOK.Enabled := btnOK.Enabled and ((Components[i] as TEdit).Text <> '');
end;

end.
