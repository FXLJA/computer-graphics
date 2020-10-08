unit prak05;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Math, ComCtrls, ColorBox;

type
    //Record (Struct) untuk menampung koordinat
    koordinat = record
      x: Integer;
      y: Integer;
    end;

  { TForm1 }
    TForm1 = class(TForm)
    CartesiusImage: TImage;

    //Button
    btnIndex: TButton;
    btnMatrix: TButton;
    btnClear: TButton;
    btnExit: TButton;
    clrBox: TColorBox;
    btnScale: TButton;
    btnTranslasi: TButton;
    btnScaling: TButton;
    btnRotasi: TButton;
    Label22: TLabel;
    Label23: TLabel;

    //Label
    lblTx: TLabel;
    lbSx: TLabel;
    lblTy: TLabel;
    lblSy: TLabel;
    lblR: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;

    //Checkbox
    m11: TCheckBox;
    m12: TCheckBox;
    m13: TCheckBox;
    m14: TCheckBox;
    m15: TCheckBox;

    m21: TCheckBox;
    m22: TCheckBox;
    m23: TCheckBox;
    m24: TCheckBox;
    m25: TCheckBox;

    m31: TCheckBox;
    m32: TCheckBox;
    m33: TCheckBox;
    m34: TCheckBox;
    m35: TCheckBox;

    m41: TCheckBox;
    m42: TCheckBox;
    m43: TCheckBox;
    m44: TCheckBox;
    m45: TCheckBox;

    m51: TCheckBox;
    m52: TCheckBox;
    m53: TCheckBox;
    m54: TCheckBox;
    m55: TCheckBox;

    pivotCheck: TCheckBox;
    PivX: TEdit;
    PivY: TEdit;

    //TextBox
    Tx: TEdit;
    Sx: TEdit;
    Ty: TEdit;
    Sy: TEdit;
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
    R: TEdit;

    //Other
    trckBar: TTrackBar;

    procedure btnClearClick(Sender: TObject);
    procedure btnMatrixClick(Sender: TObject);
    procedure btnRotasiClick(Sender: TObject);
    procedure btnScaleClick(Sender: TObject);
    procedure btnTranslasiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnIndexClick(Sender: TObject);
    procedure getKoordinat();
    procedure getPivot();
  private

  public

  end;

var
  Form1: TForm1;
  Px: Integer;
  Py: Integer;
  Pivot: koordinat;
  koor: array [1..5] of koordinat;
  matrix: array [1..5, 1..5] of Integer;

implementation

{$R *.lfm}

{ TForm1 }

//Initial
procedure TForm1.FormShow(Sender: TObject);
begin
  btnClearClick(Sender);
end;

procedure TForm1.getKoordinat();
begin
  //Menyimpan koordinat titik P1 - P5 kedalam sebuah array of record
  koor[1].x:= StrToInt(P1x.Text);
  koor[1].y:= StrToInt(P1y.Text);

  koor[2].x:= StrToInt(P2x.Text);
  koor[2].y:= StrToInt(P2y.Text);

  koor[3].x:= StrToInt(P3x.Text);
  koor[3].y:= StrToInt(P3y.Text);

  koor[4].x:= StrToInt(P4x.Text);
  koor[4].y:= StrToInt(P4y.Text);

  koor[5].x:= StrToInt(P5x.Text);
  koor[5].y:= StrToInt(P5y.Text);
end;

//Menentukan pivot point
procedure TForm1.getPivot();
type
  value = record
    min: Integer;
    max: Integer;
  end;

var
  i: Integer;
  tempX: value;
  tempY: value;
  tbX: TEdit;
  tbY: TEdit;

begin
  //Mengisi nilai fixed sementara dengan koor titik x dan y titik pertama
  tempX.min:= StrToInt(P1x.Text);
  tempY.min:= StrToInt(P1y.Text);
  tempX.max:= StrToInt(P1x.Text);
  tempY.max:= StrToInt(P1y.Text);

  for i:= 1 to 5 do
  begin
    tbX:= TEdit(Form1.FindComponent('P' + IntToStr(i) + 'x'));
    tbY:= TEdit(Form1.FindComponent('P' + IntToStr(i) + 'y'));

    //Carin nilai MIN titik X dan Y
    if (tempX.min > StrToInt(tbX.Text)) then
    begin
         tempX.min:= StrToInt(tbX.Text);
    end;

    if (tempY.min > StrToInt(tbY.Text)) then
    begin
         tempY.min:= StrToInt(tbY.Text);
    end;

    //Carin nilai MAX titik X dan Y
    if (tempX.max < StrToInt(tbX.Text)) then
    begin
         tempX.max:= StrToInt(tbX.Text);
    end;

    if (tempY.max < StrToInt(tbY.Text)) then
    begin
         tempY.max:= StrToInt(tbY.Text);
    end;
  end;

  Pivot.x:= (tempX.min + tempX.max) div 2;
  Pivot.y:= (tempY.min + tempY.max) div 2;

  PivX.Text:= IntToStr(Pivot.x);
  PivY.Text:= IntToStr(Pivot.y);
