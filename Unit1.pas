unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart, ComCtrls,Math;
const
       DEFAULT_WIDTH=640;
       DEFAULT_HEIGHT=480;

       DEFAULT_SCALE=40;
       DEFAULT_OFFSET=0;
type
  PTResultFunction=^TResultFunction;
  TResultFunction=record
   x: real;
   y: real;
  end;

//---------------------------------------------------------------------------

TRealVector=class(TObject)
private
      FValue: PTResultFunction;
      FID: integer;
      function GetVector: PTResultFunction;
      procedure SetVector(AValue: PTResultFunction);
      function GetID: integer;
      procedure SetID(AValue: integer);
public
      function Add(AValue: PTResultFunction): PTResultFunction; overload; virtual;
      function Add(AValue: real): PTResultFunction; overload; virtual;
      function Add(AValue: integer): PTResultFunction; overload; virtual;
      function Sub(AValue: PTResultFunction): PTResultFunction; overload; virtual;
      function Sub(AValue: real): PTResultFunction; overload; virtual;
      function Sub(AValue: integer): PTResultFunction; overload; virtual;
      function Mul(AValue: PTResultFunction): PTResultFunction; overload; virtual;
      function Mul(AValue: real): PTResultFunction; overload; virtual;
      function Mul(AValue: integer): PTResultFunction; overload; virtual;
      function Del(AValue: PTResultFunction): PTResultFunction; overload; virtual;
      function Del(AValue: real): PTResultFunction; overload; virtual;
      function Del(AValue: integer): PTResultFunction; overload; virtual;
      property Vector: PTResultFunction read GetVector write SetVector;
      constructor Create(AID: integer;FA,FB: real); overload;
      destructor Destroy; override;
published
      property ID: integer read GetID write SetID;
end;


//---------------------------------------------------------------------------

TComplexVector=class(TRealVector)
public
      function Add(AValue: PTResultFunction): PTResultFunction; override;
      function Add(AValue: real): PTResultFunction; override;
      function Add(AValue: integer): PTResultFunction; override;
      function Sub(AValue: PTResultFunction): PTResultFunction; override;
      function Sub(AValue: real): PTResultFunction; override;
      function Sub(AValue: integer): PTResultFunction; override;
      function Mul(AValue: PTResultFunction): PTResultFunction; override;
      function Mul(AValue: real): PTResultFunction; override;
      function Mul(AValue: integer): PTResultFunction; override;
      function Del(AValue: PTResultFunction): PTResultFunction; override;
      function Del(AValue: real): PTResultFunction; override;
      function Del(AValue: integer): PTResultFunction; override;
      constructor Create(AID: integer;ARe,AIm: real); overload;
      destructor Destroy; override;
end;

//---------------------------------------------------------------------------

TProduceFunction=class(TObject)
private
      FFunctionValues: TList;
      FDescriptions: TList;
      FRealVector: TList;
      function GetFunctionValues: TList;
      function GetDescriptions: TList;
      function GetRealVectors: TList;
protected
      procedure OnCalcValues; virtual;
public
      function AddValue(AValue: TRealVector): integer;
      function FindValue(AValue: integer): TRealVector;
      procedure DeleteValue(AValue: integer);
      procedure ClearValues;
      procedure Update;
      constructor Create; overload;
      destructor Destroy; override;
published
     property FunctionValues: TList read GetFunctionValues;
     property Descriptions: TList read GetDescriptions;
     property RealVector: TList read GetRealVectors;
end;


//---------------------------------------------------------------------------

TProduceFunctionComplex=class(TProduceFunction)
private
      procedure OnCalcValues; override;
      procedure CalcFunction(fn: integer);
public
      constructor Create; overload;
      destructor Destroy; override;
end;


//---------------------------------------------------------------------------

TGraficComplex=class(TProduceFunctionComplex)
public
      procedure PrintVector; virtual;
      constructor Create; overload;
      destructor Destroy; override;
end;

//---------------------------------------------------------------------------

TTextComplex=class(TGraficComplex)
public
      procedure PrintVector; override;
      constructor Create; overload;
      destructor Destroy; override;
end;

