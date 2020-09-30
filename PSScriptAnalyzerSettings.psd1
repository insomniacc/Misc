# Use the PowerShell extension setting `powershell.scriptAnalysis.settingsPath` to get the current workspace
# to use this PSScriptAnalyzerSettings.psd1 file to configure code analysis in Visual Studio Code.
# This setting is configured in the workspace's `.vscode\settings.json`.
#
# For more information on PSScriptAnalyzer settings see:
# https://github.com/PowerShell/PSScriptAnalyzer/blob/master/README.md#settings-support-in-scriptanalyzer
#
# You can see the predefined PSScriptAnalyzer settings here:
# https://github.com/PowerShell/PSScriptAnalyzer/tree/master/Engine/Settings
@{
    # Only diagnostic records of the specified severity will be generated.
    # Uncomment the following line if you only want Errors and Warnings but
    # not Information diagnostic records.
    #Severity = @('Error','Warning')

    # Analyze **only** the following rules. Use IncludeRules when you want
    # to invoke only a small subset of the default rules.
    IncludeRules = @(
                        #Read rule definitions here:
                        #https://github.com/PowerShell/PSScriptAnalyzer/blob/master/RuleDocumentation/README.md
                        
                        # General
                        'PSAvoidAssignmentToAutomaticVariable',
                        'PSMissingModuleManifestField',
                        'PSPossibleIncorrectComparisonWithNull',
                        'PSPossibleIncorrectUsageOfRedirectionOperator',
                        'PSUseToExportFieldsInManifest',
                        'PSUseUsingScopeModifierInNewRunspaces',
                        'PSAvoidUsingDeprecatedManifestFields',
                        'PSAvoidUsingEmptyCatchBlock',

                        # Security
                        #'PSAvoidUsingComputerNameHardcoded',
                        'PSUsePSCredentialType',
                        'PSAvoidUsingPlainTextForPassword',
                        'PSAvoidUsingConvertToSecureStringWithPlainText',
                        'PSAvoidUsingUsernameAndPasswordParams',

                        # Code style
                        #'PSAvoidLongLines',
                        #'PSAvoidTrailingWhitespace',
                        #'PSAvoidUsingDoubleQuotesForConstantString',
                        'PSAvoidUsingCmdletAliases',
                        'PSProvideCommentHelp',
                        'PSPossibleIncorrectUsageOfAssignmentOperator',
                        'PSPossibleIncorrectUsageOfRedirectionOperator',
                        'PSMisleadingBacktick',
                        'PSUseLiteralInitializerForHashtable',

                        # Code formatting OTBS
                        #'PSUseCorrectCasing',
                        'PSPlaceOpenBrace',
                        'PSPlaceCloseBrace',
                        'PSAlignAssignmentStatement',
                        #'PSUseConsistentIndentation',
                        'PSUseConsistentWhitespace',

                        # Functions
                        'PSUseApprovedVerbs',
                        'PSAvoidDefaultValueForMandatoryParameter',
                        'PSAvoidDefaultValueSwitchParameter',
                        'PSAvoidUsingWMICmdlet',
                        'PSReservedCmdletChar',
                        'PSReservedParams',
                        #'PSReviewUnusedParameter',
                        'PSUseCmdletCorrectly',
                        'PSUseDeclaredVarsMoreThanAssignments',
                        #'PSUseSingularNouns',
                        #'PSUseOutputTypeCorrectly',
                        'PSUseSupportsShouldProcess',
                        'PSAvoidNullOrEmptyHelpMessageAttribute',
                        'PSAvoidShouldContinueWithoutForce',
                        'PSUseProcessBlockForPipelineCommand',
                        'PSUseShouldProcessForStateChangingFunctions'
                     )

    # Do not analyze the following rules. Use ExcludeRules when you have
    # commented out the IncludeRules settings above and want to include all
    # the default rules except for those you exclude below.
    # Note: if a rule is in both IncludeRules and ExcludeRules, the rule
    # will be excluded.
    #ExcludeRules = @('PSAvoidUsingWriteHost')

    # You can use rule configuration to configure rules that support it:
    Rules = @{

        #PSAvoidUsingCmdletAliases = @{
        #    Whitelist = @("cd")
        #}

        #PSAvoidUsingDoubleQuotesForConstantString = @{
        #    Enable = $true
        #}
    
        PSPlaceOpenBrace                          = @{
            Enable             = $true
            OnSameLine         = $true
            NewLineAfter       = $true
            IgnoreOneLineBlock = $true
        }
    
        PSPlaceCloseBrace                         = @{
            Enable             = $true
            NewLineAfter       = $false
            IgnoreOneLineBlock = $true
            NoEmptyLineBefore  = $false
        }
    
        PSUseConsistentIndentation                = @{
            Enable              = $true
            Kind                = 'space'
            PipelineIndentation = 'IncreaseIndentationForFirstPipeline'
            IndentationSize     = 4
        }
    
        PSUseConsistentWhitespace                 = @{
            Enable                          = $true
            CheckInnerBrace                 = $true
            CheckOpenBrace                  = $true
            CheckOpenParen                  = $true
            CheckOperator                   = $false # https://github.com/PowerShell/PSScriptAnalyzer/issues/769
            CheckPipe                       = $true
            CheckPipeForRedundantWhitespace = $true
            CheckSeparator                  = $true
            CheckParameter                  = $true
        }
    
        PSAlignAssignmentStatement                = @{
            Enable         = $true
            CheckHashtable = $true
        }
    
        #PSUseCorrectCasing                        = @{
        #    Enable = $true
        #}

        PSProvideCommentHelp = @{
            Enable = $true
            ExportedOnly = $true
            BlockComment = $true
            VSCodeSnippetCorrection = $false
            Placement = "begin"
        }
    }
}
