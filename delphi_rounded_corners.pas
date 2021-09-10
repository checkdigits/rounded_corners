unit delphi_rounded_corners;

interface
uses
  Winapi.Windows;

type TRoundedWindowCornerType = (RoundedCornerDefault, RoundedCornerOff, RoundedCornerOn, RoundedCornerSmall);

////////////////////////////////////////////////////////////////////////////
//
// Originally written by Ian Barker
//            https://github.com/checkdigits
//            https://about.me/IanBarker
//            ian.barker@gmail.com
//
// Based on an example in an answer during the RAD Studio 11 Launch Q & A
//
//
// Free software - use for any purpose including commercial use.
//
////////////////////////////////////////////////////////////////////////////
//
// Set or prevent Windows 11 from rounding the corners or your application
//
// Usage:
//         SetRoundedCorners(Self.Handle, RoundedCornerSmall);
//
////////////////////////////////////////////////////////////////////////////
///
procedure SetRoundedCorners(const TheHandle: HWND; const CornerType: TRoundedWindowCornerType);


implementation
uses
  Winapi.Dwmapi;

const

  //
  // More information:
  //      https://docs.microsoft.com/en-us/windows/apps/desktop/modernize/apply-rounded-corners
  //      https://docs.microsoft.com/en-us/windows/win32/api/dwmapi/ne-dwmapi-dwmwindowattribute
  //      https://docs.microsoft.com/en-us/windows/win32/api/dwmapi/nf-dwmapi-dwmsetwindowattribute
  //

  DWMWCP_DEFAULT    = 0; // Let the system decide whether or not to round window corners
  DWMWCP_DONOTROUND = 1; // Never round window corners
  DWMWCP_ROUND      = 2; // Round the corners if appropriate
  DWMWCP_ROUNDSMALL = 3; // Round the corners if appropriate, with a small radius

  DWMWA_WINDOW_CORNER_PREFERENCE = 33; // [set] WINDOW_CORNER_PREFERENCE, Controls the policy that rounds top-level window corners

procedure SetRoundedCorners(const TheHandle: HWND; const CornerType: TRoundedWindowCornerType);
var
  DWM_WINDOW_CORNER_PREFERENCE: Cardinal;
begin
  case CornerType of
    RoundedCornerOff:     DWM_WINDOW_CORNER_PREFERENCE := DWMWCP_DONOTROUND;
    RoundedCornerOn:      DWM_WINDOW_CORNER_PREFERENCE := DWMWCP_ROUND;
    RoundedCornerSmall:   DWM_WINDOW_CORNER_PREFERENCE := DWMWCP_ROUNDSMALL;
  else
    DWM_WINDOW_CORNER_PREFERENCE := DWMWCP_DEFAULT;
  end;
  Winapi.Dwmapi.DwmSetWindowAttribute(TheHandle, DWMWA_WINDOW_CORNER_PREFERENCE, @DWM_WINDOW_CORNER_PREFERENCE, sizeof(DWM_WINDOW_CORNER_PREFERENCE));
 end;
end.
