Get-Module BeExceptional | Remove-Module -Force

Import-Module BeExceptional -Force

InModuleScope BeExceptional {

    Describe "public\New-MessageProvider" {

        Get-Item -ErrorAction Stop -Path ..\Mocks.ps1 | ForEach-Object { . $_.Fullname }

        It "ConfigDataByHashTable - Creates a [MessageProvider] from a [hashtable]" {

            $configuration = @{

                PushSensor = @{

                    ProviderType = 'PRTGBasicHttpPushSensorProvider'

                    HostName     = 'prtg.domain.com'

                    UseSSL       = $false

                    Token        = 'TestHttpBasicSensor'

                }

            }

            $params = @{

                Configuration = $configuration

                ErrorAction   = 'Stop'

            }

            $provider = BeExceptional\New-MessageProvider @params

            ($provider.PushSensor.GetType()).BaseType | Should -BeExactly 'MessageProvider'

        }

        It "ConfigDataByFile - Creates a [MessageProvider] from file" {

            $providers = BeExceptional\New-MessageProvider -Path ..\Providers.psd1 -ErrorAction Stop

            ($providers['ExamplePRTGBasicPushSensor'].GetType()).BaseType | Should -BeExactly 'MessageProvider'

        }

    }

}
