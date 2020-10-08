unit prak03;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)

  //Button
  btnIndex: TButton;
  btnMatrix: TButton;
  btnClear: TButton;
  btnExit: TButton;

  //CheckBox
  P1toP1: TCheckBox;
  P1toP2: TCheckBox;
  P1toP3: TCheckBox;
  P1toP4: TCheckBox;
  P1toP5: TCheckBox;
  P2toP1: TCheckBox;
  P2toP2: TCheckBox;
  P2toP3: TCheckBox;
  P2toP4: TCheckBox;
  P2toP5: TCheckBox;
  P3toP1: TCheckBox;
  P3toP2: TCheckBox;
  P3toP3: TCheckBox;
  P3toP4: TCheckBox;
  P3toP5: TCheckBox;
  P4toP1: TCheckBox;
  P4toP2: TCheckBox;
  P4toP3: TCheckBox;
  P4toP4: TCheckBox;
  P4toP5: TCheckBox;
  P5toP1: TCheckBox;
  P5toP2: TCheckBox;
  P5toP3: TCheckBox;
  P5toP4: TCheckBox;
  P5toP5: TCheckBox;

  //TextBox
  P1x: TEdit;
  P5y: TEdit;
  P1y: TEdit;
  P2x: TEdit;
  P2y: TEdit;
  P3x: TEdit;
  P3y: TEdit;
  P4x: TEdit;
  P4y: TEdit;
  P5x: TEdit;

  //Label
  Label1: TLabel;
  Label10: TLabel;
  Label11: TLabel;
  Label12: TLabel;
  Label13: TLabel;
  Label14: TLabel;
  Label15: TLabel;
  Label2: TLabel;
  Label3: TLabel;
  Label4: TLabel;
  Label5: TLabel;
  Label6: TLabel;
  Label7: TLabel;
  Label8: TLabel;
  Label9: TLabel;

  CartesiusImage: TImage;
  procedure btnClearClick(Sender: TObject);
  procedure btnExitClick(Sender: TObject);
  procedure btnIndexClick(Sender: TObject);
  procedure btnMatrixClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure P1toP1Change(Sender: TObject);
  procedure P1toP2Change(Sender: TObject);
  procedure P1toP3Change(Sender: TObject);
  procedure P1toP4Change(Sender: TObject);
  procedure P1toP5Change(Sender: TObject);
  procedure P2toP1Change(Sender: TObject);
  procedure P2toP2Change(Sender: TObject);
  procedure P2toP3Change(Sender: TObject);
  procedure P2toP4Change(Sender: TObject);
  procedure P2toP5Change(Sender: TObject);
  procedure P3toP1Change(Sender: TObject);
  procedure P3toP2Change(Sender: TObject);
  procedure P3toP3Change(Sender: TObject);
  procedure P3toP4Change(Sender: TObject);
  procedure P3toP5Change(Sender: TObject);
  procedure P4toP1Change(Sender: TObject);
  procedure P4toP2Change(Sender: TObject);
  procedure P4toP3Change(Sender: TObject);
  procedure P4toP4Change(Sender: TObject);
  procedure P4toP5Change(Sender: TObject);
  procedure P5toP1Change(Sender: TObject);
  procedure P5toP2Change(Sender: TObject);
  procedure P5toP3Change(Sender: TObject);
  procedure P5toP4Change(Sender: TObject);
  procedure P5toP5Change(Sender: TObject);

  private

  public

  end;

var
  Form1 : TForm1;
  i     : Integer;
  j     : Integer;
  Px    : Integer;
  Py    : Integer;
  korX  : array [1..5] of integer;
  korY  : array [1..5] of integer;
  arah  : array [1..5] of integer;
  adj   : array [1 .. 5, 1 .. 5] of Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormShow(Sender: TObject);
begin
  Px := CartesiusImage.Width div 2;
  Py := CartesiusImage.Height div 2;

  CartesiusImage.Canvas.Brush.Color:=clWhite;
  CartesiusImage.Canvas.FillRect(0,0,CartesiusImage.Width,CartesiusImage.Height);
  CartesiusImage.Canvas.FillRect(CartesiusImage.BoundsRect);

  CartesiusImage.Canvas.Pen.Style:=psDot;
  CartesiusImage.Canvas.Pen.Color:=clBlack;
  CartesiusImage.Canvas.Line(Px,0,Px,CartesiusImage.Height);
  CartesiusImage.Canvas.Line(0,Py,CartesiusImage.Width,Py);
end;

//From P1
procedure TForm1.P1toP1Change(Sender: TObject);
begin
  if (P1toP1.Checked = True) then
    adj[1,1] := 1
    else
      adj[1,1] := 0;
end;