end;

//Gambar awal (Array Index)
procedure TForm1.btnIndexClick(Sender: TObject);
var
  i: Integer;

begin
  getKoordinat();
  CartesiusImage.Canvas.Pen.Style:= psSolid;
  CartesiusImage.Canvas.Pen.Width:= trckBar.Position;
  CartesiusImage.Canvas.Pen.Color:= clrBox.Selected;

  CartesiusImage.Canvas.MoveTo(Px + koor[5].x, Py - koor[5].y);
  for i:= 1 to 5 do
  begin
    CartesiusImage.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
  end;
end;

//Gambar awal (Adjacency Matrix)
procedure TForm1.btnMatrixClick(Sender: TObject);
var
  i: Integer;
  j: Integer;
  cbObject: TCheckBox;

begin
  getKoordinat();
  CartesiusImage.Canvas.Pen.Style:= psSolid;
  CartesiusImage.Canvas.Pen.Width:= trckBar.Position;
  CartesiusImage.Canvas.Pen.Color:= clrBox.Selected;

  for i:= 1 to 5 do
  begin
    for j:= 1 to 5 do
    begin
      cbObject:= TCheckBox(Form1.FindComponent('m' + IntToStr(i) + IntToStr(j)));
      if (cbObject.Checked = True) then
      begin
        matrix[i,j]:= 1;
      end;
    end;
  end;

  for i:= 1 to 5 do
  begin
    for j:= 1 to 5 do
    begin
      if (matrix[i,j] = 1) then
      begin
        CartesiusImage.Canvas.MoveTo(Px + koor[i].x, Py - koor[i].y);
        CartesiusImage.Canvas.LineTo(Px + koor[j].x, Py - koor[j].y);
      end;
    end;
  end;
end;

//Translasi
procedure TForm1.btnTranslasiClick(Sender: TObject);
var
  i: Integer;

begin
  //Reset canvas
  btnClearClick(Sender);

  //Pen setup
  CartesiusImage.Canvas.Pen.Style:= psSolid;
  CartesiusImage.Canvas.Pen.Width:= trckBar.Position;
  CartesiusImage.Canvas.Pen.Color:= clrBox.Selected;

  //Atur ulang koordinat
  for i:= 1 to 5 do
  begin
    koor[i].x:= koor[i].x + StrToInt(Tx.Text);
    koor[i].y:= koor[i].y + StrToInt(Ty.Text);
  end;

  //Gambar
  CartesiusImage.Canvas.MoveTo(Px + koor[5].x, Py - koor[5].y);
  for i:= 1 to 5 do
  begin
    CartesiusImage.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
  end;
end;

//Scaling
procedure TForm1.btnScaleClick(Sender: TObject);
type
  scaleMatrix = record
    x: Real;
    y: Real;
  end;

var
  i: Integer;
  tempScale: array [1..5] of scaleMatrix;

