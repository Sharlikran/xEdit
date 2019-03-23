unit wbDataFormatNifTypes;

interface

uses
  Types, SysUtils, StrUtils, Math, wbDataFormat;

var
  // True: Euler YPR, False: Angle and Axis
  wbRotationEuler: Boolean = True;


function wbShortString(const aName: string; const aEvents: array of const): TdfCharsDef; overload;
function wbShortString(const aName: string): TdfCharsDef; overload;
function wbSizedString(const aName, aDefaultValue: string; const aEvents: array of const): TdfCharsDef; overload;
function wbSizedString(const aName: string; const aEvents: array of const): TdfCharsDef; overload;
function wbSizedString(const aName: string): TdfCharsDef; overload;
function wbByteArray(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbByteArray(const aName: string): TdfDef; overload;
function wbByteFloat(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbByteFloat(const aName: string): TdfDef; overload;
function wbMatchGroup(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbMatchGroup(const aName: string): TdfDef; overload;
function wbVector3(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef; overload;
function wbVector3(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbVector3(const aName: string): TdfDef; overload;
function wbVector4(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef; overload;
function wbVector4(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbVector4(const aName: string): TdfDef; overload;
function wbHalfVector3(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef; overload;
function wbHalfVector3(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbHalfVector3(const aName: string): TdfDef; overload;
function wbByteVector3(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef; overload;
function wbByteVector3(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbByteVector3(const aName: string): TdfDef; overload;
function wbColor3(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef; overload;
function wbColor3(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbColor3(const aName: string): TdfDef; overload;
function wbColor4(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef; overload;
function wbColor4(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbColor4(const aName: string): TdfDef; overload;
function wbByteColor4(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef; overload;
function wbByteColor4(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbByteColor4(const aName: string): TdfDef; overload;
function wbQuaternion(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbQuaternion(const aName: string): TdfDef; overload;
function wbQuaternionXYZW(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbQuaternionXYZW(const aName: string): TdfDef; overload;
function wbMatrix22(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbMatrix22(const aName: string): TdfDef; overload;
function wbMatrix33(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbMatrix33(const aName: string): TdfDef; overload;
function wbRotMatrix33(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbRotMatrix33(const aName: string): TdfDef; overload;
function wbMatrix44(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbMatrix44(const aName: string): TdfDef; overload;
function wbhkMatrix3(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbhkMatrix3(const aName: string): TdfDef; overload;
function wbTBC(const aName: string; const aEvents: array of const): TdfDef;
function wbNiBound(const aName: string): TdfDef;
function wbQTransform(const aName: string): TdfDef;
function wbMTransform(const aName: string): TdfDef;
function wbSkinTransform(const aName: string): TdfDef;
function wbTexCoord(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef; overload;
function wbTexCoord(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbTexCoord(const aName: string): TdfDef; overload;
function wbHalfTexCoord(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef; overload;
function wbHalfTexCoord(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbHalfTexCoord(const aName: string): TdfDef; overload;
function wbTriangle(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef; overload;
function wbTriangle(const aName: string; const aEvents: array of const): TdfDef; overload;
function wbTriangle(const aName: string): TdfDef; overload;
function wbAlphaFormat(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBSPartFlag(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBSDismemberBodyPartType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBodyPartList(const aName: string; const aEvents: array of const): TdfDef;
function wbBSGeometrySegmentData(const aName: string; const aEvents: array of const): TdfDef;
function wbBSShaderType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBSShaderFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBSShaderFlags2(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBSLightingShaderPropertyShaderType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbEffectShaderControlledVariable(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbEffectShaderControlledColor(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbLightingShaderControlledVariable(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbLightingShaderControlledColor(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbSkyrimWaterShaderFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbSkyObjectType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBroadPhaseType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbhkResponseType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbhkConstraintType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbTexType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbKeyType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbLightMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbApplyMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbOblivionHavokMaterial(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbFallout3HavokMaterial(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbSkyrimHavokMaterial(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbOblivionLayer(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbFallout3Layer(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbSkyrimLayer(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbhkWorldObjCinfoProperty(const aName: string; const aEvents: array of const): TdfDef;
function wbbhkCOFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbbhkCMSDMaterial(const aName: string; const aEvents: array of const): TdfDef;
function wbbhkCMSDTransform(const aName: string; const aEvents: array of const): TdfDef;
function wbbhkCMSDBigTris(const aName: string; const aEvents: array of const): TdfDef;
function wbbhkCMSDChunk(const aName: string; const aEvents: array of const): TdfDef;
function wbMoppDataBuildType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbMipMapFormat(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbPixelFormat(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbPixelLayout(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbTexClampMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbTexFilterMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbVertMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbCycleType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBillboardMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbFieldType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbZCompareMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbStencilCompareMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbStencilAction(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbFaceDrawMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbMotionSystem(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbDeactivatorType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbSolverDeactivation(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbMotionQuality(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbForceType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbTexTransform(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbDecayType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbSymmetryType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbVelocityType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbEmitFrom(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbEffectType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbCoordGenType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbTargetColor(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbConsistencyType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBoundVolumeType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbCollisionMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbPropagationMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbPathFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbInterpBlendFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbVectorFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBSVectorFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbSkyrimShaderPropertyFlags1(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbSkyrimShaderPropertyFlags2(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbFallout4ShaderPropertyFlags1(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbFallout4ShaderPropertyFlags2(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbVertexFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbBSCPCullingType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbNiSwitchFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbMotorType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbChannelType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbChannelConvention(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbFurnitureEntryPoints(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbAnimationType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbLookAtFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
function wbAdditionalDataInfo(const aName: string; const aEvents: array of const): TdfDef;
function wbAdditionalDataBlock(const aName: string; const aEvents: array of const): TdfDef;
function wbBSPackedAdditionalDataBlock(const aName: string; const aEvents: array of const): TdfDef;


implementation

uses
  wbNifMath;

procedure GetTextHexColor(const aElement: TdfElement; var aText: string);
begin
  aText := '#' + aText;
end;

procedure SetTextHexColor(const aElement: TdfElement; var aText: string);
begin
  if Copy(aText, 1, 1) = '#' then
    Delete(aText, 1, 1);

  if Length(aText) = 3 then
    aText := Copy(aText, 1, 1) + Copy(aText, 1, 1) + Copy(aText, 2, 1) + Copy(aText, 2, 1) + Copy(aText, 3, 1) + Copy(aText, 3, 1);

  aElement.EditValues['R'] := Copy(aText, 1, 2);
  aElement.EditValues['G'] := Copy(aText, 3, 2);
  aElement.EditValues['B'] := Copy(aText, 5, 2);
  aElement.EditValues['A'] := Copy(aText, 7, 2);
  aText := '';
end;


// a byte represented as a float value [-1.0, 1.0]
function wbByteFloat(const aName: string; const aEvents: array of const): TdfDef;
  procedure GetText(const aElement: TdfElement; var aText: string);
  begin
    aText := dfFloatToStr(StrToInt(aText) / 127.5 - 1.0);
  end;
  procedure SetText(const aElement: TdfElement; var aText: string);
  begin
    aText := IntToStr(Round((dfStrToFloat(aText) + 1.0) * 127.5));
  end;
begin
  Result := dfInteger(aName, dtU8, '0.0', aEvents);
  Result.OnGetText := @GetText;
  Result.OnSetText := @SetText;
end;

function wbByteFloat(const aName: string): TdfDef;
begin
  Result := wbByteFloat(aName, []);
end;


// a byte represented as hex value 00..FF
function wbHexByte(const aName: string): TdfDef;
  procedure GetTextHexByte(const aElement: TdfElement; var aText: string);
  begin
    aText := IntToHex(StrToInt(aText), 2);
  end;
  procedure SetTextHexByte(const aElement: TdfElement; var aText: string);
  begin
    aText := IntToStr(StrToInt('$' + aText));
  end;
begin
  Result := dfInteger(aName, dtU8, [
    DF_OnGetText, @GetTextHexByte,
    DF_OnSetText, @SetTextHexByte
  ]);
end;

// a float32 represented as a byte hex value 00..FF
function wbHexFloat(const aName: string): TdfDef;
  procedure GetTextHexFloat(const aElement: TdfElement; var aText: string);
  var
    v: Extended;
  begin
    v := dfStrToFloat(aText) * 255;
    if v < 0.0 then v := 0.0
    else if v > 255.0 then v := 255.0;
    aText := IntToHex(Round(v), 2);
  end;
  procedure SetTextHexFloat(const aElement: TdfElement; var aText: string);
  var
    v: Extended;
  begin
    v := StrToInt('$' + aText) / 255;
    aText := FloatToStr(v);
  end;
begin
  Result := dfFloat(aName, [
    DF_OnGetText, @GetTextHexFloat,
    DF_OnSetText, @SetTextHexFloat
  ]);
end;

function wbShortString(const aName: string; const aEvents: array of const): TdfCharsDef;
begin
  Result := dfChars(aName, -1, '', #0, True, aEvents);
end;

function wbShortString(const aName: string): TdfCharsDef;
begin
  Result := wbShortString(aName, []);
end;

function wbSizedString(const aName, aDefaultValue: string; const aEvents: array of const): TdfCharsDef;
begin
  Result := dfChars(aName, -4, aDefaultValue, #0, False, aEvents);
end;

function wbSizedString(const aName: string; const aEvents: array of const): TdfCharsDef;
begin
  Result := wbSizedString(aName, '', aEvents);
end;

function wbSizedString(const aName: string): TdfCharsDef;
begin
  Result := wbSizedString(aName, '', []);
end;

function wbByteArray(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfBytes(aName, -4, aEvents);
end;

function wbByteArray(const aName: string): TdfDef;
begin
  Result := dfBytes(aName, -4, []);
end;

function wbMatchGroup(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfArray(aName, dfInteger('Vertex Indices', dtU16), -2, '', aEvents);
end;

function wbMatchGroup(const aName: string): TdfDef; overload;
begin
  Result := wbMatchGroup(aName, []);
end;

function wbVector3(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfMerge(aName, [
    dfFloat('X'),
    dfFloat('Y'),
    dfFloat('Z')
  ], aDefaultValue, aEvents);
end;

function wbVector3(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := wbVector3(aName, '', aEvents);
end;

function wbVector3(const aName: string): TdfDef; overload;
begin
  Result := wbVector3(aName, []);
end;

function wbVector4(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfMerge(aName, [
    dfFloat('X'),
    dfFloat('Y'),
    dfFloat('Z'),
    dfFloat('W')
  ], aDefaultValue, aEvents);
end;

function wbVector4(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := wbVector4(aName, '', aEvents);
end;

function wbVector4(const aName: string): TdfDef;
begin
  Result := wbVector4(aName, []);
end;

function wbHalfVector3(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfMerge(aName, [
    dfFloat('X', dtFloat16),
    dfFloat('Y', dtFloat16),
    dfFloat('Z', dtFloat16)
  ], aDefaultValue, aEvents);
end;

function wbHalfVector3(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := wbHalfVector3(aName, '', aEvents);
end;

function wbHalfVector3(const aName: string): TdfDef;
begin
  Result := wbHalfVector3(aName, []);
end;

function wbByteVector3(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfMerge(aName, [
    wbByteFloat('X'),
    wbByteFloat('Y'),
    wbByteFloat('Z')
  ], aDefaultValue, aEvents);
end;

function wbByteVector3(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := wbByteVector3(aName, '', aEvents);
end;

function wbByteVector3(const aName: string): TdfDef; overload;
begin
  Result := wbByteVector3(aName, []);
end;

function wbColor3(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfMerge(aName, [
    wbHexFloat('R'),
    wbHexFloat('G'),
    wbHexFloat('B')
  ], aDefaultValue, aEvents);
  TdfMergeDef(Result).Delimiter := '';
  Result.OnGetText := @GetTextHexColor;
  Result.OnSetText := @SetTextHexColor;
end;

function wbColor3(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := wbColor3(aName, '#FFFFFF', aEvents);
end;

function wbColor3(const aName: string): TdfDef;
begin
  Result := wbColor3(aName, []);
end;

function wbColor4(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfMerge(aName, [
    wbHexFloat('R'),
    wbHexFloat('G'),
    wbHexFloat('B'),
    wbHexFloat('A')
  ], aDefaultValue, aEvents);
  TdfMergeDef(Result).Delimiter := '';
  Result.OnGetText := @GetTextHexColor;
  Result.OnSetText := @SetTextHexColor;
end;

function wbColor4(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := wbColor4(aName, '#FFFFFFFF', aEvents);
end;

function wbColor4(const aName: string): TdfDef;
begin
  Result := wbColor4(aName, []);
end;

function wbByteColor4(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfMerge(aName, [
    wbHexByte('R'),
    wbHexByte('G'),
    wbHexByte('B'),
    wbHexByte('A')
  ], aDefaultValue, aEvents);
  TdfMergeDef(Result).Delimiter := '';
  Result.OnGetText := @GetTextHexColor;
  Result.OnSetText := @SetTextHexColor;
end;

function wbByteColor4(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := wbByteColor4(aName, '#FFFFFFFF', aEvents);
end;

function wbByteColor4(const aName: string): TdfDef; overload;
begin
  Result := wbByteColor4(aName, []);
end;

procedure QuaternionGetText(const e: TdfElement; var aText: string);
var
  q: TQuaternion;
  a, x, y, z: Extended;
begin
  q.w := e.NativeValues['W'];
  q.x := e.NativeValues['X'];
  q.y := e.NativeValues['Y'];
  q.z := e.NativeValues['Z'];
  if wbRotationEuler then begin
    QuaternionToEuler(q, x, y, z);
    aText := dfFloatToStr(RadToDeg(x)) + ' ' +
             dfFloatToStr(RadToDeg(y)) + ' ' +
             dfFloatToStr(RadToDeg(z));
  end
  else begin
    QuaternionToAxisAngle(q, a, x, y, z);
    aText := dfFloatToStr(RadToDeg(a)) + ' ' +
             dfFloatToStr(x) + ' ' +
             dfFloatToStr(y) + ' ' +
             dfFloatToStr(z);
  end;
end;

procedure QuaternionSetText(const e: TdfElement; var aText: string);
var
  q: TQuaternion;
  a, x, y, z: Extended;
  s: TStringDynArray;
begin
  s := SplitString(aText, ' ');
  if wbRotationEuler then begin
    if Length(s) < 3 then Exit;
    x := DegToRad(dfStrToFloat(s[0]));
    y := DegToRad(dfStrToFloat(s[1]));
    z := DegToRad(dfStrToFloat(s[2]));
    EulerToQuaternion(x, y, z, q);
  end
  else begin
    if Length(s) < 4 then Exit;
    a := DegToRad(dfStrToFloat(s[0]));
    x := dfStrToFloat(s[1]);
    y := dfStrToFloat(s[2]);
    z := dfStrToFloat(s[3]);
    AxisAngleToQuaternion(a, x, y, z, q);
  end;
  e.NativeValues['W'] := q.w;
  e.NativeValues['X'] := q.x;
  e.NativeValues['Y'] := q.y;
  e.NativeValues['Z'] := q.z;
  aText := '';
end;

function wbQuaternion(const aName: string; const aEvents: array of const): TdfDef; overload;
begin
  //Result := dfStruct(aName, [
  Result := dfMerge(aName, [
    dfFloat('W', '1.0'),
    dfFloat('X'),
    dfFloat('Y'),
    dfFloat('Z')
  ], aEvents);
  Result.OnGetText := @QuaternionGetText;
  Result.OnSetText := @QuaternionSetText;
end;

function wbQuaternion(const aName: string): TdfDef; overload;
begin
  Result := wbQuaternion(aName, []);
end;

function wbQuaternionXYZW(const aName: string; const aEvents: array of const): TdfDef; overload;
begin
  //Result := dfStruct(aName, [
  Result := dfMerge(aName, [
    dfFloat('X'),
    dfFloat('Y'),
    dfFloat('Z'),
    dfFloat('W', '1.0')
  ], aEvents);
  Result.OnGetText := @QuaternionGetText;
  Result.OnSetText := @QuaternionSetText;
end;

function wbQuaternionXYZW(const aName: string): TdfDef; overload;
begin
  Result := wbQuaternionXYZW(aName, []);
end;

function wbMatrix22(const aName: string; const aEvents: array of const): TdfDef; overload;
begin
  Result := dfStruct(aName, [
    dfFloat('m11', '1.0'),
    dfFloat('m21'),
    dfFloat('m12'),
    dfFloat('m22', '1.0')
  ], aEvents);
end;

function wbMatrix22(const aName: string): TdfDef; overload;
begin
  Result := wbMatrix22(aName, []);
end;

function wbMatrix33(const aName: string; const aEvents: array of const): TdfDef; overload;
begin
  Result := dfStruct(aName, [
    dfFloat('m11', '1.0'),
    dfFloat('m21'),
    dfFloat('m31'),
    dfFloat('m12'),
    dfFloat('m22', '1.0'),
    dfFloat('m32'),
    dfFloat('m13'),
    dfFloat('m23'),
    dfFloat('m33', '1.0')
  ], aEvents);
end;

function wbMatrix33(const aName: string): TdfDef; overload;
begin
  Result := wbMatrix33(aName, []);
end;

function wbRotMatrix33(const aName: string; const aEvents: array of const): TdfDef;
  procedure GetText(const e: TdfElement; var aText: string);
  var
    m: TMatrix33;
    i, j: integer;
    a, x, y, z: Extended;
  begin
    for i := 0 to 2 do
      for j := 0 to 2 do
        m[j, i] := e.NativeValues['m' + IntToStr(i+1) + IntToStr(j+1)];

    if wbRotationEuler then begin
      M33ToEuler(m, x, y, z);
      aText := dfFloatToStr(RadToDeg(x)) + ' ' +
               dfFloatToStr(RadToDeg(y)) + ' ' +
               dfFloatToStr(RadToDeg(z));
    end
    else begin
      M33ToAxisAngle(m, a, x, y, z);
      aText := dfFloatToStr(RadToDeg(a)) + ' ' +
               dfFloatToStr(x) + ' ' +
               dfFloatToStr(y) + ' ' +
               dfFloatToStr(z);
    end;
  end;
  procedure SetText(const e: TdfElement; var aText: string);
  var
    m: TMatrix33;
    i, j: integer;
    a, x, y, z: Extended;
    s: TStringDynArray;
  begin
    s := SplitString(aText, ' ');
    if wbRotationEuler then begin
      if Length(s) < 3 then Exit;
      x := DegToRad(dfStrToFloat(s[0]));
      y := DegToRad(dfStrToFloat(s[1]));
      z := DegToRad(dfStrToFloat(s[2]));
      EulerToM33(x, y, z, m);
    end
    else begin
      if Length(s) < 4 then Exit;
      a := DegToRad(dfStrToFloat(s[0]));
      x := dfStrToFloat(s[1]);
      y := dfStrToFloat(s[2]);
      z := dfStrToFloat(s[3]);
      AxisAngleToM33(a, x, y, z, m);
    end;

    for i := 0 to 2 do
      for j := 0 to 2 do
        e.NativeValues['m' + IntToStr(i+1) + IntToStr(j+1)] := m[j, i];
    aText := '';
  end;
begin
  Result := dfMerge(aName, [
    dfFloat('m11', '1.0'),
    dfFloat('m21'),
    dfFloat('m31'),
    dfFloat('m12'),
    dfFloat('m22', '1.0'),
    dfFloat('m32'),
    dfFloat('m13'),
    dfFloat('m23'),
    dfFloat('m33', '1.0')
  ], aEvents);
  Result.OnGetText := @GetText;
  Result.OnSetText := @SetText;
end;

function wbRotMatrix33(const aName: string): TdfDef;
begin
  Result := wbRotMatrix33(aName, []);
end;

function wbMatrix44(const aName: string; const aEvents: array of const): TdfDef; overload;
begin
  Result := dfStruct(aName, [
    dfFloat('m11', '1.0'),
    dfFloat('m21'),
    dfFloat('m31'),
    dfFloat('m41'),
    dfFloat('m12'),
    dfFloat('m22', '1.0'),
    dfFloat('m32'),
    dfFloat('m42'),
    dfFloat('m13'),
    dfFloat('m23'),
    dfFloat('m33', '1.0'),
    dfFloat('m43'),
    dfFloat('m14'),
    dfFloat('m24'),
    dfFloat('m34'),
    dfFloat('m44', '1.0')
  ], aEvents);
end;

function wbMatrix44(const aName: string): TdfDef; overload;
begin
  Result := wbMatrix44(aName, []);
end;

function wbhkMatrix3(const aName: string; const aEvents: array of const): TdfDef; overload;
begin
  Result := dfStruct(aName, [
    dfFloat('m11'),
    dfFloat('m12'),
    dfFloat('m13'),
    dfFloat('Unused m14'),
    dfFloat('m21'),
    dfFloat('m22'),
    dfFloat('m23'),
    dfFloat('Unused m24'),
    dfFloat('m31'),
    dfFloat('m32'),
    dfFloat('m33'),
    dfFloat('Unused m34')
  ], aEvents);
end;

function wbhkMatrix3(const aName: string): TdfDef; overload;
begin
  Result := wbhkMatrix3(aName, []);
end;

function wbTBC(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfStruct(aName, [
    dfFloat('T'),
    dfFloat('B'),
    dfFloat('C')
  ], aEvents);
end;

function wbNiBound(const aName: string): TdfDef;
begin
  Result := dfStruct(aName, [
    wbVector3('Center'),
    dfFloat('Radius')
  ]);
end;

function wbQTransform(const aName: string): TdfDef;
begin
  Result := dfStruct(aName, [
    wbVector3('Translation'),
    wbQuaternion('Rotation'),
    dfFloat('Scale', '1.0')
  ]);
end;

function wbMTransform(const aName: string): TdfDef;
begin
  Result := dfStruct(aName, [
    wbVector3('Translation'),
    wbRotMatrix33('Rotation', []),
    dfFloat('Scale', '1.0')
  ]);
end;

function wbSkinTransform(const aName: string): TdfDef;
begin
  Result := dfStruct(aName, [
    wbMatrix33('Rotation'),
    wbVector3('Translation'),
    dfFloat('Scale', '1.0')
  ]);
end;

function wbTexCoord(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfMerge(aName, [
    dfFloat('U'),
    dfFloat('V')
  ], aDefaultValue, aEvents);
end;

function wbTexCoord(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := wbTexCoord(aName, '', aEvents);
end;

function wbTexCoord(const aName: string): TdfDef;
begin
  Result := wbTexCoord(aName, []);
end;

function wbHalfTexCoord(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfMerge(aName, [
    dfFloat('U', dtFloat16),
    dfFloat('V', dtFloat16)
  ], aDefaultValue, aEvents);
end;

function wbHalfTexCoord(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := wbHalfTexCoord(aName, '', aEvents);
end;

function wbHalfTexCoord(const aName: string): TdfDef;
begin
  Result := wbHalfTexCoord(aName, []);
end;

function wbTriangle(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfMerge(aName, [
    dfInteger('V1', dtU16),
    dfInteger('V2', dtU16),
    dfInteger('V3', dtU16)
  ], aDefaultValue, aEvents);
end;

function wbTriangle(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := wbTriangle(aName, '', aEvents);
end;

function wbTriangle(const aName: string): TdfDef;
begin
  Result := wbTriangle(aName, []);
end;

function wbAlphaFormat(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'ALPHA_NONE',
    1, 'ALPHA_BINARY',
    2, 'ALPHA_SMOOTH',
    3, 'ALPHA_DEFAULT'
  ], aDefaultValue, aEvents);
end;

function wbBSPartFlag(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU16, [
    0, 'PF_EDITOR_VISIBLE',
    8, 'PF_START_NET_BONESET'
  ], aDefaultValue, aEvents);
end;

function wbBSDismemberBodyPartType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU16, [
    0, 'BP_TORSO',
    1, 'BP_HEAD',
    2, 'BP_HEAD2',
    3, 'BP_LEFTARM',
    4, 'BP_LEFTARM2',
    5, 'BP_RIGHTARM',
    6, 'BP_RIGHTARM2',
    7, 'BP_LEFTLEG',
    8, 'BP_LEFTLEG2',
    9, 'BP_LEFTLEG3',
    10, 'BP_RIGHTLEG',
    11, 'BP_RIGHTLEG2',
    12, 'BP_RIGHTLEG3',
    13, 'BP_BRAIN',
    30, 'SBP_30_HEAD',
    31, 'SBP_31_HAIR',
    32, 'SBP_32_BODY',
    33, 'SBP_33_HANDS',
    34, 'SBP_34_FOREARMS',
    35, 'SBP_35_AMULET',
    36, 'SBP_36_RING',
    37, 'SBP_37_FEET',
    38, 'SBP_38_CALVES',
    39, 'SBP_39_SHIELD',
    40, 'SBP_40_TAIL',
    41, 'SBP_41_LONGHAIR',
    42, 'SBP_42_CIRCLET',
    43, 'SBP_43_EARS',
    44, 'SBP_44_DRAGON_BLOODHEAD_OR_MOD_MOUTH',
    45, 'SBP_45_DRAGON_BLOODWINGL_OR_MOD_NECK',
    46, 'SBP_46_DRAGON_BLOODWINGR_OR_MOD_CHEST_PRIMARY',
    47, 'SBP_47_DRAGON_BLOODTAIL_OR_MOD_BACK',
    48, 'SBP_48_MOD_MISC1',
    49, 'SBP_49_MOD_PELVIS_PRIMARY',
    50, 'SBP_50_DECAPITATEDHEAD',
    51, 'SBP_51_DECAPITATE',
    52, 'SBP_52_MOD_PELVIS_SECONDARY',
    53, 'SBP_53_MOD_LEG_RIGHT',
    54, 'SBP_54_MOD_LEG_LEFT',
    55, 'SBP_55_MOD_FACE_JEWELRY',
    56, 'SBP_56_MOD_CHEST_SECONDARY',
    57, 'SBP_57_MOD_SHOULDER',
    58, 'SBP_58_MOD_ARM_LEFT',
    59, 'SBP_59_MOD_ARM_RIGHT',
    60, 'SBP_60_MOD_MISC2',
    61, 'SBP_61_FX01',
    101, 'BP_SECTIONCAP_HEAD',
    102, 'BP_SECTIONCAP_HEAD2',
    103, 'BP_SECTIONCAP_LEFTARM',
    104, 'BP_SECTIONCAP_LEFTARM2',
    105, 'BP_SECTIONCAP_RIGHTARM',
    106, 'BP_SECTIONCAP_RIGHTARM2',
    107, 'BP_SECTIONCAP_LEFTLEG',
    108, 'BP_SECTIONCAP_LEFTLEG2',
    109, 'BP_SECTIONCAP_LEFTLEG3',
    110, 'BP_SECTIONCAP_RIGHTLEG',
    111, 'BP_SECTIONCAP_RIGHTLEG2',
    112, 'BP_SECTIONCAP_RIGHTLEG3',
    113, 'BP_SECTIONCAP_BRAIN',
    130, 'SBP_130_HEAD',
    131, 'SBP_131_HAIR',
    141, 'SBP_141_LONGHAIR',
    142, 'SBP_142_CIRCLET',
    143, 'SBP_143_EARS',
    150, 'SBP_150_DECAPITATEDHEAD',
    201, 'BP_TORSOCAP_HEAD',
    202, 'BP_TORSOCAP_HEAD2',
    203, 'BP_TORSOCAP_LEFTARM',
    204, 'BP_TORSOCAP_LEFTARM2',
    205, 'BP_TORSOCAP_RIGHTARM',
    206, 'BP_TORSOCAP_RIGHTARM2',
    207, 'BP_TORSOCAP_LEFTLEG',
    208, 'BP_TORSOCAP_LEFTLEG2',
    209, 'BP_TORSOCAP_LEFTLEG3',
    210, 'BP_TORSOCAP_RIGHTLEG',
    211, 'BP_TORSOCAP_RIGHTLEG2',
    212, 'BP_TORSOCAP_RIGHTLEG3',
    213, 'BP_TORSOCAP_BRAIN',
    230, 'SBP_230_HEAD',
    1000, 'BP_TORSOSECTION_HEAD',
    2000, 'BP_TORSOSECTION_HEAD2',
    3000, 'BP_TORSOSECTION_LEFTARM',
    4000, 'BP_TORSOSECTION_LEFTARM2',
    5000, 'BP_TORSOSECTION_RIGHTARM',
    6000, 'BP_TORSOSECTION_RIGHTARM2',
    7000, 'BP_TORSOSECTION_LEFTLEG',
    8000, 'BP_TORSOSECTION_LEFTLEG2',
    9000, 'BP_TORSOSECTION_LEFTLEG3',
    10000, 'BP_TORSOSECTION_RIGHTLEG',
    11000, 'BP_TORSOSECTION_RIGHTLEG2',
    12000, 'BP_TORSOSECTION_RIGHTLEG3',
    13000, 'BP_TORSOSECTION_BRAIN'
  ], aDefaultValue, aEvents);
end;

function wbBodyPartList(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfStruct(aName,[
    wbBSPartFlag('Part Flags', '257', []),
    wbBSDismemberBodyPartType('Body Part', '', [])
  ], aEvents);
end;

function wbBSGeometrySegmentData(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfStruct(aName,[
    dfInteger('Flags', dtU8),
    dfInteger('Index', dtU32),
    dfInteger('Num Tris in Segment', dtU32)
  ], aEvents);
end;

function wbBSShaderType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'SHADER_TALL_GRASS',
    1, 'SHADER_DEFAULT',
    10, 'SHADER_SKY',
    14, 'SHADER_SKIN',
    17, 'SHADER_WATER',
    29, 'SHADER_LIGHTING30',
    32, 'SHADER_TILE',
    33, 'SHADER_NOLIGHTING'
  ], aDefaultValue, aEvents);
end;

function wbBSShaderFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU32, [
    0, 'SF_Specular',
    1, 'SF_Skinned',
    2, 'SF_LowDetail',
    3, 'SF_Vertex_Alpha',
    4, 'SF_Unknown_1',
    5, 'SF_Single_Pass',
    6, 'SF_Empty',
    7, 'SF_Environment_Mapping',
    8, 'SF_Alpha_Texture',
    9, 'SF_Unknown_2',
    10, 'SF_FaceGen',
    11, 'SF_Parallax_Shader_Index_15',
    12, 'SF_Unknown_3',
    13, 'SF_Non_Projective_Shadows',
    14, 'SF_Unknown_4',
    15, 'SF_Refraction',
    16, 'SF_Fire_Refraction',
    17, 'SF_Eye_Environment_Mapping',
    18, 'SF_Hair',
    19, 'SF_Dynamic_Alpha',
    20, 'SF_Localmap_Hide_Secret',
    21, 'SF_Window_Environment_Mapping',
    22, 'SF_Tree_Billboard',
    23, 'SF_Shadow_Frustum',
    24, 'SF_Multiple_Textures',
    25, 'SF_Remappable_Textures',
    26, 'SF_Decal_Single_Pass',
    27, 'SF_Dynamic_Decal_Single_Pass',
    28, 'SF_Parallax_Occulsion',
    29, 'SF_External_Emittance',
    30, 'SF_Shadow_Map',
    31, 'SF_ZBuffer_Test'
  ], aDefaultValue, aEvents);
end;

function wbBSShaderFlags2(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU32, [
    0, 'SF2_ZBuffer_Write',
    1, 'SF2_LOD_Landscape',
    2, 'SF2_LOD_Building',
    3, 'SF2_No_Fade',
    4, 'SF2_Refraction_Tint',
    5, 'SF2_Vertex_Colors',
    6, 'SF2_Unknown1',
    7, 'SF2_1st_Light_is_Point_Light',
    8, 'SF2_2nd_Light',
    9, 'SF2_3rd_Light',
    10, 'SF2_Vertex_Lighting',
    11, 'SF2_Uniform_Scale',
    12, 'SF2_Fit_Slope',
    13, 'SF2_Billboard_and_Envmap_Light_Fade',
    14, 'SF2_No_LOD_Land_Blend',
    15, 'SF2_Envmap_Light_Fade',
    16, 'SF2_Wireframe',
    17, 'SF2_VATS_Selection',
    18, 'SF2_Show_in_Local_Map',
    19, 'SF2_Premult_Alpha',
    20, 'SF2_Skip_Normal_Maps',
    21, 'SF2_Alpha_Decal',
    22, 'SF2_No_Transparecny_Multisampling',
    23, 'SF2_Unknown2',
    24, 'SF2_Unknown3',
    25, 'SF2_Unknown4',
    26, 'SF2_Unknown5',
    27, 'SF2_Unknown6',
    28, 'SF2_Unknown7',
    29, 'SF2_Unknown8',
    30, 'SF2_Unknown9',
    31, 'SF2_Unknown10'
  ], aDefaultValue, aEvents);
end;

function wbBSLightingShaderPropertyShaderType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'Default',
    1, 'Environment Map',
    2, 'Glow Shader',
    3, 'Heightmap',
    4, 'Face Tint',
    5, 'Skin Tint',
    6, 'Hair Tint',
    7, 'Parallax Occ Material',
    8, 'World Multitexture',
    9, 'WorldMap1',
    10, 'Unknown 10',
    11, 'MultiLayer Parallax',
    12, 'Unknown 12',
    13, 'WorldMap2',
    14, 'Sparkle Snow',
    15, 'WorldMap3',
    16, 'Eye Envmap',
    17, 'Unknown 17',
    18, 'WorldMap4',
    19, 'World LOD Multitexture'
  ], aDefaultValue, aEvents);
end;

function wbEffectShaderControlledVariable(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'EmissiveMultiple',
    1, 'Falloff Start Angle',
    2, 'Falloff Stop Angle',
    3, 'Falloff Start Opacity',
    4, 'Falloff Stop Opacity',
    5, 'Alpha Transparency',
    6, 'U Offset',
    7, 'U Scale',
    8, 'V Offset',
    9, 'V Scale'
  ], aDefaultValue, aEvents);
end;

function wbEffectShaderControlledColor(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'Emissive Color'
  ], aDefaultValue, aEvents);
end;

function wbLightingShaderControlledVariable(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'Refraction Strength',
    8, 'Environment Map Scale',
    9, 'Glossiness',
    10, 'Specular Strength',
    11, 'Emissive Multiple',
    12, 'Alpha',
    20, 'U Offset',
    21, 'U Scale',
    22, 'V Offset',
    23, 'V Scale'
  ], aDefaultValue, aEvents);
end;

function wbLightingShaderControlledColor(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'Specular Color',
    1, 'Emissive Color'
  ], aDefaultValue, aEvents);
end;

function wbSkyrimWaterShaderFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU8, [
    0, 'SWSF1_UNKNOWN0',
    1, 'SWSF1_Bypass_Refraction_Map',
    2, 'SWSF1_Water_Toggle',
    3, 'SWSF1_UNKNOWN3',
    4, 'SWSF1_UNKNOWN4',
    5, 'SWSF1_UNKNOWN5',
    6, 'SWSF1_Highlight_Layer_Toggle',
    7, 'SWSF1_Enabled'
  ], aDefaultValue, aEvents);
end;

function wbSkyObjectType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'BSSM_SKY_TEXTURE',
    1, 'BSSM_SKY_SUNGLARE',
    2, 'BSSM_SKY',
    3, 'BSSM_SKY_CLOUDS',
    5, 'BSSM_SKY_STARS',
    7, 'BSSM_SKY_MOON_STARS_MASK'
  ], aDefaultValue, aEvents);
end;

function wbBroadPhaseType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'BROAD_PHASE_INVALID',
    1, 'BROAD_PHASE_ENTITY',
    2, 'BROAD_PHASE_PHANTOM',
    3, 'BROAD_PHASE_BORDER'
  ], aDefaultValue, aEvents);
end;

function wbhkResponseType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'RESPONSE_INVALID',
    1, 'RESPONSE_SIMPLE_CONTACT',
    2, 'RESPONSE_REPORTING',
    3, 'RESPONSE_NONE'
  ], aDefaultValue, aEvents);
end;

function wbhkConstraintType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'BallAndSocket',
    1, 'Hinge',
    2, 'Limited Hinge',
    6, 'Prismatic',
    7, 'Ragdoll',
    8, 'StiffSpring',
    13, 'Malleable'
  ], aDefaultValue, aEvents);
end;

function wbApplyMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'APPLY_REPLACE',
    1, 'APPLY_DECAL',
    2, 'APPLY_MODULATE',
    3, 'APPLY_HILIGHT',
    4, 'APPLY_HILIGHT2'
  ], aDefaultValue, aEvents);
end;

function wbTexType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'BASE_MAP',
    1, 'DARK_MAP',
    2, 'DETAIL_MAP',
    3, 'GLOSS_MAP',
    4, 'GLOW_MAP',
    5, 'BUMP_MAP',
    6, 'NORMAL_MAP',
    7, 'UNKNOWN2_MAP',
    8, 'DECAL_0_MAP',
    9, 'DECAL_1_MAP',
    10, 'DECAL_2_MAP',
    11, 'DECAL_3_MAP'
  ], aDefaultValue, aEvents);
end;

function wbKeyType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    1, 'LINEAR_KEY',
    2, 'QUADRATIC_KEY',
    3, 'TBC_KEY',
    4, 'XYZ_ROTATION_KEY',
    5, 'CONST_KEY'
  ], aDefaultValue, aEvents);
end;

function wbLightMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'LIGHT_MODE_EMISSIVE',
    1, 'LIGHT_MODE_EMI_AMB_DIF'
  ], aDefaultValue, aEvents);
end;

function wbOblivionHavokMaterial(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'OB_HAV_MAT_STONE',
    1, 'OB_HAV_MAT_CLOTH',
    2, 'OB_HAV_MAT_DIRT',
    3, 'OB_HAV_MAT_GLASS',
    4, 'OB_HAV_MAT_GRASS',
    5, 'OB_HAV_MAT_METAL',
    6, 'OB_HAV_MAT_ORGANIC',
    7, 'OB_HAV_MAT_SKIN',
    8, 'OB_HAV_MAT_WATER',
    9, 'OB_HAV_MAT_WOOD',
    10, 'OB_HAV_MAT_HEAVY_STONE',
    11, 'OB_HAV_MAT_HEAVY_METAL',
    12, 'OB_HAV_MAT_HEAVY_WOOD',
    13, 'OB_HAV_MAT_CHAIN',
    14, 'OB_HAV_MAT_SNOW',
    15, 'OB_HAV_MAT_STONE_STAIRS',
    16, 'OB_HAV_MAT_CLOTH_STAIRS',
    17, 'OB_HAV_MAT_DIRT_STAIRS',
    18, 'OB_HAV_MAT_GLASS_STAIRS',
    19, 'OB_HAV_MAT_GRASS_STAIRS',
    20, 'OB_HAV_MAT_METAL_STAIRS',
    21, 'OB_HAV_MAT_ORGANIC_STAIRS',
    22, 'OB_HAV_MAT_SKIN_STAIRS',
    23, 'OB_HAV_MAT_WATER_STAIRS',
    24, 'OB_HAV_MAT_WOOD_STAIRS',
    25, 'OB_HAV_MAT_HEAVY_STONE_STAIRS',
    26, 'OB_HAV_MAT_HEAVY_METAL_STAIRS',
    27, 'OB_HAV_MAT_HEAVY_WOOD_STAIRS',
    28, 'OB_HAV_MAT_CHAIN_STAIRS',
    29, 'OB_HAV_MAT_SNOW_STAIRS',
    30, 'OB_HAV_MAT_ELEVATOR',
    31, 'OB_HAV_MAT_RUBBER'
  ], aDefaultValue, aEvents);
end;

function wbFallout3HavokMaterial(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'FO_HAV_MAT_STONE',
    1, 'FO_HAV_MAT_CLOTH',
    2, 'FO_HAV_MAT_DIRT',
    3, 'FO_HAV_MAT_GLASS',
    4, 'FO_HAV_MAT_GRASS',
    5, 'FO_HAV_MAT_METAL',
    6, 'FO_HAV_MAT_ORGANIC',
    7, 'FO_HAV_MAT_SKIN',
    8, 'FO_HAV_MAT_WATER',
    9, 'FO_HAV_MAT_WOOD',
    10, 'FO_HAV_MAT_HEAVY_STONE',
    11, 'FO_HAV_MAT_HEAVY_METAL',
    12, 'FO_HAV_MAT_HEAVY_WOOD',
    13, 'FO_HAV_MAT_CHAIN',
    14, 'FO_HAV_MAT_BOTTLECAP',
    15, 'FO_HAV_MAT_ELEVATOR',
    16, 'FO_HAV_MAT_HOLLOW_METAL',
    17, 'FO_HAV_MAT_SHEET_METAL',
    18, 'FO_HAV_MAT_SAND',
    19, 'FO_HAV_MAT_BROKEN_CONCRETE',
    20, 'FO_HAV_MAT_VEHICLE_BODY',
    21, 'FO_HAV_MAT_VEHICLE_PART_SOLID',
    22, 'FO_HAV_MAT_VEHICLE_PART_HOLLOW',
    23, 'FO_HAV_MAT_BARREL',
    24, 'FO_HAV_MAT_BOTTLE',
    25, 'FO_HAV_MAT_SODA_CAN',
    26, 'FO_HAV_MAT_PISTOL',
    27, 'FO_HAV_MAT_RIFLE',
    28, 'FO_HAV_MAT_SHOPPING_CART',
    29, 'FO_HAV_MAT_LUNCHBOX',
    30, 'FO_HAV_MAT_BABY_RATTLE',
    31, 'FO_HAV_MAT_RUBBER_BALL',
    32, 'FO_HAV_MAT_STONE_PLATFORM',
    33, 'FO_HAV_MAT_CLOTH_PLATFORM',
    34, 'FO_HAV_MAT_DIRT_PLATFORM',
    35, 'FO_HAV_MAT_GLASS_PLATFORM',
    36, 'FO_HAV_MAT_GRASS_PLATFORM',
    37, 'FO_HAV_MAT_METAL_PLATFORM',
    38, 'FO_HAV_MAT_ORGANIC_PLATFORM',
    39, 'FO_HAV_MAT_SKIN_PLATFORM',
    40, 'FO_HAV_MAT_WATER_PLATFORM',
    41, 'FO_HAV_MAT_WOOD_PLATFORM',
    42, 'FO_HAV_MAT_HEAVY_STONE_PLATFORM',
    43, 'FO_HAV_MAT_HEAVY_METAL_PLATFORM',
    44, 'FO_HAV_MAT_HEAVY_WOOD_PLATFORM',
    45, 'FO_HAV_MAT_CHAIN_PLATFORM',
    46, 'FO_HAV_MAT_BOTTLECAP_PLATFORM',
    47, 'FO_HAV_MAT_ELEVATOR_PLATFORM',
    48, 'FO_HAV_MAT_HOLLOW_METAL_PLATFORM',
    49, 'FO_HAV_MAT_SHEET_METAL_PLATFORM',
    50, 'FO_HAV_MAT_SAND_PLATFORM',
    51, 'FO_HAV_MAT_BROKEN_CONCRETE_PLATFORM',
    52, 'FO_HAV_MAT_VEHICLE_BODY_PLATFORM',
    53, 'FO_HAV_MAT_VEHICLE_PART_SOLID_PLATFORM',
    54, 'FO_HAV_MAT_VEHICLE_PART_HOLLOW_PLATFORM',
    55, 'FO_HAV_MAT_BARREL_PLATFORM',
    56, 'FO_HAV_MAT_BOTTLE_PLATFORM',
    57, 'FO_HAV_MAT_SODA_CAN_PLATFORM',
    58, 'FO_HAV_MAT_PISTOL_PLATFORM',
    59, 'FO_HAV_MAT_RIFLE_PLATFORM',
    60, 'FO_HAV_MAT_SHOPPING_CART_PLATFORM',
    61, 'FO_HAV_MAT_LUNCHBOX_PLATFORM',
    62, 'FO_HAV_MAT_BABY_RATTLE_PLATFORM',
    63, 'FO_HAV_MAT_RUBBER_BALL_PLATFORM',
    64, 'FO_HAV_MAT_STONE_STAIRS',
    65, 'FO_HAV_MAT_CLOTH_STAIRS',
    66, 'FO_HAV_MAT_DIRT_STAIRS',
    67, 'FO_HAV_MAT_GLASS_STAIRS',
    68, 'FO_HAV_MAT_GRASS_STAIRS',
    69, 'FO_HAV_MAT_METAL_STAIRS',
    70, 'FO_HAV_MAT_ORGANIC_STAIRS',
    71, 'FO_HAV_MAT_SKIN_STAIRS',
    72, 'FO_HAV_MAT_WATER_STAIRS',
    73, 'FO_HAV_MAT_WOOD_STAIRS',
    74, 'FO_HAV_MAT_HEAVY_STONE_STAIRS',
    75, 'FO_HAV_MAT_HEAVY_METAL_STAIRS',
    76, 'FO_HAV_MAT_HEAVY_WOOD_STAIRS',
    77, 'FO_HAV_MAT_CHAIN_STAIRS',
    78, 'FO_HAV_MAT_BOTTLECAP_STAIRS',
    79, 'FO_HAV_MAT_ELEVATOR_STAIRS',
    80, 'FO_HAV_MAT_HOLLOW_METAL_STAIRS',
    81, 'FO_HAV_MAT_SHEET_METAL_STAIRS',
    82, 'FO_HAV_MAT_SAND_STAIRS',
    83, 'FO_HAV_MAT_BROKEN_CONCRETE_STAIRS',
    84, 'FO_HAV_MAT_VEHICLE_BODY_STAIRS',
    85, 'FO_HAV_MAT_VEHICLE_PART_SOLID_STAIRS',
    86, 'FO_HAV_MAT_VEHICLE_PART_HOLLOW_STAIRS',
    87, 'FO_HAV_MAT_BARREL_STAIRS',
    88, 'FO_HAV_MAT_BOTTLE_STAIRS',
    89, 'FO_HAV_MAT_SODA_CAN_STAIRS',
    90, 'FO_HAV_MAT_PISTOL_STAIRS',
    91, 'FO_HAV_MAT_RIFLE_STAIRS',
    92, 'FO_HAV_MAT_SHOPPING_CART_STAIRS',
    93, 'FO_HAV_MAT_LUNCHBOX_STAIRS',
    94, 'FO_HAV_MAT_BABY_RATTLE_STAIRS',
    95, 'FO_HAV_MAT_RUBBER_BALL_STAIRS',
    96, 'FO_HAV_MAT_STONE_STAIRS_PLATFORM',
    97, 'FO_HAV_MAT_CLOTH_STAIRS_PLATFORM',
    98, 'FO_HAV_MAT_DIRT_STAIRS_PLATFORM',
    99, 'FO_HAV_MAT_GLASS_STAIRS_PLATFORM',
    100, 'FO_HAV_MAT_GRASS_STAIRS_PLATFORM',
    101, 'FO_HAV_MAT_METAL_STAIRS_PLATFORM',
    102, 'FO_HAV_MAT_ORGANIC_STAIRS_PLATFORM',
    103, 'FO_HAV_MAT_SKIN_STAIRS_PLATFORM',
    104, 'FO_HAV_MAT_WATER_STAIRS_PLATFORM',
    105, 'FO_HAV_MAT_WOOD_STAIRS_PLATFORM',
    106, 'FO_HAV_MAT_HEAVY_STONE_STAIRS_PLATFORM',
    107, 'FO_HAV_MAT_HEAVY_METAL_STAIRS_PLATFORM',
    108, 'FO_HAV_MAT_HEAVY_WOOD_STAIRS_PLATFORM',
    109, 'FO_HAV_MAT_CHAIN_STAIRS_PLATFORM',
    110, 'FO_HAV_MAT_BOTTLECAP_STAIRS_PLATFORM',
    111, 'FO_HAV_MAT_ELEVATOR_STAIRS_PLATFORM',
    112, 'FO_HAV_MAT_HOLLOW_METAL_STAIRS_PLATFORM',
    113, 'FO_HAV_MAT_SHEET_METAL_STAIRS_PLATFORM',
    114, 'FO_HAV_MAT_SAND_STAIRS_PLATFORM',
    115, 'FO_HAV_MAT_BROKEN_CONCRETE_STAIRS_PLATFORM',
    116, 'FO_HAV_MAT_VEHICLE_BODY_STAIRS_PLATFORM',
    117, 'FO_HAV_MAT_VEHICLE_PART_SOLID_STAIRS_PLATFORM',
    118, 'FO_HAV_MAT_VEHICLE_PART_HOLLOW_STAIRS_PLATFORM',
    119, 'FO_HAV_MAT_BARREL_STAIRS_PLATFORM',
    120, 'FO_HAV_MAT_BOTTLE_STAIRS_PLATFORM',
    121, 'FO_HAV_MAT_SODA_CAN_STAIRS_PLATFORM',
    122, 'FO_HAV_MAT_PISTOL_STAIRS_PLATFORM',
    123, 'FO_HAV_MAT_RIFLE_STAIRS_PLATFORM',
    124, 'FO_HAV_MAT_SHOPPING_CART_STAIRS_PLATFORM',
    125, 'FO_HAV_MAT_LUNCHBOX_STAIRS_PLATFORM',
    126, 'FO_HAV_MAT_BABY_RATTLE_STAIRS_PLATFORM',
    127, 'FO_HAV_MAT_RUBBER_BALL_STAIRS_PLATFORM'
  ], aDefaultValue, aEvents);
end;

function wbSkyrimHavokMaterial(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    Int64(131151687), 'SKY_HAV_MAT_BROKEN_STONE',
    Int64(365420259), 'SKY_HAV_MAT_LIGHT_WOOD',
    Int64(398949039), 'SKY_HAV_MAT_SNOW',
    Int64(428587608), 'SKY_HAV_MAT_GRAVEL',
    Int64(438912228), 'SKY_HAV_MAT_MATERIAL_CHAIN_METAL',
    Int64(493553910), 'SKY_HAV_MAT_BOTTLE',
    Int64(500811281), 'SKY_HAV_MAT_WOOD',
    Int64(591247106), 'SKY_HAV_MAT_SKIN',
    Int64(617099282), 'SKY_HAV_MAT_UNKNOWN_617099282',
    Int64(732141076), 'SKY_HAV_MAT_BARREL',
    Int64(781661019), 'SKY_HAV_MAT_MATERIAL_CERAMIC_MEDIUM',
    Int64(790784366), 'SKY_HAV_MAT_MATERIAL_BASKET',
    Int64(873356572), 'SKY_HAV_MAT_ICE',
    Int64(899511101), 'SKY_HAV_MAT_STAIRS_STONE',
    Int64(1024582599), 'SKY_HAV_MAT_WATER',
    Int64(1028101969), 'SKY_HAV_MAT_UNKNOWN_1028101969',
    Int64(1060167844), 'SKY_HAV_MAT_MATERIAL_BLADE_1HAND',
    Int64(1264672850), 'SKY_HAV_MAT_MATERIAL_BOOK',
    Int64(1286705471), 'SKY_HAV_MAT_MATERIAL_CARPET',
    Int64(1288358971), 'SKY_HAV_MAT_SOLID_METAL',
    Int64(1305674443), 'SKY_HAV_MAT_MATERIAL_AXE_1HAND',
    Int64(1440721808), 'SKY_HAV_MAT_UNKNOWN_1440721808',
    Int64(1461712277), 'SKY_HAV_MAT_STAIRS_WOOD',
    Int64(1486385281), 'SKY_HAV_MAT_MUD',
    Int64(1550912982), 'SKY_HAV_MAT_MATERIAL_BOULDER_SMALL',
    Int64(1560365355), 'SKY_HAV_MAT_STAIRS_SNOW',
    Int64(1570821952), 'SKY_HAV_MAT_HEAVY_STONE',
    Int64(1574477864), 'SKY_HAV_MAT_UNKNOWN_1574477864',
    Int64(1591009235), 'SKY_HAV_MAT_UNKNOWN_1591009235',
    Int64(1607128641), 'SKY_HAV_MAT_MATERIAL_BOWS_STAVES',
    Int64(1803571212), 'SKY_HAV_MAT_MATERIAL_WOOD_AS_STAIRS',
    Int64(1848600814), 'SKY_HAV_MAT_GRASS',
    Int64(1885326971), 'SKY_HAV_MAT_MATERIAL_BOULDER_LARGE',
    Int64(1886078335), 'SKY_HAV_MAT_MATERIAL_STONE_AS_STAIRS',
    Int64(2022742644), 'SKY_HAV_MAT_MATERIAL_BLADE_2HAND',
    Int64(2025794648), 'SKY_HAV_MAT_MATERIAL_BOTTLE_SMALL',
    Int64(2168343821), 'SKY_HAV_MAT_SAND',
    Int64(2229413539), 'SKY_HAV_MAT_HEAVY_METAL',
    Int64(2290050264), 'SKY_HAV_MAT_UNKNOWN_2290050264',
    Int64(2518321175), 'SKY_HAV_MAT_DRAGON',
    Int64(2617944780), 'SKY_HAV_MAT_MATERIAL_BLADE_1HAND_SMALL',
    Int64(2632367422), 'SKY_HAV_MAT_MATERIAL_SKIN_SMALL',
    Int64(2892392795), 'SKY_HAV_MAT_STAIRS_BROKEN_STONE',
    Int64(2965929619), 'SKY_HAV_MAT_MATERIAL_SKIN_LARGE',
    Int64(2974920155), 'SKY_HAV_MAT_ORGANIC',
    Int64(3049421844), 'SKY_HAV_MAT_MATERIAL_BONE',
    Int64(3070783559), 'SKY_HAV_MAT_HEAVY_WOOD',
    Int64(3074114406), 'SKY_HAV_MAT_MATERIAL_CHAIN',
    Int64(3106094762), 'SKY_HAV_MAT_DIRT',
    Int64(3424720541), 'SKY_HAV_MAT_MATERIAL_ARMOR_LIGHT',
    Int64(3448167928), 'SKY_HAV_MAT_MATERIAL_SHIELD_LIGHT',
    Int64(3589100606), 'SKY_HAV_MAT_MATERIAL_COIN',
    Int64(3702389584), 'SKY_HAV_MAT_MATERIAL_SHIELD_HEAVY',
    Int64(3708432437), 'SKY_HAV_MAT_MATERIAL_ARMOR_HEAVY',
    Int64(3725505938), 'SKY_HAV_MAT_MATERIAL_ARROW',
    Int64(3739830338), 'SKY_HAV_MAT_GLASS',
    Int64(3741512247), 'SKY_HAV_MAT_STONE',
    Int64(3839073443), 'SKY_HAV_MAT_CLOTH',
    Int64(3969592277), 'SKY_HAV_MAT_MATERIAL_BLUNT_2HAND',
    Int64(4239621792), 'SKY_HAV_MAT_UNKNOWN_4239621792',
    Int64(4283869410), 'SKY_HAV_MAT_MATERIAL_BOULDER_MEDIUM'
  ], aDefaultValue, aEvents);
end;

function wbOblivionLayer(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'OL_UNIDENTIFIED',
    1, 'OL_STATIC',
    2, 'OL_ANIM_STATIC',
    3, 'OL_TRANSPARENT',
    4, 'OL_CLUTTER',
    5, 'OL_WEAPON',
    6, 'OL_PROJECTILE',
    7, 'OL_SPELL',
    8, 'OL_BIPED',
    9, 'OL_TREES',
    10, 'OL_PROPS',
    11, 'OL_WATER',
    12, 'OL_TRIGGER',
    13, 'OL_TERRAIN',
    14, 'OL_TRAP',
    15, 'OL_NONCOLLIDABLE',
    16, 'OL_CLOUD_TRAP',
    17, 'OL_GROUND',
    18, 'OL_PORTAL',
    19, 'OL_STAIRS',
    20, 'OL_CHAR_CONTROLLER',
    21, 'OL_AVOID_BOX',
    22, 'OL_UNKNOWN1',
    23, 'OL_UNKNOWN2',
    24, 'OL_CAMERA_PICK',
    25, 'OL_ITEM_PICK',
    26, 'OL_LINE_OF_SIGHT',
    27, 'OL_PATH_PICK',
    28, 'OL_CUSTOM_PICK_1',
    29, 'OL_CUSTOM_PICK_2',
    30, 'OL_SPELL_EXPLOSION',
    31, 'OL_DROPPING_PICK',
    32, 'OL_OTHER',
    33, 'OL_HEAD',
    34, 'OL_BODY',
    35, 'OL_SPINE1',
    36, 'OL_SPINE2',
    37, 'OL_L_UPPER_ARM',
    38, 'OL_L_FOREARM',
    39, 'OL_L_HAND',
    40, 'OL_L_THIGH',
    41, 'OL_L_CALF',
    42, 'OL_L_FOOT',
    43, 'OL_R_UPPER_ARM',
    44, 'OL_R_FOREARM',
    45, 'OL_R_HAND',
    46, 'OL_R_THIGH',
    47, 'OL_R_CALF',
    48, 'OL_R_FOOT',
    49, 'OL_TAIL',
    50, 'OL_SIDE_WEAPON',
    51, 'OL_SHIELD',
    52, 'OL_QUIVER',
    53, 'OL_BACK_WEAPON',
    54, 'OL_BACK_WEAPON2',
    55, 'OL_PONYTAIL',
    56, 'OL_WING',
    57, 'OL_NULL'
  ], aDefaultValue, aEvents);
end;

function wbFallout3Layer(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'FOL_UNIDENTIFIED',
    1, 'FOL_STATIC',
    2, 'FOL_ANIM_STATIC',
    3, 'FOL_TRANSPARENT',
    4, 'FOL_CLUTTER',
    5, 'FOL_WEAPON',
    6, 'FOL_PROJECTILE',
    7, 'FOL_SPELL',
    8, 'FOL_BIPED',
    9, 'FOL_TREES',
    10, 'FOL_PROPS',
    11, 'FOL_WATER',
    12, 'FOL_TRIGGER',
    13, 'FOL_TERRAIN',
    14, 'FOL_TRAP',
    15, 'FOL_NONCOLLIDABLE',
    16, 'FOL_CLOUD_TRAP',
    17, 'FOL_GROUND',
    18, 'FOL_PORTAL',
    19, 'FOL_DEBRIS_SMALL',
    20, 'FOL_DEBRIS_LARGE',
    21, 'FOL_ACOUSTIC_SPACE',
    22, 'FOL_ACTORZONE',
    23, 'FOL_PROJECTILEZONE',
    24, 'FOL_GASTRAP',
    25, 'FOL_SHELLCASING',
    26, 'FOL_TRANSPARENT_SMALL',
    27, 'FOL_INVISIBLE_WALL',
    28, 'FOL_TRANSPARENT_SMALL_ANIM',
    29, 'FOL_DEADBIP',
    30, 'FOL_CHARCONTROLLER',
    31, 'FOL_AVOIDBOX',
    32, 'FOL_COLLISIONBOX',
    33, 'FOL_CAMERASPHERE',
    34, 'FOL_DOORDETECTION',
    35, 'FOL_CAMERAPICK',
    36, 'FOL_ITEMPICK',
    37, 'FOL_LINEOFSIGHT',
    38, 'FOL_PATHPICK',
    39, 'FOL_CUSTOMPICK1',
    40, 'FOL_CUSTOMPICK2',
    41, 'FOL_SPELLEXPLOSION',
    42, 'FOL_DROPPINGPICK',
    43, 'FOL_NULL'
  ], aDefaultValue, aEvents);
end;

function wbSkyrimLayer(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'SKYL_UNIDENTIFIED',
    1, 'SKYL_STATIC',
    2, 'SKYL_ANIMSTATIC',
    3, 'SKYL_TRANSPARENT',
    4, 'SKYL_CLUTTER',
    5, 'SKYL_WEAPON',
    6, 'SKYL_PROJECTILE',
    7, 'SKYL_SPELL',
    8, 'SKYL_BIPED',
    9, 'SKYL_TREES',
    10, 'SKYL_PROPS',
    11, 'SKYL_WATER',
    12, 'SKYL_TRIGGER',
    13, 'SKYL_TERRAIN',
    14, 'SKYL_TRAP',
    15, 'SKYL_NONCOLLIDABLE',
    16, 'SKYL_CLOUD_TRAP',
    17, 'SKYL_GROUND',
    18, 'SKYL_PORTAL',
    19, 'SKYL_DEBRIS_SMALL',
    20, 'SKYL_DEBRIS_LARGE',
    21, 'SKYL_ACOUSTIC_SPACE',
    22, 'SKYL_ACTORZONE',
    23, 'SKYL_PROJECTILEZONE',
    24, 'SKYL_GASTRAP',
    25, 'SKYL_SHELLCASING',
    26, 'SKYL_TRANSPARENT_SMALL',
    27, 'SKYL_INVISIBLE_WALL',
    28, 'SKYL_TRANSPARENT_SMALL_ANIM',
    29, 'SKYL_WARD',
    30, 'SKYL_CHARCONTROLLER',
    31, 'SKYL_STAIRHELPER',
    32, 'SKYL_DEADBIP',
    33, 'SKYL_BIPED_NO_CC',
    34, 'SKYL_AVOIDBOX',
    35, 'SKYL_COLLISIONBOX',
    36, 'SKYL_CAMERASHPERE',
    37, 'SKYL_DOORDETECTION',
    38, 'SKYL_CONEPROJECTILE',
    39, 'SKYL_CAMERAPICK',
    40, 'SKYL_ITEMPICK',
    41, 'SKYL_LINEOFSIGHT',
    42, 'SKYL_PATHPICK',
    43, 'SKYL_CUSTOMPICK1',
    44, 'SKYL_CUSTOMPICK2',
    45, 'SKYL_SPELLEXPLOSION',
    46, 'SKYL_DROPPINGPICK',
    47, 'SKYL_NULL'
  ], aDefaultValue, aEvents);
end;

function wbhkWorldObjCinfoProperty(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfStruct(aName, [
    dfInteger('Data', dtU32),
    dfInteger('Size', dtU32),
    dfInteger('Capacity and Flags', dtU32, '2147483648')
  ], aEvents);
end;

function wbbhkCOFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU16, [
    0, 'BHKCO_ACTIVE',
    2, 'BHKCO_NOTIFY',
    3, 'BHKCO_SET_LOCAL',
    4, 'BHKCO_DBG_DISPLAY',
    5, 'BHKCO_USE_VEL',
    6, 'BHKCO_RESET',
    7, 'BHKCO_SYNC_ON_UPDATE',
    10, 'BHKCO_ANIM_TARGETED',
    11, 'BHKCO_DISMEMBERED_LIMB'
  ], aDefaultValue, aEvents);
end;

function wbbhkCMSDMaterial(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfStruct(aName, [
    wbSkyrimHavokMaterial('Material', '', []),
    wbSkyrimLayer('Layer', '', []),
    dfBytes('Unused', 3)
  ], aEvents);
end;

function wbbhkCMSDTransform(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfStruct(aName, [
    wbVector4('Translation'),
    wbQuaternionXYZW('Rotation')
  ], aEvents);
end;

function wbbhkCMSDBigTris(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfStruct(aName, [
    dfInteger('Triangle 1', dtU16),
    dfInteger('Triangle 2', dtU16),
    dfInteger('Triangle 3', dtU16),
    dfInteger('Material', dtU32),
    dfInteger('Welding Info', dtU16)
  ], aEvents);
end;

function wbbhkCMSDChunk(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfStruct(aName, [
    wbVector4('Translation'),
    dfInteger('Material Index', dtU32),
    dfInteger('Reference', dtU16),
    dfInteger('Transform Index', dtU16),
    dfArray('Vertices', dfInteger('Vertices', dtU16), -4),
    dfArray('Indices', dfInteger('Indices', dtU16), -4),
    dfArray('Strips', dfInteger('Strips', dtU16), -4),
    dfArray('Indices 2', dfInteger('Indices 2', dtU16), -4)
  ], aEvents);
end;

function wbMoppDataBuildType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'BUILT_WITH_CHUNK_SUBDIVISION',
    1, 'BUILT_WITHOUT_CHUNK_SUBDIVISION',
    2, 'BUILD_NOT_SET'
  ], aDefaultValue, aEvents);
end;

function wbMipMapFormat(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'MIP_FMT_NO',
    1, 'MIP_FMT_YES',
    2, 'MIP_FMT_DEFAULT'
  ], aDefaultValue, aEvents);
end;

function wbPixelFormat(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'PX_FMT_RGB8',
    1, 'PX_FMT_RGBA8',
    2, 'PX_FMT_PAL8',
    4, 'PX_FMT_DXT1',
    5, 'PX_FMT_DXT5',
    6, 'PX_FMT_DXT5_ALT'
  ], aDefaultValue, aEvents);
end;

function wbPixelLayout(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'PIX_LAY_PALETTISED',
    1, 'PIX_LAY_HIGH_COLOR_16',
    2, 'PIX_LAY_TRUE_COLOR_32',
    3, 'PIX_LAY_COMPRESSED',
    4, 'PIX_LAY_BUMPMAP',
    5, 'PIX_LAY_PALETTISED_4',
    6, 'PIX_LAY_DEFAULT'
  ], aDefaultValue, aEvents);
end;

function wbTexClampMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'CLAMP_S_CLAMP_T',
    1, 'CLAMP_S_WRAP_T',
    2, 'WRAP_S_CLAMP_T',
    3, 'WRAP_S_WRAP_T'
  ], aDefaultValue, aEvents);
end;

function wbTexFilterMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'FILTER_NEAREST',
    1, 'FILTER_BILERP',
    2, 'FILTER_TRILERP',
    3, 'FILTER_NEAREST_MIPNEAREST',
    4, 'FILTER_NEAREST_MIPLERP',
    5, 'FILTER_BILERP_MIPNEAREST'
  ], aDefaultValue, aEvents);
end;

function wbVertMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'VERT_MODE_SRC_IGNORE',
    1, 'VERT_MODE_SRC_EMISSIVE',
    2, 'VERT_MODE_SRC_AMB_DIF'
  ], aDefaultValue, aEvents);
end;

function wbCycleType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'CYCLE_LOOP',
    1, 'CYCLE_REVERSE',
    2, 'CYCLE_CLAMP'
  ], aDefaultValue, aEvents);
end;

function wbBillboardMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU16, [
    0, 'ALWAYS_FACE_CAMERA',
    1, 'ROTATE_ABOUT_UP',
    2, 'RIGID_FACE_CAMERA',
    3, 'ALWAYS_FACE_CENTER',
    4, 'RIGID_FACE_CENTER',
    5, 'BSROTATE_ABOUT_UP',
    9, 'ROTATE_ABOUT_UP2'
  ], aDefaultValue, aEvents);
end;

function wbFieldType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'FIELD_WIND',
    1, 'FIELD_POINT'
  ], aDefaultValue, aEvents);
end;

function wbZCompareMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'ZCOMP_ALWAYS',
    1, 'ZCOMP_LESS',
    2, 'ZCOMP_EQUAL',
    3, 'ZCOMP_LESS_EQUAL',
    4, 'ZCOMP_GREATER',
    5, 'ZCOMP_NOT_EQUAL',
    6, 'ZCOMP_GREATER_EQUAL',
    7, 'ZCOMP_NEVER'
  ], aDefaultValue, aEvents);
end;

function wbStencilCompareMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'TEST_NEVER',
    1, 'TEST_LESS',
    2, 'TEST_EQUAL',
    3, 'TEST_LESS_EQUAL',
    4, 'TEST_GREATER',
    5, 'TEST_NOT_EQUAL',
    6, 'TEST_GREATER_EQUAL',
    7, 'TEST_ALWAYS'
  ], aDefaultValue, aEvents);
end;

function wbStencilAction(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'ACTION_KEEP',
    1, 'ACTION_ZERO',
    2, 'ACTION_REPLACE',
    3, 'ACTION_INCREMENT',
    4, 'ACTION_DECREMENT',
    5, 'ACTION_INVERT'
  ], aDefaultValue, aEvents);
end;

function wbFaceDrawMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'DRAW_CCW_OR_BOTH',
    1, 'DRAW_CCW',
    2, 'DRAW_CW',
    3, 'DRAW_BOTH'
  ], aDefaultValue, aEvents);
end;

function wbMotionSystem(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'MO_SYS_INVALID',
    1, 'MO_SYS_DYNAMIC',
    2, 'MO_SYS_SPHERE',
    3, 'MO_SYS_SPHERE_INERTIA',
    4, 'MO_SYS_BOX',
    5, 'MO_SYS_BOX_STABILIZED',
    6, 'MO_SYS_KEYFRAMED',
    7, 'MO_SYS_FIXED',
    8, 'MO_SYS_THIN_BOX',
    9, 'MO_SYS_CHARACTER'
  ], aDefaultValue, aEvents);
end;

function wbDeactivatorType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'DEACTIVATOR_INVALID',
    1, 'DEACTIVATOR_NEVER',
    2, 'DEACTIVATOR_SPATIAL'
  ], aDefaultValue, aEvents);
end;

function wbSolverDeactivation(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'SOLVER_DEACTIVATION_INVALID',
    1, 'SOLVER_DEACTIVATION_OFF',
    2, 'SOLVER_DEACTIVATION_LOW',
    3, 'SOLVER_DEACTIVATION_MEDIUM',
    4, 'SOLVER_DEACTIVATION_HIGH',
    5, 'SOLVER_DEACTIVATION_MAX'
  ], aDefaultValue, aEvents);
end;

function wbMotionQuality(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'MO_QUAL_INVALID',
    1, 'MO_QUAL_FIXED',
    2, 'MO_QUAL_KEYFRAMED',
    3, 'MO_QUAL_DEBRIS',
    4, 'MO_QUAL_MOVING',
    5, 'MO_QUAL_CRITICAL',
    6, 'MO_QUAL_BULLET',
    7, 'MO_QUAL_USER',
    8, 'MO_QUAL_CHARACTER',
    9, 'MO_QUAL_KEYFRAMED_REPORT'
  ], aDefaultValue, aEvents);
end;

function wbForceType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'FORCE_PLANAR',
    1, 'FORCE_SPHERICAL',
    2, 'FORCE_UNKNOWN'
  ], aDefaultValue, aEvents);
end;

function wbTexTransform(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'TT_TRANSLATE_U',
    1, 'TT_TRANSLATE_V',
    2, 'TT_ROTATE',
    3, 'TT_SCALE_U',
    4, 'TT_SCALE_V'
  ], aDefaultValue, aEvents);
end;

function wbDecayType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'DECAY_NONE',
    1, 'DECAY_LINEAR',
    2, 'DECAY_EXPONENTIAL'
  ], aDefaultValue, aEvents);
end;

function wbSymmetryType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'SPHERICAL_SYMMETRY',
    1, 'CYLINDRICAL_SYMMETRY',
    2, 'PLANAR_SYMMETRY'
  ], aDefaultValue, aEvents);
end;

function wbVelocityType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'VELOCITY_USE_NORMALS',
    1, 'VELOCITY_USE_RANDOM',
    2, 'VELOCITY_USE_DIRECTION'
  ], aDefaultValue, aEvents);
end;

function wbEmitFrom(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'EMIT_FROM_VERTICES',
    1, 'EMIT_FROM_FACE_CENTER',
    2, 'EMIT_FROM_EDGE_CENTER',
    3, 'EMIT_FROM_FACE_SURFACE',
    4, 'EMIT_FROM_EDGE_SURFACE'
  ], aDefaultValue, aEvents);
end;

function wbEffectType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'EFFECT_PROJECTED_LIGHT',
    1, 'EFFECT_PROJECTED_SHADOW',
    2, 'EFFECT_ENVIRONMENT_MAP',
    3, 'EFFECT_FOG_MAP'
  ], aDefaultValue, aEvents);
end;

function wbCoordGenType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'CG_WORLD_PARALLEL',
    1, 'CG_WORLD_PERSPECTIVE',
    2, 'CG_SPHERE_MAP',
    3, 'CG_SPECULAR_CUBE_MAP',
    4, 'CG_DIFFUSE_CUBE_MAP'
  ], aDefaultValue, aEvents);
end;

function wbTargetColor(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU16, [
    0, 'TC_AMBIENT',
    1, 'TC_DIFFUSE',
    2, 'TC_SPECULAR',
    3, 'TC_SELF_ILLUM'
  ], aDefaultValue, aEvents);
end;

function wbConsistencyType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU16, [
    $0000, 'CT_MUTABLE',
    $4000, 'CT_STATIC',
    $8000, 'CT_VOLATILE'
  ], aDefaultValue, aEvents);
end;

function wbPropagationMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'PROPAGATE_ON_SUCCESS',
    1, 'PROPAGATE_ON_FAILURE',
    2, 'PROPAGATE_ALWAYS',
    3, 'PROPAGATE_NEVER'
  ], aDefaultValue, aEvents);
end;

function wbCollisionMode(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'CM_USE_OBB',
    1, 'CM_USE_TRI',
    2, 'CM_USE_ABV',
    3, 'CM_NOTEST',
    4, 'CM_USE_NIBOUND'
  ], aDefaultValue, aEvents);
end;

function wbBoundVolumeType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtS32, [
   -1, 'BASE_BV',
    0, 'SPHERE_BV',
    1, 'BOX_BV',
    2, 'CAPSULE_BV',
    4, 'UNION_BV',
    5, 'HALFSPACE_BV'
  ], aDefaultValue, aEvents);
end;

function wbPathFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU16, [
    $01, 'NIPI_CVDataNeedsUpdate',
    $02, 'NIPI_CurveTypeOpen',
    $04, 'NIPI_AllowFlip',
    $08, 'NIPI_Bank',
    $10, 'NIPI_ConstantVelocity',
    $20, 'NIPI_Follow',
    $40, 'NIPI_Flip'
  ], aDefaultValue, aEvents);
end;

function wbInterpBlendFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    1, 'MANAGER_CONTROLLED'
  ], aDefaultValue, aEvents);
end;

function wbVectorFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU16, [
    0, 'UV_1',
    1, 'UV_2',
    2, 'UV_4',
    3, 'UV_8',
    4, 'UV_16',
    5, 'UV_32',
    6, 'Unk64',
    7, 'Unk128',
    8, 'Unk256',
    9, 'Unk512',
    10, 'Unk1024',
    11, 'Unk2048',
    12, 'Has_Tangents',
    13, 'Unk8192',
    14, 'Unk16384',
    15, 'Unk32768'
  ], aDefaultValue, aEvents);
end;

function wbBSVectorFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU16, [
    0, 'Has_UV',
    1, 'Unk2',
    2, 'Unk4',
    3, 'Unk8',
    4, 'Unk16',
    5, 'Unk32',
    6, 'Unk64',
    7, 'Unk128',
    8, 'Unk256',
    9, 'Unk512',
    10, 'Unk1024',
    11, 'Unk2048',
    12, 'Has_Tangents',
    13, 'Unk8192',
    14, 'Unk16384',
    15, 'Unk32768'
  ], aDefaultValue, aEvents);
end;

function wbSkyrimShaderPropertyFlags1(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU32, [
    0, 'SLSF1_Specular',
    1, 'SLSF1_Skinned',
    2, 'SLSF1_Temp_Refraction',
    3, 'SLSF1_Vertex_Alpha',
    4, 'SLSF1_Greyscale_To_PaletteColor',
    5, 'SLSF1_Greyscale_To_PaletteAlpha',
    6, 'SLSF1_Use_Falloff',
    7, 'SLSF1_Environment_Mapping',
    8, 'SLSF1_Recieve_Shadows',
    9, 'SLSF1_Cast_Shadows',
    10, 'SLSF1_Facegen_Detail_Map',
    11, 'SLSF1_Parallax',
    12, 'SLSF1_Model_Space_Normals',
    13, 'SLSF1_Non_Projective_Shadows',
    14, 'SLSF1_Landscape',
    15, 'SLSF1_Refraction',
    16, 'SLSF1_Fire_Refraction',
    17, 'SLSF1_Eye_Environment_Mapping',
    18, 'SLSF1_Hair_Soft_Lighting',
    19, 'SLSF1_Screendoor_Alpha_Fade',
    20, 'SLSF1_Localmap_Hide_Secret',
    21, 'SLSF1_FaceGen_RGB_Tint',
    22, 'SLSF1_Own_Emit',
    23, 'SLSF1_Projected_UV',
    24, 'SLSF1_Multiple_Textures',
    25, 'SLSF1_Remappable_Textures',
    26, 'SLSF1_Decal',
    27, 'SLSF1_Dynamic_Decal',
    28, 'SLSF1_Parallax_Occlusion',
    29, 'SLSF1_External_Emittance',
    30, 'SLSF1_Soft_Effect',
    31, 'SLSF1_ZBuffer_Test'
  ], aDefaultValue, aEvents);
end;

function wbSkyrimShaderPropertyFlags2(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU32, [
    0, 'SLSF2_ZBuffer_Write',
    1, 'SLSF2_LOD_Landscape',
    2, 'SLSF2_LOD_Objects',
    3, 'SLSF2_No_Fade',
    4, 'SLSF2_Double_Sided',
    5, 'SLSF2_Vertex_Colors',
    6, 'SLSF2_Glow_Map',
    7, 'SLSF2_Assume_Shadowmask',
    8, 'SLSF2_Packed_Tangent',
    9, 'SLSF2_Multi_Index_Snow',
    10, 'SLSF2_Vertex_Lighting',
    11, 'SLSF2_Uniform_Scale',
    12, 'SLSF2_Fit_Slope',
    13, 'SLSF2_Billboard',
    14, 'SLSF2_No_LOD_Land_Blend',
    15, 'SLSF2_EnvMap_Light_Fade',
    16, 'SLSF2_Wireframe',
    17, 'SLSF2_Weapon_Blood',
    18, 'SLSF2_Hide_On_Local_Map',
    19, 'SLSF2_Premult_Alpha',
    20, 'SLSF2_Cloud_LOD',
    21, 'SLSF2_Anisotropic_Lighting',
    22, 'SLSF2_No_Transparency_Multisampling',
    23, 'SLSF2_Unused01',
    24, 'SLSF2_Multi_Layer_Parallax',
    25, 'SLSF2_Soft_Lighting',
    26, 'SLSF2_Rim_Lighting',
    27, 'SLSF2_Back_Lighting',
    28, 'SLSF2_Unused02',
    29, 'SLSF2_Tree_Anim',
    30, 'SLSF2_Effect_Lighting',
    31, 'SLSF2_HD_LOD_Objects'
  ], aDefaultValue, aEvents);
end;

function wbFallout4ShaderPropertyFlags1(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU32, [
    0, 'FSF1_Specular',
    1, 'FSF1_Skinned',
    2, 'FSF1_Temp_Refraction',
    3, 'FSF1_Vertex_Alpha',
    4, 'FSF1_GreyscaleToPalette_Color',
    5, 'FSF1_GreyscaleToPalette_Alpha',
    6, 'FSF1_Use_Falloff',
    7, 'FSF1_Environment_Mapping',
    8, 'FSF1_RGB_Falloff',
    9, 'FSF1_Cast_Shadows',
    10, 'FSF1_Face',
    11, 'FSF1_UI_Mask_Rects',
    12, 'FSF1_Model_Space_Normals',
    13, 'FSF1_Non_Projective_Shadows',
    14, 'FSF1_Landscape',
    15, 'FSF1_Refraction',
    16, 'FSF1_Fire_Refraction',
    17, 'FSF1_Eye_Environment_Mapping',
    18, 'FSF1_Hair',
    19, 'FSF1_Screendoor_Alpha_Fade',
    20, 'FSF1_Localmap_Hide_Secret',
    21, 'FSF1_Skin_Tint',
    22, 'FSF1_Own_Emit',
    23, 'FSF1_Projected_UV',
    24, 'FSF1_Multiple_Textures',
    25, 'FSF1_Tessellate',
    26, 'FSF1_Decal',
    27, 'FSF1_Dynamic_Decal',
    28, 'FSF1_Character_Lighting',
    29, 'FSF1_External_Emittance',
    30, 'FSF1_Soft_Effect',
    31, 'FSF1_ZBuffer_Test'
  ], aDefaultValue, aEvents);
end;

function wbFallout4ShaderPropertyFlags2(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU32, [
    0, 'FSF2_ZBuffer_Write',
    1, 'FSF2_LOD_Landscape',
    2, 'FSF2_LOD_Objects',
    3, 'FSF2_No_Fade',
    4, 'FSF2_Double_Sided',
    5, 'FSF2_Vertex_Colors',
    6, 'FSF2_Glow_Map',
    7, 'FSF2_Transform_Changed',
    8, 'FSF2_Dismemberment_Meatcuff',
    9, 'FSF2_Tint',
    10, 'FSF2_Grass_Vertex_Lighting',
    11, 'FSF2_Grass_Uniform_Scale',
    12, 'FSF2_Grass_Fit_Slope',
    13, 'FSF2_Grass_Billboard',
    14, 'FSF2_No_LOD_Land_Blend',
    15, 'FSF2_Dismemberment',
    16, 'FSF2_Wireframe',
    17, 'FSF2_Weapon_Blood',
    18, 'FSF2_Hide_On_Local_Map',
    19, 'FSF2_Premult_Alpha',
    20, 'FSF2_VATS_Target',
    21, 'FSF2_Anisotropic_Lighting',
    22, 'FSF2_Skew_Specular_Alpha',
    23, 'FSF2_Menu_Screen',
    24, 'FSF2_Multi_Layer_Parallax',
    25, 'FSF2_Alpha_Test',
    26, 'FSF2_Gradient_Remap',
    27, 'FSF2_VATS_Target_Draw_All',
    28, 'FSF2_Pipboy_Screen',
    29, 'FSF2_Tree_Anim',
    30, 'FSF2_Effect_Lighting',
    31, 'FSF2_Refraction_Writes_Depth'
  ], aDefaultValue, aEvents);
end;

function wbVertexFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU16, [
    0, 'VF_Unknown_0',
    1, 'VF_Unknown_1',
    2, 'VF_Unknown_2',
    3, 'VF_Unknown_3',
    4, 'VF_VERTEX',
    5, 'VF_UV',
    6, 'VF_UV_2',
    7, 'VF_NORMAL',
    8, 'VF_TANGENT',
    9, 'VF_COLORS',
    10, 'VF_SKINNED',
    11, 'VF_LANDDATA',
    12, 'VF_EYEDATA',
    13, 'VF_Unknown_13',
    14, 'VF_FULLPREC',
    15, 'VF_Unknown_15'
  ], aDefaultValue, aEvents);
end;

function wbBSCPCullingType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'BSCP_CULL_NORMAL',
    1, 'BSCP_CULL_ALLPASS',
    2, 'BSCP_CULL_ALLFAIL',
    3, 'BSCP_CULL_IGNOREMULTIBOUNDS',
    4, 'BSCP_CULL_FORCEMULTIBOUNDSNOUPDATE'
  ], aDefaultValue, aEvents);
