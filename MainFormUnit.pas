Unit MainFormUnit;

Interface

Uses
  Classes, Forms, ComCtrls, StdCtrls, Dialogs, Messages, CustomMemo, OS2Def,Sysutils,
  AutoSaveFormUnit, ACLLanguageUnit, CustomFontDialog,
  ReplaceFormUnit;

Const
  AppVersion =     'v1.9.8'; // $SS_REQUIRE_NEW_VERSION$
  BldLevelVersion = '1.9.8';

{ Todo:
  Crashes with Freetype?
  dbcs status bar
  Insert time/date/filename/text...
  Ctrl+drop, inserts file
    (need large paste first)
  Backup?
  Message if nothing found instead of dialog box
  Position find/replace dialog to not obscure word?
  Switch proportional/nonprop font
  Print tabs
  Hide save/update language unless using cmdline
  MRU files
  live scrolling?
    grab handle of vert scroll bar from memo (child)
    subclass
    receive scroll updates
    post "scroll finished" messages back.
     ugly problems?

  don't print full path of file in header
}

  WM_UPDATEPOSITION  = WM_USER + 100;
  WM_FOCUSMEMO       = WM_USER + 101;
  WM_MEMOCHANGE      = WM_USER + 102;
  WM_OPENDROPPEDFILE = WM_USER + 103;
  WM_OPENED          = WM_USER + 104;

Type
  TTextFormat =
  (
    tfDOS,
    tfUnix
  );

Type
  TMainForm = Class (TForm)
    MainMenu: TMainMenu;
    StatusBar: TStatusBar;
    OpenDialog: TSystemOpenDialog;
    OptionsReadOnlyMI: TMenuItem;
    SaveDialog: TSystemSaveDialog;
    AutosaveTimer: TTimer;
    EditPopupMenu: TPopupMenu;
    EditCutPMI: TMenuItem;
    EditCopyPMI: TMenuItem;
    EditPastePMI: TMenuItem;
    MenuItem10: TMenuItem;
    EditSelectAllPMI: TMenuItem;
    FontDialog: TCustomFontDialog;
    MenuItem8: TMenuItem;
    MenuItem5: TMenuItem;
    OptionsColorsMI: TMenuItem;
    MenuItem4: TMenuItem;
    SaveLanguageMI: TMenuItem;
    HelpKeysMI: TMenuItem;
    OptionsF3FindAgainMI: TMenuItem;
    OptionsF3ExitMI: TMenuItem;
    FileAutosaveMI: TMenuItem;
    OptionsF3KeyActionMI: TMenuItem;
    OptionsFontMI: TMenuItem;
    MenuItem1: TMenuItem;
    FileNewMI: TMenuItem;
    MenuItem2: TMenuItem;
    EditUndoMI: TMenuItem;
    FileOpenMI: TMenuItem;
    MenuItem3: TMenuItem;
    FileSaveMI: TMenuItem;
    FileSaveAsMI: TMenuItem;
    MenuItem6: TMenuItem;
    FileExitMI: TMenuItem;
    OptionsMenu: TMenuItem;
    HelpMenu: TMenuItem;
    FilePrintMI: TMenuItem;
    MenuItem12: TMenuItem;
    EditCopyMI: TMenuItem;
    EditPasteMI: TMenuItem;
    MenuItem16: TMenuItem;
    EditSelectAllMI: TMenuItem;
    MenuItem18: TMenuItem;
    EditFindMI: TMenuItem;
    EditFindAgainMI: TMenuItem;
    EditReplaceMI: TMenuItem;
    MenuItem22: TMenuItem;
    HelpProductInformationMI: TMenuItem;
    MenuItem29: TMenuItem;
    HelpContentsMI: TMenuItem;
    OptionsWrapMI: TMenuItem;
    EditCutMI: TMenuItem;
    EditMenu: TMenuItem;
    FileMenu: TMenuItem;
    Procedure OptionsColorsMIOnClick (Sender: TObject);
    Procedure OptionsFontMIOnClick (Sender: TObject);
    Procedure EditSelectAllPMIOnClick (Sender: TObject);
    Procedure EditPastePMIOnClick (Sender: TObject);
    Procedure EditCopyPMIOnClick (Sender: TObject);
    Procedure EditCutPMIOnClick (Sender: TObject);
    Procedure SaveLanguageMIOnClick (Sender: TObject);
    Procedure HelpKeysMIOnClick (Sender: TObject);
    Procedure AutosaveTimerOnTimer (Sender: TObject);
    Procedure FileAutosaveMIOnClick (Sender: TObject);
    Procedure OptionsF3FindAgainMIOnClick (Sender: TObject);
    Procedure OptionsF3ExitMIOnClick (Sender: TObject);
    Procedure OptionsExitOnF3MIOnClick (Sender: TObject);
    Procedure HelpContentsMIOnClick (Sender: TObject);
    Procedure FilePrintMIOnClick (Sender: TObject);
    Procedure MainFormOnCreate (Sender: TObject);
    Procedure EditReplaceMIOnClick (Sender: TObject);
    Procedure MainFormOnActivate (Sender: TObject);
    Procedure EditFindAgainMIOnClick (Sender: TObject);
    Procedure EditFindMIOnClick (Sender: TObject);
    Procedure HelpProductInformationMIOnClick (Sender: TObject);
    Procedure MainFormOnClose (Sender: TObject; Var Action: TCloseAction);
    Procedure OptionsWrapMIOnClick (Sender: TObject);
    Procedure EditSelectAllMIOnClick (Sender: TObject);
    Procedure EditPasteMIOnClick (Sender: TObject);
    Procedure EditCopyMIOnClick (Sender: TObject);
    Procedure EditCutMIOnClick (Sender: TObject);
    Procedure EditUndoMIOnClick (Sender: TObject);
    Procedure OptionsReadOnlyMIOnClick (Sender: TObject);
    Procedure FileSaveAsMIOnClick (Sender: TObject);
    Procedure FileSaveMIOnClick (Sender: TObject);
    Procedure MainFormOnCloseQuery (Sender: TObject; Var CanClose: Boolean);
    Procedure FileNewMIOnClick (Sender: TObject);
    Procedure MainFormOnResize (Sender: TObject);
    Procedure MainFormOnSetupShow (Sender: TObject);
    Procedure MainFormOnShow (Sender: TObject);
    Procedure FileOpenMIOnClick (Sender: TObject);
    Procedure FileExitMIOnClick (Sender: TObject);
  Protected
    FFilename: string;
    FTextFormat: TTextFormat;

    FSettingText: boolean; // whilst loading etc so we don't think it changed...

    Memo: TCustomMemo;
    FMemoFont: TFont;
    FMemoPenColor: TColor;
    FMemoColor: TColor;

    FWrap: boolean;
    FReadOnly: boolean;
    FExitOnF3: boolean;

    FShowUsage: boolean;

    FLastDirectory: string;

    FFindText: string;
    FFindCaseSensitive: boolean;
    FFindFromTop: boolean; // this find
    FReplaceText: string;

    FPrintHeader: boolean;

    FAutoSaveType: TAutoSaveType;
    FAutoSaveMinutes: longint;
    FAutoSaveChanges: longint;
    FRequireManualSave: boolean;

    FChangeCount: longint;

    FWarnLargeFiles: boolean;

    Procedure OnLanguageEvent( Language: TLanguageFile;
                               const Apply: boolean );

    Procedure MemoOnFontChange( Sender: TObject );
    Procedure MemoOnDragDrop( Sender: TObject;
                              Source: TObject;
                              X, Y: LongInt );
    Procedure MemoOnDragOver( Sender: TObject;
                              Source: TObject;
                              X, Y: LongInt;
                              State: TDragState;
                              var Accept: boolean );
    Procedure MemoOnMouseUp( Sender: TObject;
                             Button: TMouseButton;
                             Shift: TShiftState;
                             X: LongInt;
                             Y: LongInt );
    Procedure MemoOnChange( Sender: TObject );
    Procedure MemoOnScan( Sender: TObject;
                          Var KeyCode: TKeyCode );

    Procedure InitAutoSave;
    Procedure AutoSave;

    procedure CreateMemo;

    Procedure SetExitOnF3( Value: boolean );

    Procedure RedisplayText;

    Procedure TextToMemo( Text: pchar;
                          TextLength: longint );
    Procedure MemoToText( Var Text: pchar;
                          Var TextLength: longint;
                          SelectionOnly: boolean );


    function OpenFile( const Filename: string;
                       ComplainIfMissing: boolean ): boolean;
    function SaveFileTo( const Filename: string ): boolean;

    function CloseFile: boolean;
    function SaveFile: boolean;
    function SaveFileAs: boolean;

    procedure DetectTextFormat( Text: pchar;
                                TextLength: ULONG );

    Procedure PostUpdatePosition;

    Procedure WMUpdatePosition( Var Msg: TMessage ); message WM_UPDATEPOSITION;
    Procedure WMMemoChange( Var Msg: TMessage ); message WM_MEMOCHANGE;
    Procedure WMFocusMemo( Var Msg: TMessage ); message WM_FOCUSMEMO;

    Procedure WMOpenDroppedFile( Var Msg: TMessage ); message WM_OPENDROPPEDFILE;

    procedure WMOpened( Var Msg: TMessage ); message WM_OPENED;

    Procedure UpdateMode;
    Procedure UpdateCaption;
    Procedure UpdatePosition;
    Procedure EnableControls;
    Procedure UpdateStatus;

    Procedure SetMessage( const Message: string );

    Procedure Find;

    // callbacks for the replace and find commands.
    Procedure OnReplaceCommand( Sender: TObject;
                                Command: TReplaceCommand );
    Procedure OnFindCommand( Sender: TObject );

    Procedure PrintPageHeader( X: longint;
                               Y: longint;
                               Width: longint );

    Function GetChanged: boolean;
    Procedure SetChanged( Value: boolean );

    procedure SetReadOnly( Value: boolean );
    Procedure SetWrap( Value: boolean );

    procedure OnHint( Sender: TObject );

    Function HaveSelection: boolean;
    Procedure SelectNone;

  Protected
    // language strings
    SaveLanguageTitle: string;
    SaveLanguageError: string;
    SavedMsg: string;
    AutosaveDoneMsg: string;
    PrintTitle: string;
    NoPrinterError: string;
    PrintDoneMsg1: string;
    PrintDoneMsg2: string;
    HelpTitle: string;
    ReplaceDoneMsg1: string;
    ReplaceDoneMsg2: string;
    NoReplacementsMsg: string;
    MatchMsg: string;
    NoMatchMsg: string;
    ReadOnlyStatus: string;
    ModifiedStatus: string;
    NewStatus: string;
    UntitledTitle: string;
    AppTitle: string;
    InsertStatus: string;
    OverwriteStatus: string;
    SaveTitle: string;
    SaveReadonlyError: string;
    SaveAccessDeniedError: string;
    FileInUseError: string;
    FileDoesNotExistError: string;
    OpenAccessDeniedError: string;
    OpenFileInUseError: string;
    SaveError: string;
    ReplacePrompt: string;
    NewFileMsg: string;
    OpenTitle: string;
    OpenError: string;
    OpenedMsg: string;
    UsageTitle: string;
    Usage1: string;
    Usage2: string;
    Usage3: string;
    PrintingPageMsg: string;
  End;


