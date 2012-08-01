Unit AutoSaveFormUnit;

Interface

Uses
  Classes, Forms, Graphics, Buttons, ExtCtrls, Spin, StdCtrls, ComCtrls,
  ACLLanguageUnit;

Type
  TAutoSaveType =
  (
    asNone,
    asTimed,
    asChanges
  );
Const
  AutoSaveTypeStrings: array[ Low( TAutoSaveType ) .. High( TAutoSaveType ) ] of string =
  (
    'None',
    'Timed',
    'Changes'
  );

Type
  TAutosaveForm = Class (TForm)
    OKButton: TButton;
    CancelButton: TButton;
    HelpButton: TButton;
    RequireManualSaveCheckBox: TCheckBox;
    MinutesEdit: TEdit;
    ChangesEdit: TEdit;
    NoAutoSaveRadioButton: TRadioButton;
    TimedAutosaveRadioButton: TRadioButton;
    MinutesLabel: TLabel;
    ChangesLabel: TLabel;
    ChangesAutosaveRadioButton: TRadioButton;
    Procedure AutosaveFormOnSetupShow (Sender: TObject);
    Procedure AutosaveFormOnCreate (Sender: TObject);
    Procedure OKButtonOnClick (Sender: TObject);
    Procedure ChangesAutosaveRadioButtonOnClick (Sender: TObject);
    Procedure TimedAutosaveRadioButtonOnClick (Sender: TObject);
    Procedure NoAutoSaveRadioButtonOnClick (Sender: TObject);
    Procedure AutosaveFormOnShow (Sender: TObject);
  Private
    Procedure UpdateType;
    ErrorTitle: string;
    MinutesError: string;
    NumberChangesError: string;

  Public
    Procedure OnLanguageEvent( Language: TLanguageFile;
                               const Apply: boolean );
    FAutoSaveType: TAutoSaveType;
    FMinutes: longint;
    FChanges: longint;

  End;

Var
  AutosaveForm: TAutosaveForm;

Implementation

Uses
  SysUtils, ACLDialogs, ControlsUtility;

Procedure TAutosaveForm.AutosaveFormOnSetupShow (Sender: TObject);
Begin
  ScaleForm( self, 11, 16 );
End;

Procedure TAutosaveForm.AutosaveFormOnCreate (Sender: TObject);
Begin
  RegisterForLanguages( OnLanguageEvent );
End;

Procedure TAutosaveForm.OnLanguageEvent( Language: TLanguageFile;
                                         const Apply: boolean );
begin
  Language.LoadComponentLanguage( self, Apply );
  Language.LL( Apply, ErrorTitle, 'ErrorTitle', 'Error' );
  Language.LL( Apply, MinutesError, 'MinutesError', 'Number of minutes must be 1 to 600' );
  Language.LL( Apply, NumberChangesError, 'NumberChangesError', 'Number of changes must be 10 to 1000' );
end;

Procedure TAutosaveForm.OKButtonOnClick (Sender: TObject);
Begin
  FMinutes := StrToInt( MinutesEdit.Text );
  FChanges := StrToInt( ChangesEdit.Text );
  // valid number of minutes/changes, if that type is selected.
  if FAutoSaveType = asTimed then
  begin
    if    ( FMinutes < 1 )
       or ( FMinutes > 600 ) then
    begin
      DoErrorDlg( ErrorTitle,
                  MinutesError );
      exit;
    end;
  end;

  if FAutoSaveType = asChanges then
  begin
    if    ( FChanges < 10 )
       or ( FChanges > 1000 ) then
    begin
      DoErrorDlg( ErrorTitle,
                  NumberChangesError );
      exit;
    end;
  end;

  ModalResult := mrOK;
End;

Procedure TAutosaveForm.ChangesAutosaveRadioButtonOnClick (Sender: TObject);
Begin
  FAutoSaveType := asChanges;
  UpdateType;
End;

Procedure TAutosaveForm.TimedAutosaveRadioButtonOnClick (Sender: TObject);
Begin
  FAutoSaveType := asTimed;
  UpdateType;
End;

Procedure TAutosaveForm.NoAutoSaveRadioButtonOnClick (Sender: TObject);
Begin
  FAutoSaveType := asNone;
  UpdateType;
End;

Procedure TAutosaveForm.AutosaveFormOnShow (Sender: TObject);
Begin
  OKButton.Default := true;
  UpdateType;
  MinutesEdit.Text := IntToStr( FMinutes );
  ChangesEdit.Text := IntToStr( FChanges );
End;

Procedure TAutosaveForm.UpdateType;
Begin
  NoAutoSaveRadioButton.Checked := FAutoSaveType = asNone;
  TimedAutoSaveRadioButton.Checked := FAutoSaveType = asTimed;
  ChangesAutoSaveRadioButton.Checked := FAutoSaveType = asChanges;
End;

Initialization
  RegisterClasses ([TAutosaveForm, TButton,
    TRadioButton, TLabel, TCheckBox, TEdit]);
End.