//---------------------------------------------------------------------------

  TForm1 = class(TForm)
    Button3: TButton;
    Image2: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Button1: TButton;
    Edit6: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button2: TButton;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
        tc: TTextComplex;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//===========================================================================
//===========================================================================

//---------------------------------------------------------------------------
function TRealVector.GetVector: PTResultFunction;
begin
    result:=FValue;
end;
//---------------------------------------------------------------------------
procedure TRealVector.SetVector(AValue: PTResultFunction);
begin
    FValue.x:=AValue.x;
    FValue.y:=AValue.y;
end;

//---------------------------------------------------------------------------
function TRealVector.GetID: integer;
begin
    result:=FID;
end;
//---------------------------------------------------------------------------
procedure TRealVector.SetID(AValue: integer);
begin
    FID:=AValue;
end;

//---------------------------------------------------------------------------
constructor TRealVector.Create(AID: integer;FA,FB: real);
begin
    inherited Create;
    New(FValue);
    FID:=AID;
    FValue.x:=FA;
    FValue.y:=FB;
end;
//---------------------------------------------------------------------------
destructor TRealVector.Destroy;
begin
    Dispose(FValue);
    inherited;
end;
//---------------------------------------------------------------------------
function TRealVector.Add(AValue: PTResultFunction): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Add(AValue: real): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Add(AValue: integer): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Sub(AValue: PTResultFunction): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Sub(AValue: real): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Sub(AValue: integer): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Mul(AValue: PTResultFunction): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Mul(AValue: real): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Mul(AValue: integer): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Del(AValue: PTResultFunction): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Del(AValue: real): PTResultFunction;
begin
end;
//---------------------------------------------------------------------------
function TRealVector.Del(AValue: integer): PTResultFunction;
begin
end;


//===========================================================================
//===========================================================================
function TComplexVector.Add(AValue: PTResultFunction): PTResultFunction;
var
   temp: PTResultFunction;
begin
   New(temp);
   temp.x:=Vector.x+AValue.x;
   temp.y:=Vector.y+AValue.y;
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Add(AValue: real): PTResultFunction;
var
   temp: PTResultFunction;
begin
   New(temp);
   temp.x:=Vector.x+AValue;
   temp.y:=Vector.y+AValue;
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Add(AValue: integer): PTResultFunction;
var
   temp: PTResultFunction;
begin
   New(temp);
   temp.x:=Vector.x+AValue;
   temp.y:=Vector.y+AValue;
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Sub(AValue: PTResultFunction): PTResultFunction;
var
   temp: PTResultFunction;
begin
   New(temp);
   temp.x:=Vector.x-AValue.x;
   temp.y:=Vector.y-AValue.y;
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Sub(AValue: real): PTResultFunction;
var
   temp: PTResultFunction;
begin
   New(temp);
   temp.x:=Vector.x-AValue;
   temp.y:=Vector.y-AValue;
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Sub(AValue: integer): PTResultFunction;
var
   temp: PTResultFunction;
begin
   New(temp);
   temp.x:=Vector.x-AValue;
   temp.y:=Vector.y-AValue;
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Mul(AValue: PTResultFunction): PTResultFunction;
var
   temp: PTResultFunction;
begin
   New(temp);
   temp.x:=Vector.x*AValue.x-Vector.y*AValue.y;
   temp.y:=Vector.x*AValue.y+Vector.y*AValue.x;
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Mul(AValue: real): PTResultFunction;
var
   temp: PTResultFunction;
begin
   New(temp);
   temp.x:=Vector.x*AValue;
   temp.y:=Vector.x*AValue;
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Mul(AValue: integer): PTResultFunction;
var
   temp: PTResultFunction;
begin
   New(temp);
   temp.x:=Vector.x*AValue;
   temp.y:=Vector.x*AValue;
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Del(AValue: PTResultFunction): PTResultFunction;
var
   temp: PTResultFunction;
begin
   temp:=NIL;
   if(Abs(AValue.x)>0) Or (Abs(AValue.y)>0) then
   begin
     New(temp);;
     temp.x:=(Vector.x*AValue.x+Vector.y*AValue.y)/(AValue.x*AValue.x+AValue.y*AValue.y);
     temp.y:=(Vector.y*AValue.x-Vector.x*AValue.y)/(AValue.x*AValue.x+AValue.y*AValue.y);
   end
   else Raise Exception.Create('Деление на 0 в функции TComplexVector.Div!');
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Del(AValue: real): PTResultFunction;
var
   temp: PTResultFunction;
