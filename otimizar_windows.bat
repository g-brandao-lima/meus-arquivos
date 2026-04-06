@echo off
:: =============================================================================
:: OTIMIZACAO WINDOWS 11 - Gustavo Brandao
:: Baseado nas configuracoes coletadas em 05/04/2026
:: Rodar como ADMINISTRADOR
:: =============================================================================

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Execute este script como Administrador!
    echo Clique direito no arquivo e selecione "Executar como administrador"
    pause
    exit /b 1
)

echo.
echo ============================================
echo   OTIMIZACAO WINDOWS 11 - Gustavo Brandao
echo ============================================
echo.

:: =============================================================================
:: 1. SERVICOS - Desativar servicos desnecessarios
:: =============================================================================
echo [1/8] Desativando servicos desnecessarios...

:: Telemetria Microsoft (coleta de dados de uso)
sc config DiagTrack start= disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
echo   - DiagTrack (telemetria): desativado

:: Fila de impressao (reativar se usar impressora)
sc config Spooler start= disabled >nul 2>&1
sc stop Spooler >nul 2>&1
echo   - Spooler (impressao): desativado

:: Mapas offline
sc config MapsBroker start= disabled >nul 2>&1
sc stop MapsBroker >nul 2>&1
echo   - MapsBroker (mapas offline): desativado

:: Compartilhamento de internet
sc config SharedAccess start= disabled >nul 2>&1
sc stop SharedAccess >nul 2>&1
echo   - SharedAccess (compartilhamento internet): desativado

:: Fax
sc config Fax start= disabled >nul 2>&1
echo   - Fax: desativado

:: Push de telemetria
sc config dmwappushservice start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
echo   - dmwappushservice (push telemetria): desativado

:: Servicos Xbox (descomente se nao usa Xbox)
:: sc config XblAuthManager start= disabled >nul 2>&1
:: sc config XblGameSave start= disabled >nul 2>&1
:: sc config XboxGipSvc start= disabled >nul 2>&1
:: sc config XboxNetApiSvc start= disabled >nul 2>&1
:: echo   - Servicos Xbox: desativados

:: Pagamentos NFC
sc config SEMgrSvc start= disabled >nul 2>&1
echo   - SEMgrSvc (pagamentos NFC): desativado

:: Controle parental
sc config WpcMonSvc start= disabled >nul 2>&1
echo   - WpcMonSvc (controle parental): desativado

:: Biometria (descomente se nao usa leitor de digital/facial)
:: sc config WbioSrvc start= disabled >nul 2>&1
:: echo   - WbioSrvc (biometria): desativado

:: Telefonia
sc config PhoneSvc start= disabled >nul 2>&1
echo   - PhoneSvc (telefonia): desativado

:: Windows Media Player sharing
sc config WMPNetworkSvc start= disabled >nul 2>&1
echo   - WMPNetworkSvc (WMP sharing): desativado

:: Carteira digital
sc config WalletService start= disabled >nul 2>&1
echo   - WalletService (carteira digital): desativado

:: Hotspot movel
sc config icssvc start= disabled >nul 2>&1
echo   - icssvc (hotspot movel): desativado

:: Modo demonstracao loja
sc config RetailDemo start= disabled >nul 2>&1
echo   - RetailDemo (modo loja): desativado

:: Scanner/Webcam antigos
sc config stisvc start= disabled >nul 2>&1
sc config WiaRpc start= disabled >nul 2>&1
sc config FrameServer start= disabled >nul 2>&1
echo   - stisvc/WiaRpc/FrameServer (scanner/webcam legado): desativados

echo   [OK] Servicos configurados
echo.

:: =============================================================================
:: 2. PRIVACIDADE - Desativar coleta de dados e anuncios
:: =============================================================================
echo [2/8] Configurando privacidade...

:: Desativar ID de publicidade
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   - ID de publicidade: desativado

:: Desativar apps em background
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul 2>&1
echo   - Apps em background: desativados

:: Desativar notificacoes toast
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Notificacoes toast: desativadas

:: Desativar instalacao silenciosa de apps sugeridos
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Instalacao silenciosa de apps: desativada

:: Desativar sugestoes e dicas do Windows
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-310093Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353698Enabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Sugestoes e dicas do Windows: desativadas

:: Desativar Bing no menu Iniciar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Bing na busca do menu Iniciar: desativado

:: Telemetria nivel minimo
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Telemetria: nivel minimo

echo   [OK] Privacidade configurada
echo.

:: =============================================================================
:: 3. INTERFACE - Limpar taskbar e explorer
:: =============================================================================
echo [3/8] Otimizando interface...

:: Desativar animacoes da taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Animacoes da taskbar: desativadas

