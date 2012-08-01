Unit ColorsFormUnit;

Interface

Uses
  Classes, Forms, Graphics, ColorWheel, Buttons, StdCtrls,
  ACLLanguageUnit;

Type
  TColorsForm = Class (TForm)
    ColorWheel: TColorWheel;
    SampleMemo: TMemo;
    SampleLabel: TLabel;
    ValueBar: TValueBar;
    OKButton: TButton;
    CancelButton: TButton;
    HelpButton: TButton;
    TextRadioButton: TRadioButton;
    BackgroundRadioButton: TRadioButton;
    Procedure ColorsFormOnSetupShow (Sender: TObject);
    Procedure ColorsFormOnCreate (Sender: TObject);
    Procedure BackgroundRadioButtonOnClick (Sender: TObject);
    Procedure ColorsFormOnShow (Sender: TObject);
    Procedure TextRadioButtonOnClick (Sender: TObject);
    Procedure ValueBarOnChange (Sender: TObject);
  Protected
    SettingColor: boolean;
    Procedure DisplayColor;
    Procedure DisplaySample;
  Protected
    Procedure OnLanguageEvent( Language: TLanguageFile;
                               const Apply: boolean );
    ExampleText: string;
  Public
    TextColor: TColor;
    BackgroundColor: TColor;
  End;

Var
  ColorsForm: TColorsForm;

Implementation

Uses
  ControlsUtility;

Procedure TColorsForm.ColorsFormOnSetupShow (Sender: TObject);
Begin
//   ScaleForm( self, 11, 16 );
  // doesn't look to good with non-proportional scaling.
End;

Procedure TColorsForm.ColorsFormOnCreate (Sender: TObject);
Begin
  RegisterForLanguages( OnLanguageEvent );
End;

Procedure TColorsForm.OnLanguageEvent( Language: TLanguageFile;
                                       const Apply: boolean );
begin
  Language.LoadComponentLanguage( self, Apply );
  Language.LL( Apply, ExampleText, 'ExampleText', 'This is an example' );
end;

Procedure TColorsForm.BackgroundRadioButtonOnClick (Sender: TObject);
Begin
  DisplayColor;
End;

Procedure TColorsForm.ColorsFormOnShow (Sender: TObject);
Begin
  OKButton.Default := true;
  SettingColor := false;
  SampleMemo.Lines.Text := ExampleText;
  DisplayColor;
End;

Procedure TColorsForm.TextRadioButtonOnClick (Sender: TObject);
Begin
  DisplayColor;
End;

Procedure TColorsForm.DisplaySample;
begin
  SampleMemo.Color := BackgroundColor;
  SampleMemo.PenColor := TextColor;
end;

Procedure TColorsForm.DisplayColor;
begin
  SettingColor := true;
  if TextRadioButton.Checked then
    ColorWheel.SetSelectedColor( TextColor )
  else
    ColorWheel.SetSelectedColor( BackgroundColor );
  SettingColor := false;
  DisplaySample;
end;

Procedure TColorsForm.ValueBarOnChange (Sender: TObject);
Begin
  if SettingColor then
    exit;
  if TextRadioButton.Checked then
    TextColor := ValueBar.SelectedColor
  else
    BackgroundColor := ValueBar.SelectedColor;
  DisplaySample;
End;

Initialization
  RegisterClasses ([TColorsForm, TColorWheel, TValueBar, TButton, TRadioButton,
    TMemo, TLabel]);
End.
