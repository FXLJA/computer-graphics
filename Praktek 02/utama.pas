unit utama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.FormShow(Sender: TObject);
begin
  Image1.Canvas.Pen.Style:= psSolid;
  Image1.Canvas.Pen.Color:= clRed;
  Image1.Canvas.Line(100,100,280,100);
  Image1.Canvas.LineTo(130, 240);
  Image1.Canvas.LineTo(190, 40);
  Image1.Canvas.LineTo(240,240);
  Image1.Canvas.LineTo(100,100);
end;

end.

