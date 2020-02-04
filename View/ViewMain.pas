unit ViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, NsNumEdit, NsEditText,
  MyUtils, System.Actions, Vcl.ActnList;

type
  TWindowMain = class(TForm)
    BoxType: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    TxtResult: TEdit;
    Txt1: TNsEditText;
    Txt2: TNsEditText;
    LabelResult: TLabel;
    Label3: TLabel;
    Txt3: TNsEditText;
    Actions: TActionList;
    ActEsc: TAction;
    procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BoxTypeChange(Sender: TObject);
    procedure TxtChange(Sender: TObject);
    procedure ActEscExecute(Sender: TObject);
  end;

var
  WindowMain: TWindowMain;

implementation

{$R *.dfm}

procedure TWindowMain.KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Perform(Wm_NextDlgCtl, 0, 0);
  end
  else if Key = VK_UP then
  begin
    Key := 7;
    Perform(Wm_NextDlgCtl, 1, 0);
  end;
end;

procedure TWindowMain.BoxTypeChange(Sender: TObject);
begin
  TxtResult.Clear;
  Txt1.Clear;
  Txt2.Clear;
  Txt3.Clear;
end;

procedure TWindowMain.TxtChange(Sender: TObject);
var
  V1, V2, V3: double;
begin
  case BoxType.ItemIndex of
    0:
    begin
      V1 := StrToFloat(TUtils.IfEmpty(Txt1.Text, '1'));
      V2 := TUtils.IfZero(StrToFloat(TUtils.IfEmpty(Txt2.Text, '1')), 1);
      V3 := TUtils.IfZero(StrToFloat(TUtils.IfEmpty(Txt3.Text, '1')), 1);

      if Txt2.Focused then
      begin
        Txt3.Text := FloatToStr((V1 / V2) / V1);
        V3 := TUtils.IfZero(StrToFloat(TUtils.IfEmpty(Txt3.Text, '1')), 1);
      end
      else
      if Txt3.Focused then
      begin
        Txt2.Text := FloatToStr(V1 / (V3 * V1));
        V2 := TUtils.IfZero(StrToFloat(TUtils.IfEmpty(Txt2.Text, '1')), 1);
      end;

      TxtResult.Text := FloatToStr(V1 * V3);
    end;
  end;
end;

procedure TWindowMain.ActEscExecute(Sender: TObject);
begin
  Close;
end;

end.
