Unit FindFormUnit;

Interface

Uses
  Classes, Forms, Graphics, Buttons, StdCtrls,
  ACLLanguageUnit;

Type
  TFindForm = Class (TForm)
    OKButton: TButton;
    CancelButton: TButton;
    TextToFindLabel: TLabel;
    FromTopCheckBox: TCheckBox;
    HelpButton: TButton;
    TextToFindEdit: TEdit;
    CaseSensitiveCheckBox: TCheckBox;
    Procedure FindFormOnSetupShow (Sender: TObject);
    Procedure OKButtonOnClick (Sender: TObject);
    Procedure CancelButtonOnClick (Sender: TObject);
    Procedure FindFormOnCreate (Sender: TObject);
    Procedure FindFormOnShow (Sender: TObject);
  Protected
  Public
    OnFindClicked: TNotifyEvent;
    Procedure OnLanguageEvent( Language: TLanguageFile;
                               const Apply: boolean );
  End;

Var
  FindForm: TFindForm;

Implementation

Uses
  ControlsUtility;

Procedure TFindForm.FindFormOnSetupShow (Sender: TObject);
Begin
  ScaleForm( self, 11, 16 );
End;

Procedure TFindForm.OKButtonOnClick (Sender: TObject);
Begin
  OnFindClicked( Sender );
End;

Procedure TFindForm.CancelButtonOnClick (Sender: TObject);
Begin
  Close;
End;

Procedure TFindForm.FindFormOnCreate (Sender: TObject);
Begin
  RegisterForLanguages( OnLanguageEvent );
End;

Procedure TFindForm.OnLanguageEvent( Language: TLanguageFile;
                                     const Apply: boolean );
begin
  Language.LoadComponentLanguage( self, Apply );
end;

Procedure TFindForm.FindFormOnShow (Sender: TObject);
Begin
  OKButton.Default := true;
  TextToFindEdit.Focus;
End;

Initialization
  RegisterClasses ([TFindForm, TButton, TLabel, TEdit, TCheckBox]);
End.

