unit UntMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Ani, FMX.ListView, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, FMX.Effects, FMX.MultiView;

type
  TfrmMain = class(TForm)
    layout_principal: TLayout;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label1: TLabel;
    img_menu: TImage;
    ShadowEffect2: TShadowEffect;
    mtvMenu: TMultiView;
    lytMenu: TLayout;
    rect_menu: TRectangle;
    AnimationMenu: TFloatAnimation;
    Layout5: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Path1: TPath;
    Layout4: TLayout;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    lytExit: TLayout;
    lytIcoExit: TLayout;
    pthIcoExit: TPath;
    lytTextExit: TLayout;
    lblExit: TLabel;
    speLogoff: TSpeedButton;
    Rectangle4: TRectangle;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Circle3: TCircle;
    Circle4: TCircle;
    ShadowEffect1: TShadowEffect;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure Close_Menu();
begin
  with frmMain do
  begin
    mtvMenu.Mode := TMultiViewMode.Drawer;
  end;
end;

procedure Open_Menu();
begin
  with frmMain do
  begin
    mtvMenu.Mode := TMultiViewMode.Panel;
  end;
end;

procedure Menu();
var
  larg_screen: Integer;
begin
{$IFDEF ANDROID}
  larg_screen := Screen.width;
{$ENDIF}
{$IFDEF MSWINDOWS}
  larg_screen := frmMain.width;
{$ENDIF}
  with frmMain do
  begin
    begin
      if (larg_screen < 600) then
      begin
        // Si la pantalla es menor a 600 se cerrara el menu(cambia de modo a Drawer)
        Close_Menu;
      end;

      if (larg_screen >= 600) then
      begin
        // Si la pantalla es mayor a 599 se abrira el menu (cambia de modo a Panel)
        Open_Menu;
      end;
    end;
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  Menu();
end;

end.
