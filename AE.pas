Program AE;

Uses
  Forms, Graphics, MainFormUnit, FindFormUnit, SaveQueryFormUnit, ReplaceFormUnit,
AEPrintDialogUnit, ProductInformationFormUnit, AutoSaveFormUnit,
ColorsFormUnit, LargeFileWarningFormUnit;

{$r AE.scu}

Begin
  Application.Create;
  Application.CreateForm (TMainForm, MainForm);
  Application.Run;
  Application.Destroy;
End.