Var
  MainForm: TMainForm;

Imports
FUNCTION _WinNextChar(ahab:HAB;idcp,idcc:ULONG;apsz:PChar):PChar;
                    APIENTRY;             'PMWIN' index 791;
FUNCTION _WinPrevChar(ahab:HAB;idcp,idcc:ULONG;pszStart,apsz:PChar):PChar;
                    APIENTRY;             'PMWIN' index 795;

end;

Implementation

uses
  BseDos, BseErr, PMWin, Dos, PMGPI, PMWP, PmStdDlg, BseSub,
  SysUtils, IniFiles, Printers,
  ACLStringUtility, ACLFileUtility, ACLUtility,
  ACLDialogs,
  ControlsUtility,
  SaveQueryFormUnit, FindFormUnit,
  AEPrintDialogUnit, ProductInformationFormUnit, ColorsFormUnit,
  LargeFileWarningFormUnit;

 {$r ae}

var
  g_DroppedFileName: string;

function GetIniFilePath( const FilePart: string ): string;
var
  UserIniPath: string;
  IniFileDir: string;
begin
  UserIniPath := GetEnv( 'USER_INI' );
  IniFileDir := ExtractFilePath( UserIniPath );
  if IniFileDir = '' then
    IniFileDir := GetApplicationDir;

  Result := AddSlash( IniFileDir )
            + FilePart;
end;

Procedure TMainForm.OptionsColorsMIOnClick (Sender: TObject);
Begin
  ColorsForm.TextColor := SysColorToRGB( FMemoPenColor );
  ColorsForm.BackgroundColor := SysColorToRGB( FMemoColor );

  ColorsForm.ShowModal;
  if ColorsForm.ModalResult <> mrOK then
    exit;

  FMemoPenColor := ColorsForm.TextColor;
  FMemoColor := ColorsForm.BackgroundColor;

  Memo.PenColor := FMemoPenColor;
  Memo.Color := FMemoColor;

End;

Procedure TMainForm.OptionsFontMIOnClick (Sender: TObject);
var
  DialogSetup: FONTDLG;
  SelectedFont: cstring;
