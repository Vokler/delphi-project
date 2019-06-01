unit StoreAppServer_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 19.05.2019 13:32:38 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Валера\Delphi\Store\Server\StoreAppServer.tlb (1)
// LIBID: {446359DE-862F-49DD-BDCA-CF1B98FF0C79}
// LCID: 0
// Helpfile: 
// HelpString: StoreAppServer Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (C:\WINDOWS\SysWOW64\midas.dll)
//   (3) v4.0 StdVCL, (C:\WINDOWS\SysWOW64\stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  StoreAppServerMajorVersion = 1;
  StoreAppServerMinorVersion = 0;

  LIBID_StoreAppServer: TGUID = '{446359DE-862F-49DD-BDCA-CF1B98FF0C79}';

  IID_IStoreServer: TGUID = '{A83FFD8E-51FC-4FEE-B2B8-A0CC7EBE1A1B}';
  CLASS_StoreServer: TGUID = '{C20E026F-2872-4747-B8E6-9ED2B43D41B7}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IStoreServer = interface;
  IStoreServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  StoreServer = IStoreServer;


// *********************************************************************//
// Interface: IStoreServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A83FFD8E-51FC-4FEE-B2B8-A0CC7EBE1A1B}
// *********************************************************************//
  IStoreServer = interface(IAppServer)
    ['{A83FFD8E-51FC-4FEE-B2B8-A0CC7EBE1A1B}']
    procedure smUpdateProvider(ID: Integer; const Name: WideString; const Address: WideString); safecall;
    procedure smDeleteProvider(ID: Integer); safecall;
    procedure smUpdateProduct(ID: Integer; const Name: WideString; const Unit_: WideString); safecall;
    procedure smDeleteProduct(ID: Integer); safecall;
    procedure smUpdateWaybill(ID: Integer; ProviderID: Integer; TotalSum: Double; Date: TDateTime; 
                              isPaid: Integer); safecall;
    procedure smDeleteWaybill(ID: Integer); safecall;
    procedure smUpdateWaybillInfo(WaybillID: Integer; ProductID: Integer; Quantity: Double; 
                                  Price: Double); safecall;
    procedure smDeleteWaybillInfo(WaybillID: Integer; ProductID: Integer); safecall;
    procedure smSQLClear; safecall;
    procedure smSQLAddString(const s: WideString); safecall;
    procedure smSQLExecute; safecall;
  end;

// *********************************************************************//
// DispIntf:  IStoreServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A83FFD8E-51FC-4FEE-B2B8-A0CC7EBE1A1B}
// *********************************************************************//
  IStoreServerDisp = dispinterface
    ['{A83FFD8E-51FC-4FEE-B2B8-A0CC7EBE1A1B}']
    procedure smUpdateProvider(ID: Integer; const Name: WideString; const Address: WideString); dispid 1;
    procedure smDeleteProvider(ID: Integer); dispid 2;
    procedure smUpdateProduct(ID: Integer; const Name: WideString; const Unit_: WideString); dispid 3;
    procedure smDeleteProduct(ID: Integer); dispid 4;
    procedure smUpdateWaybill(ID: Integer; ProviderID: Integer; TotalSum: Double; Date: TDateTime; 
                              isPaid: Integer); dispid 5;
    procedure smDeleteWaybill(ID: Integer); dispid 6;
    procedure smUpdateWaybillInfo(WaybillID: Integer; ProductID: Integer; Quantity: Double; 
                                  Price: Double); dispid 7;
    procedure smDeleteWaybillInfo(WaybillID: Integer; ProductID: Integer); dispid 8;
    procedure smSQLClear; dispid 301;
    procedure smSQLAddString(const s: WideString); dispid 302;
    procedure smSQLExecute; dispid 303;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoStoreServer provides a Create and CreateRemote method to          
// create instances of the default interface IStoreServer exposed by              
// the CoClass StoreServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoStoreServer = class
    class function Create: IStoreServer;
    class function CreateRemote(const MachineName: string): IStoreServer;
  end;

implementation

uses ComObj;

class function CoStoreServer.Create: IStoreServer;
begin
  Result := CreateComObject(CLASS_StoreServer) as IStoreServer;
end;

class function CoStoreServer.CreateRemote(const MachineName: string): IStoreServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_StoreServer) as IStoreServer;
end;

end.
