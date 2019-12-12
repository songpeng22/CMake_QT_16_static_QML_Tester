#ifndef _1_global_defines_h_H
#define _1_global_defines_h_H

/*
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 Achtung:                                                            
 Dieses Programmodul enthaelt eichrelevanten Programm Code          
 Bei Aenderungen am eichrelevantem Code muss DATA_SOFT_ID in der Datei eich_defines.h      
 erhoeht werden und eine Neuzulassung veranlasst werden             
 
 Attention:
 This module contains approval relevant code                        
 If you change approval relevant code you have to increase DATA_SOFT_ID in the    
 file eich_defines.h and you have to induce a new authorization     
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*/


/**********************************************************************
*
*	Header %name:	global_defines.h %
*	Instance:		1
*	Description:	
*	%created_by:	lehng %
*	%date_created:	Wed Dec 01 08:52:19 2010 %
*
**********************************************************************/

/** Welmec Font Face-Name */
#define WELMEC1_FONT_NR   0
#define WELMEC1_FONT_NAME "Bizerba"
#define WELMEC1_FONT_CHN_NR   2
#define WELMEC1_FONT_CHN_NAME "AR PLBaosong2GBK Light"
#define BOSCFG1_FONT_NAME "BOSCFG_SCALE_MAIN_FONTCRC"
#define WELMEC2_FONT_NR   1
#define WELMEC2_FONT_NAME "Bizerba Condensed Bold Narrow"
#define BOSCFG2_FONT_NAME "BOSCFG_SCALE_NUM_FONTCRC"

/** Welmec-Font-File */
#ifdef WIN32
#define WELMEC1_FONT_FILE     "c:\\windows\\fonts\\Bizerba.ttf"
#define WELMEC1_FONT_CHN_FILE "c:\\windows\\fonts\\arplbaosong2gbklt.ttf"
#define WELMEC2_FONT_FILE     "c:\\windows\\fonts\\BizerbaCondBoldNarrow.ttf"
#else
#define WELMEC1_FONT_FILE     "/usr/share/fonts/Bizerba.ttf"
#define WELMEC1_FONT_CHN_FILE "/usr/share/fonts/arplbaosong2gbklt.ttf"
#define WELMEC2_FONT_FILE     "/usr/share/fonts/BizerbaCondBoldNarrow.ttf"
#endif

#define _ONLYPRICE_CALC_ALLOWED   // Nur noch Skins mit Preisrechnung zulassen (wegen Neuzulassung MC)

#define    BOSCFG_SCALE_MAIN_KEY      "./oemscale/classes/main"
#define    BOSCFG_SCALE_MAIN_FONTCRC  "systemcode"

#define    OS_PRIMARY_DISPLAY    0
#define    OS_SECONDARY_DISPLAY  1

#define    DISPLAY_NR_OPERATOR   0
#define    DISPLAY_NR_CUSTOMER   1
#define    DISPLAY_NR_SECONDARY_OPERATOR   0x10 + DISPLAY_NR_OPERATOR
#define    DISPLAY_NR_SECONDARY_CUSTOMER   0x10 + DISPLAY_NR_CUSTOMER
#define    DISPLAY_NR_MAX        2
#define    DISPLAY_NR_ALL           -1

#define    COLOR_ELEMENT_BORDER     0
#define    COLOR_ELEMENT_FOREGROUND 1
#define    COLOR_ELEMENT_BACKGROUND 2
#define    COLOR_ELEMENT_MAX        3


/** MAIN INI-Files for the kroem application */
#ifdef WIN32
    #define PATH_SEPARATOR       wxChar('\\')
    #define MAIN_PREFIX          "winnt_x86"                    // winnt_x86 bzw linux_x86
    #define MAIN_EXECUTABLE      "winnt_x86\\posscale.exe"      // Muss CRC gecheckt werden
    #define MAIN_INIFILE         "posscale.ini"      // Darf NICHT CRC gecheckt werden
    #define MAIN_CRC32FILE       "winnt_x86\\posscale.kryp"     // Datei mit verschl¨¹sselten CRC32 Codes zur Verifizierung von bestimmten Dateien
    #define CONFIG_EXECUTABLE    "winnt_x86\\configstart.cmd"   // K-OEM-Control-Pannel
    #define WES_EXECUTABLE       "winnt_x86\\posscalewes.exe -wes"  // K-OEM-WES Produktionsmodul
    #define PRODUCTION_ACTIVE    "production.status" // scale in prodcution
    #define GETSTRING		     wchar_str
    #define CONVERT_TO_WX	     cWC2WX
    #define ENCODING             HY_STRING_ENCODING_UCS2
