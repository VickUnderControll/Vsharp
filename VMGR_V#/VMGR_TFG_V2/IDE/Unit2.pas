unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    FileOpenDialog1: TFileOpenDialog;
    FileSaveDialog1: TFileSaveDialog;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.Button1Click(Sender: TObject);
begin
filesavedialog1.Execute;
memo1.Lines.SaveToFile(filesavedialog1.FileName);
form1.parametro:=filesavedialog1.FileName;
form1.show;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
fileopendialog1.Execute;
form1.parametro:=fileopendialog1.FileName;
form1.show;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin



Form1.Show;

end;

end.
