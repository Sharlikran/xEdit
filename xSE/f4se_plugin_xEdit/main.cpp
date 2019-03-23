#include <string>
#include <shlobj.h>
#include "common/IPrefix.h"
#include "f4se_common/f4se_version.h"
#include "f4se_common/Relocation.h"
#include "f4se_common/SafeWrite.h"
#include "f4se/PluginAPI.h"
#include "f4se/ObScript.h"
//#include "f4se/GameAPI.h"
//#include "f4se/ParamInfos.h"
#include "f4se/GameForms.h"
//#include "f4se/GameObjects.h"

	char xEditCommandName[] = {"xEditDump"};
	char pluginName[] = {"f4se_plugin_xEdit"};
	char pluginExt[] = {".log"};
	char pluginLogPath[] = {"\\My Games\\Fallout4\\F4SE\\"};
#ifdef _DEBUG
	char pluginEdition[] = {"-debug"};
#else
	char pluginEdition[] = {""};
#endif
#ifdef _NOGORE
	char pluginVariant[] = {"-nogore"};
#else
	char pluginVariant[] = {""};
#endif
	static char pluginLog[sizeof(pluginLogPath)+sizeof(pluginName)+sizeof(pluginEdition)+sizeof(pluginVariant)+sizeof(pluginExt)];

PluginHandle	g_pluginHandle = kPluginHandle_Invalid;
F4SEInterface * SaveF4SE;

#define REQUIRED_RUNTIME RUNTIME_VERSION_1_9_4

void OpenPluginLog()
{
	strcpy_s(pluginLog, pluginLogPath);
	strcat_s(pluginLog, pluginName);
	strcat_s(pluginLog, pluginVariant);
	strcat_s(pluginLog, pluginEdition);
	strcat_s(pluginLog, pluginExt);

	gLog.OpenRelative(CSIDL_MYDOCUMENTS, pluginLog);
}

bool CheckParam(ObScriptCommand * iter, UInt32 paramIndex)
{
	// At least one function (1245) has numParams > 0 and params == NULL
	return iter && iter->params && iter->numParams>paramIndex;
}