begin
   temp:=NIL;
   if Abs(AValue)>0 then
   begin
     New(temp);;
     temp.x:=Vector.x/AValue;
     temp.y:=Vector.y/AValue;
   end
   else Raise Exception.Create('Деление на 0 в функции TComplexVector.Div!');
   result:=temp;
end;
//---------------------------------------------------------------------------
function TComplexVector.Del(AValue: integer): PTResultFunction;
var
   temp: PTResultFunction;
begin
   temp:=NIL;
   if Abs(AValue)>0 then
   begin
     New(temp);;
     temp.x:=Vector.x/AValue;
     temp.y:=Vector.y/AValue;
   end
   else Raise Exception.Create('Деление на 0 в функции TComplexVector.Div!');
   result:=temp;
end;
//---------------------------------------------------------------------------

constructor TComplexVector.Create(AID: integer;ARe,AIm: real);
begin
   inherited Create(AID,ARe,AIm);
//   Vector.x:=ARe;
//   Vector.y:=AIm;
end;

//---------------------------------------------------------------------------

destructor TComplexVector.Destroy;
begin
    inherited;
end;

//===========================================================================
//===========================================================================

function TProduceFunction.GetFunctionValues: TList;
begin
   result:=FFunctionValues;
end;


//---------------------------------------------------------------------------

function TProduceFunction.GetDescriptions: TList;
begin
   result:=FDescriptions;
end;


//---------------------------------------------------------------------------
function TProduceFunction.GetRealVectors: TList;
begin
   result:=FRealVector;
end;
//---------------------------------------------------------------------------
procedure TProduceFunction.DeleteValue(AValue: integer);
var
  temp: TRealVector;
begin
  try
      temp:=FindValue(AValue);
      if temp<>NIL then FRealVector.Delete(FRealVector.IndexOf(temp));
  except
      Raise Exception.Create('Ошибка удаления TProduceFunction.DeleteValue!');
  end;
end;
//---------------------------------------------------------------------------
function TProduceFunction.FindValue(AValue: integer): TRealVector;
var
   i: integer;
   temp: TRealVector;
begin
   result:=NIL;
   if FRealVector.Count>0 then
   begin
       for i:=0 to FRealVector.Count-1 do
       begin
         temp:=TRealVector(FRealVector.Items[i]);
         if temp.ID=AValue then
         begin
           result:=temp;
           break;
         end;
       end
   end;
end;
//---------------------------------------------------------------------------
function TProduceFunction.AddValue(AValue: TRealVector): integer;
var
   res: integer;
begin
   res:=FRealVector.Add(AValue);
   OnCalcValues;
   result:=res;
end;
//---------------------------------------------------------------------------
procedure TProduceFunction.Update;
begin
    OnCalcValues;
end;

//---------------------------------------------------------------------------
procedure TProduceFunction.ClearValues;
var
   i: integer;
begin
   if FFunctionValues.Count>0 then
   begin
     for i:=0 to FFunctionValues.Count-1 do Dispose(FFunctionValues.Items[i]);
     FFunctionValues.Clear;
   end;
   FFunctionValues.Free;

   if FRealVector.Count>0 then
   begin
     for i:=0 to FRealVector.Count-1 do Dispose(FRealVector.Items[i]);
     FRealVector.Clear;
   end;
   FRealVector.Free;

   if FDescriptions.Count>0 then
   begin
     for i:=0 to FDescriptions.Count-1 do FreeMem(FDescriptions.Items[i]);
     FDescriptions.Clear;
   end;
   FDescriptions.Free;
   OnCalcValues;
end;

//---------------------------------------------------------------------------

procedure TProduceFunction.OnCalcValues;
begin
end;
//---------------------------------------------------------------------------
constructor TProduceFunction.Create;
begin
  try
     FRealVector:=TList.Create;
     FDescriptions:=TList.Create;
     FFunctionValues:=TList.Create;
  except
     Raise;
  end;