:: Esconder botao Task View
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Botao Task View: escondido

:: Esconder botao Copilot
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Botao Copilot: escondido

:: Esconder data na taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Data na taskbar: escondida

:: Mostrar extensoes de arquivo
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Extensoes de arquivo: visiveis

:: Esconder barra de pesquisa (so icone ou nada)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Barra de pesquisa: escondida

:: Efeitos visuais customizados
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 3 /f >nul 2>&1
echo   - Efeitos visuais: modo customizado

:: Tema escuro
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Tema escuro: ativado

echo   [OK] Interface configurada
echo.

:: =============================================================================
:: 4. GAMING - Desativar Game Bar/DVR (mantem Game Mode)
:: =============================================================================
echo [4/8] Configurando gaming...

:: Desativar Game DVR (gravacao em background)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Game DVR (gravacao background): desativado

:: Game Mode auto desativado
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 0 /f >nul 2>&1
echo   - Game Mode automatico: desativado

echo   [OK] Gaming configurado
echo.

:: =============================================================================
:: 5. ENERGIA - Plano de alto desempenho
:: =============================================================================
echo [5/8] Configurando energia...

:: Ativar plano Alto Desempenho
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo   - Plano Alto Desempenho: ativado

:: Desativar hibernacao (libera ~12GB no SSD)
powercfg /hibernate off >nul 2>&1
echo   - Hibernacao: desativada

echo   [OK] Energia configurada
echo.

:: =============================================================================
:: 6. BLOATWARE - Remover apps pre-instalados
:: =============================================================================
echo [6/8] Removendo bloatware...

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$apps = @('Microsoft.GetHelp','MicrosoftCorporationII.QuickAssist','Microsoft.MicrosoftOfficeHub','Microsoft.BingNews','Microsoft.BingWeather','Microsoft.MicrosoftSolitaireCollection','Microsoft.MixedReality.Portal','Microsoft.People','Microsoft.Print3D','Microsoft.SkypeApp','Microsoft.WindowsMaps','Microsoft.ZuneMusic','Microsoft.ZuneVideo','Clipchamp.Clipchamp','Microsoft.549981C3F5F10','Microsoft.YourPhone','MicrosoftTeams','Microsoft.Getstarted'); foreach ($a in $apps) { Get-AppxPackage -Name *$a* -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue; if ($?) { Write-Host ('  - {0}: removido' -f $a) } }"

echo   [OK] Bloatware removido
echo.

:: =============================================================================
:: 7. STARTUP - Limpar itens de inicializacao
:: =============================================================================
echo [7/8] Limpando startup...

:: Remover iTunesHelper (se existir)
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v iTunesHelper /f >nul 2>&1
echo   - iTunesHelper: removido (se existia)

:: Remover LGHUB (se existir)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v LGHUB /f >nul 2>&1
echo   - LGHUB: removido (se existia)

:: Remover TRIGGERcmd Agent do startup folder (se existir)
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\TRIGGERcmd Agent.lnk" >nul 2>&1
echo   - TRIGGERcmd Agent: removido (se existia)

echo   [OK] Startup limpo
echo.

:: =============================================================================
:: 8. LIMPEZA - Arquivos temporarios
:: =============================================================================
echo [8/8] Limpando arquivos temporarios...

:: Limpar temp do usuario (arquivos com +30 dias)
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$cutoff = (Get-Date).AddDays(-30); $old = Get-ChildItem $env:TEMP -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt $cutoff }; $size = [math]::Round(($old | Measure-Object Length -Sum).Sum/1MB, 0); $old | Remove-Item -Force -ErrorAction SilentlyContinue; Write-Host ('  - Temp limpo: {0}MB liberados' -f $size)"

:: Limpar temp do Windows
del /q /f "%WINDIR%\Temp\*" >nul 2>&1
echo   - Windows Temp: limpo

:: Esvaziar lixeira
powershell -NoProfile -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo   - Lixeira: esvaziada

echo   [OK] Limpeza concluida
echo.

:: =============================================================================
:: FINALIZADO
:: =============================================================================
echo ============================================
echo   OTIMIZACAO CONCLUIDA!
echo ============================================
echo.
echo   Recomendacoes pos-execucao:
echo   - Reinicie o computador para aplicar tudo
echo   - Malwarebytes: desativar inicio automatico
echo     no proprio app (Configuracoes - Geral)
echo   - Windows Update: verificar updates pendentes
echo     (Configuracoes - Windows Update)
echo.
echo   Servicos mantidos intencionalmente:
echo   - SysMain (gerenciamento de memoria)
echo   - TrkWks (rastreamento de atalhos)
echo   - lfsvc (geolocalizacao)
echo   - WSearch (indexacao de busca)
echo.
pause
