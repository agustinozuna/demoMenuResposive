unit UntMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Ani, FMX.ListView, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, FMX.Effects;

type
  TfrmMain = class(TForm)
    rect_menu: TRectangle;
    AnimationMenu: TFloatAnimation;
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
    Layout2: TLayout;
    Layout3: TLayout;
    Path1: TPath;
    Layout4: TLayout;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    layout_principal: TLayout;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label1: TLabel;
    img_menu: TImage;
    rect_backgroundOpacity: TRectangle;
    Layout5: TLayout;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    procedure FormResize(Sender: TObject);
    procedure img_menuClick(Sender: TObject);
    procedure AnimationMenuFinish(Sender: TObject);
    procedure rect_backgroundOpacityClick(Sender: TObject);
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
    AnimationMenu.Inverse := true;
    AnimationMenu.Start;
    rect_menu.AnimateFloat('Opacity', 0, 0.4);
    rect_backgroundOpacity.Visible := false;
    rect_menu.Tag := 0;
  end;
end;

procedure Open_Menu();
begin
  with frmMain do
  begin
    rect_menu.Visible := true;
    AnimationMenu.Inverse := false;
    AnimationMenu.Start;
    rect_menu.AnimateFloat('Opacity', 1, 0.4);
    rect_menu.Tag := 1;
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
        // Si la pantalla es menor a 600 se cerrara el menu
        img_menu.Visible := true;
        layout_principal.Align := TAlignLayout.Top;
        rect_menu.Align := TAlignLayout.FitLeft;
        Close_Menu;
      end;
      if (larg_screen >= 600) then
      begin
        // Si la pantalla es mayor a 599 se abrira el menu
        img_menu.Visible := false;
        layout_principal.Align := TAlignLayout.Horizontal;
        rect_menu.Align := TAlignLayout.Left;
        Open_Menu;
      end;
    end;
  end;
end;

procedure TfrmMain.AnimationMenuFinish(Sender: TObject);
begin
  if frmMain.width < 600 then
    img_menu.AnimateFloat('Opacity', 1, 0.2)
  else
    img_menu.AnimateFloat('Opacity', 0, 0.2);
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  Menu();
end;

procedure TfrmMain.img_menuClick(Sender: TObject);
begin
  if frmMain.rect_menu.Tag = 0 then
  begin
    Open_Menu;
    rect_backgroundOpacity.Visible := true;
  end
  else
  begin
    Close_Menu;
  end;
end;

procedure TfrmMain.rect_backgroundOpacityClick(Sender: TObject);
begin
 Close_Menu;
end;

end.
