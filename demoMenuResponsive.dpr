program demoMenuResponsive;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntMain in 'UntMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