end;

function wbNiSwitchFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU16, [
    0, 'UpdateOnlyActiveChild',
    1, 'UpdateControllers'
  ], aDefaultValue, aEvents);
end;

function wbMotorType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU8, [
    0, 'MOTOR_NONE',
    1, 'MOTOR_POSITION',
    2, 'MOTOR_VELOCITY',
    3, 'MOTOR_SPRING'
  ], aDefaultValue, aEvents);
end;

function wbChannelType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'CHNL_RED',
    1, 'CHNL_GREEN',
    2, 'CHNL_BLUE',
    3, 'CHNL_ALPHA',
    4, 'CHNL_COMPRESSED',
    16, 'CHNL_INDEX',
    19, 'CHNL_EMPTY'
  ], aDefaultValue, aEvents);
end;

function wbChannelConvention(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU32, [
    0, 'CC_FIXED',
    3, 'CC_INDEX',
    4, 'CC_COMPRESSED',
    5, 'CC_EMPTY'
  ], aDefaultValue, aEvents);
end;

function wbFurnitureEntryPoints(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfFlags(aName, dtU16, [
    0, 'Front',
    1, 'Behind',
    2, 'Right',
    3, 'Left',
    4, 'Up'
  ], aDefaultValue, aEvents);
end;

function wbAnimationType(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU16, [
    1, 'Sit',
    2, 'Sleep',
    4, 'Lean'
  ], aDefaultValue, aEvents);
end;

function wbLookAtFlags(const aName, aDefaultValue: string; const aEvents: array of const): TdfDef;
begin
  Result := dfEnum(aName, dtU16, [
    0, 'LOOK_X_AXIS',
    1, 'LOOK_FLIP',
    2, 'LOOK_Y_AXIS',
    4, 'LOOK_Z_AXIS'
  ], aDefaultValue, aEvents);
end;

function wbAdditionalDataInfo(const aName: string; const aEvents: array of const): TdfDef;
begin
  Result := dfStruct(aName, [
    dfInteger('Data Type', dtS32),
    dfInteger('Num Channel Bytes Per Element', dtS32),
    dfInteger('Num Channel Bytes', dtS32),
    dfInteger('Num Total Bytes Per Element', dtS32),
    dfInteger('Block Index', dtS32),
    dfInteger('Channel Offset', dtS32),
    dfInteger('Unknown Byte 1', dtU8, '2')
  ])
end;

function wbAdditionalDataBlock(const aName: string; const aEvents: array of const): TdfDef;
  function EnData(const e: TdfElement): Boolean; begin Result := e.NativeValues['..\Has Data'] <> 0; end;
  procedure GetCountData(const e: TdfElement; var aCount: Integer); begin aCount := e.NativeValues['..\..\Block Size']; end;
begin
  Result := dfStruct(aName, [
    dfBool('Has Data', dtU8),
    dfStruct('Data', [
      dfInteger('Block Size', dtS32),
      dfArray('Block Offsets', dfInteger('Block Offsets', dtS32), -4),
      dfInteger('Num Data', dtS32),
      dfArray('Data Sizes', dfInteger('Data Sizes', dtS32), 0, 'Num Data', []),
      dfArray('Data', dfBytes('Data', 0, [DF_OnGetCount, @GetCountData]), 0, 'Num Data', [])
    ], [DF_OnGetEnabled, @EnData])
  ], aEvents);
end;

function wbBSPackedAdditionalDataBlock(const aName: string; const aEvents: array of const): TdfDef;
  function EnData(const e: TdfElement): Boolean; begin Result := e.NativeValues['..\Has Data'] <> 0; end;
begin
  Result := dfStruct(aName, [
    dfBool('Has Data', dtU8),
    dfStruct('Data', [
      dfInteger('Num Total Bytes', dtU32),
      dfArray('Block Offsets', dfInteger('Block Offsets', dtS32), -4),
      dfArray('Atom Sizes', dfInteger('Atom Sizes', dtS32), -4),
      dfArray('Data', dfInteger('Data', dtU8), 0, 'Num Total Bytes', []),
      dfInteger('Unknown Int', dtS32),
      dfInteger('Num Total Bytes Per Element', dtU32)
    ], [DF_OnGetEnabled, @EnData])
  ], aEvents);
end;




end.