#else
    #define PATH_SEPARATOR       wxChar('/')
    #define MAIN_PREFIX          "linux_x86"                    // winnt_x86 bzw linux_x86
    #define MAIN_EXECUTABLE      "linux_x86/posscale.x"         // Muss CRC gecheckt werden
    #define MAIN_INIFILE         "posscale.ini"       // Darf NICHT CRC gecheckt werden
    #define MAIN_CRC32FILE       "linux_x86/posscale.kryp"      // Datei mit verschl¨¹sselten CRC32 Codes zur Verifizierung von bestimmten Dateien
    #define CONFIG_EXECUTABLE    "linux_x86/configstart.sh"     // K-OEM-Control-Pannel
    #define WES_EXECUTABLE       "linux_x86/posscalewes.x -wes" // K-OEM-WES Produktionsmodul
    #define PRODUCTION_ACTIVE    "production.status"  // scale in prodcution
    #define GETSTRING		     utf8_str
    #define CONVERT_TO_WX	    cMB2WX
    #define ENCODING            HY_STRING_ENCODING_UTF8
#endif

/* Pfade sind unter Windows und Linux identisch */
#define MAIN_REGOPTINIFILE   "country/posscale_regopt." // muss CRC gecheckt werden; CRC Summe in der Datei; Datei beinhaltet Wiege-und L?ndereinstellungen
#define MAIN_TEXTFILE        "language/posscale_txt."   // muss CRC gecheckt werden; CRC Summe in der Datei; Datei beinhaltet Texte wie Netto , Tara...
#define MAIN_SKINFILE        "skins/posscale_skin."     // muss CRC gecheckt werden; CRC Summe in der Datei; Datei beinhaltet Parameter zur Fensterdarstellung
#define MAIN_SKINFILECAL     "skins/posscale_skin_cal."  // muss CRC gecheckt werden; CRC Summe in der Datei; Datei beinhaltet Parameter zur Fensterdarstellung
#define SECONDARY_SKINFILE   "skins/posscale_skin_sec." // muss CRC gecheckt werden; CRC Summe in der Datei; Datei beinhaltet Parameter zur Fensterdarstellung
#define MAIN_VERFILE         "posscale.ver"             // Von winnt_x86 bzw linux_x86/posscale Vers File nach Bizerba VER
#define WES_USEFILE          "wes4use.txt"              // Wenn diese Datei da ist, wird WES gestartet

/* Pfade sind in der ini-Datei */
#define MAIN_TYPEIDFILE      "posscale_id.xml"          // Ger?tepass XML Datei
#define TEMP_TYPEIDFILE      "posscale_id.tmp"          // Zwischendatei zur Erstellung der Ger?tepassdatei; Die Datei wird vom Konfigurations&Testtool erzeugt (Druckerdaten...)
#define CW_SETTINGSFILE      "posscale_cw.ini"          // Initialisierung Catchweigher Settings im Kalibriermodus 

/* switch calib detection file name */
#define CALIB_DETECTION_FILENAME    ("calibactive.status")