end;
//---------------------------------------------------------------------------
destructor TProduceFunction.Destroy;
var
   i: integer;
begin
   if FFunctionValues.Count>0 then
   begin
     for i:=0 to FFunctionValues.Count-1 do Dispose(FFunctionValues.Items[i]);
     FFunctionValues.Clear;
   end;
   FFunctionValues.Free;

   if FRealVector.Count>0 then
   begin
     for i:=0 to FRealVector.Count-1 do Dispose(FRealVector.Items[i]);
     FRealVector.Clear;
   end;
   FRealVector.Free;

   if FDescriptions.Count>0 then
   begin
     for i:=0 to FDescriptions.Count-1 do FreeMem(FDescriptions.Items[i]);
     FDescriptions.Clear;
   end;
   FDescriptions.Free;
end;


//===========================================================================
//============================== =============================================

procedure TProduceFunctionComplex.CalcFunction(fn: integer);
var
   p,z1: TRealVector;
   backup,temp: PTResultFunction;
   s: String;
   bf: PChar;
   i: integer;
begin
   p:=FRealVector.Items[0];
   New(backup);
   backup.x:=p.Vector.x;
   backup.y:=p.Vector.y;

   s:='z'+IntToStr(p.ID);
   for i:=1 to FRealVector.Count-1 do
   begin
         z1:=FRealVector.Items[i];
         case fn of
            1:
            begin
              temp:=p.Add(z1.Vector);
              s:='('+s+'+z'+IntToStr(z1.ID)+')';
            end;
            2:
            begin
              temp:=p.Sub(z1.Vector);
              s:='('+s+'-z'+IntToStr(z1.ID)+')';
            end;
            3:
            begin
              temp:=p.Mul(z1.Vector);
              s:='('+s+'*z'+IntToStr(z1.ID)+')';
            end;
            4:
            begin
              temp:=p.Del(z1.Vector);
              s:='('+s+'/z'+IntToStr(z1.ID)+')';
            end;
         end;
         p.Vector.x:=temp.x;
         p.Vector.y:=temp.y;
   end;
   temp.x:=p.Vector.x;
   temp.y:=p.Vector.y;
   FunctionValues.Add(temp);
   case fn of
       1: s:='Add='+s+'=('+FloatToStrF(p.Vector.x,ffFixed,4,2)+')+i('+FloatToStrF(p.Vector.y,ffFixed,4,2)+')';
       2: s:='Sub='+s+'=('+FloatToStrF(p.Vector.x,ffFixed,4,2)+')+i('+FloatToStrF(p.Vector.y,ffFixed,4,2)+')';
       3: s:='Mul='+s+'=('+FloatToStrF(p.Vector.x,ffFixed,4,2)+')+i('+FloatToStrF(p.Vector.y,ffFixed,4,2)+')';
       4: s:='Div='+s+'=('+FloatToStrF(p.Vector.x,ffFixed,4,2)+')+i('+FloatToStrF(p.Vector.y,ffFixed,4,2)+')';
   end;
   bf:=AllocMem(sizeof(char)*(Length(s)+1));
   StrPCopy(bf,s);
   Descriptions.Add(bf);
   p.Vector.x:=backup.x;
   p.Vector.y:=backup.y;
   Dispose(backup);
end;
//---------------------------------------------------------------------------
procedure TProduceFunctionComplex.OnCalcValues;
var
     i: integer;
     s: String;
     bf: PChar;
     z1: TRealVector;
     temp: PTResultFunction;
begin
     if FunctionValues.Count>0 then
     begin
       for i:=0 to FunctionValues.Count-1 do Dispose(FunctionValues.Items[i]);
       FunctionValues.Clear;
     end;
     if Descriptions.Count>0 then
     begin
       for i:=0 to Descriptions.Count-1 do FreeMem(Descriptions.Items[i]);
       Descriptions.Clear;
     end;
     if FRealVector.Count>1 then
     begin
       for i:=0 to FRealVector.Count-1 do
       begin
         z1:=FRealVector.Items[i];
         New(temp);
         temp.x:=z1.Vector.x;
         temp.y:=z1.Vector.y;
         FunctionValues.Add(temp);
         s:='z'+IntToStr(z1.ID)+'=('+FloatToStrF(z1.Vector.x,ffFixed,4,2)+')+i('+FloatToStrF(z1.Vector.y,ffFixed,4,2)+')';
         bf:=AllocMem(sizeof(char)*(Length(s)+1));
         StrPCopy(bf,s);
         Descriptions.Add(bf);
       end;
       CalcFunction(1);
       CalcFunction(2);
       CalcFunction(3);
       CalcFunction(4);
     end;
