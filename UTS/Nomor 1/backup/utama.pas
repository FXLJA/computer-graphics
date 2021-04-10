unit Utama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type
    koordinat = record
      x: Integer;
      y: Integer;
    end;

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
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
  //Cartesian center
  Px:= 300;
  Py:= 250;

  //Isi titik
  koor[1].x:= 50;
  koor[1].y:= 150;

  koor[2].x:= 150;
  koor[2].y:= 150;

  koor[3].x:= 50;
  koor[3].y:= 50;

  koor[4].x:= 150;
  koor[4].y:= 50;

  //Buat Canvas berwarna putih
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
  Image1.Canvas.Pen.Color:= clBlue;

  //Gambar
  Image1.Canvas.MoveTo(Px + koor[4].x, Py - koor[4].y);
  for i:= 1 to 4 do
  begin
    Image1.Canvas.LineTo(Px + koor[i].x, Py - koor[i].y);
  end;
end;

end.