/*  WIRD NUR UNTER LINUX VERWENDET */
#define MAIN_RESBMP1_ZERO    "res/0.bmp"
#define MAIN_RESBMP1_ONE     "res/1.bmp"
#define MAIN_RESBMP1_TWO     "res/2.bmp"
#define MAIN_RESBMP1_THREE   "res/3.bmp"
#define MAIN_RESBMP1_FOUR    "res/4.bmp"
#define MAIN_RESBMP1_FIVE    "res/5.bmp"
#define MAIN_RESBMP1_SIX     "res/6.bmp"
#define MAIN_RESBMP1_SEVEN   "res/7.bmp"
#define MAIN_RESBMP1_EIGHT   "res/8.bmp"
#define MAIN_RESBMP1_NINE    "res/9.bmp"
#define MAIN_RESBMP1_MINUS   "res/minus.bmp"
#define MAIN_RESBMP1_SLASH   "res/slash.bmp"
#define MAIN_RESBMP1_OVER    "res/over.bmp"
#define MAIN_RESBMP1_LESS    "res/less.bmp"
#define MAIN_RESBMP1_UNCALIB "res/uncalib.bmp"
#define MAIN_RESBMP1_X       "res/x.bmp"
#define MAIN_RESBMP1_DOT     "res/dot.bmp"
#define MAIN_RESBMP1_COMMA   "res/comma.bmp"
#define MAIN_RESBMP1_BLANK   "res/blank.bmp"
#define MAIN_RESBMP1_BLANKS  "res/smallblank.bmp"

#define MAIN_RESBMP2_ZERO    "res/big_0.bmp"
#define MAIN_RESBMP2_ONE     "res/big_1.bmp"
#define MAIN_RESBMP2_TWO     "res/big_2.bmp"
#define MAIN_RESBMP2_THREE   "res/big_3.bmp"
#define MAIN_RESBMP2_FOUR    "res/big_4.bmp"
#define MAIN_RESBMP2_FIVE    "res/big_5.bmp"
#define MAIN_RESBMP2_SIX     "res/big_6.bmp"
#define MAIN_RESBMP2_SEVEN   "res/big_7.bmp"
#define MAIN_RESBMP2_EIGHT   "res/big_8.bmp"
#define MAIN_RESBMP2_NINE    "res/big_9.bmp"
#define MAIN_RESBMP2_MINUS   "res/big_minus.bmp"
#define MAIN_RESBMP2_SLASH   "res/big_slash.bmp"
#define MAIN_RESBMP2_OVER    "res/big_over.bmp"
#define MAIN_RESBMP2_LESS    "res/big_less.bmp"
#define MAIN_RESBMP2_UNCALIB "res/big_uncalib.bmp"
#define MAIN_RESBMP2_X       "res/big_x.bmp"
#define MAIN_RESBMP2_DOT     "res/big_dot.bmp"
#define MAIN_RESBMP2_COMMA   "res/big_comma.bmp"
#define MAIN_RESBMP2_BLANK   "res/big_blank.bmp"
#define MAIN_RESBMP2_BLANKS  "res/big_smallblank.bmp"

//ID's
#define ID_TIMER_REFRESH      1001

#define ID_SCALE_BITMAP1      1100
#define ID_SCALE_BITMAP2      1101
#define ID_SCALE_BITMAP3      1102
#define ID_SCALE_BITMAP4      1103
#define ID_SCALE_BITMAP5      1104
#define ID_SCALE_BITMAP6      1105
#define ID_SCALE_BITMAP7      1107

#define ID_ADW_LISTBOX        1200
#define ID_ADW_BUTTON_CONFIG  1201
#define ID_ADW_BUTTON_SHOWREGITERED  1202


