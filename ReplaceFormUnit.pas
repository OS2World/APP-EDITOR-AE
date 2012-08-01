Unit ReplaceFormUnit;

Interface

Uses
  Classes, Forms, Graphics, Buttons, StdCtrls,
  ACLLanguageUnit, TabCtrls;

Type
  TReplaceCommand =
  (
    rcFindOnly,
    rcReplaceSelectionThenFind,
    rcReplaceSelectionAndAll,
    rcReplaceAll
  );
  TOnReplaceCommand = procedure( Sender: TObject;
                                 Command: TReplaceCommand ) of object;

  TReplaceForm = Class (TForm)
    TextToFindLabel: TLabel;
    FindButton: TButton;
    ChangeButton: TButton;
    ChangeAllButton: TButton;
    CancelButton: TButton;
    HelpButton: TButton;
    FromTopCheckBox: TCheckBox;
    ReplaceTextLabel: TLabel;
    ReplaceTextEdit: TEdit;
    TextToFindEdit: TEdit;
    CaseSensitiveCheckBox: TCheckBox;
    Procedure ReplaceFormOnSetupShow (Sender: TObject);
    Procedure ChangeAllButtonOnClick (Sender: TObject);
    Procedure ChangeButtonOnClick (Sender: TObject);
    Procedure FindButtonOnClick (Sender: TObject);
    Procedure OKButtonOnClick (Sender: TObject);
    Procedure CancelButton2OnClick (Sender: TObject);
    Procedure CancelButtonOnClick (Sender: TObject);
    Procedure ReplaceFormOnCreate (Sender: TObject);
    Procedure ReplaceFormOnShow (Sender: TObject);
  Public
    OnReplaceCommand: TOnReplaceCommand;
  Protected
    Procedure OnLanguageEvent( Language: TLanguageFile;
                               const Apply: boolean );
  End;

Var
  ReplaceForm: TReplaceForm;

Implementation

Uses
  ControlsUtility;

Procedure TReplaceForm.ReplaceFormOnSetupShow (Sender: TObject);
Begin
  ScaleForm( self, 11, 16 );
End;

Procedure TReplaceForm.ChangeAllButtonOnClick (Sender: TObject);
Begin
  OnReplaceCommand( self, rcReplaceAll );
End;

Procedure TReplaceForm.ChangeButtonOnClick (Sender: TObject);
Begin
  OnReplaceCommand( self, rcReplaceSelectionThenFind );
End;

Procedure TReplaceForm.FindButtonOnClick (Sender: TObject);
Begin
  OnReplaceCommand( self, rcFindOnly );
End;

Procedure TReplaceForm.OKButtonOnClick (Sender: TObject);
Begin
  Close; // close ourselves since we are modal
  OnReplaceCommand( self, rcReplaceAll );
End;

Procedure TReplaceForm.CancelButton2OnClick (Sender: TObject);
Begin
  Close;
End;

Procedure TReplaceForm.CancelButtonOnClick (Sender: TObject);
Begin
  Close;
End;

Procedure TReplaceForm.ReplaceFormOnCreate (Sender: TObject);
Begin
  RegisterForLanguages( OnLanguageEvent );
End;

Procedure TReplaceForm.OnLanguageEvent( Language: TLanguageFile;
                                        const Apply: boolean );
begin
  Language.LoadComponentLanguage( self, Apply );
end;

Procedure TReplaceForm.ReplaceFormOnShow (Sender: TObject);
Begin
  FindButton.Default := true;
  TextToFindEdit.Focus;
End;

Initialization
  RegisterClasses ([TReplaceForm, TLabel, TEdit, TCheckBox, TButton]);
End.