end;

//---------------------------------------------------------------------------
constructor TProduceFunctionComplex.Create;
begin
   inherited;
end;

//---------------------------------------------------------------------------

destructor TProduceFunctionComplex.Destroy;
begin
    inherited;
end;

//===========================================================================
//===========================================================================
procedure TGraficComplex.PrintVector;
var
   i: integer;
begin
      if Descriptions.Count>0 then
      begin
        Form1.Image2.Canvas.Font.Name:='Courier New';
        Form1.Image2.Canvas.Font.Size:=10;
        Form1.Image2.Canvas.FillRect(Form1.Image2.Canvas.ClipRect);
        for i:=0 to Descriptions.Count-1 do Form1.Image2.Canvas.TextOut(10,10+(i+1)*Form1.Image2.Canvas.Font.Size*2,String(PChar(Descriptions.Items[i])));
      end;
end;
//---------------------------------------------------------------------------
constructor TGraficComplex.Create;
begin
   inherited;
end;

//---------------------------------------------------------------------------

destructor TGraficComplex.Destroy;
begin
    inherited;
end;

//===========================================================================
//===========================================================================
procedure TTextComplex.PrintVector;
var
   i: integer;
begin
      if Descriptions.Count>0 then
      begin
         for i:=0 to Descriptions.Count-1 do Writeln(String(PChar(Descriptions.Items[i])));
         Writeln('====================================================================');
      end;
end;
//---------------------------------------------------------------------------

constructor TTextComplex.Create;
begin
   inherited;
end;

//---------------------------------------------------------------------------

destructor TTextComplex.Destroy;
begin
    inherited;
end;

//===========================================================================
//===========================================================================

procedure TForm1.Button1Click(Sender: TObject);
begin
  tc.Update;
  tc.PrintVector;
end;

procedure TForm1.Button2Click(Sender: TObject);
type
  PTextComplex=^TTextComplex;
var
  t: TGraficComplex;
  backup: TTextComplex;
begin
  t:=TGraficComplex.Create;
  backup:=PTextComplex(tc)^;
  PTextComplex(tc)^:=PTextComplex(t)^;
  tc.Update;
  tc.PrintVector;
  PTextComplex(tc)^:=backup;
  t.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
   z1: TComplexVector;
begin
   z1:=TComplexVector.Create(1,5,5);
   tc.AddValue(z1);
   Edit1.Text:=FloatToStr(tc.FindValue(1).Vector.x);
   Edit2.Text:=FloatToStr(tc.FindValue(1).Vector.y);
   z1:=TComplexVector.Create(2,10,8);
   tc.AddValue(z1);
   Edit3.Text:=FloatToStr(tc.FindValue(2).Vector.x);
   Edit4.Text:=FloatToStr(tc.FindValue(2).Vector.y);
   z1:=TComplexVector.Create(3,0.8,3.3);
   tc.AddValue(z1);
   Edit5.Text:=FloatToStr(tc.FindValue(3).Vector.x);
   Edit6.Text:=FloatToStr(tc.FindValue(3).Vector.y);
   Edit1.Enabled:=true;
   Edit2.Enabled:=true;
   Edit3.Enabled:=true;
   Edit4.Enabled:=true;
   Edit5.Enabled:=true;
   Edit6.Enabled:=true;
   Button1.Enabled:=true;
   Button3.Enabled:=false;
   CheckBox1.Checked:=true;
   CheckBox2.Checked:=true;
   CheckBox3.Checked:=true;
   CheckBox1.Enabled:=true;
   CheckBox2.Enabled:=true;
   CheckBox3.Enabled:=true;
end;
procedure TForm1.CheckBox1Click(Sender: TObject);
var
   t1,t2: real;
   p: TRealVector;
   z1: TComplexVector;