Begin
  FontDialog.AllowSimulations := false;
  FontDialog.EditFont := FMemoFont;
  if FontDialog.Execute then
  begin
    FMemoFont := FontDialog.EditFont;
    Memo.Font := FMemoFont;
  end;

  exit;

  SelectedFont := FMemoFont.Family;

  FillChar( DialogSetup, sizeof( DialogSetup ), #0 );
  with DialogSetup do
  begin
    cbSize := sizeof( DialogSetup );
    hpsScreen := Screen.Canvas.Handle;
    pszFamilyName := Addr( SelectedFont );
    usFamilyBufLen := sizeof( SelectedFont );
    fxPointSize := FMemoFont.PointSize shl 16; // FIXED
    clrBack := SYSCLR_WINDOW;
    clrFore := SYSCLR_WINDOWTEXT;
    fl := FNTS_CENTER;
  end;

  WinFontDlg( HWND_DESKTOP,
              Frame.Handle,
              DialogSetup );
  if DialogSetup.lReturn = DID_OK then
  begin
    FMemoFont := Screen.GetFontFromPointSize( SelectedFont,
                                              DialogSetup.fxPointSize shr 16 );
    Memo.Font := FMemoFont;
  end;
End;

Procedure TMainForm.EditSelectAllPMIOnClick (Sender: TObject);
Begin
  Memo.SelectAll;
End;

Procedure TMainForm.EditPastePMIOnClick (Sender: TObject);
Begin
  SendMsg( Memo.Handle, MLM_PASTE, 0, 0 );
End;

Procedure TMainForm.EditCopyPMIOnClick (Sender: TObject);
Begin
  SendMsg( Memo.Handle, MLM_COPY, 0, 0 );
End;

Procedure TMainForm.EditCutPMIOnClick (Sender: TObject);
Begin
  SendMsg( Memo.Handle, MLM_CUT, 0, 0 );

End;

Procedure TMainForm.SaveLanguageMIOnClick (Sender: TObject);
Var
  LanguageFile: TLanguageFile;
Begin
  SaveDialog.Title := SaveLanguageTitle;
  SaveDialog.Filename := GetApplicationDir + 'new.lng';
  if not SaveDialog.Execute then
    exit;

  Caption := '';
  try
    LanguageFile := TLanguageFile.Create( SaveDialog.Filename );

    UpdateLanguage( LanguageFile );
  except
    on E: Exception do
    begin
      DoErrorDlg( SaveLanguageTitle,
                  SaveLanguageError + E.Message );
      exit;
    end;
  end;
  LanguageFile.Destroy;

  UpdateCaption;

  SetMessage( SavedMsg + SaveDialog.Filename );
End;

Procedure TMainForm.OnLanguageEvent( Language: TLanguageFile;
                                     const Apply: boolean );
begin
  Language.LoadComponentLanguage( self, Apply );

  // Load strings referred to by code...
  // ----------------------------------------------------------

  Language.LL( Apply, SaveLanguageError, 'SaveLanguageError', 'Error saving language file ' );
  Language.LL( Apply, SavedMsg, 'SavedMsg', 'Saved: ' );
  Language.LL( Apply, AutosaveDoneMsg, 'AutosaveDoneMsg', 'Auto-saved ' );
  Language.LL( Apply, PrintTitle, 'PrintTitle', 'Print' );
  Language.LL( Apply, NoPrinterError, 'NoPrinterError', 'You don''t have a printer configured.' );
  Language.LL( Apply, PrintDoneMsg1, 'PrintDoneMsg1', 'Printing complete (' );
  Language.LL( Apply, PrintDoneMsg2, 'PrintDoneMsg2', ' pages)' );
  Language.LL( Apply, HelpTitle, 'HelpTitle', 'Text Editor Help' );
  Language.LL( Apply, ReplaceDoneMsg1, 'ReplaceDoneMsg1', 'Replaced ' );
  Language.LL( Apply, ReplaceDoneMsg2, 'ReplaceDoneMsg2', ' occurrence(s)' );
  Language.LL( Apply, NoReplacementsMsg, 'NoReplacementsMsg', 'No replacements made' );
  Language.LL( Apply, MatchMsg, 'MatchMsg', 'Found' );
  Language.LL( Apply, NoMatchMsg, 'NoMatchMsg', 'No match found' );
  Language.LL( Apply, ReadOnlyStatus, 'ReadOnlyStatus', 'Read-only' );
  Language.LL( Apply, ModifiedStatus, 'ModifiedStatus', 'Modified' );
  Language.LL( Apply, NewStatus, 'NewStatus', 'New' );
  Language.LL( Apply, UntitledTitle, 'UntitledTitle', '(Untitled)' );
  Language.LL( Apply, AppTitle, 'AppTitle', 'Text Editor' );
  Language.LL( Apply, InsertStatus, 'InsertStatus', 'INS' );
  Language.LL( Apply, OverwriteStatus, 'OverwriteStatus', 'OVR' );
  Language.LL( Apply, SaveTitle, 'SaveTitle', 'Save File' );
  Language.LL( Apply, SaveReadonlyError, 'SaveReadonlyError', 'Cannot save to read-only file: ' );
  Language.LL( Apply, SaveAccessDeniedError, 'SaveAccessDeniedError', 'Access denied saving file: ' );
  Language.LL( Apply, FileInUseError, 'FileInUseError', 'File in use by another program: ' );
  Language.LL( Apply, FileDoesNotExistError, 'FileDoesNotExistError', 'File does not exist: ' );
  Language.LL( Apply, OpenAccessDeniedError, 'OpenAccessDeniedError', 'Access denied: ' );
  Language.LL( Apply, OpenFileInUseError, 'OpenFileInUseError', 'File in use by another program: ' );
  Language.LL( Apply, SaveError, 'SaveError', 'Error saving file: ' );
  Language.LL( Apply, ReplacePrompt, 'ReplacePrompt', 'Are you sure you want to replace this file?' );
  Language.LL( Apply, NewFileMsg, 'NewFileMsg', 'New file' );
  Language.LL( Apply, OpenTitle, 'OpenTitle', 'Open File' );
  Language.LL( Apply, OpenError, 'OpenError', 'Error opening file: ' );
  Language.LL( Apply, OpenedMsg, 'OpenedMsg', 'Opened: ' );
  Language.LL( Apply, UsageTitle, 'Usage', 'Usage' );
  Language.LL( Apply, Usage1, 'Usage1', 'Usage: ae [/read] [<filename>]' );
  Language.LL( Apply, Usage2, 'Usage2', '  /read: set read-only' );
  Language.LL( Apply, Usage3, 'Usage3', 'Displays or edits text files' );
  Language.LL( Apply, PrintingPageMsg, 'PrintingPageMsg', 'Printing: page ' );
end;

Procedure TMainForm.HelpKeysMIOnClick (Sender: TObject);
Begin
  Application.Help( 6 ); // Keyboard shortcuts topic
End;

Procedure TMainForm.InitAutoSave;
begin
  FChangeCount := 0;
  AutosaveTimer.Interval := FAutoSaveMinutes
                            * 60 // secs/min
                            * 1000; // ms/sec
  AutoSaveTimer.Stop;
end;

Procedure TMainForm.AutoSave;
Begin
  InitAutoSave; // reset counter/timer

  if FRequireManualSave then
    if FFilename = '' then
      // filename not specified yet.
      exit;

  if not SaveFile then
    exit;

  SetMessage( AutosaveDoneMsg
              + FFilename
              + ' ('
              + FormatDateTime( 'tt', Now )
              + ')' );
end;

Procedure TMainForm.AutosaveTimerOnTimer (Sender: TObject);
Begin
  if FAutoSaveType <> asTimed then
  begin
    // what are we doing here??
    AutosaveTimer.Stop;
    exit;
  end;
  Autosave;
End;

Procedure TMainForm.FileAutosaveMIOnClick (Sender: TObject);
Begin
  AutoSaveForm.FAutoSaveType := FAutoSaveType;
  AutoSaveForm.FMinutes := FAutoSaveMinutes;
  AutoSaveForm.FChanges := FAutoSaveChanges;
  AutoSaveForm.RequireManualSaveCheckBox.Checked := FRequireManualSave;

  AutoSaveForm.ShowModal;
  if AutoSaveForm.ModalResult <> mrOK then
    exit;

  // start counting now
  InitAutoSave;

  FAutoSaveType := AutoSaveForm.FAutoSaveType;
  FAutoSaveMinutes := AutoSaveForm.FMinutes;
  FAutoSaveChanges := AutoSaveForm.FChanges;
  FRequireManualSave := AutoSaveForm.RequireManualSaveCheckBox.Checked;
End;

Procedure TMainForm.OptionsF3FindAgainMIOnClick (Sender: TObject);
Begin
  SetExitOnF3( false );
End;

Procedure TMainForm.OptionsF3ExitMIOnClick (Sender: TObject);
Begin
  SetExitOnF3( true );
End;

Procedure TMainForm.SetExitOnF3( Value: boolean );
begin
  FExitOnF3 := Value;
  OptionsF3ExitMI.Checked := Value; // check the selected option
  OptionsF3FindAgainMI.Checked := not Value; // unchecked the other option
end;

Procedure TMainForm.OptionsExitOnF3MIOnClick (Sender: TObject);
Begin
  SetExitOnF3( not FExitOnF3 );
End;

Procedure TMainForm.EnableControls;
begin
  EditReplaceMI.Enabled := not FReadOnly;
  EditCutMI.Enabled := not FReadOnly;
  EditPasteMI.Enabled := not FReadOnly;

  EditCutPMI.Enabled := not FReadOnly;
  EditPastePMI.Enabled := not FReadOnly;

end;

Procedure TMainForm.WMOpenDroppedFile( Var Msg: TMessage );
begin
  OpenFile( g_DroppedFileName, true );
end;

Procedure TMainForm.MemoOnDragOver( Sender: TObject;
                                    Source: TObject;
                                    X, Y: LongInt;
                                    State: TDragState;
                                    var Accept: boolean );
begin
  if Source is TExternalDragDropObject then
    Accept := true;
end;

Procedure TMainForm.MemoOnDragDrop( Sender: TObject;
                                    Source: TObject;
                                    X, Y: LongInt );
var
  DropObject: TExternalDragDropObject;
Begin
  if not ( Source is TExternalDragDropObject ) then
    // probably not needed, but crashes during drag drop completely
    // screw PM, so best to be sure!
    exit;

  DropObject := Source as TExternalDragDropObject;

  g_DroppedFileName := AddSlash( DropObject.ContainerName )
                       + DropObject.SourceFilename;
  // can't process synchronously, cause we need to destroy the memo
  // that's handling the drop event
  PostMsg( Self.Handle,
           WM_OPENDROPPEDFILE,
           0,
           0 );
end;

Procedure TMainForm.MemoOnFontChange( Sender: TObject );
begin
  FMemoFont := Memo.Font;
end;

Procedure TMainForm.HelpContentsMIOnClick (Sender: TObject);
Begin
  Application.HelpContents;
End;

Procedure TMainForm.PrintPageHeader( X: longint;
                                     Y: longint;
                                     Width: longint );
var
  DateTimeStr: string;
  DateTimeX: longint;
  PageNumberStr: string;
begin

  // Filename top left
  Printer.Canvas.TextOut( X,
                          Y,
                          ExtractFileName( FFilename ) );

  // centred date/time, if it fits
  DateTimeStr := FormatDateTime( 'ddddd t', // short date, short time
                                 Now );

  DateTimeX := X
               + Width div 2
               - Printer.Canvas.TextWidth( DateTimeStr ) div 2;

  if DateTimeX > Printer.Canvas.PenPos.X then
    // datetime starts after end of filename
    Printer.Canvas.TextOut( DateTimeX,
                            Y,
                            DateTimeStr );

  // page number, top right
  PageNumberStr := IntToStr( Printer.PageNumber );

  Printer.Canvas.TextOut( Width
                          - Printer.Canvas.TextWidth( PageNumberStr ),
                          Y,
                          PageNumberStr );
end;

type
  TCharWidthArray = array[ #0..#255 ] of longint;

Procedure TMainForm.SelectNone;
var
  CursorPosition: ULONG;
begin
  CursorPosition := SendMsg( Memo.Handle,
                             MLM_QUERYSEL,
                             MLFQS_CURSORSEL,
                             0 );

  SendMsg( Memo.Handle,
           MLM_SETSEL,
           CursorPosition,
           CursorPosition );
end;

Function TMainForm.HaveSelection: boolean;
begin
  result :=   WinSendMsg( Memo.Handle, MLM_QUERYSEL, MLFQS_MAXSEL, 0 )
            - WinSendMsg( Memo.Handle, MLM_QUERYSEL, MLFQS_MINSEL, 0 )
            > 0;
end;

Procedure TMainForm.FilePrintMIOnClick (Sender: TObject);
var
  MarginSize: longint;
  RightMargin: longint;
  TopMargin: longint;
  p: pchar;
  EndP: Pchar;
  Text: pchar;
  Size: longint;
  c: char;
  TextHeight: longint;

  pLineStart: pchar;
  pLineEnd: pchar;
  pLastBreak: pchar;

  CharWidths: TCharWidthArray;
  X: longint;
  Y: longint;
  DrawPoint: POINTL;

  NumberOfPages: longint;
Begin
  if Printer.Printers.Count = 0 then
  begin
    DoErrorDlg( PrintTitle,
                NoPrinterError );
    exit;
  end;

  AEPrintDialog.HeaderCheckBox.Checked := FPrintHeader;

  if HaveSelection then
    // there's a selection - use that
    AEPrintDialog.SelectionRadioButton.Checked := true
  else
    AEPrintDialog.AllRadioButton.Checked := true;

  AEPrintDialog.ShowModal;
  if AEPrintDialog.ModalResult <> mrOK then
    exit;

  FPrintHeader := AEPrintDialog.HeaderCheckBox.Checked;

  Screen.Cursor := crHourglass;

  Printer.Title := FFilename;

  Printer.BeginDoc;

  // Pick the printer font.
  if FMemoFont.FontType = ftBitmap then
  begin
    // pick an appropriate outline font
    if FMemoFont.Pitch = fpFixed then
    begin
      Printer.Canvas.Font :=
        Screen.GetFontFromPointSize( 'Courier New',
                                     FMemoFont.PointSize );
    end
    else
    begin
      Printer.Canvas.Font :=
        Screen.GetFontFromPointSize( 'Helvetica',
                                     FMemoFont.PointSize );
    end
  end
  else
  begin
    // the selected memo font is an outline font so use it as is.
    Printer.Canvas.Font := FMemoFont;
  end;

  MarginSize := Printer.Canvas.HorizontalResolution // pixels per meter
                 * 0.0125; // 12.5 mm = 0.5 inch

  RightMargin := Printer.PageWidth - MarginSize;
  TopMargin := Printer.PageHeight - MarginSize;

  TextHeight := Printer.Canvas.TextHeight( 'm' );

  MemoToText( Text,
              Size,
              AEPrintDialog.SelectionRadioButton.Checked );

  p := Text;
  EndP := Text + Size;

  // Retrieve all character widths
  if not GpiQueryWidthTable( Printer.Canvas.Handle,
                             0, 256,
                             CharWidths[ #0 ] ) then
  begin
    raise Exception.Create( 'Error getting character width table: '
                            + 'GpiQueryWidthTable error '
                            + IntToStr( WinGetLastError( AppHandle ) ) );
  end;

  // Convert all widths to positive!
  // For unknown reason, sometimes GPI returns negative values...
  for c := #0 to #255 do
  begin
    CharWidths[ c ] := Abs( CharWidths[ c ] );
  end;

  while p < EndP do
  begin
    // Print a page

    SetMessage( PrintingPageMsg
                + IntToStr( Printer.PageNumber ) );

    Y := TopMargin - TextHeight;

    if FPrintHeader then
    begin
      PrintPageHeader( MarginSize,  // X
                       Y, // Y
                       RightMargin - MarginSize ); // width

      dec( Y, TextHeight * 2 ); // space for header
    end;

    // print text that fits on this page

    while P < EndP do
    begin
      // print a line

      // move to start of text area.
      X := MarginSize;

      pLineStart := p;
      pLineEnd := nil;
      pLastBreak := nil;

      // work out how much text fits on the line ie. do wrapping
      while true do
      begin
        if p >= EndP then
        begin
          pLineEnd := p;
          break;
        end;

        c := p[ 0 ];

        case c of
          #13: // carriage return
          begin
            pLineEnd := p;
            inc( p );
            if p[ 0 ] = #10 then
              // skip following LF
              inc( p );
            break;
          end;

          #10: // linefeed
          begin
            pLineEnd := p;
            inc( p );
            break;
          end;

          ' ', #9: // space, tab
          begin
            pLastBreak := p;
          end;

        end;

        // add size of this char
        inc( X, CharWidths[ c ] );

        if X > RightMargin then
        begin
          // need to wrap
          if pLastBreak <> nil then
          begin
            pLineEnd := pLastBreak;
            p := pLastBreak + 1;

            // skip extra spaces
            while p < EndP do
            begin
              if p[ 0 ] <> ' ' then
                break;
              inc( p );
            end;

          end
          else
          begin
            // no word break, just truncate at this char
            pLineEnd := p;
            if p = pLineStart then
              // draw at least 1 char
              inc( p );
          end;
          break;
        end;
        inc( p );
      end;

      // print the line

      DrawPoint.X := MarginSize;
      DrawPoint.Y := Y;

      // note: max 512 chars, thanks GPI :(
      GpiCharStringPosAt( Printer.Canvas.Handle,
                          DrawPoint,
                          nil, // text rect - not used
                          0, // no options
                          PCharDiff( pLineEnd, pLineStart ),
                          pLineStart[ 0 ],
                          nil // no vector of increments
                        );

      // subtract line height from vertical position
      dec( Y, TextHeight );

      if P < EndP then
      begin
        if Y - TextHeight < MarginSize then
        begin
          // next line won't fit on page, new page
          Printer.NewPage;
          break;
        end;
      end;
    end;
  end;

  StrDispose( Text );

  NumberOfPages := Printer.PageNumber;

  Printer.EndDoc;

  Screen.Cursor := crDefault;

  SetMessage( PrintDoneMsg1
              + IntToStr( NumberOfPages )
              + PrintDoneMsg2 );

End;

Procedure TMainForm.MainFormOnCreate (Sender: TObject);
Begin
  Application.ShowHint := true;

  RegisterForLanguages( OnLanguageEvent );

  LoadDefaultLanguage( 'ae' );

  Font := GetNiceDefaultFont;
  FPrintHeader := true;

  // set up form icons
  FormIconResourceID := 1;

  Application.HelpFile := FindDefaultLanguageHelpFile( 'ae' );
  Application.HelpWindowTitle := HelpTitle;

  Application.OnHint := OnHint;
End;

Procedure TMainForm.EditReplaceMIOnClick (Sender: TObject);
Begin

  // load existing preferences to replace dialog
  ReplaceForm.TextToFindEdit.Text := FFindText;
  ReplaceForm.ReplaceTextEdit.Text := FReplaceText;
  ReplaceForm.CaseSensitiveCheckBox.Checked := FFindCaseSensitive;
  ReplaceForm.FromTopCheckBox.Checked := false;

  ReplaceForm.OnReplaceCommand := OnReplaceCommand;

  SelectNone;

  ReplaceForm.Show;
  WinSetOwner( ReplaceForm.Frame.Handle, Frame.Handle );
end;

Procedure TMainForm.OnReplaceCommand( Sender: TObject;
                                      Command: TReplaceCommand );
var
  szFindText: cstring;
  szReplaceText: cstring;
  SearchData: MLE_SEARCHDATA;
  Flags: ULONG;
  CursorPosition: ULONG;
  CursorLine: ULONG;
  CursorLineScreenBottom: ULONG;
  TopPosition: ULONG;
  TopLine: ULONG;
  ReplaceCount: longint;
  MatchFound: boolean;
begin
  // get preferences back from dialog
  FFindText := ReplaceForm.TextToFindEdit.Text;
  FReplaceText := ReplaceForm.ReplaceTextEdit.Text;
  FFindCaseSensitive := ReplaceForm.CaseSensitiveCheckBox.Checked;
  FFindFromTop := ReplaceForm.FromTopCheckBox.Checked;
  ReplaceForm.FromTopCheckBox.Checked := false; // uncheck after one use

  szFindText := FFindText; // convert to null terminated
  szReplaceText := FReplaceText; // convert to null terminated

  if    ( Command = rcReplaceSelectionThenFind )
     or ( Command = rcReplaceSelectionAndAll ) then
  begin
    // first replace selection, if any, with replace text.
    // NOTE: Original e.exe actually does another search, and only replaces
    // matches regardless of current selection.
    // I think this behaviour is perhaps reasonable and even useful.
    // Of course most people will not be modifying selection so it is an obscure point.
    if HaveSelection then
    begin
      SendMsg( Memo.Handle,
               MLM_INSERT,
               MPARAM( Addr( szReplaceText ) ),
               0 );
    end;
  end;
  // Set up search data
  SearchData.cb := sizeof( SearchData );
  SearchData.pchFind := Addr( szFindText );
  SearchData.cchFind := Length( FFindText );

  // set up flags
  Flags := MLFSEARCH_SELECTMATCH; // select the matching text
  if FFindCaseSensitive then
    Flags := Flags + MLFSEARCH_CASESENSITIVE; // want case sensitive search

  ReplaceCount := 0;
  MatchFound := false;

  while true do
  begin
    // set search start and end positions
    if FFindFromTop then
      SearchData.iptStart := 0 // start
    else
      SearchData.iptStart := -1; // current cursor
    FFindFromTop := false;

    SearchData.iptStop := -1; // end

    // do the search
    if SendMsg( Memo.Handle,
                MLM_SEARCH,
                Flags,
                MParam( Addr( SearchData ) ) ) = 0 then
      // no (more) matches found
      break;

    MatchFound := true;

    if    ( Command = rcFindOnly )
       or ( Command = rcReplaceSelectionThenFind ) then
      // only doing a single find.
      break;

    // do the replacement
    SendMsg( Memo.Handle,
             MLM_INSERT,
             MParam( Addr( szReplaceText ) ),
             0 );
    inc( ReplaceCount );

    CursorPosition := SendMsg( Memo.Handle,
                               MLM_QUERYSEL,
                               MLFQS_CURSORSEL,
                               0 );

    // move past previous match
    SendMsg( Memo.Handle,
             MLM_SETSEL,
             CursorPosition,
             CursorPosition );
  end;

  if Command = rcFindOnly then
  begin
    if MatchFound then
      SetMessage( MatchMsg )
    else
//      SetMessage( NoMatchMsg )
      DoMessageDlg( FindForm.Caption, NoMatchMsg );
  end
  else
  begin
    if ReplaceCount > 0 then
      SetMessage( ReplaceDoneMsg1
                  + IntToStr( ReplaceCount )
                  + ReplaceDoneMsg2 )
    else if MatchFound then
      SetMessage( NoReplacementsMsg )
    else
      DoMessageDlg( ReplaceForm.Caption, NoMatchMsg );
//      SetMessage( NoMatchMsg )
  end;
End;

Procedure TMainForm.MainFormOnActivate (Sender: TObject);
Begin
  UpdateMode;
End;

Procedure TMainForm.EditFindAgainMIOnClick (Sender: TObject);
Begin
  if FFindText = '' then
    EditFindMIOnClick( Sender )
  else
    Find;

End;

Procedure TMainForm.SetMessage( const Message: string );
begin
  StatusBar.Panels[ 0 ].Text := Message;
end;

Procedure TMainForm.Find;
var
  szFindText: cstring;
  SearchData: MLE_SEARCHDATA;
  Flags: ULONG;
begin
  szFindText := FFindText;
  SearchData.cb := sizeof( SearchData );
  SearchData.pchFind := Addr( szFindText );
  SearchData.cchFind := Length( FFindText );
  if FFindFromTop then
    SearchData.iptStart := 0 // start
  else
    SearchData.iptStart := -1; // current cursor
  FFindFromTop := false;
  SearchData.iptStop := -1; // end

  Flags := MLFSEARCH_SELECTMATCH;
  if FFindCaseSensitive then
    Flags := Flags + MLFSEARCH_CASESENSITIVE;

  if SendMsg( Memo.Handle,
              MLM_SEARCH,
              Flags,
              MParam( Addr( SearchData ) ) ) <> 0 then
  begin
    SetMessage( MatchMsg )
  end
  else
  begin
    // no match - put focus back on find form, edit box
    FindForm.Focus;
    FindForm.TextToFindEdit.Focus;
    DoMessageDlg( FindForm.Caption, NoMatchMsg );
  end;
    // SetMessage( NoMatchMsg )
end;

Procedure TMainForm.EditFindMIOnClick (Sender: TObject);
Begin
  FindForm.TextToFindEdit.Text := FFindText;
  FindForm.CaseSensitiveCheckBox.Checked := FFindCaseSensitive;
  FindForm.OnFindClicked := OnFindCommand;
  FindForm.FromTopCheckBox.Checked := false;

  SelectNone;

  FindForm.Show;
  WinSetOwner( FindForm.Frame.Handle, Frame.Handle );
end;

Procedure TMainForm.OnFindCommand;
begin
  FFindText := FindForm.TextToFindEdit.Text;
  FFindCaseSensitive := FindForm.CaseSensitiveCheckBox.Checked;

  FFindFromTop := FindForm.FromTopCheckBox.Checked;
  FindForm.FromTopCheckBox.Checked := false; // uncheck after one use

  Find;
End;

Procedure TMainForm.HelpProductInformationMIOnClick (Sender: TObject);
Begin
  ProductInformationForm.NameAndVersionEdit.Text := 'AE ' + AppVersion;
  ProductInformationForm.ShowModal;
End;

Procedure TMainForm.MainFormOnClose (Sender: TObject;
  Var Action: TCloseAction);
var
  IniFile: TMyIniFile;
Begin
  try
    IniFile := TMyIniFile.Create( GetIniFilePath( 'ae.ini' ) );

    IniFile.WriteBool( 'General', 'FindCaseSensitive', FFindCaseSensitive );
    IniFile.WriteString( 'General', 'FindText', FFindText );
    IniFile.WriteString( 'General', 'ReplaceText', FReplaceText );
    IniFile.WriteString( 'General', 'LastDirectory', FLastDirectory );

    IniFile.WriteBool( 'General', 'WordWrap', FWrap );
    IniFile.WriteBool( 'General', 'ExitOnF3', FExitOnF3 );

    IniFile.WriteBool( 'General', 'PrintHeader', FPrintHeader );

    SaveFormSizePosition( self, IniFile );

    // save memo font
    IniFile.WriteString( 'Font', 'Face', FMemoFont.FaceName );
    IniFile.WriteInteger( 'Font', 'Size', FMemoFont.PointSize );
    IniFile.Erase( 'Font', 'Bold' ); // no longer used

    IniFile.WriteInteger( 'Color', 'Foreground', FMemoPenColor );
    IniFile.WriteInteger( 'Color', 'Background', FMemoColor );

    IniFile.WriteString( 'AutoSave', 'Type', AutoSaveTypeStrings[ FAutoSaveType ] );
    IniFile.WriteInteger( 'AutoSave', 'Minutes', FAutoSaveMinutes );
    IniFile.WriteInteger( 'AutoSave', 'Changes', FAutoSaveChanges );
    IniFile.WriteBool( 'AutoSave', 'RequireManualSave', FRequireManualSave );

    IniFile.WriteBool( 'General', 'WarnLargeFiles', FWarnLargeFiles );

    // Old keys, no longer applicable
    IniFile.Erase( 'General', 'ConfirmReplace' );
    IniFile.Erase( 'General', 'FindFromTop' );
    IniFile.Erase( 'General', 'ModalFindReplace' );

    IniFile.Destroy;
  except
  end;
End;

Function MLMFormat( TextFormat: TTextFormat ): MPARAM;
begin
  if TextFormat = tfDOS then
    result := MLFIE_CFTEXT
  else
    result := MLFIE_NOTRANS;
end;

// Insert specified text into memo. Handles any length
// the string is not zero terminated.
Procedure TMainForm.TextToMemo( Text: pchar;
                                TextLength: longint );
var
  InsertPoint: IPT;
  ImportSize: longint;
  ImportStart: pchar;
  ImportEnd: pchar;
  MaxImportEnd: pchar;
  TextEnd: pchar;
begin
  FSettingText := true;

  CreateMemo;

  Memo.BeginUpdate;

  // set import format as appropriate
  WinSendMsg( Memo.Handle,
              MLM_FORMAT,
              MLMFormat( FTextFormat ),
              0 );

  // start at the start
  ImportStart := Text;
  InsertPoint := 0;

  // calculate end address
  TextEnd := Text + TextLength;

  // loop until end reached...
  while ImportStart < TextEnd do
  begin
    // Work out the block to import.
    // We can import up to 64kB at a time;
    // and we must make sure to import CR+LF pairs,
    // and DBCS characters, as a whole.
    ImportEnd := ImportStart;

    MaxImportEnd := ImportStart + $FF00; // a bit less than 64k
    if MaxImportEnd > TextEnd then
      MaxImportEnd := TextEnd;

    // Now loop thru the block. Blech! Recode in assembler?
    while ImportEnd < MaxImportEnd do
    begin
      if ImportEnd[ 0 ] = #13 then
      begin
        // CR
        inc( ImportEnd );
        if ImportEnd < TextEnd then
          if ImportEnd[ 0 ] = #10 then
            // and LF.
            inc( ImportEnd );
      end
      else if ImportEnd[ 0 ] < #128 then
      begin
        // can't be a DBCS char
        inc( ImportEnd );
      end
      else
      begin
        ImportEnd := _WinNextChar( AppHandle,
                                   0, // system codepage
                                   0, // reserved
                                   ImportEnd );
      end;
    end;

    // Work out size
    ImportSize := PCharDiff( ImportEnd, ImportStart );

    // set import buffer
    WinSendMsg( Memo.Handle,
                MLM_SETIMPORTEXPORT,
                LongWord( ImportStart ),
                ImportSize );

    Screen.Cursor := crHourGlass;

    // do the import
    WinSendMsg( Memo.Handle,
                MLM_IMPORT,
                ULONG( @InsertPoint ),
                ImportSize );

    // next block. (MLM_IMPORT adjusts the insertpoint itself)
    inc( ImportStart, ImportSize );
  end;

  Memo.EndUpdate;

  Screen.Cursor := crDefault;

  FSettingText := false;
end;

// Insert specified text into memo. Handles any length
// the string is not zero terminated.
Procedure TMainForm.MemoToText( Var Text: pchar;
                                Var TextLength: longint;
                                SelectionOnly: boolean );
Var
  Start: IPT;
  NumCharacters: longint;
  ExportStart: pchar;
  ExportLength: longint;
  BytesExported: longint;
  SelEnd: IPT;

begin
  WinSendMsg( Memo.Handle,
              MLM_FORMAT,
              MLMFormat( FTextFormat ),
              0 ); // set format as appropriate

  if SelectionOnly then
  begin
    // get start and end of selection
    Start := WinSendMsg( Memo.Handle, MLM_QUERYSEL, MLFQS_MINSEL, 0 );
    SelEnd := WinSendMsg( Memo.Handle, MLM_QUERYSEL, MLFQS_MAXSEL, 0 );
    NumCharacters := SelEnd - Start;
  end
  else
  begin
    // all the text
    NumCharacters := WinSendMsg( Memo.Handle,
                                 MLM_QUERYTEXTLENGTH,
                                 0,
                                 0 );
    Start := 0;
  end;

  // convert to formatted size
  TextLength := WinSendMsg( Memo.Handle,
                            MLM_QUERYFORMATTEXTLENGTH,
                            Start,
                            NumCharacters );

  // allocate memory for the text
  Text := StrAlloc( TextLength );

  ExportStart := Text;

  BytesExported := 0;
  while BytesExported < TextLength do
  begin
    // how much to export in this block?
    ExportLength := $ff00;
    if BytesExported + ExportLength > TextLength then
      // last block - take remainder
      ExportLength := TextLength - BytesExported;

    // set buffer
    WinSendMsg( Memo.Handle,
                MLM_SETIMPORTEXPORT,
                LongWord( ExportStart + BytesExported ),
                ExportLength );
    // do the export
    BytesExported :=
      BytesExported
      + WinSendMsg( Memo.Handle,
                    MLM_EXPORT,
                    ULONG( @Start ),
                    ULONG( @ExportLength ) );
  end;
end;

Procedure TMainForm.RedisplayText;
var
  Text: PChar;
  Size: longint;
  OldChanged: boolean;
begin
  OldChanged := GetChanged;

  // save text cause setting scrollbars clears the window.
  // normally it would store it into a TStringList but we don't
  // want that as it is limited to 255; so StoreLines is set to false.

  MemoToText( Text, Size, false );

  // now restore the text. This will setup the memo etc.
  TextToMemo( Text, Size );

  StrDispose( Text );

  SetChanged( OldChanged );
end;

Procedure TMainForm.SetWrap( Value: boolean );
var
  OldCursor: IPT;
  OldAnchor: IPT;
begin
  OptionsWrapMI.Checked := Value;

  if FWrap = Value then
    exit;
  FWrap := Value;

  if Assigned( Memo ) then
  begin
    // preserve cursor/selection
    OldCursor := WinSendMsg( Memo.Handle, MLM_QUERYSEL, MLFQS_CURSORSEL, 0 );
    OldAnchor := WinSendMsg( Memo.Handle, MLM_QUERYSEL, MLFQS_ANCHORSEL, 0 );
  end
  else
  begin
    OldCursor := 0;
    OldAnchor := 0;
  end;

  RedisplayText;

  WinSendMsg( Memo.Handle, MLM_SETSEL, OldAnchor, OldCursor );

  UpdatePosition;

  PostMsg( Handle, WM_FOCUSMEMO, 0, 0 );
end;

Procedure TMainForm.OptionsWrapMIOnClick (Sender: TObject);
Begin
  SetWrap( not FWrap );
End;

Procedure TMainForm.EditSelectAllMIOnClick (Sender: TObject);
Begin
  Memo.SelectAll;
End;

Procedure TMainForm.EditPasteMIOnClick (Sender: TObject);
Begin
  SendMsg( Memo.Handle, MLM_PASTE, 0, 0 );
End;

Procedure TMainForm.EditCopyMIOnClick (Sender: TObject);
Begin
  SendMsg( Memo.Handle, MLM_COPY, 0, 0 );
End;

Procedure TMainForm.EditCutMIOnClick (Sender: TObject);
Begin
  SendMsg( Memo.Handle, MLM_CUT, 0, 0 );
End;

Procedure TMainForm.EditUndoMIOnClick (Sender: TObject);
Begin
  SendMsg( Memo.Handle, MLM_UNDO, 0, 0 );
End;

Procedure TMainForm.OptionsReadOnlyMIOnClick (Sender: TObject);
Begin
  SetReadOnly( not FReadOnly );
End;

procedure TMainForm.SetReadOnly( Value: boolean );
begin
  FReadOnly := Value;
  if Assigned( Memo ) then
    Memo.ReadOnly := Value;

  OptionsReadOnlyMI.Checked := Value;

  UpdateStatus;
  EnableControls;
end;

Procedure TMainForm.UpdateStatus;
var
  Status: string;
begin
  if FReadOnly then
  begin
    Status := ReadOnlyStatus
  end
  else if GetChanged then
  begin
    if FFilename = '' then
      Status := NewStatus
    else
      Status := ModifiedStatus
  end
  else
  begin
    Status := '';
  end;

  if Status <> StatusBar.Panels[ 3 ].Text then
  begin
    // only redraw if needed. (StatusBar is not smart enough to do this)
    StatusBar.Panels[ 3 ].Text := Status;
    StatusBar.Refresh;
  end;
end;

Procedure TMainForm.FileSaveAsMIOnClick (Sender: TObject);
Begin
  SaveFileAs;
End;

Procedure TMainForm.FileSaveMIOnClick (Sender: TObject);
Begin
  SaveFile;
End;

Procedure TMainForm.MainFormOnCloseQuery (Sender: TObject;
  Var CanClose: Boolean);
Begin
  if GetChanged then
  begin
    // check whether user wants to save, discard or stop closing
    if not CloseFile then
    begin
      // cancel close
      CanClose := false;
    end;
  end
  else
  begin
    CloseFile; // mainly to get colors back from memo
  end;
End;

Procedure TMainForm.FileNewMIOnClick (Sender: TObject);
Begin
  CloseFile;
End;

Procedure TMainForm.MemoOnMouseUp (Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X: LongInt; Y: LongInt);
Begin
  PostUpdatePosition;
End;

Procedure TMainForm.MemoOnChange (Sender: TObject);
Begin
  if FSettingText then
    exit;

  PostMsg( Handle, WM_MEMOCHANGE, 0, 0 );
end;

Procedure TMainForm.WMMemoChange( Var Msg: TMessage );
begin
  UpdatePosition;
  UpdateStatus;
  SetMessage( '' );

  if FAutoSaveType = asChanges then
  begin
    inc( FChangeCount );
    if FChangeCount > FAutoSaveChanges then
    begin
      AutoSave;
    end;
  end
  else if FAutoSaveType = asTimed then
  begin
    if not AutoSaveTimer.Running then
      // start timing...
      AutoSaveTimer.Start;
  end;
End;

Procedure TMainForm.WMFocusMemo( Var Msg: TMessage );
begin
  Memo.Focus;
end;

Procedure TMainForm.WMUpdatePosition( Var Msg: TMessage );
begin
  UpdatePosition;
end;

Procedure TMainForm.UpdateCaption;
begin
  if FFilename = '' then
    Caption := AppTitle  + '-' + UntitledTitle
  else
    Caption := AppTitle + '-' + FFilename;
end;

Procedure TMainForm.UpdatePosition;
var
  CursorPosition: longint;
  Row: longint;
  Column: longint;
  RowStartPosition: longint;
begin
  if Memo.WordWrap then
  begin
    // MLE doesn't report line/col usefully in wrap mode
    StatusBar.Panels[ 2 ].Text := '';
    exit;
  end;

  CursorPosition := SendMsg( Memo.Handle,
                             MLM_QUERYSEL,
                             MLFQS_CURSORSEL,
                             0 );
  Row := SendMsg( Memo.Handle,
                  MLM_LINEFROMCHAR,
                  CursorPosition,
                  0 );

  RowStartPosition := SendMsg( Memo.Handle,
                               MLM_CHARFROMLINE,
                               Row,
                               0 );

  Column := CursorPosition - RowStartPosition;
  StatusBar.Panels[ 2 ].Text := IntToStr( Row + 1 )
                                + ': '
                                + IntToStr( Column + 1 );
  StatusBar.Refresh;
end;

Procedure TMainForm.PostUpdatePosition;
begin
  PostMsg( Handle, WM_UPDATEPOSITION, 0, 0 );
end;

Procedure TMainForm.UpdateMode;
begin
  if WinQuerySysValue( HWND_DESKTOP, SV_INSERTMODE ) <> 0 then
    StatusBar.Panels[ 1 ].Text := InsertStatus
  else
    StatusBar.Panels[ 1 ].Text := OverwriteStatus
end;

Procedure TMainForm.MemoOnScan (Sender: TObject; Var KeyCode: TKeyCode);
Begin
  case KeyCode of
    kbCtrlZ:
      SendMsg( Memo.Handle, MLM_UNDO, 0, 0 );

    kbF3:
      // a contentious issue: old timers would prefer this to be exit...
      // But Windows Notepad and other applications use it as find next
      if FExitOnF3 then
        Close
      else
        Find;

    kbF2:
      SaveFile; // EPM compatibility
  end;
  PostUpdatePosition;
  UpdateMode;
End;

Procedure TMainForm.MainFormOnResize (Sender: TObject);
var
  i: longint;
  FirstPanelWidth: longint;
Begin
  StatusBar.Height := Canvas.TextHeight( 'S' ) + 4;
  if Assigned( Memo ) then
  begin
    Memo.Left := 0;
    Memo.Bottom := StatusBar.Height + 2;
    Memo.Width := ClientWidth;
    Memo.Height := ClientHeight - ( StatusBar.Height + 2 );
  end;

  FirstPanelWidth := ClientWidth;

  for i := 1 to StatusBar.Panels.Count - 1 do
    dec( FirstPanelWidth,
           StatusBar.Panels[ i ].Width
         + StatusBar.Spacing );

  StatusBar.Panels[ 0 ].Width := FirstPanelWidth;
End;

Procedure TMainForm.MainFormOnSetupShow (Sender: TObject);
Begin
End;

Procedure TMainForm.MainFormOnShow (Sender: TObject);
var
  IniFile: TMyIniFile;
  AutoSaveTypeString: string;
  ParamIndex: longint;
  Param: string;
  ReadOnlyFlag: boolean;
  Filename: string;
Begin
  // ValidateSPCCObjects;

  // Set the menu fonts, because they remember their own specific one
  MainMenu.Font := Screen.MenuFont;

  // get default font
  FMemoFont := Screen.GetFontFromPointSize( 'System VIO', 10 );
  if FMemoFont = nil then
    FMemoFont := Screen.GetFontFromPointSize( 'Courier', 10 );
  if FMemoFont = nil then
    FMemoFont := Screen.DefaultFont;

  try
    IniFile := TMyIniFile.Create( GetIniFilePath( 'ae.ini' ) );
    FFindCaseSensitive := IniFile.ReadBool( 'General', 'FindCaseSensitive', false );
    FFindText := IniFile.ReadString( 'General', 'FindText', '' );
    FReplaceText := IniFile.ReadString( 'General', 'ReplaceText', '' );
    FLastDirectory := IniFile.ReadString( 'General',
                                          'LastDirectory',
                                          GetBootDrive + ':\' );
    FWrap := IniFile.ReadBool( 'General', 'WordWrap', true );
    SetExitOnF3( IniFile.ReadBool( 'General', 'ExitOnF3', true ) );
    FPrintHeader := IniFile.ReadBool( 'General', 'PrintHeader', FPrintHeader );

    LoadFormSizePosition( self, IniFile );

    FMemoFont :=
      Screen.CreateCompatibleFont(
        Screen.GetFontFromPointSize(
          IniFile.ReadString( 'Font', 'Face', FMemoFont.FaceName ),
          IniFile.ReadInteger( 'Font', 'Size', FMemoFont.PointSize ) ) );

    FMemoPenColor := IniFile.ReadInteger( 'Color', 'Foreground', clWindowText  );
    FMemoColor := IniFile.ReadInteger( 'Color', 'Background', clEntryField );

    AutoSaveTypeString := IniFile.ReadString( 'AutoSave', 'Type', 'None' );
    if StringsSame( AutoSaveTypeString, 'Timed' ) then
      FAutoSaveType := asTimed
    else if StringsSame( AutoSaveTypeString, 'Changes' ) then
      FAutoSaveType := asChanges
    else
      FAutoSaveType := asNone;

    FAutoSaveMinutes := IniFile.ReadInteger( 'AutoSave', 'Minutes', 10 );
    FAutoSaveChanges := IniFile.ReadInteger( 'AutoSave', 'Changes', 100 );
    FRequireManualSave := IniFile.ReadBool( 'AutoSave', 'RequireManualSave', true ); // like E

    FWarnLargeFiles := IniFile.ReadBool( 'General', 'WarnLargeFiles', true );

    IniFile.Destroy;
  except
  end;

  CloseFile;
  UpdateMode;
  SetWrap( FWrap );

  FShowUsage := false;
  ReadOnlyFlag := false;
  Filename := '';

  for ParamIndex := 1 to ParamCount do
  begin
    Param := ParamStr( ParamIndex );
    if    MatchFlagParam( Param, '?' )
       or MatchFlagParam( Param, 'H' )
       or MatchFlagParam( Param, 'HELP' ) then
    begin
      FShowUsage := true
    end
    else if MatchFlagParam( Param, 'READ' ) then
    begin
      ReadOnlyFlag := true;
    end
    else
    begin
      if Filename = '' then
        Filename := Param
      else
        // too many parameters
        FShowUsage := true;
    end;
  end;

  // load file from command line, if specified
  if Filename <> ''  then
  begin
    OpenFile( Filename, false ); // don't complain (might want a new one)
    FFilename := Filename; // even if not found, so can save new one.
    if ReadOnlyFlag then
      SetReadOnly( true );
    UpdateCaption;
  end
  else
  begin
    UpdatePosition;
  end;

  PostMsg( Handle, WM_OPENED, 0, 0 );
End;

procedure TMainForm.WMOpened( Var Msg: TMessage );
begin
  if FShowUsage then
    DoMessageDlg( UsageTitle,
                  Usage1 + EndLine + Usage2 + EndLine + EndLine + Usage3 );

  Memo.Focus;
  UpdateStatus;
end;

function TMainForm.SaveFileTo( const Filename: string ): boolean;
var
  Text: pchar;
  F: HFILE;
  rc: APIRET;
  szName: cstring;
  OpenAction: ULONG;
  ActualWritten: ULONG;
  Size: longint;
begin
  Result := false;

  MemoToText( Text, Size, false );

  szName := FileName;
  rc:= DosOpen( szName,
                F,
                OpenAction,
                Size, // file size (only used if file is new)
                0, // attrs
                OPEN_ACTION_CREATE_IF_NEW + OPEN_ACTION_OPEN_IF_EXISTS,
                OPEN_SHARE_DENYREADWRITE + OPEN_ACCESS_WRITEONLY,
                nil ); // no eas
  if rc <> 0 then
  begin
    case rc of
      ERROR_ACCESS_DENIED:
      begin
        if FileIsReadOnly( Filename ) then
          DoErrorDlg( SaveTitle,
                      SaveReadonlyError
                      + FileName )
        else
          DoErrorDlg( SaveTitle,
                      SaveAccessDeniedError
                      + FileName );
      end;

      ERROR_SHARING_VIOLATION:
        DoErrorDlg( SaveTitle,
                    FileInUseError
                    + FileName );

      else
        DoErrorDlg( SaveTitle,
                    SaveError
                    + FileName
                    + ' '
                    + SysErrorMessage( rc ) );
    end;
    exit;
  end;

  // Set the file size. This is done for two reasons:
  // 1. (Most important) we are not replacing the file but overwriting
  //    existing data, in order to keep extended attributes. So we need
  //    to set the correct size in case the file on disk is currently longer.
  // 2. Efficiently allocate space
  rc := DosSetFileSize( F, Size );
  if rc = 0 then
    rc := DosWrite( F, Text^, Size, ActualWritten );

  DosClose( F );
  StrDispose( Text );

  if rc <> 0 then
  begin
    DoErrorDlg( SaveTitle,
                SaveError
                + Filename
                + ' '
                + SysErrorMessage( rc ) );
    exit;
  end;

  SetMessage( SavedMsg + Filename );

  SetChanged( false );

  Result := true;
end;

function TMainForm.SaveFileAs: boolean;
begin
  Result := false;
  SaveDialog.Title := SaveTitle;
  SaveDialog.Filename := FFilename;
  if not SaveDialog.Execute then
    exit;
  if FileExists( SaveDialog.Filename ) then
    if not DoConfirmDlg( SaveTitle,
                         ReplacePrompt
                         + EndLine
                         + SaveDialog.Filename ) then
      exit;
  if not SaveFileTo( SaveDialog.Filename ) then
    exit;

  Result := true;
  FFilename := SaveDialog.Filename;
  FLastDirectory := ExtractFilePath( FFilename );

  UpdateCaption;
end;

function TMainForm.SaveFile: boolean;
begin
  Result := true;
  if FFilename = '' then
  begin
    Result := SaveFileAs;
    exit;
  end;

  Result := SaveFileTo( FFilename );
end;

procedure TMainForm.CreateMemo;
begin
  // MLE  seems to be crap in this respect,
  // we have to destroy it to free up memory or something!
  if Assigned( Memo ) then
  begin
    FMemoPenColor := Memo.PenColor;
    FMemoColor := Memo.Color;
    Memo.Destroy;
  end;

  Memo := TCustomMemo.Create( self );

  Memo.WordWrap := FWrap;
  if Memo.WordWrap then
    Memo.ScrollBars := ssVertical
  else
    Memo.ScrollBars := ssBoth;

  MainFormOnResize( self );
  Memo.BorderStyle := bsNone;
  Memo.StoreLines := false;
  Memo.ReadOnly := FReadOnly;

  Memo.PopupMenu := EditPopupMenu;

  Memo.Parent := self;
  Memo.Font := FMemoFont;

  Memo.PenColor := FMemoPenColor;
  Memo.Color := FMemoColor;

  Memo.WantTabs := true;
  {
  // can't do it at this point in startup.
  // leave as default (8 spaces)
  SendMsg( Memo.Handle,
           MLM_SETTABSTOP,
           Memo.Canvas.TextWidth( 'm' ) * 2,
           0 );
  }
  WinSendMsg( Memo.Handle, MLM_RESETUNDO, 0, 0 ); // cause setting the color counts as an undoable item!

  Memo.OnFontChange := MemoOnFontChange;
  Memo.OnChange := MemoOnChange;
  Memo.OnMouseUp := MemoOnMouseUp; // for updating position
  Memo.OnScan := MemoOnScan; // overriding some keys
  Memo.OnDragDrop := MemoOnDragDrop;
  Memo.OnDragOver := MemoOnDragOver;
end;

function TMainForm.CloseFile: boolean;
begin
  result := false;

  if Assigned( Memo ) then
  begin
    if GetChanged then
    begin
      SaveQueryForm.ShowModal;

      case SaveQueryForm.ModalResult of
        cmSave:
          if not SaveFile then
            exit;

        cmCancel:
          exit;

        // else - cmDiscard - do nothing
      end;
    end;
  end;

  Result := true;

  CreateMemo;

  SetChanged( false );
  SetReadOnly( false );

  FTextFormat := tfDOS;

  UpdateStatus;
  EnableControls;

  FFilename := '';
  UpdateCaption;

  SetMessage( NewFileMsg );

  PostMsg( Handle, WM_FOCUSMEMO, 0, 0 );
end;

procedure TMainForm.DetectTextFormat( Text: pchar;
                                      TextLength: ULONG );
var
  ScanLength: ULONG;
  p: pchar;
  EndP: pchar;
begin
  // scan up to 64k for the first line break

  ScanLength := TextLength;
  if ScanLength > 65536 then
    ScanLength := 65536;

  p := Text + 1;
  EndP := Text + ScanLength;

  FTextFormat := tfDOS; // default if no linebreak found
  while p < EndP do
  begin
    if p[ 0 ] = #10 then  // Line feed
    begin
      if (p-1)[ 0 ] = #13 then
        // CRLF -> DOS
        FTextFormat := tfDOS
      else
        // LF by itself -> Unix
        FTextFormat := tfUnix;
      break;
    end;
    inc( p );
  end;
end;

function TMainForm.OpenFile( const Filename: string;
                             ComplainIfMissing: boolean ): boolean;
var
  Text: pchar;
  F: HFILE;
  rc: APIRET;
  szName: cstring;
  OpenAction: ULONG;
  FileInfo: FILESTATUS3;
  ActualRead: ULONG;
  TextLength: ULONG;
begin
  Result := false;
  if not CloseFile then
    exit;

  Screen.Cursor := crHourGlass;

  szName := Filename;
  rc := DosOpen( szName,
                 F,
                 OpenAction,
                 0, // file size - irrelevant, not creating,
                 0, // attrs - ''
                 OPEN_ACTION_OPEN_IF_EXISTS,
                 OPEN_SHARE_DENYREADWRITE + OPEN_ACCESS_READONLY,
                 nil ); // no eas
  if rc <> 0 then
  begin
    Screen.Cursor := crDefault;
    case rc of
      ERROR_FILE_NOT_FOUND,
      ERROR_OPEN_FAILED:
        if ComplainIfMissing then
          DoErrorDlg( OpenTitle,
                      FileDoesNotExistError + FileName );

      ERROR_ACCESS_DENIED:
        DoErrorDlg( OpenTitle,
                    OpenAccessDeniedError + FileName );

      ERROR_SHARING_VIOLATION:
        DoErrorDlg( OpenTitle,
                    OpenFileInUseError + FileName );

      else
        DoErrorDlg( OpenTitle,
                    OpenError
                    + FileName
                    + ' '
                    + SysErrorMessage( rc ) );
    end;
    exit;
  end;

  // Get file size
  rc := DosQueryFileInfo( F,
                          FIL_STANDARD,
                          FileInfo,
                          sizeof( FileInfo ) );
  if rc <> 0 then
  begin
    Screen.Cursor := crDefault;
    DosClose( F );
    DoErrorDlg( OpenTitle,
                OpenError + SysErrorMessage( rc ) );
    exit;
  end;

  TextLength := FileInfo.cbFile;

  if FWarnLargeFiles
     and ( TextLength > 1000*1000 ) then
  begin
    Screen.Cursor := crDefault;
    LargeFileWarningForm.NotAgainCheckBox.Checked := not FWarnLargeFiles;
    LargeFileWarningForm.ShowModal;
    FWarnLargeFiles := not LargeFileWarningForm.NotAgainCheckBox.Checked;

    if LargeFileWarningForm.ModalResult <> mrOK then
    begin
      DosClose( F );
      exit;
    end;

    Screen.Cursor := crHourGlass;
  end;

  // allocate temp memory for loading file
  GetMem( Text, TextLength );

  rc := DosRead( F, Text^, TextLength, ActualRead );
  DosClose( F );

  if rc <> 0 then
  begin
    Screen.Cursor := crDefault;
    FreeMem( Text, TextLength );
    DoErrorDlg( OpenTitle,
                OpenError + SysErrorMessage( rc ) );
    exit;
  end;

  DetectTextFormat( Text, TextLength );

  TextToMemo( Text, ActualRead );

  UpdatePosition;

  FreeMem( Text, TextLength );

  FFilename := Filename;

  FLastDirectory := ExtractFilePath( FFilename );

  UpdateCaption;

  SetChanged( false );
  WinSendMsg( Memo.Handle, MLM_RESETUNDO, 0, 0 ); // cause setting the color counts as an undoable item!

  if FileGetAttr( Filename ) and faReadOnly <> 0 then
    SetReadonly( True );

  SetMessage( OpenedMsg + Filename );

  Screen.Cursor := crDefault;

  Result := true;
end;

Procedure TMainForm.FileOpenMIOnClick (Sender: TObject);
Begin
  OpenDialog.Filename := AddSlash( FLastDirectory ) + '*.*';
  if OpenDialog.Execute then
    OpenFIle( OpenDialog.Filename, true );
End;

Procedure TMainForm.FileExitMIOnClick (Sender: TObject);
Begin
  Close;
End;

Function TMainForm.GetChanged: boolean;
begin
  Result := SendMsg( Memo.Handle,
                     MLM_QUERYCHANGED,
                     0,
                     0 ) <> 0;
end;

Procedure TMainForm.SetChanged( Value: boolean );
begin
  SendMsg( Memo.Handle,
           MLM_SETCHANGED,
           MParam( Value ),
           0 );
  if not Value then
    // ack! pffbt! Shouldn't this be if Value ???
    // changed: start timing/counting for autosave
    InitAutoSave;
  UpdateStatus;
end;

procedure TMainForm.OnHint( Sender: TObject );
Begin
  SetMessage( Application.Hint );
end;

const
  Vendor = 'Aaron Lawrence';
  Description = 'Text Editor';

  // BLDLevel - compatible - mostly
  EmbeddedVersion: string =
      '@#'
    + Vendor
    + ':'
    + BldLevelVersion
    + '#@'
    + Description
    + #0;

Initialization
  RegisterClasses ([TMainForm, TMainMenu, TStatusBar, TMenuItem,
    TSystemOpenDialog, TSystemSaveDialog, TTimer, TPopupMenu, TCustomFontDialog]);
End.
