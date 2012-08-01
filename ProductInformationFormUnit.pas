Unit ProductInformationFormUnit;

Interface

Uses
  Classes, Forms, Graphics, ExtCtrls, StdCtrls, Buttons,
  ACLLanguageUnit;

Type
  TProductInformationForm = Class (TForm)
    Bevel1: TBevel;
    LogoImage: TImage;
    CopyrightLabel: TLabel;
    OKButton: TButton;
    TranslationInfoLabel: TLabel;
    NameAndVersionEdit: TEdit;
    WebPageEdit: TEdit;
    EmailEdit: TEdit;
    Procedure WebPageEditOnClick (Sender: TObject);
    Procedure EmailEditOnClick (Sender: TObject);
    Procedure ProductInformationFormOnSetupShow (Sender: TObject);
    Procedure ProductInformationFormOnCreate (Sender: TObject);
  Private
  Public
    Procedure OnLanguageEvent( Language: TLanguageFile;
                               const Apply: boolean );
  End;

Var
  ProductInformationForm: TProductInformationForm;

Implementation

Uses
  ControlsUtility,
  WebBrowserUnit;

Procedure TProductInformationForm.WebPageEditOnClick (Sender: TObject);
Begin
  LaunchURL( 'http://' + WebPageEdit.Text );
End;

Procedure TProductInformationForm.EmailEditOnClick (Sender: TObject);
Begin
  LaunchURL( 'mailto://' + EmailEdit.Text );
End;

Procedure TProductInformationForm.ProductInformationFormOnSetupShow (Sender: TObject);
Begin
  ScaleForm( self, 11, 16 );
End;

Procedure TProductInformationForm.ProductInformationFormOnCreate (Sender: TObject);
Begin
  RegisterForLanguages( OnLanguageEvent );

  NameAndVersionEdit.Font := Screen.CreateCompatibleFont( Font );
  NameAndVersionEdit.Font.Attributes := [ faBold ];

  WebPageEdit.Font := Screen.CreateCompatibleFont( Font );
  WebPageEdit.Font.Attributes := [ faUnderscore ];
  EmailEdit.Font := WebPageEdit.Font;

  WebPageEdit.Cursor := GetLinkCursor;
  EmailEdit.Cursor := GetLinkCursor;

End;

Procedure TProductInformationForm.OnLanguageEvent( Language: TLanguageFile;
                                                   const Apply: boolean );
begin
  Language.LoadComponentLanguage( self, Apply );

  // so they cannae hide it with language file
  CopyrightLabel.Caption := 'Copyright 2005 Aaron Lawrence';
end;

Initialization
  RegisterClasses ([TProductInformationForm, TBevel, TLabel, TImage, TButton,
    TEdit]);
End.
