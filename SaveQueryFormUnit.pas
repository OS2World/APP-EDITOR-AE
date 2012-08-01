Unit SaveQueryFormUnit;

Interface

Uses
  Classes, Forms, Graphics, SystemIconUnit, StdCtrls, Buttons,
  ACLLanguageUnit;

Type
  TSaveQueryForm = Class (TForm)
    Icon: TSystemIcon;
    MessageLabel: TLabel;
    SaveButton: TButton;
    DiscardButton: TButton;
    CancelButton: TButton;
    Procedure SaveQueryFormOnSetupShow (Sender: TObject);
    Procedure SaveQueryFormOnCreate (Sender: TObject);
    Procedure SaveQueryFormOnShow (Sender: TObject);
  Public
    Procedure OnLanguageEvent( Language: TLanguageFile;
                               const Apply: boolean );
  End;

Var
  SaveQueryForm: TSaveQueryForm;

Implementation

Uses
  ControlsUtility;

Procedure TSaveQueryForm.SaveQueryFormOnSetupShow (Sender: TObject);
Begin
  ScaleForm( self, 11, 16 );
End;

Procedure TSaveQueryForm.SaveQueryFormOnCreate (Sender: TObject);
Begin
  RegisterForLanguages( OnLanguageEvent );
End;

Procedure TSaveQueryForm.OnLanguageEvent( Language: TLanguageFile;
                                         const Apply: boolean );
begin
  Language.LoadComponentLanguage( self, Apply );
end;

Procedure TSaveQueryForm.SaveQueryFormOnShow (Sender: TObject);
Begin
  SaveButton.Focus; // make default
End;

Initialization
  RegisterClasses ([TSaveQueryForm, TSystemIcon, TLabel, TButton]);
End.