bool xEditCommand()
{
	#if RUNTIME_VERSION == REQUIRED_RUNTIME
		static const UInt32 s_doShowChangeFlagsName = 0x00CBD070;				// Skyrim 1.9.32: 00675DB0,					Fallout3: 006C9510	FalloutNV: 0x0083FEF0
		static const UInt32 s_changeFormTypeArray = 0x0371A150;					// Skyrim: 012724C0							Fallout3: 00F6D1D0	FalloutNV: 0x011A2428
		static const UInt32 s_FormToChangeType = 0x059FEC10;					// after initialisation Skyrim: 01B2E4D0	Fallout3: 01079BD0	FalloutNV: 0x011DE360
		static const UInt32 s_nickNames = 0x02C03C44;							// Array of form signatures
		static const UInt32 s_formTypeNicknames = 0x03667780;					// Skyrim: 0123F2C4							Fallout3: 00F4A74C	FalloutNV: 0x01187004
		static const UInt32 s_GlobalData1Names = 0x03719B00;					// Skyrim: 01272310, 01272334, 01272370,	Fallout3: 00F6CED8	FalloutNV: 0x011A216C Fallout4 7FF6ED787DD0 - 07FF6E92D0000
		static const UInt32 s_GlobalData2Names = s_GlobalData1Names + 12;		// 100 + index
		static const UInt32 s_GlobalData3Names = s_GlobalData2Names + 18;		// 1000 + index
		static const UInt32 s_GlobalData3NamesEnd = s_GlobalData3Names + 8;
		static const UInt64 s_DialogSubtypes = 0x036A73F0;						// First is CUST Custom
		static const UInt64 s_DialogSubtypesEnd = 0x036A8778;				
		static const UInt64 s_DefaultObjectManagerObjectArray = 0x0367CC00;		// First is UNUSED01, WWSP
		static const UInt64 s_DefaultObjectManagerObjectArrayEnd = 0x0367FD40;	// ??_R0?AVBGSDefaultObjectManager@@@8
	#else 
	#error
	#endif

	typedef char * (* _s_doShowChangeFlagsName)(UInt32 flag, UInt32 formType, bool returnDescription);
	RelocAddr <_s_doShowChangeFlagsName> doShowChangeFlagsName(s_doShowChangeFlagsName);
	RelocPtr <UInt32> changeToFormType(s_changeFormTypeArray);

	struct FormTypeNickname
	{
		char formType;
		char pad01[7];
		char *nickname;
		UInt32 unk10;
		UInt32 pad14;
	};
	RelocPtr <FormTypeNickname> formTypeNicknames(s_formTypeNicknames);	// array size = kFormType_Max

	_MESSAGE("*****************************************************************************************************");

	// create the list of signatures
	_MESSAGE("formType;formSignature; %d elements not counting the 6 specials for Papyrus", kFormType_Max);
	for (UInt32 formType = 0; formType < kFormType_Max; formType++) {
		_MESSAGE("%03d;%s", formType, formTypeNicknames[formType].nickname);
	}
	_MESSAGE("");

	_MESSAGE("*****************************************************************************************************");

	// create the list of script commands
	UInt32 i = 0;
	_MESSAGE("  wbConsoleFunctions : array[] of TFunction = (");
	for(ObScriptCommand * iter = g_firstConsoleCommand; iter->opcode < (kObScript_NumConsoleCommands+kObScript_ConsoleOpBase); ++iter, i++)
	{
			_MESSAGE("    (Index: %3d; Name: '%s'%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s),", i, iter->longName, 
				CheckParam(iter, 0) ? "; Paramtype1: pt" : "", CheckParam(iter, 0) ? iter->params[0].typeStr : "", 
				CheckParam(iter, 1) ? "; Paramtype2: pt" : "", CheckParam(iter, 1) ? iter->params[1].typeStr : "", 
				CheckParam(iter, 2) ? "; Paramtype3: pt" : "", CheckParam(iter, 2) ? iter->params[2].typeStr : "",
				CheckParam(iter, 3) ? "; Paramtype3: pt" : "", CheckParam(iter, 3) ? iter->params[3].typeStr : "",
				CheckParam(iter, 4) ? "; Paramtype4: pt" : "", CheckParam(iter, 4) ? iter->params[4].typeStr : "",
				CheckParam(iter, 5) ? "; Paramtype5: pt" : "", CheckParam(iter, 5) ? iter->params[5].typeStr : "",
				CheckParam(iter, 6) ? "; Paramtype6: pt" : "", CheckParam(iter, 6) ? iter->params[6].typeStr : "",
				CheckParam(iter, 7) ? "; Paramtype7: pt" : "", CheckParam(iter, 7) ? iter->params[7].typeStr : "",
				CheckParam(iter, 8) ? "; Paramtype8: pt" : "", CheckParam(iter, 8) ? iter->params[8].typeStr : "",
				CheckParam(iter, 9) ? "// ; More..." : "");
	}
	_MESSAGE("  );");	// Don't forget to remove the last ,

	_MESSAGE("");

	_MESSAGE("*****************************************************************************************************");

	// create the list of script commands
	i = 0;
	_MESSAGE("  wbFunctions : array[] of TFunction = (");
	for(ObScriptCommand * iter = g_firstObScriptCommand; iter->opcode < (kObScript_NumObScriptCommands+kObScript_ScriptOpBase); ++iter, i++)
	{
			_MESSAGE("    (Index: %3d; Name: '%s'%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s),", i, iter->longName, 
				CheckParam(iter, 0) ? "; Paramtype1: pt" : "", CheckParam(iter, 0) ? iter->params[0].typeStr : "", 
				CheckParam(iter, 1) ? "; Paramtype2: pt" : "", CheckParam(iter, 1) ? iter->params[1].typeStr : "", 
				CheckParam(iter, 2) ? "; Paramtype3: pt" : "", CheckParam(iter, 2) ? iter->params[2].typeStr : "",
				CheckParam(iter, 3) ? "; Paramtype3: pt" : "", CheckParam(iter, 3) ? iter->params[3].typeStr : "",
				CheckParam(iter, 4) ? "; Paramtype4: pt" : "", CheckParam(iter, 4) ? iter->params[4].typeStr : "",
				CheckParam(iter, 5) ? "; Paramtype5: pt" : "", CheckParam(iter, 5) ? iter->params[5].typeStr : "",
				CheckParam(iter, 6) ? "; Paramtype6: pt" : "", CheckParam(iter, 6) ? iter->params[6].typeStr : "",
				CheckParam(iter, 7) ? "; Paramtype7: pt" : "", CheckParam(iter, 7) ? iter->params[7].typeStr : "",
				CheckParam(iter, 8) ? "; Paramtype8: pt" : "", CheckParam(iter, 8) ? iter->params[8].typeStr : "",
				CheckParam(iter, 9) ? "// ; More..." : "");
	}
	_MESSAGE("  );");	// Don't forget to remove the last ,

	_MESSAGE("");

	_MESSAGE("*****************************************************************************************************");

	// create the list of condition commands
	i = 0;
	UInt32 j = 0;
	_MESSAGE("  wbCTDAFunctions : array[] of TCTDAFunction = (");
	for(ObScriptCommand * iter = g_firstObScriptCommand; iter->opcode < (kObScript_NumObScriptCommands+kObScript_ScriptOpBase); ++iter, i++)
	{
		if(iter->eval)
		{
			_MESSAGE("    (Index: %3d; Name: '%s'%s%s%s%s%s%s),\t\t// %3d", i, iter->longName, 
				CheckParam(iter, 0) ? "; Paramtype1: pt" : "", CheckParam(iter, 0) ? iter->params[0].typeStr : "", 
				CheckParam(iter, 1) ? "; Paramtype2: pt" : "", CheckParam(iter, 1) ? iter->params[1].typeStr : "", 
				CheckParam(iter, 2) ? "; Paramtype3: pt" : "", CheckParam(iter, 2) ? iter->params[2].typeStr : "",
				j);
			j++;
		}
	}
	_MESSAGE("  );");	// Don't forget to remove the last ,

	_MESSAGE("");

	_MESSAGE("*****************************************************************************************************");

	// create the Changed Form flags variables
	UInt32 changeTypeCount = 50; // First being 13 = TESClass. 16 different cases, 50 valid are: 0,     1,   11h,   11h,    11h,   11h,   11h,   11h,    11h,   11h,   11h,   11h,    11h,   11h,   11h,   11h,    11h,   11h,   11h,   11h,      2,   11h,   11h,   11h,    11h,   11h,   11h,   11h,    11h,   11h,   11h,   11h,      3,     4,   11h,   11h,    11h,     5,   11h,   11h,    11h,   11h,   11h,     4,    11h,   11h,   11h,   11h,    11h,   11h,     6,     7,      7,     7,     7,     7,      7,     7,     7,     7,      7,   11h,   11h,   11h,    11h,   11h,     8,     9,    11h,   0Ah,   11h,   11h,      4,   11h,   11h,   11h,    11h,   11h,   11h,   11h,    11h,   0Bh,   11h,   11h,    11h,   11h,   11h,   11h,    11h,   11h,   11h,   11h,    11h,   0Ch,   0Dh,   11h,    11h,   11h,   11h,   11h,    11h,   11h,   11h,   11h,    0Eh,   11h,   11h,   11h,    11h,   11h,   11h,   11h,    0Fh,   10h
	for (UInt32 changeType = 0; changeType < changeTypeCount; changeType++) {
		_MESSAGE("  wbChangeFlags%03u        : IwbIntegerDef;", changeType);
	}
	_MESSAGE("");

	// create the Changed Form Data union variables
	for (UInt32 changeType = 0; changeType < changeTypeCount; changeType++) {
		UInt32 formType = changeToFormType[changeType];
		UInt32 flagValue;
		char * changeFlagsName;
		for (UInt8 flagShift = 0; flagShift < 32; flagShift++) {
			flagValue = 1 << flagShift;
			changeFlagsName = doShowChangeFlagsName(flagValue, formType, 0);
			if (strcmp("Bad Flag Name", changeFlagsName)) {
				_MESSAGE("  wbUnion%s : IwbUnionDef;", changeFlagsName);
			}
		}
	}

	_MESSAGE("*****************************************************************************************************");

	// decode the Change Type name
	_MESSAGE("  wbChangeTypes := wbKey2Data6Enum([");
	for (UInt32 changeType = 0; changeType < changeTypeCount-1; changeType++) {
		UInt32 formType = changeToFormType[changeType];
		_MESSAGE("    '%02u (%03X : %s)',", changeType, formType, formTypeNicknames[formType].nickname);
	}
	UInt32 formType = changeToFormType[changeTypeCount-1];
	_MESSAGE("    '%02u (%03X : %s)'", changeTypeCount-1, formType, formTypeNicknames[formType].nickname);
	_MESSAGE("  ]);\n");

	_MESSAGE("*****************************************************************************************************");

	// decode the Changed form flags
	for (UInt32 changeType = 0; changeType < changeTypeCount; changeType++) {
		UInt32 formType = changeToFormType[changeType];
		_MESSAGE("  // changeType: %03u = formType: %03u : %s", changeType, formType,  formTypeNicknames[formType].nickname);
		_MESSAGE("  wbChangeFlags%03u := wbInteger('Change Flags', itU32 , wbFlags([", changeType);

		UInt32 flagValue;
		char * changeFlagsName;
		char * changeFlagsDescription;
		for (UInt8 flagShift = 0; flagShift < 31; flagShift++) {
			flagValue = 1 << flagShift;
			changeFlagsName = doShowChangeFlagsName(flagValue, formType, 0);
			if (0==strcmp("Bad Flag Name", changeFlagsName)) {
				_MESSAGE("    {%02u} 'UnnamedFlag%02u',", flagShift, flagShift);
			} else {
				changeFlagsDescription = doShowChangeFlagsName(flagValue, formType, 1);
				_MESSAGE("    {%02u} '%s', // %s", flagShift, changeFlagsName, changeFlagsDescription);
			}
		}
		flagValue = 1 << 31;
		changeFlagsName = doShowChangeFlagsName(flagValue, formType, 0);
		if (0==strcmp("Bad Flag Name", changeFlagsName)) {
			_MESSAGE("    {%02u} 'UnnamedFlag%02u'", 31, 31);
		} else {
			changeFlagsDescription = doShowChangeFlagsName(flagValue, formType, 1);
			_MESSAGE("    {%02u} '%s' // %s", 31, changeFlagsName, changeFlagsDescription);
		}
		_MESSAGE("  ]));\n");
	}

	_MESSAGE("*****************************************************************************************************");

	// Build the Changed Form flags union
	_MESSAGE("  wbChangeFlags := wbUnion('Change Flags', ChangedFormFlagsDecider, [");
	for (UInt32 changeType = 0; changeType < changeTypeCount-1; changeType++) {
		_MESSAGE("    wbChangeFlags%03u,", changeType);
	}
	_MESSAGE("    wbChangeFlags%03u", changeTypeCount-1);
	_MESSAGE("  ]);\n");

	// Build the Changed Form union
	for (UInt32 changeType = 0; changeType < changeTypeCount; changeType++) {
		UInt32 formType = changeToFormType[changeType];
		UInt32 flagValue;
		char * changeFlagsName;
		for (UInt8 flagShift = 0; flagShift < 32; flagShift++) {
			flagValue = 1 << flagShift;
			changeFlagsName = doShowChangeFlagsName(flagValue, formType, 0);
			if (strcmp("Bad Flag Name", changeFlagsName)) {
				_MESSAGE("  wbUnion%s := wbUnion('%s', ChangedFlag%02uDecider, [wbNull, wbNull]);", changeFlagsName, doShowChangeFlagsName(flagValue, formType, 1), flagShift);
			}
		}
		_MESSAGE("");
	}
	_MESSAGE("");

	_MESSAGE("*****************************************************************************************************");

	// Build the Changed Form Data struct
	UInt32 flagValue = 1;
	char * changeFlagsName = doShowChangeFlagsName(flagValue, formType, 0);
	_MESSAGE("  wbChangedFormData := wbStruct('Changed Form Data', [");
	_MESSAGE("    wbInitialDataType,");
	_MESSAGE("    wbUnion('CForm Union', ChangedFormDataDecider, [");
	_MESSAGE("       wbNull");
	for (UInt32 changeType = 0; changeType < changeTypeCount; changeType++) {
		bool first = true;
		UInt32 formType = changeToFormType[changeType];
		_MESSAGE("      ,wbStruct('Change %s Data', [ {%03X}", formTypeNicknames[formType].nickname, formType);
		for (UInt8 flagShift = 0; flagShift < 32; flagShift++) {
			flagValue = 1 << flagShift;
			changeFlagsName = doShowChangeFlagsName(flagValue, formType, 0);
			if (strcmp("Bad Flag Name", changeFlagsName)) {
				if (first) {
					first = false;
					_MESSAGE("         wbUnion%s", changeFlagsName);
				} else
				_MESSAGE("        ,wbUnion%s", changeFlagsName);
			}
		}
		_MESSAGE("       ])");
	}
	_MESSAGE("    ]),");
	_MESSAGE("    wbByteArray('Undecoded Data', ChangedFormRemainingDataCounter)");
	_MESSAGE("  ]);\n");

	_MESSAGE("*****************************************************************************************************");
	_MESSAGE("\n\n\n");

	_MESSAGE("avID;avName;formID;\"fullName\";description.unk08;flags;avType");
	UInt32 firstAV = 0x2BC;
	UInt32 avID = 0;
	do
	{
		TESForm* pForm = LookupFormByID(avID+firstAV);
		ActorValueInfo* pActorValueInfo = NULL;

		if (pForm && pForm->formType == 98)
			pActorValueInfo = (ActorValueInfo*)pForm;
		if (pActorValueInfo) {
			_MESSAGE("%d;%s;%x;\"%s\";%x;%x;%x", avID, pActorValueInfo->avName, pActorValueInfo->formID, 
				pActorValueInfo->fullName.Get(), 
				pActorValueInfo->description.unk08, pActorValueInfo->avFlags, pActorValueInfo->avType);
		}
		avID++;
	} while ((avID+firstAV) < 0x800);

	_MESSAGE("*****************************************************************************************************");
	_MESSAGE("\n\n\n");

	struct DialogSubtype
	{
		const char	* name;			// 000
		char		unk008;			// 008
		char		fil009[3];		// 009
		char		shortName[4];	// 00C
		char		dstID;			// 010
		char		fil011[3];		// 011
		char		unk014;			// 014
		char		unk015;			// 015
		char		fil016[2];		// 016
		char		unk018;			// 018
		char		fil019[15];		// 019
	};	// 028

	_MESSAGE("dstID;dstName;dstType;dstShort;dstUnk014;dstUnk015;dstUnk018");
	RelocPtr <DialogSubtype>	g_DialogSubtypes(s_DialogSubtypes);
	RelocPtr <DialogSubtype>	g_DialogSubtypesEnd(s_DialogSubtypesEnd);
	DialogSubtype* curr = g_DialogSubtypes;
	UInt32 dstID = 0;
	do
	{
		char shortName[5] = "    ";
		for (UInt8 i = 0; i < 4 ; i++) shortName[i] = curr->shortName[i]; shortName[4] = 0;
		_MESSAGE("%d;\"%s\";%d;\"%s\";%d;%d;%d", dstID, curr->name, curr->dstID, shortName, curr->unk008, curr->unk014, curr->unk015, curr->unk018);
		dstID++;
		curr++;
	} while (curr < g_DialogSubtypesEnd);

	_MESSAGE("*****************************************************************************************************");
	_MESSAGE("\n\n\n");

	struct DataDOM
	{
		const char	* name;			// 000
		UInt8		formType;		// 008
		UInt8		fil009[3];		// 009
		char		shortName[4];	// 00C
		UInt32		unk010;			// 010
		UInt32		unk014;			// 014
		UInt32		formID;			// 018
		UInt32		pad01C;			// 01C
	};	// 020

	RelocPtr <DataDOM>	g_DefaultObjectManagerObject(s_DefaultObjectManagerObjectArray);
	UInt32 domCount = (s_DefaultObjectManagerObjectArrayEnd - s_DefaultObjectManagerObjectArray) / sizeof(DataDOM);
	DataDOM* dom = g_DefaultObjectManagerObject;
	_MESSAGE("domID;domName;domShort;formType;domUnk010;domUnk014;domFormID; %d elements", domCount);
	for (UInt32 domID = 0; domID < domCount ; domID++)
	{
		char shortName[5] = "    ";
		for (UInt8 i = 0; i < 4 ; i++) shortName[i] = dom->shortName[i]; shortName[4] = 0;
		_MESSAGE("%d;\"%s\";\"%s\";%d;%d;%d;%08x", domID, dom->name, shortName, dom->formType, dom->unk010, dom->unk014, dom->formID);
		dom++;
	};

	_MESSAGE("*****************************************************************************************************");
	_MESSAGE("\n\n\n");

	dom = g_DefaultObjectManagerObject;
	for (UInt32 domID = 0; domID < domCount ; domID++)
	{
		char shortName[5] = "    ";
		for (UInt8 i = 0; i < 4 ; i++) shortName[i] = dom->shortName[i]; shortName[4] = 0;
		_MESSAGE("sig2Int('%s'), '%s'", shortName, dom->name);
		dom++;
	};

	_MESSAGE("*****************************************************************************************************");
	_MESSAGE("\n\n\n");

	return true;
}
  
