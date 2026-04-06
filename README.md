# Config Windows Otimizado

Script `.bat` para otimizar o Windows 11 em uma unica execucao. Remove bloatware, desativa servicos desnecessarios, configura privacidade e limpa arquivos temporarios.

Testado no Windows 11 Pro (build 26200+).

## Como usar

1. Baixe o arquivo `otimizar_windows.bat`
2. Clique direito > **Executar como administrador**
3. Aguarde a execucao (leva ~30 segundos)
4. Reinicie o computador

> O script verifica automaticamente se esta rodando como admin. Se nao estiver, avisa e encerra.

---

## O que o script faz

### 1. Servicos desativados

Servicos do Windows que rodam em background consumindo RAM e CPU sem necessidade para a maioria dos usuarios.

| Servico | O que faz | Por que desativar |
|---------|-----------|-------------------|
| **DiagTrack** | Coleta dados de uso e envia para a Microsoft (telemetria) | Consome CPU, disco e rede constantemente enviando dados que nao beneficiam o usuario |
| **Spooler** | Gerencia a fila de impressao | Desnecessario se voce nao usa impressora. Consome ~26MB de RAM parado. Reative se precisar imprimir |
| **MapsBroker** | Baixa e gerencia mapas offline do app Mapas do Windows | Ninguem usa o app Mapas do Windows - todo mundo usa Google Maps no celular |
| **SharedAccess** | Transforma o PC em roteador, compartilhando internet com outros dispositivos | Voce ja tem um roteador Wi-Fi. Esse servico fica rodando atoa |
| **Fax** | Servico de envio e recebimento de fax | Fax em 2026. Proximo |
| **dmwappushservice** | Envia dados de telemetria via push para a Microsoft | Complemento do DiagTrack - mesma coleta de dados, outro canal |
| **SEMgrSvc** | Gerencia pagamentos por NFC no PC | PCs desktop nao tem NFC. Mesmo notebooks raramente usam isso |
| **WpcMonSvc** | Controle parental - monitora e restringe uso do PC por criancas | Se voce nao tem criancas usando o PC, e peso morto |
| **PhoneSvc** | Servico de telefonia do Windows | Heranca de quando o Windows tentou ser plataforma mobile. Nao faz nada util |
| **WMPNetworkSvc** | Compartilha biblioteca do Windows Media Player na rede local | O Windows Media Player ja e obsoleto. Ninguem compartilha musica por ele |
| **WalletService** | Carteira digital do Windows para pagamentos | Nunca decolou. Nao e usado por nenhum servico relevante |
| **icssvc** | Hotspot movel - compartilha internet via Wi-Fi do PC | Em desktop nao faz sentido. Em notebook, reative se precisar |
| **RetailDemo** | Modo demonstracao de loja - aquele modo que roda nos PCs de vitrine | Voce nao e um PC de vitrine da Best Buy |
| **stisvc** | Servico de captura de imagem para scanners antigos | Scanners modernos trazem drivers proprios |
| **WiaRpc** | Protocolo de comunicacao com scanners/cameras via WIA | Complemento do stisvc - mesmo caso |
| **FrameServer** | Compartilha webcam entre multiplos apps simultaneamente | Raramente necessario. Se precisar, reative |

**Servicos opcionais (comentados no script - descomente se quiser):**

| Servico | O que faz | Quando desativar |
|---------|-----------|------------------|
| XblAuthManager | Autenticacao Xbox Live | Se nao joga no PC com conta Xbox |
| XblGameSave | Sincronizacao de saves na nuvem Xbox | Se nao usa Xbox Game Pass |
| XboxGipSvc | Gerenciamento de acessorios Xbox | Se nao usa controle Xbox |
| XboxNetApiSvc | Rede Xbox Live | Se nao joga online via Xbox |
| WbioSrvc | Leitura biometrica (digital, facial) | Se nao usa Windows Hello |

### 2. Privacidade

