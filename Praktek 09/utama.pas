unit utama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ColorBox;

type

  { TForm1 }

  TForm1 = class(TForm)
    btClear: TButton;
    btGambar: TButton;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    editx1: TEdit;
    edity1: TEdit;
    editx2: TEdit;
    edity2: TEdit;
    Image1: TImage;
    procedure btClearClick(Sender: TObject);
    procedure btGambarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

var
  px, py : integer;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.btClearClick(Sender: TObject);
begin
  Image1.Canvas.Pen.Color:=clWhite;
  Image1.Canvas.Brush.Style:= bsSolid;
  Image1.Canvas.Brush.Color:= clWhite;
  Image1.Canvas.Rectangle(0,0,Image1.Width, Image1.Height);

  Image1.Canvas.Pen.Style:= psDash;
  Image1.Canvas.Pen.Color:= clRed;

  //garis sumbu y
  Image1.Canvas.MoveTo(px,0);
  Image1.Canvas.LineTo(px,Image1.Height);

  //garis sumbu x
  Image1.Canvas.MoveTo(0,py);
  Image1.Canvas.LineTo(Image1.Width,py);

end;

procedure TForm1.btGambarClick(Sender: TObject);
var
  x2,x1,y2,y1 : Double;
  dx,dy : Double;
  step : Double;
  stepX, stepY : Double;
  x,y: Double;
  a,j : Integer;
begin

     x2 := StrToFloat(editx2.Text);
     x1 := StrToFloat(editx1.Text);
     y2 := StrToFloat(edity2.Text);
     y1 := StrToFloat(edity1.Text);
     dx := abs ( x2-x1 );
     dy := abs ( y2-y1 );

     if dx>dy then
     begin
       step := dx;
     end
     else
     begin
       step := dy;
       end;

     stepX := (x2-x1)/step;
     stepY := (y2-y1)/step;

     x := x1;
     y := y1;
     j := round (step)-1;


          Image1.Canvas.Pixels[(px + round(x)) , (py - round(y))] := colorbox1.selected;

     for a := 1 to j do
     begin
          x := x + stepX;
          y := y + stepY;
          Image1.Canvas.Pixels[(px + round(x)) , (py - round(y))] := colorbox1.selected;

     end;

     for a := 1 to j do
     begin
          Image1.Canvas.Pixels[(px + round(x)) , (py - round(y))] := colorbox2.selected;
          x := x + stepX;
          y := y + stepY;
          Image1.Canvas.Pixels[(px + round(x)) , (py - round(y))] := colorbox1.selected;

     end;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  btClearClick(Sender);
  Image1.Canvas.Pen.Style:= psDash;
  Image1.Canvas.Pen.Color:= clRed;
  px := Image1.Width div 2;
  py := Image1.Height div 2;

  //garis sumbu y
  Image1.Canvas.MoveTo(px,0);
  Image1.Canvas.LineTo(px,Image1.Height);

  //garis sumbu x
  Image1.Canvas.MoveTo(0,py);
  Image1.Canvas.LineTo(Image1.Width,py);
end;

end.


