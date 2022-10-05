unit uFrmMain;

interface

uses
   Winapi.Windows,
   Winapi.Messages,
   System.SysUtils,
   System.Variants,
   System.Classes,
   Vcl.Graphics,
   Vcl.Controls,
   Vcl.Forms,
   Vcl.Dialogs,
   Vcl.StdCtrls;

type
   TFrmMain = class(TForm)
      btnOK: TButton;
      procedure FormCreate(Sender: TObject);
      procedure btnOKClick(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TrimAppMemorySize;
var
   MainHandle: THandle;
begin
   try
      MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
      SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF);
      CloseHandle(MainHandle);
   except
   end;
   Application.ProcessMessages;
end;

procedure TFrmMain.btnOKClick(Sender: TObject);
begin
   TrimAppMemorySize;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
   Self.Height := 200;
   Self.Width := 400;

   Self.Caption := Application.Title;
   Self.BorderIcons := [biSystemMenu, biMinimize];
   Self.Position := poScreenCenter;
end;

end.