procedure TForm1.P1toP2Change(Sender: TObject);
begin
  if (P1toP2.Checked = True) then
    adj[1,2] := 1
    else
      adj[1,2] := 0;
end;

procedure TForm1.P1toP3Change(Sender: TObject);
begin
  if (P1toP3.Checked = True) then
    adj[1,3] := 1
    else
      adj[1,3] := 0;
end;

procedure TForm1.P1toP4Change(Sender: TObject);
begin
  if (P1toP4.Checked = True) then
    adj[1,4] := 1
    else
      adj[1,4] := 0;
end;

procedure TForm1.P1toP5Change(Sender: TObject);
begin
  if (P1toP5.Checked = True) then
    adj[1,5] := 1
    else
      adj[1,5] := 0;
end;

//From P2
procedure TForm1.P2toP1Change(Sender: TObject);
begin
  if (P2toP1.Checked = True) then
    adj[2,1] := 1
    else
      adj[2,1] := 0;
end;

procedure TForm1.P2toP2Change(Sender: TObject);
begin
  if (P2toP2.Checked = True) then
    adj[2,2] := 1
    else
      adj[2,2] := 0;
end;

procedure TForm1.P2toP3Change(Sender: TObject);
begin
  if (P2toP3.Checked = True) then
    adj[2,3] := 1
    else
      adj[2,3] := 0;
end;

procedure TForm1.P2toP4Change(Sender: TObject);
begin
  if (P2toP4.Checked = True) then
    adj[2,4] := 1
    else
      adj[2,4] := 0;
end;

procedure TForm1.P2toP5Change(Sender: TObject);
begin
  if (P2toP5.Checked = True) then
    adj[2,5] := 1
    else
      adj[2,5] := 0;
end;

//From P3
procedure TForm1.P3toP1Change(Sender: TObject);
begin
  if (P3toP1.Checked = True) then
    adj[3,1] := 1
    else
      adj[3,1] := 0;
end;

procedure TForm1.P3toP2Change(Sender: TObject);
begin
  if (P3toP2.Checked = True) then
    adj[3,2] := 1
    else
      adj[3,2] := 0;
end;

procedure TForm1.P3toP3Change(Sender: TObject);
begin
  if (P3toP3.Checked = True) then
    adj[3,3] := 1
    else
      adj[3,3] := 0;
end;

procedure TForm1.P3toP4Change(Sender: TObject);
begin
  if (P3toP4.Checked = True) then
    adj[3,4] := 1
    else
      adj[3,4] := 0;
end;

procedure TForm1.P3toP5Change(Sender: TObject);
begin
  if (P3toP5.Checked = True) then
    adj[3,5] := 1
    else
      adj[3,5] := 0;
end;

//From P4
procedure TForm1.P4toP1Change(Sender: TObject);
begin
  if (P4toP1.Checked = True) then
    adj[4,1] := 1
    else
      adj[4,1] := 0;
end;

procedure TForm1.P4toP2Change(Sender: TObject);
begin
  if (P4toP2.Checked = True) then
    adj[4,2] := 1
    else
      adj[4,2] := 0;
end;

procedure TForm1.P4toP3Change(Sender: TObject);
begin
  if (P4toP3.Checked = True) then
    adj[4,3] := 1
    else
      adj[4,3] := 0;
end;

procedure TForm1.P4toP4Change(Sender: TObject);
begin
  if (P4toP4.Checked = True) then
    adj[4,4] := 1
    else
      adj[4,4] := 0;
end;

procedure TForm1.P4toP5Change(Sender: TObject);
begin
  if (P4toP5.Checked = True) then
    adj[4,5] := 1
    else
      adj[4,5] := 0;
end;

//From P5
procedure TForm1.P5toP1Change(Sender: TObject);
begin
  if (P5toP1.Checked = True) then
    adj[5,1] := 1
    else
      adj[5,1] := 0;
end;

procedure TForm1.P5toP2Change(Sender: TObject);
begin
  if (P5toP2.Checked = True) then
    adj[5,2] := 1
    else
      adj[5,2] := 0;
end;

procedure TForm1.P5toP3Change(Sender: TObject);
begin
  if (P5toP3.Checked = True) then
    adj[5,3] := 1
    else
      adj[5,3] := 0;
end;

procedure TForm1.P5toP4Change(Sender: TObject);
begin
  if (P5toP4.Checked = True) then
    adj[5,4] := 1
    else
      adj[5,4] := 0;
end;

procedure TForm1.P5toP5Change(Sender: TObject);
begin
  if (P5toP5.Checked = True) then
    adj[5,5] := 1
    else
      adj[5,5] := 0;
end;

//Exit
procedure TForm1.btnExitClick(Sender: TObject);
begin
  Close;
