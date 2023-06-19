unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.FileCtrl,
  Vcl.ComCtrls , RegularExpressions, RegularExpressionsCore,ShellAPI;





type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    menubtncargar: TMenuItem;
    menubtnguardar: TMenuItem;
    Nuevo1: TMenuItem;
    Nuevo2: TMenuItem;
    Salir1: TMenuItem;
    Project1: TMenuItem;
    Run1: TMenuItem;
    FileListBox1: TFileListBox;
    FileOpenDialog1: TFileOpenDialog;
    SaveDialog1: TSaveDialog;
    DirectoryListBox1: TDirectoryListBox;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Cargarultimo1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure menubtnguardarClick(Sender: TObject);
    procedure menubtncargarClick(Sender: TObject);
    procedure Nuevo1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RichEdit1SelectionChange(Sender: TObject);
    procedure Run1Click(Sender: TObject);
    procedure Cargarultimo1Click(Sender: TObject);


  private
    { Private declarations }
  public
  Parametro,cadena: string;

    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Cargarultimo1Click(Sender: TObject);
begin
richedit1.lines.loadFromFile(ExtractFilePath(ParamStr(0))+'debug.v#');
end;

procedure TForm1.FileListBox1Change(Sender: TObject);
begin


//preguntar si quieres guardar el proyecto

var
  Res: integer;

Res := Application.MessageBox('�Quieres guardar el fichero antes de cargar otro?', 'Are you sure?',
  MB_ICONQUESTION or MB_YESNO);






  if Res = IDYES then
  savedialog1.Execute;
  if savedialog1.FileName='' then
   begin
   end
   else begin
     richedit1.Lines.SaveToFile(savedialog1.FileName);
     richedit1.Lines.LoadFromFile(Filelistbox1.FileName);
   end;

   if Res = IDNO then
   richedit1.Lines.LoadFromFile(Filelistbox1.FileName);


end;

procedure TForm1.FormActivate(Sender: TObject);
begin

  with saveDialog1 do begin
    Filter := 'v# files (*.v#)|*.v#|Python files (*.py)|*.py';
    DefaultExt := '.v#';
    FilterIndex := 1;
    FileName := '';

  end;


   directorylistbox1.Directory:=  Parametro;


end;

procedure TForm1.FormShow(Sender: TObject);
begin
var
  Frase: string;
begin
  Frase := Form1.Parametro; // Recupera el valor del par�metro
  // Hacer algo con la variable Frase...
    if frase='' then
   begin
   end
   else begin
     richedit1.Lines.LoadFromFile(frase);
   end;



end;
end;

procedure TForm1.menubtncargarClick(Sender: TObject);
begin
 fileopendialog1.Execute;
  if fileopendialog1.FileName='' then
   begin
   end
   else begin
     richedit1.Lines.LoadFromFile(fileopendialog1.FileName);
   end;
end;

procedure TForm1.menubtnguardarClick(Sender: TObject);
var
  TextoVisible: TStringList;
begin
 savedialog1.Execute;
   TextoVisible := TStringList.Create;
  if savedialog1.FileName='' then
   begin
   end
   else begin
   TextoVisible.Text := richedit1.Text;
     TextoVisible.SaveToFile(savedialog1.FileName);
   end;

end;

procedure TForm1.Nuevo1Click(Sender: TObject);
begin
richedit1.Lines.Clear;
end;








procedure TForm1.RichEdit1SelectionChange(Sender: TObject);
begin
var
  CharIndex, LineIndex, LineNo: Integer;
begin
  CharIndex := SendMessage(RichEdit1.Handle, EM_LINEINDEX, -1, 0);
  LineIndex := SendMessage(RichEdit1.Handle, EM_LINEFROMCHAR, CharIndex, 0);
  LineNo := LineIndex + 1;
  Label1.Caption := 'L�nea actual: ' + IntToStr(LineNo);
////pintar componentes








end;
end;

procedure TForm1.Run1Click(Sender: TObject);
var
  Params: string;
  Texto: TStrings;
begin
  Texto := TStringList.Create;
  try
  Texto.Assign(RichEdit1.Lines);
  Texto.SaveToFile(ExtractFilePath(ParamStr(0))+'debug.v#');
  finally

    Texto.Free;
  end;






  // Construye la l�nea de comandos con el nombre del archivo Python y los par�metros
  Params := 'py ' + ExtractFilePath(ParamStr(0)) +'main.py ' + ExtractFilePath(ParamStr(0)) + 'debug.v#';

  // Ejecuta la l�nea de comandos en una nueva ventana de cmd
  ShellExecute(Handle, 'open', 'cmd.exe', PChar('/c ' + Params), nil, SW_SHOW);
end;

procedure TForm1.Salir1Click(Sender: TObject);
begin
Halt;
end;

end.