// currently ToggleESRAM
static ObScriptCommand * s_hijackedCommand = nullptr;

void xEdit_ObScript_Init()
{
	// instead of hooking the entire classic scripting system, we're just hijacking some unused commands, just like F4SE does

	for(ObScriptCommand * iter = g_firstConsoleCommand; iter->opcode < (kObScript_NumConsoleCommands+kObScript_ConsoleOpBase); ++iter)
	{
		if(!strcmp(iter->longName, "ToggleESRAM"))
		{
			s_hijackedCommand = iter;
			break;
		}
	}

	if(!s_hijackedCommand)
	{
		_ERROR("couldn't find the obscript command to use");
	}
}

bool xEditCommand_Execute(COMMAND_ARGS)
{
	return xEditCommand();
}

void xEdit_ObScript_Commit()
{
	ObScriptCommand cmd = *s_hijackedCommand;

	cmd.longName = xEditCommandName;
	cmd.shortName = "";
	cmd.helpText = "";
	cmd.needsParent = 0;
	cmd.numParams = 0;
	cmd.execute = xEditCommand_Execute;
	cmd.flags = 0;

	SafeWriteBuf((uintptr_t)s_hijackedCommand, &cmd, sizeof(cmd));
	_MESSAGE("xEdit console command '%s' installed as 0x%08x", cmd.longName, cmd.opcode);
}