begin
   //Reset canvas
   btnClearClick(Sender);

   //Pen setup
   CartesiusImage.Canvas.Pen.Style:= psSolid;
   CartesiusImage.Canvas.Pen.Width:= trckBar.Position;
   CartesiusImage.Canvas.Pen.Color:= clrBox.Selected;

   //Set pivot
   getPivot();

   //Cek pivot
  if (pivotCheck.Checked = True) then
  begin
    for i:= 1 to 5 do
    begin
      tempScale[i].x:= koor[i].x - Pivot.x;
      tempScale[i].y:= koor[i].y - Pivot.y;

      tempScale[i].x:= tempScale[i].x * StrToFloat(Sx.Text);
      tempScale[i].y:= tempScale[i].y * StrToFloat(Sx.Text);

      koor[i].x:= round(tempScale[i].x) + Pivot.x;
      koor[i].y:= round(tempScale[i].y) + Pivot.y;
    end;
  end
    else
    begin
      for i:= 1 to 5 do
      begin
        //Ubah koordinat dari integer ke real
         tempScale[i].x:= koor[i].x;
         tempScale[i].y:= koor[i].y;

         //Kali koordinatnya dengan skalar (diperbesar/diperkecil berapa kali)
         tempScale[i].x:= tempScale[i].x * StrToFloat(Sx.Text);
         tempScale[i].y:= tempScale[i].y * StrToFloat(Sx.Text);

         //Tampung kembali koordinat setelah diubah ke integer
         koor[i].x:= round(tempScale[i].x);
         koor[i].y:= round(tempScale[i].y);
      end;
    end;

    CartesiusImage.Canvas.MoveTo(Px + koor[5].x, Py - koor[5].y);
    for i:= 1 to 5 do
    begin
      CartesiusImage.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
    end;
end;

//Function untuk merotasi objek
procedure TForm1.btnRotasiClick(Sender: TObject);
type
  rotateMatrix = record
    x: Real;
    y: Real;
  end;

var
  i: Integer;
  T: Real;
  rad: Real;
  beta: Real;
  tempRotate: array [1..5] of rotateMatrix;

begin

  //Reset canvas
  btnClearClick(Sender);

  //Pen setup
  CartesiusImage.Canvas.Pen.Style:= psSolid;
  CartesiusImage.Canvas.Pen.Width:= trckBar.Position;
  CartesiusImage.Canvas.Pen.Color:= clrBox.Selected;

  //Set pivot
  getPivot();

  //Atur Ulang Koordinat
  beta:= StrToFloat(R.Text);
  rad:= beta * pi / 180 ;

  if (pivotCheck.Checked = True) then
  begin
   for i:= 1 to 5 do
   begin
     //ShowMessage(IntToStr(i));
     tempRotate[i].x:= koor[i].x - Pivot.x;
     tempRotate[i].y:= koor[i].y - Pivot.y;

     T:= tempRotate[i].x;
     tempRotate[i].x:= cos(rad) * tempRotate[i].x - sin(rad) * tempRotate[i].y;
     tempRotate[i].y:= sin(rad) * T + cos(rad) * tempRotate[i].y;

     koor[i].x:= round(tempRotate[i].x) + Pivot.x;
     koor[i].y:= round(tempRotate[i].y) + Pivot.y;
   end;
  end
    else
    begin
     for i:= 1 to 5 do
     begin
        tempRotate[i].x:= koor[i].x;
        tempRotate[i].y:= koor[i].y;

        T:= tempRotate[i].x;
        tempRotate[i].x:= cos(rad) * tempRotate[i].x - sin(rad) * tempRotate[i].y;
        tempRotate[i].y:= sin(rad) * T + cos(rad) * tempRotate[i].y;

        koor[i].x:= round(tempRotate[i].x);
        koor[i].y:= round(tempRotate[i].y);
     end;
    end;

  //Gambar
  CartesiusImage.Canvas.MoveTo(Px + koor[5].x, Py - koor[5].y);
  for i:= 1 to 5 do
  begin
   CartesiusImage.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
  end;
end;

//Clear
procedure TForm1.btnClearClick(Sender: TObject);
var
  i: Integer;
  j: Integer;

begin
  Px := CartesiusImage.Width div 2;
  Py := CartesiusImage.Height div 2;

  //Buat Canvas berwarna putih
  CartesiusImage.Canvas.Brush.Color:= clWhite;
  CartesiusImage.Canvas.FillRect(0,0,CartesiusImage.Width,CartesiusImage.Height);
  CartesiusImage.Canvas.FillRect(CartesiusImage.BoundsRect);

  //Buat Garis Cartesius
  CartesiusImage.Canvas.Pen.Style:= psDot;
  CartesiusImage.Canvas.Pen.Width:= 1;
  CartesiusImage.Canvas.Pen.Color:= clBlack;
  CartesiusImage.Canvas.Line(Px,0,Px,CartesiusImage.Height);
  CartesiusImage.Canvas.Line(0,Py,CartesiusImage.Width,Py);

  //Reset adjacency matrix
  for i:= 1 to 5 do
  begin
    for j:= 1 to 5 do
    begin
      matrix[i, j]:= 0;
    end;
  end;
end;

//Exit
procedure TForm1.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