end;

//Index
procedure TForm1.btnIndexClick(Sender: TObject);
begin
  Px:= CartesiusImage.Width div 2;
  Py:= CartesiusImage.Height div 2;

  CartesiusImage.Canvas.Pen.Style:=psSolid;
  CartesiusImage.Canvas.Pen.Color:=clBlue;

  korX[1] := Px + StrToInt(P1x.Text);
  korX[2] := Px + StrToInt(P2x.Text);
  korX[3] := Px + StrToInt(P3x.Text);
  korX[4] := Px + StrToInt(P4x.Text);
  korX[5] := Px + StrToInt(P5x.Text);

  korY[1] := Py - StrToInt(P1y.Text);
  korY[2] := Py - StrToInt(P2y.Text);
  korY[3] := Py - StrToInt(P3y.Text);
  korY[4] := Py - StrToInt(P4y.Text);
  korY[5] := Py - StrToInt(P5y.Text);

  CartesiusImage.Canvas.MoveTo(korX[1],korY[1]);

  for i := 2 to 6 do
  begin
    if (i = 6) then
    begin
      CartesiusImage.Canvas.LineTo(korX[1],korY[1]);
      Break;
    end;

    CartesiusImage.Canvas.LineTo(korX[i], korY[i]);
  end;

end;

//Matrix
procedure TForm1.btnMatrixClick(Sender: TObject);
begin
  Px:= CartesiusImage.Width div 2;
  Py:= CartesiusImage.Height div 2;

  CartesiusImage.Canvas.Pen.Style:=psSolid;
  CartesiusImage.Canvas.Pen.Color:=clBlue;

  korX[1] := Px + StrToInt(P1x.Text);
  korX[2] := Px + StrToInt(P2x.Text);
  korX[3] := Px + StrToInt(P3x.Text);
  korX[4] := Px + StrToInt(P4x.Text);
  korX[5] := Px + StrToInt(P5x.Text);

  korY[1] := Py - StrToInt(P1y.Text);
  korY[2] := Py - StrToInt(P2y.Text);
  korY[3] := Py - StrToInt(P3y.Text);
  korY[4] := Py - StrToInt(P4y.Text);
  korY[5] := Py - StrToInt(P5y.Text);

  CartesiusImage.Canvas.MoveTo(korX[1],korY[1]);

  for i := 1 to 5 do
  begin
    for j := 1 to 5 do
    begin
      if (adj[i,j] = 1) then
      begin
        CartesiusImage.Canvas.LineTo(korX[i], korY[j]);
      end;
    end;
  end;

end;

//Clear
procedure TForm1.btnClearClick(Sender: TObject);
begin
  //Pusatkan titik 0,0 Canvas
  Px:= CartesiusImage.Width div 2;
  Py:= CartesiusImage.Height div 2;

  //Set background color
  CartesiusImage.Canvas.Brush.Color:=clWhite;
  CartesiusImage.Canvas.FillRect(0,0,CartesiusImage.Width,CartesiusImage.Height);
  CartesiusImage.Canvas.FillRect(CartesiusImage.BoundsRect);

  //Gambar ulang diagram kartesius polos
  CartesiusImage.Canvas.Pen.Style:=psDot;
  CartesiusImage.Canvas.Pen.Color:=clBlack;
  CartesiusImage.Canvas.Line(Px,0,Px,CartesiusImage.Height);
  CartesiusImage.Canvas.Line(0,Py,CartesiusImage.Width,Py);

  //Reset Textbox
  P1x.Clear;
  P2x.Clear;
  P3x.Clear;
  P4x.Clear;
  P5x.Clear;
  P1y.Clear;
  P2y.Clear;
  P3y.Clear;
  P4y.Clear;
  P5y.Clear;

  //Reset Checkbox
  P1toP1.Checked:=False;
  P1toP2.Checked:=False;
  P1toP3.Checked:=False;
  P1toP4.Checked:=False;
  P1toP5.Checked:=False;

  P2toP1.Checked:=False;
  P2toP2.Checked:=False;
  P2toP3.Checked:=False;
  P2toP4.Checked:=False;
  P2toP5.Checked:=False;

  P3toP1.Checked:=False;
  P3toP2.Checked:=False;
  P3toP3.Checked:=False;
  P3toP4.Checked:=False;
  P3toP5.Checked:=False;

  P4toP1.Checked:=False;
  P4toP2.Checked:=False;
  P4toP3.Checked:=False;
  P4toP4.Checked:=False;
  P4toP5.Checked:=False;

  P5toP1.Checked:=False;
  P5toP2.Checked:=False;
  P5toP3.Checked:=False;
  P5toP4.Checked:=False;
  P5toP5.Checked:=False;
end;


end.

