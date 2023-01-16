page 60032 "Test StringConversionMgt_TNG"
{
    Caption = 'Test String Conversion Management';
    PageType = Card;
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(ASCIIConversion)
            {
                Caption = 'Ascii Conversion';
                field(FieldInputTextForAsciiConversion; InputTextForAsciiConversion)
                {
                    ApplicationArea = All;
                    Caption = 'Text';
                    ToolTip = 'Input Text For Ascii Conversion';
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    var
                        StringConversionManagement: Codeunit StringConversionManagement;
                    begin
                        Message(StringConversionManagement.WindowsToASCII(InputTextForAsciiConversion));
                    end;
                }
            }
            group(PaddingAndRemoveDecimal)
            {
                Caption = 'Padding and Remove Decimal';
                field(FieldInputNoOfCharsForPadding; InputNoOfCharsForPadding)
                {
                    ApplicationArea = All;
                    Caption = 'No Of Characters';
                    ToolTip = 'Input No Of Characters For Padding';
                }
                field(FieldInputPadCharacter; InputPadCharacter)
                {
                    ApplicationArea = All;
                    Caption = 'Pad Characters';
                    ToolTip = 'Input Pad Characters For Padding';
                }
                field(FieldRemoveDecimal; RemoveDecimal)
                {
                    ApplicationArea = All;
                    Caption = 'Remove Decimal';
                    ToolTip = 'Remove Decimals For Padding';
                }
                field(FieldInputTextForPadding; InputTextForPadding)
                {
                    ApplicationArea = All;
                    Caption = 'Text';
                    ToolTip = 'Input Text For Padding';
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    begin
                        if RemoveDecimal then
                            RemoveDecimals(InputTextForPadding, InputNoOfCharsForPadding, InputPadCharacter)
                        else
                            ShowPadding(InputTextForPadding, InputNoOfCharsForPadding, InputPadCharacter);
                    end;
                }
            }
            group(RemoveNonAlphaNumericChar)
            {
                Caption = 'Remove Non Alpha Numeric Char';
                field(FieldInputTextForRemoveNonAlphaNumericChar; InputTextForRemoveNonAlphaNumericChar)
                {
                    ApplicationArea = All;
                    Caption = 'Text';
                    ToolTip = 'Input Text For Remove Non Alpha Numeric Characters';
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    var
                        StringConversionManagement: Codeunit StringConversionManagement;
                    begin
                        Message(StringConversionManagement.RemoveNonAlphaNumericCharacters(InputTextForRemoveNonAlphaNumericChar));
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        InputNoOfCharsForPadding := 10;
        InputPadCharacter := '-';
        InputTextForPadding := 'ABC123';
        InputTextForRemoveNonAlphaNumericChar := '123~ ABC#9';
    end;

    local procedure ShowPadding(InputText: Text[250]; NoOfChars: Integer; PadCharacter: Text[1])
    var
        StringConversionManagement: Codeunit StringConversionManagement;
        Justification: Option Right,Left;
    begin
        Message('Left Justification: \' + StringConversionManagement.GetPaddedString(InputText, NoOfChars, PadCharacter, Justification::Left) + '\' +
                'Right Justification: \' + StringConversionManagement.GetPaddedString(InputText, NoOfChars, PadCharacter, Justification::Right));
    end;

    local procedure RemoveDecimals(InputText: Text[250]; NoOfChars: Integer; PadCharacter: Text[1])
    var
        StringConversionManagement: Codeunit StringConversionManagement;
        Justification: Option Right,Left;
    begin
        Message('Remove Decimal Left Justification: \' + StringConversionManagement.RemoveDecimalFromString(InputText, NoOfChars, PadCharacter, Justification::Left) + '\' +
                'Remove Decimal Right Justification: \' + StringConversionManagement.RemoveDecimalFromString(InputText, NoOfChars, PadCharacter, Justification::Right));
    end;

    var
        InputTextForAsciiConversion: Text;
        InputTextForPadding: Text[250];
        InputPadCharacter: Text[1];
        InputNoOfCharsForPadding: Integer;
        RemoveDecimal: Boolean;
        InputTextForRemoveNonAlphaNumericChar: Text;

}
