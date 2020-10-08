unit prak04;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, ColorBox;

type
    //Record (Struct) untuk menampung koordinat
    koordinat = record
      x: Integer;
      y: Integer;
    end;

  { TForm1 }
    TForm1 = class(TForm)
    btnScale: TButton;
    btnTranslasi: TButton;
    btnScaling: TButton;
    btnRotasi: TButton;
    CartesiusImage: TImage;

    //Button
    btnIndex: TButton;
    btnMatrix: TButton;
    btnClear: TButton;
    btnExit: TButton;
    clrBox: TColorBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    lblTx: TLabel;
    lbSx: TLabel;
    lblTy: TLabel;
    lblSy: TLabel;
    lblR: TLabel;

    //CheckBox
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
    R: TEdit;
    trckBar: TTrackBar;

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

    procedure btnClearClick(Sender: TObject);
    procedure btnMatrixClick(Sender: TObject);
    procedure btnRotasiClick(Sender: TObject);
    procedure btnScaleClick(Sender: TObject);
    procedure btnTranslasiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnIndexClick(Sender: TObject);
    procedure simpanKoordinat();
  private

  public

  end;

var
  Form1: TForm1;
  Px, Py: Integer;
  koor: array [1..5] of koordinat; //Menyimpan koordinat cartesius canvas(x,y) titik P1 - P5
  matrix: array [1..5, 1..5] of Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormShow(Sender: TObject);
begin
  btnClearClick(Sender);
end;

procedure TForm1.simpanKoordinat();
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

procedure TForm1.btnIndexClick(Sender: TObject);
var
  i: Integer;

begin
  simpanKoordinat();
  CartesiusImage.Canvas.Pen.Style:= psSolid;
  CartesiusImage.Canvas.Pen.Width:= trckBar.Position;
  CartesiusImage.Canvas.Pen.Color:= clrBox.Selected;

  CartesiusImage.Canvas.MoveTo(Px + koor[5].x, Py - koor[5].y);
  for i:= 1 to 5 do
  begin
    CartesiusImage.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
  end;
end;

procedure TForm1.btnMatrixClick(Sender: TObject);
var
  i, j: Integer;
  cbObject: TCheckBox;

begin
  simpanKoordinat();
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

procedure TForm1.btnTranslasiClick(Sender: TObject);
var
  i: Integer;

begin
  //1. Reset Canvas
  btnClearClick(Sender);

  //2. Pen
  CartesiusImage.Canvas.Pen.Style:= psSolid;
  CartesiusImage.Canvas.Pen.Width:= trckBar.Position;
  CartesiusImage.Canvas.Pen.Color:= clrBox.Selected;

  //3. Atur Ulang Koordinat
  for i:= 1 to 5 do
  begin
    koor[i].x:= koor[i].x + StrToInt(Tx.Text);
    koor[i].y:= koor[i].y + StrToInt(Ty.Text);
  end;

  //4. Gambar Bintang
  CartesiusImage.Canvas.MoveTo(Px + koor[5].x, Py - koor[5].y);
  for i:= 1 to 5 do
  begin
    CartesiusImage.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
  end;
end;

procedure TForm1.btnScaleClick(Sender: TObject);
type
  scaleMatrix = record
    x: Real;
    y: Real;
  end;

var
  i: Integer;
  temp: array [1..5] of scaleMatrix;

begin
     //1. Reset Canvas
     btnClearClick(Sender);

     //2. Pen Style
     CartesiusImage.Canvas.Pen.Style:= psSolid;
     CartesiusImage.Canvas.Pen.Width:= trckBar.Position;
     CartesiusImage.Canvas.Pen.Color:= clrBox.Selected;

     //3. Atur Ulang Koordinat
     for i:= 1 to 5 do
     begin
      //Ubah koordinat dari integer ke real
      temp[i].x:= koor[i].x;
      temp[i].y:= koor[i].y;
      //Kali koordinatnya dengan skalar (diperbesar/diperkecil berapa kali)
      temp[i].x:= temp[i].x * StrToFloat(Sx.Text);
      temp[i].y:= temp[i].y * StrToFloat(Sx.Text);
      //Tampung kembali koordinat setelah diubah ke integer
      koor[i].x:= round(temp[i].x);
      koor[i].y:= round(temp[i].y);
     end;

     //4. Gambar Bintang
     CartesiusImage.Canvas.MoveTo(Px + koor[1].x, Py - koor[1].y);
     CartesiusImage.Canvas.MoveTo(Px + koor[5].x, Py - koor[5].y);
     for i:= 1 to 5 do
     begin
          CartesiusImage.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
     end;
end;

procedure TForm1.btnRotasiClick(Sender: TObject);
type
  rotateMatrix = record
    x: Real;
    y: Real;
  end;

var
  i: Integer;
  beta, rad, T: Real;
  temp: array [1..5] of rotateMatrix;

begin
   //1. Reset Canvas
   btnClearClick(Sender);

   //2. Pen Style
   CartesiusImage.Canvas.Pen.Style:= psSolid;
   CartesiusImage.Canvas.Pen.Width:= trckBar.Position;
   CartesiusImage.Canvas.Pen.Color:= clrBox.Selected;

   //3. Atur Ulang Koordinat
   beta:= StrToFloat(R.Text);
   rad:= beta * pi/180 ;

   for i:= 1 to 5 do
   begin
     //Ubah koordinat dari integer ke real
      temp[i].x:= koor[i].x;
      temp[i].y:= koor[i].y;

      T:= temp[i].x;
      temp[i].x:= cos(rad)*temp[i].x - sin(rad)*temp[i].y;
      temp[i].y:= sin(rad)*T + cos(rad)*temp[i].y;
      //Tampung kembali koordinat setelah diubah ke integer
      koor[i].x:= round(temp[i].x);
      koor[i].y:= round(temp[i].y);
   end;

   //4. Gambar Bintang
   CartesiusImage.Canvas.MoveTo(Px + koor[1].x, Py - koor[1].y);
   CartesiusImage.Canvas.MoveTo(Px + koor[5].x, Py - koor[5].y);
   for i:= 1 to 5 do
   begin
        CartesiusImage.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
   end;
end;

procedure TForm1.btnClearClick(Sender: TObject);
var
  i, j: Integer;

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

  //Reset matrix adj
  for i:= 1 to 5 do
  begin
    for j:= 1 to 5 do
    begin
      matrix[i, j]:= 0;
    end;
  end;
end;

procedure TForm1.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