//Krypt Datei
#define   KRYPTPOS_BMPFONT1_ZERO      "[0001]"
#define   KRYPTPOS_BMPFONT1_ONE       "[0002]"
#define   KRYPTPOS_BMPFONT1_TWO       "[0003]"
#define   KRYPTPOS_BMPFONT1_THREE     "[0004]"
#define   KRYPTPOS_BMPFONT1_FOUR      "[0005]"
#define   KRYPTPOS_BMPFONT1_FIVE      "[0006]"
#define   KRYPTPOS_BMPFONT1_SIX       "[0007]"
#define   KRYPTPOS_BMPFONT1_SEVEN     "[0008]"
#define   KRYPTPOS_BMPFONT1_EIGHT     "[0009]"
#define   KRYPTPOS_BMPFONT1_NINE      "[0010]"
#define   KRYPTPOS_BMPFONT1_MINUS     "[0011]"
#define   KRYPTPOS_BMPFONT1_OVER      "[0012]"
#define   KRYPTPOS_BMPFONT1_LESS      "[0013]"
#define   KRYPTPOS_BMPFONT1_X         "[0014]"
#define   KRYPTPOS_BMPFONT1_DOT       "[0015]"
#define   KRYPTPOS_BMPFONT1_COMMA     "[0016]"
#define   KRYPTPOS_BMPFONT1_BLANK     "[0017]"
#define   KRYPTPOS_BMPFONT1_UNCALIB   "[0018]"
#define   KRYPTPOS_BMPFONT1_SBLANK    "[0019]"
#define   KRYPTPOS_BMPFONT1_RES3      "[0020]"
#define   KRYPTPOS_BMPFONT2_ZERO      "[0021]"
#define   KRYPTPOS_BMPFONT2_ONE       "[0022]"
#define   KRYPTPOS_BMPFONT2_TWO       "[0023]"
#define   KRYPTPOS_BMPFONT2_THREE     "[0024]"
#define   KRYPTPOS_BMPFONT2_FOUR      "[0025]"
#define   KRYPTPOS_BMPFONT2_FIVE      "[0026]"
#define   KRYPTPOS_BMPFONT2_SIX       "[0027]"
#define   KRYPTPOS_BMPFONT2_SEVEN     "[0028]"
#define   KRYPTPOS_BMPFONT2_EIGHT     "[0029]"
#define   KRYPTPOS_BMPFONT2_NINE      "[0030]"
#define   KRYPTPOS_BMPFONT2_MINUS     "[0031]"
#define   KRYPTPOS_BMPFONT2_OVER      "[0032]"
#define   KRYPTPOS_BMPFONT2_LESS      "[0033]"
#define   KRYPTPOS_BMPFONT2_X         "[0034]"
#define   KRYPTPOS_BMPFONT2_DOT       "[0035]"
#define   KRYPTPOS_BMPFONT2_COMMA     "[0036]"
#define   KRYPTPOS_BMPFONT2_BLANK     "[0037]"
#define   KRYPTPOS_BMPFONT2_UNCALIB   "[0038]"
#define   KRYPTPOS_BMPFONT2_SBLANK    "[0039]"
#define   KRYPTPOS_BMPFONT2_SLASH     "[0040]"
#define   KRYPTPOS_BMPFONT1_SLASH     "[0041]"
#define   KRYPTPOS_MAIN_EXE           "[0042]"
#define   KRYPTPOS_RES1_INI           "[0043]"
#define   KRYPTPOS_RES2_INI           "[0044]"
#define   KRYPTPOS_RES3_INI           "[0045]"
#define   KRYPTPOS_RES4_INI           "[0046]"
#define   KRYPTPOS_RES5_INI           "[0047]"
#define   KRYPTPOS_RES6_INI           "[0048]"
#define   KRYPTPOS_FONT1_INI          "[0049]"
#define   KRYPTPOS_FONT2_INI          "[0050]"
#define   KRYPTPOS_FONT1_CHN_INI      "[0051]"

// Anzahl der einzulesenden Ver-Files
#define TYPE_ID_ANZ_VERSFILES              50
 
/* Application name */
#define APPLICATION_NAME  QString("posscale")

// Macros
#if defined WIN32
   #define HIDE_CURSOR() ShowCursor(0)
   #define SHOW_CURSOR() ShowCursor(1)
#else
   #define HIDE_CURSOR() wxSetCursor(wxCursor(wxCURSOR_BLANK))
   #define SHOW_CURSOR() wxSetCursor(wxCursor(wxCURSOR_ARROW))
#endif

//QT
#define QT_STATIC						1
#define M_PI 3.1415926535897932384626433832795
/*font name: Arial? swiss? Times New Roman Sans Serif*/
#define FONT_NAME_DOUBT             "Microsoft Sans Serif"//Sans Serif//Bizerba//Microsoft Sans Serif
#define NULL                        nullptr

#endif