Configuracoes de registro que controlam o que o Windows coleta e exibe.

| Configuracao | O que faz | Por que desativar |
|--------------|-----------|-------------------|
| **ID de publicidade** | Cria um identificador unico seu para anuncios personalizados | Voce nao precisa de um ID de rastreamento no seu proprio PC |
| **Apps em background** | Permite que apps da Microsoft Store rodem mesmo fechados | Consome RAM e CPU com apps que voce nem sabe que estao abertos |
| **Notificacoes toast** | Popups de notificacao no canto da tela | Distraem e consomem recursos do sistema de notificacao |
| **Instalacao silenciosa de apps** | O Windows instala apps "sugeridos" sozinho (Candy Crush, Spotify, etc) | Voce abre o menu Iniciar e tem apps que nunca instalou. E isso |
| **Sugestoes e dicas** | Dicas do Windows que aparecem na tela de bloqueio e no Iniciar | Anuncios disfarados de "dicas". Consome recursos pra exibir conteudo promocional |
| **Bing no Iniciar** | Busca do menu Iniciar envia suas pesquisas pro Bing | Voce quer achar um programa local, nao fazer busca na internet |
| **Telemetria (nivel minimo)** | Quantidade de dados de uso enviados a Microsoft | O nivel padrao envia dados detalhados. O minimo envia so o essencial pro Windows funcionar |

### 3. Interface

Ajustes visuais na taskbar e Explorer para um desktop mais limpo.

| Configuracao | O que faz |
|--------------|-----------|
| **Animacoes da taskbar** | Remove animacoes ao minimizar/maximizar janelas. Resposta mais rapida |
| **Botao Task View** | Remove o botao de areas de trabalho virtuais da taskbar (Win+Tab continua funcionando) |
| **Botao Copilot** | Remove o botao do Copilot da taskbar |
| **Data na taskbar** | Esconde a data no relogio (so hora). Mais espaco na taskbar |
| **Extensoes de arquivo** | Mostra `.pdf`, `.exe`, `.txt` nos nomes de arquivo. Essencial pra quem trabalha com arquivos |
| **Barra de pesquisa** | Remove a barra de pesquisa da taskbar (Win+S continua funcionando) |
| **Efeitos visuais** | Modo customizado - mantem os efeitos uteis, remove os cosmeticos |
| **Tema escuro** | Ativa tema escuro no sistema e apps. Menos cansaco visual |

### 4. Gaming

| Configuracao | O que faz | Por que desativar |
|--------------|-----------|-------------------|
| **Game DVR** | Grava gameplay em background o tempo todo, mesmo sem voce pedir | Consome CPU, GPU e disco constantemente. Se quiser gravar, use OBS |
| **Game Mode automatico** | Detecta jogos e altera prioridade de processos | Pode causar instabilidade em alguns jogos. Melhor gerenciar manualmente |

### 5. Energia

| Configuracao | O que faz |
|--------------|-----------|
| **Alto Desempenho** | Plano de energia que prioriza performance em vez de economia. CPU roda na frequencia maxima |
| **Hibernacao desativada** | Remove o arquivo `hiberfil.sys` (~12GB no SSD). Hibernacao salva o estado da RAM no disco pra retomar depois - se voce so desliga/liga o PC, nao precisa |

### 6. Bloatware removido

Apps pre-instalados que vem com o Windows e quase ninguem usa.