begin
   if(CheckBox2.Checked=false) Or (CheckBox3.Checked=false) then CheckBox1.Checked:=true;
   if CheckBox1.Checked=false then
   begin
       tc.DeleteValue(1);
   end
   else
   begin
     p:=tc.FindValue(1);
     if p=NIL then
     begin
      try
       t1:=StrToFloat(Edit1.Text);
       t2:=StrToFloat(Edit2.Text);
       z1:=TComplexVector.Create(1,t1,t2);
      except
       z1:=TComplexVector.Create(1,5,5);
      end;
      tc.AddValue(z1);
     end;
   end;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
var
   t1,t2: real;
   p: TRealVector;
   z1: TComplexVector;
begin
   if(CheckBox1.Checked=false) Or (CheckBox3.Checked=false) then CheckBox2.Checked:=true;
   if CheckBox2.Checked=false then
   begin
       tc.DeleteValue(2);
   end
   else
   begin
     p:=tc.FindValue(2);
     if p=NIL then
     begin
      try
       t1:=StrToFloat(Edit3.Text);
       t2:=StrToFloat(Edit4.Text);
       z1:=TComplexVector.Create(2,t1,t2);
      except
       z1:=TComplexVector.Create(2,10,8);
      end;
      tc.AddValue(z1);
     end;

   end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
var
   t1,t2: real;
   p: TRealVector;
   z1: TComplexVector;
begin
   if(CheckBox1.Checked=false) Or (CheckBox2.Checked=false) then CheckBox3.Checked:=true;
   if CheckBox3.Checked=false then
   begin
       tc.DeleteValue(3);
   end
   else
   begin
     p:=tc.FindValue(3);
     if p=NIL then
     begin
      try
       t1:=StrToFloat(Edit5.Text);
       t2:=StrToFloat(Edit6.Text);
       z1:=TComplexVector.Create(3,t1,t2);
      except
       z1:=TComplexVector.Create(3,0.8,3.3);
      end;
      tc.AddValue(z1);
     end;
   end;
end;

//---------------------------------------------------------------------------
procedure TForm1.Edit1Exit(Sender: TObject);
var
     t: real;
     q: PTResultFunction;
begin
   if Edit1.Text<>'' then
   begin
     try
       t:=StrToFloat(Edit1.Text);
       q:=tc.FindValue(1).Vector;
       q.x:=t;
     except
     end;
   end;
end;

procedure TForm1.Edit2Exit(Sender: TObject);
var
     t: real;
     q: PTResultFunction;
begin
   if Edit2.Text<>'' then
   begin
     try
       t:=StrToFloat(Edit2.Text);
       q:=tc.FindValue(1).Vector;
       q.y:=t;
     except
     end;
   end;
end;

procedure TForm1.Edit3Exit(Sender: TObject);
var
     t: real;
     q: PTResultFunction;
begin
   if Edit3.Text<>'' then
   begin
     try
       t:=StrToFloat(Edit3.Text);
       q:=tc.FindValue(2).Vector;
       q.x:=t;
     except
     end;
   end;
end;

procedure TForm1.Edit4Exit(Sender: TObject);
var
     t: real;
     q: PTResultFunction;
begin
   if Edit4.Text<>'' then
   begin
     try
       t:=StrToFloat(Edit4.Text);
       q:=tc.FindValue(2).Vector;
       q.y:=t;
     except
     end;
   end;
end;

procedure TForm1.Edit5Exit(Sender: TObject);
var
     t: real;
     q: PTResultFunction;
begin
   if Edit5.Text<>'' then
   begin
     try
       t:=StrToFloat(Edit5.Text);
       q:=tc.FindValue(3).Vector;
       q.x:=t;
     except
     end;
   end;
end;

procedure TForm1.Edit6Exit(Sender: TObject);
var
     t: real;
     q: PTResultFunction;
begin
   if Edit6.Text<>'' then
   begin
     try
       t:=StrToFloat(Edit6.Text);
       q:=tc.FindValue(3).Vector;
       q.y:=t;
     except
     end;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   tc:=TTextComplex.Create;
   AllocConsole;
end;

//---------------------------------------------------------------------------

procedure TForm1.FormDestroy(Sender: TObject);
begin
   FreeConsole;
end;

end.
