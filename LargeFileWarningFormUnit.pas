Unit LargeFileWarningFormUnit;

Interface

Uses
  Classes, Forms, Graphics, Buttons, StdCtrls,
  ACLLanguageUnit;

Type
  TLargeFileWarningForm = Class (TForm)
    OKButton: TButton;
    CancelButton: TButton;
    WarningLabel: TLabel;
    NotAgainCheckBox: TCheckBox;
    HelpButton: TButton;
    Procedure LargeFileWarningFormOnSetupShow (Sender: TObject);
    Procedure LargeFileWarningFormOnCreate (Sender: TObject);
  Private
  Public
    Procedure OnLanguageEvent( Language: TLanguageFile;
                               const Apply: boolean );
  End;

Var
  LargeFileWarningForm: TLargeFileWarningForm;

Implementation

Uses
  ControlsUtility;

Procedure TLargeFileWarningForm.LargeFileWarningFormOnSetupShow (Sender: TObject);
Begin
  ScaleForm( self, 11, 16 );
End;

Procedure TLargeFileWarningForm.LargeFileWarningFormOnCreate (Sender: TObject);
Begin
  RegisterForLanguages( OnLanguageEvent );
End;

Procedure TLargeFileWarningForm.OnLanguageEvent( Language: TLanguageFile;
                                                 const Apply: boolean );
begin
  Language.LoadComponentLanguage( self, Apply );
end;

Initialization
  RegisterClasses ([TLargeFileWarningForm, TButton, TLabel, TCheckBox]);
End.