| App | O que faz | Por que remover |
|-----|-----------|-----------------|
| **GetHelp** | Chat de ajuda da Microsoft (~248MB) | Ninguem usa. Se precisar de ajuda, vai no Google |
| **QuickAssist** | Assistencia remota (tipo TeamViewer simplificado) | Se nunca usou pra dar/receber suporte remoto, nao precisa |
| **MicrosoftOfficeHub** | Atalho pro Office online (~261MB) | Nao e o Office de verdade, e so um atalho. Se usa Office, ja tem ele instalado |
| **BingNews** | App de noticias do Bing | Ninguem le noticias por app do Windows |
| **BingWeather** | App de clima do Bing | Voce olha o clima no celular |
| **Solitaire Collection** | Jogos de carta | Vem com anuncios e pede assinatura |
| **Mixed Reality Portal** | Portal de realidade virtual/mista | Se voce nao tem um headset VR, sao MBs desperdicados |
| **People** | App de contatos | Nao sincroniza com nada util |
| **Print 3D** | Editor de modelos 3D para impressoras 3D | Se voce nao tem impressora 3D... |
| **Skype** | Skype pre-instalado | Obsoleto. Todo mundo usa Teams, Discord ou Zoom |
| **Windows Maps** | App de mapas offline | Google Maps no navegador e melhor |
| **Zune Music** | Groove Music / Media Player moderno | Voce usa Spotify, YouTube Music ou outro |
| **Zune Video** | Player de video do Windows | VLC existe |
| **Clipchamp** | Editor de video da Microsoft | Se voce ja tem um editor de video, esse e redundante |
| **Cortana** | Assistente virtual da Microsoft | Descontinuada pela propria Microsoft |
| **Your Phone** | Vinculo com celular Android | Se voce nao conecta o celular ao PC, e peso morto |
| **Teams (consumer)** | Versao pessoal do Teams | Se ja usa Teams pelo trabalho, essa versao pessoal duplica processos |
| **Get Started** | Tutorial de boas-vindas do Windows | Voce ja sabe usar o Windows |

### 7. Startup limpo

Programas removidos da inicializacao automatica.

| Programa | Por que remover |
|----------|-----------------|
| **iTunesHelper** | Fica esperando voce conectar um iPhone. Se nao conecta todo dia, abra o iTunes manualmente |
| **LGHUB** | Logitech G Hub - gerencia perfis de periferico. So precisa se troca perfis frequentemente. Abra na mao quando precisar |
| **TRIGGERcmd Agent** | Permite controle remoto do PC via web/Alexa. Se nao usa, e um processo a toa |

### 8. Limpeza

| Acao | O que limpa |
|------|-------------|
| **Temp do usuario** | Arquivos temporarios com mais de 30 dias. Caches expirados, logs antigos, instaladores usados |
| **Temp do Windows** | Arquivos temporarios do sistema |
| **Lixeira** | Esvazia completamente |

---

## Servicos mantidos intencionalmente

Estes servicos foram avaliados e **mantidos ativos** por serem uteis:

| Servico | O que faz | Por que manter |
|---------|-----------|----------------|
| **SysMain** | Gerencia memoria RAM em conjunto com Pagefile e Prefetch | Fundamental para o desempenho mesmo com SSD. Desativar causa aumento no uso do pagefile e pode gerar erros de memoria |
| **TrkWks** | Atualiza atalhos quando arquivos sao movidos entre unidades | Previne atalhos quebrados na area de trabalho |
| **lfsvc** | Geolocalizacao para apps e navegador | Necessario se usa apps que dependem de localizacao |
| **WSearch** | Indexacao de busca do Windows | Faz a busca no menu Iniciar e no Explorer funcionar rapido |

---

## Como reverter

Cada secao pode ser revertida individualmente:

**Servicos:** Troque `disabled` por `auto` e `stop` por `start`:
```bat
sc config DiagTrack start= auto
sc start DiagTrack
```

**Registro:** Troque `/d 0` por `/d 1` (ou vice-versa) no comando `reg add` correspondente.

**Bloatware:** Reinstale pela Microsoft Store.

**Startup:** Adicione novamente pelo Gerenciador de Tarefas > Inicializacao.

---

## Requisitos

- Windows 11 (testado no Pro, deve funcionar no Home)
- Executar como administrador
- Reiniciar apos execucao

## Licenca

MIT - use, modifique e compartilhe como quiser.
