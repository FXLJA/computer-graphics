unit Utama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ColorBox;

type

  { TForm_Utama }

  TForm_Utama = class(TForm)
    ColorBox1: TColorBox;
    Ellipse: TButton;
    Rectangle: TButton;
    Clear: TButton;
    Image1: TImage;
    procedure ColorBox1Change(Sender: TObject);
    procedure EllipseClick(Sender: TObject);
    procedure RectangleClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
  private

  public

  end;

var
  Form_Utama: TForm_Utama;

implementation

{$R *.lfm}

{ TForm_Utama }

procedure TForm_Utama.RectangleClick(Sender: TObject);
begin
  Image1.Canvas.Pen.Color := ColorBox1.Selected;
  Image1.Canvas.Pen.Style := psDash;
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Brush.Style := bsClear;
  Image1.Canvas.Rectangle(100,100,250,300);
end;

procedure TForm_Utama.ClearClick(Sender: TObject);
begin
  Image1.Canvas.pen.Color := clWhite;
  Image1.Canvas.pen.Style := psSolid;
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Brush.Style := bsSolid;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
end;

procedure TForm_Utama.EllipseClick(Sender: TObject);
begin
  Image1.Canvas.Pen.Color := clBlue;
  Image1.Canvas.Pen.Style := psDash;
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Brush.Style := bsClear;
  Image1.Canvas.Ellipse(100,100,250,300);
end;

procedure TForm_Utama.ColorBox1Change(Sender: TObject);
begin
  RectangleClick(Sender);
end;

end.