extern "C" {

bool F4SEPlugin_Query(const F4SEInterface * f4se, PluginInfo * info)
{

	OpenPluginLog();

	// fill out the info structure
	info->infoVersion = PluginInfo::kInfoVersion;
	info->name = pluginName;
	info->version = 3;

	// version checks
	if(f4se->f4seVersion < F4SE_VERSION_INTEGER)
	{
		_ERROR("f4se version too old (got %08X expected at least %08X)", f4se->f4seVersion, F4SE_VERSION_INTEGER);
		return false;
	}

	if(!f4se->isEditor)
	{
		if(f4se->runtimeVersion != REQUIRED_RUNTIME)
		{
			_ERROR("incorrect runtime version (got %08X need %08X)", f4se->runtimeVersion, REQUIRED_RUNTIME);
			return false;
		}

	}
	else
	{
		return false;
	}

	// version checks pass

	return true;
}

bool F4SEPlugin_Load(const F4SEInterface * f4se)
{
	g_pluginHandle = f4se->GetPluginHandle();

	// save the F4SEinterface in cas we need it later
	SaveF4SE = (F4SEInterface *)f4se;
	//SaveCT = (NVSECommandTableInterface *)nvse->QueryInterface(kInterface_CommandTable);
	//SaveMsg = (NVSEMessagingInterface *)nvse->QueryInterface(kInterface_Messaging);
	//SaveMsg->RegisterListener(g_pluginHandle, "NVSE", MessageHandler);

	xEdit_ObScript_Init();
	xEdit_ObScript_Commit();

	return true;
}

};
