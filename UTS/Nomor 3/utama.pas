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
  Px: Integer;
  Py: Integer;
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

  //Isi array
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
  Image1.Canvas.Line(Px, 0, Px, Image1.Height);
  Image1.Canvas.Line(0, Py, Image1.Width, Py);

  Image1.Canvas.Pen.Style:= psSolid;
  Image1.Canvas.Pen.Width:= 3;
  Image1.Canvas.Pen.Color:= clLime;

  //Gambar
  Image1.Canvas.MoveTo(Px + koor[4].x, Py - koor[4].y);
  for i:= 1 to 4 do
  begin
    Image1.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
type
  rotateMatrix = record
    x: Real;
    y: Real;
  end;

var
  i: Integer;
  beta: Real;
  rad: Real;
  T: Real;
  temp: array [1..5] of rotateMatrix;

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

  //Set sudut
  beta:= 25.0;
  rad:= beta * pi/180 ;

  //Atur ulang koordinat
  for i:= 1 to 5 do
   begin
      temp[i].x:= koor[i].x;
      temp[i].y:= koor[i].y;

      T:= temp[i].x;
      temp[i].x:= cos(rad)*temp[i].x - sin(rad)*temp[i].y;
      temp[i].y:= sin(rad)*T + cos(rad)*temp[i].y;

      koor[i].x:= round(temp[i].x);
      koor[i].y:= round(temp[i].y);
   end;

  Image1.Canvas.Pen.Style:= psSolid;
  Image1.Canvas.Pen.Width:= 3;
  Image1.Canvas.Pen.Color:= clLime;

  //Gambar
  Image1.Canvas.MoveTo(Px + koor[4].x, Py - koor[4].y);
  for i:= 1 to 4 do
  begin
    Image1.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
  end;
end;

end.

