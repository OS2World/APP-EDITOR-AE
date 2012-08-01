Unit AEPrintDialogUnit;

Interface

Uses
  Classes, Forms, Graphics, Buttons, ExtCtrls, StdCtrls,
  ACLLanguageUnit;

Type
  TPrintSelection =
  (
    ptCurrentTopic,
    ptVisibleTopics,
    ptAllTopics
  );

  TAEPrintDialog = Class (TForm)
    PrinterComboBox: TComboBox;
    PrinterLabel: TLabel;
    AllRadioButton: TRadioButton;
    SelectionRadioButton: TRadioButton;
    HelpButton: TButton;
    HeaderCheckBox: TCheckBox;
    OKButton: TButton;
    SetupPrinterButton: TButton;
    CancelButton: TButton;
    Procedure AEPrintDialogOnSetupShow (Sender: TObject);
    Procedure AEPrintDialogOnCreate (Sender: TObject);
    Procedure SelectionRadioButtonOnClick (Sender: TObject);
    Procedure AllRadioButtonOnClick (Sender: TObject);
    Procedure PrinterComboBoxOnItemSelect (Sender: TObject; Index: LongInt);
    Procedure SetupPrinterButtonOnClick (Sender: TObject);
    Procedure PrintDialogOnShow (Sender: TObject);
  Private
    PrinterSetupTitle: string;
    PrinterSetupError: string;
  Public
    Procedure OnLanguageEvent( Language: TLanguageFile;
                               const Apply: boolean );

  End;

Var
  AEPrintDialog: TAEPrintDialog;

Implementation

uses
  SysUtils,
  Dialogs, Printers,
  ACLDialogs, ControlsUtility;

Procedure TAEPrintDialog.AEPrintDialogOnSetupShow (Sender: TObject);
Begin
  ScaleForm( self, 11, 16 );
End;

Procedure TAEPrintDialog.AEPrintDialogOnCreate (Sender: TObject);
Begin
  RegisterForLanguages( OnLanguageEvent );
End;

Procedure TAEPrintDialog.OnLanguageEvent( Language: TLanguageFile;
                                          const Apply: boolean );
begin
  Language.LoadComponentLanguage( self, Apply );
  Language.LL( Apply, PrinterSetupTitle, 'PrinterSetupTitle', 'Setup Printer' );
  Language.LL( Apply, PrinterSetupError, 'PrinterSetupError', 'Error displaying printer options: ' );
end;

Procedure TAEPrintDialog.SelectionRadioButtonOnClick (Sender: TObject);
Begin
  AllRadioButton.Checked := false;
End;

Procedure TAEPrintDialog.AllRadioButtonOnClick (Sender: TObject);
Begin
  SelectionRadioButton.Checked := false;
End;

Procedure TAEPrintDialog.PrinterComboBoxOnItemSelect (Sender: TObject;
  Index: LongInt);
Begin
  Printer.PrinterIndex := PrinterComboBox.ItemIndex;
End;

Procedure TAEPrintDialog.SetupPrinterButtonOnClick (Sender: TObject);
Begin
  try
    Printer.OptionsDlg;
  except
    on E: Exception do
    begin
      DoErrorDlg( PrinterSetupTitle,
                  PrinterSetupError + E.Message );
    end;
  end;
End;

Procedure TAEPrintDialog.PrintDialogOnShow (Sender: TObject);
Begin
  OKButton.Default := true;
  PrinterComboBox.Items.Assign( Printer.Printers );
  PrinterComboBox.ItemIndex := Printer.PrinterIndex;
End;

Initialization
  RegisterClasses ([TAEPrintDialog, TComboBox, TLabel, TButton, TCheckBox
   , TRadioButton]);
End.
