unit utama;

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
  matrix: array [1..4, 1..4] of Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormShow(Sender: TObject);
var
  i, j: Integer;

begin
  //Koordinat 0,0 Kartesius
  Px:= 300;
  Py:= 250;

  //Koordinat titik
  koor[1].x:= 50;
  koor[1].y:= 150;

  koor[2].x:= 150;
  koor[2].y:= 150;

  koor[3].x:= 50;
  koor[3].y:= 50;

  koor[4].x:= 150;
  koor[4].y:= 50;

  //Matrix Adj
  matrix[1,1]:= 0;
  matrix[1,2]:= 1;
  matrix[1,3]:= 0;
  matrix[1,4]:= 1;

  matrix[2,1]:= 0;
  matrix[2,2]:= 0;
  matrix[2,3]:= 1;
  matrix[2,4]:= 0;

  matrix[3,1]:= 0;
  matrix[3,2]:= 0;
  matrix[3,3]:= 0;
  matrix[3,4]:= 1;

  matrix[4,1]:= 0;
  matrix[4,2]:= 0;
  matrix[4,3]:= 0;
  matrix[4,4]:= 0;

  //Buat Canvas berwarna putih
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
  Image1.Canvas.Pen.Width:= 2;
  Image1.Canvas.Pen.Color:= clRed;

  //Gambar
  for i:= 1 to 4 do
  begin
    for j:= 1 to 4 do
    begin
      if (matrix[i,j] = 1) then
      begin
        Image1.Canvas.MoveTo(Px + koor[i].x, Py - koor[i].y);
        Image1.Canvas.LineTo(Px + koor[j].x, Py - koor[j].y);
      end;
    end;
  end;
end;

end.


