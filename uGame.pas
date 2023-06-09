unit uGame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls;

type
  TForm3 = class(TForm)
    imgSanta: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure imgSantaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  frame: Integer;

implementation

{$R *.dfm}

procedure TForm3.FormActivate(Sender: TObject);
begin
  imgSanta.Picture.LoadFromFile('.\img\Idle (1).png');
  Timer1.Enabled := True;
  frame := 1;
end;

procedure TForm3.imgSantaClick(Sender: TObject);
begin
  showMessage('Ouch!');
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
 if frame = 16 then frame := 1;
 if frame = 1 then begin
    imgSanta.Left := Random(self.width);
    imgSanta.Top := Random(self.Height);
 end;

 if frame < 16 then frame := frame + 1;

 imgSanta.Picture.LoadFromFile('.\img\Idle ('+IntToStr(frame)+').png');
end;


end.
