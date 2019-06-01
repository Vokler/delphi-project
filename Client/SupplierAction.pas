unit SupplierAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmNewSupplier = class(TForm)
    lbName: TLabel;
    lbAddress: TLabel;
    edName: TEdit;
    edAddress: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure edNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNewSupplier: TfmNewSupplier;

implementation

{$R *.dfm}

procedure TfmNewSupplier.edNameChange(Sender: TObject);
begin
  btnOK.Enabled := (edName.Text <> '') and (edAddress.Text <> '');
end;

end.
