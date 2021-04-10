unit utama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type
    koordinat = record
      x: Integer;
      y: Integer;
    end;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Px, Py: Integer;
  koor: array [1..4] of koordinat;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormShow(Sender: TObject);
var
  i: Integer;

begin

  Px:= 300;
  Py:= 250;

  //Koordinat
  koor[1].x:= 50;
  koor[1].y:= 150;

  koor[2].x:= 150;
  koor[2].y:= 150;

  koor[3].x:= 50;
  koor[3].y:= 50;

  koor[4].x:= 150;
  koor[4].y:= 50;

  Image1.Canvas.Brush.Color:= clWhite;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);
  Image1.Canvas.FillRect(Image1.BoundsRect);

  //Buat Garis Cartesius
  Image1.Canvas.Pen.Style:= psDot;
  Image1.Canvas.Pen.Width:= 1;
  Image1.Canvas.Pen.Color:= clRed;
  Image1.Canvas.Line(Px, 0, Px, Image1.Height); //Vertical (Garis Y)
  Image1.Canvas.Line(0, Py, Image1.Width, Py);  //Horizontal (Garis X)

  Image1.Canvas.Pen.Style:= psSolid;
  Image1.Canvas.Pen.Width:= 3;
  Image1.Canvas.Pen.Color:= clOrange;

  //Gambar
  Image1.Canvas.MoveTo(Px + koor[4].x, Py - koor[4].y);
  for i:= 1 to 4 do
  begin
    Image1.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
type
  floatMatrix = record
    x: Real;
    y: Real;
  end;

var
  i: Integer;
  beta, rad, T: Real;
  tempRotate: array [1..4] of floatMatrix;
  tempScale: array [1..4] of floatMatrix;

begin
  //Hapus Canvas
  Image1.Canvas.Brush.Color:= clWhite;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);
  Image1.Canvas.FillRect(Image1.BoundsRect);

  //Buat Garis Cartesius
  Image1.Canvas.Pen.Style:= psDot;
  Image1.Canvas.Pen.Width:= 1;
  Image1.Canvas.Pen.Color:= clRed;
  Image1.Canvas.Line(Px, 0, Px, Image1.Height);
  Image1.Canvas.Line(0, Py, Image1.Width, Py);

   beta:= 25.0;
   rad:= beta * pi/180;

   //Atur ulang koordinat
   for i:= 1 to 5 do
   begin
      tempRotate[i].x:= koor[i].x - koor[3].x;
      tempRotate[i].y:= koor[i].y - koor[3].y;

      T:= tempRotate[i].x;
      tempRotate[i].x:= cos(rad)*tempRotate[i].x - sin(rad)*tempRotate[i].y;
      tempRotate[i].y:= sin(rad)*T + cos(rad)*tempRotate[i].y;

      tempScale[i].x:= tempRotate[i].x;
      tempScale[i].y:= tempRotate[i].y;

      tempScale[i].x:= tempScale[i].x * 1.1;
      tempScale[i].y:= tempScale[i].y * 1.1;

      koor[i].x:= round(tempScale[i].x) + koor[3].x;
      koor[i].y:= round(tempScale[i].y) + koor[3].y;
   end;

   Image1.Canvas.Pen.Style:= psSolid;
   Image1.Canvas.Pen.Width:= 3;
   Image1.Canvas.Pen.Color:= clOrange;

   //Gambar
   Image1.Canvas.MoveTo(Px + koor[4].x, Py - koor[4].y);
   for i:= 1 to 5 do
   begin
     Image1.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
   end;
end;

end.

