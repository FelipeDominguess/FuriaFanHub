# FURIA Fan Hub

Bem-vindo ao **FURIA Fan Hub**, uma landing page React com chatbot conversacional que leva a paixão pelo time de CS da FURIA pro próximo nível! 🎮 Criado pro **Challenge #1** da FURIA, este projeto entrega uma experiência interativa com comandos como “próximo jogo” e “quiz”, além de um cadastro opcional (**Challenge #2**) pra personalizar a vibe. Com design na paleta FURIA (preto `#1C2526`, branco `#FFFFFF`, laranja `#F04E23`) e tom “GG WP!”, é pra fã nenhum botar defeito!

## O que a Aplicação Faz
O **FURIA Fan Hub** é uma web app que conecta fãs ao universo da FURIA com:
- **Chatbot Conversacional** (Challenge #1):
  - **Comandos**:
    - “próximo jogo”: Exibe o próximo confronto da FURIA (ex.: “FURIA x MIBR, 10/05/2025, 19:00”).
    - “quiz”: Perguntas sobre o time (ex.: “Quem é o AWPer da FURIA?”).
    - Resposta padrão: “Comando inválido, FURIOSO! Tenta de novo!”.
  - **Extras**: Links pra loja.furia.gg, frases gamer (“Rush B!”).
  - Dados: JSON local (`public/data/games.json`) ou PandaScore API (opcional).
- **Cadastro e Perfil** (Challenge #2, opcional):
  - Formulário: Nome, jogador favorito (FalleN, KSCERATO, yuurih), jogo (CS:GO, Valorant), skin favorita.
  - Personalização: Chat sugere conteúdo (ex.: “Fã do FalleN? Veja twitch.tv/furia!”).
- **Landing Page**:
  - **Header**: Logo FURIA, botão “Iniciar Chat”.
  - **Hero**: Banner do time de CS, texto “Fale com o FURIOSO Bot!”.
  - **Chatbot**: Janela expansível com `react-chatbot-kit`.
  - **Footer**: Links pra loja, Twitch, e redes sociais.

## Tecnologias Utilizadas
- **Frontend**:
  - **React (Vite)**: Framework pra landing page e componentes, rápido e escalável.
  - **react-chatbot-kit**: Interface de chat com balões e input, ideal pro chatbot conversacional.
  - **styled-components**: Estilização com paleta FURIA (preto, laranja, branco) e design responsivo.
  - **react-router-dom**: Navegação entre landing e perfil (se implementado).
  - **react-lazy-load**: Otimização de imagens (ex.: banner do time).
- **Backend/Dados**:
  - **Firebase Authentication**: Login/cadastro com e-mail/senha (Challenge #2).
  - **Firebase Firestore**: Banco NoSQL pra salvar preferências de usuários.
  - **PandaScore API** (opcional): Dados reais de jogos via `/csgo/matches/upcoming`.
  - **axios**: Chamadas HTTP pra PandaScore, com cache em `localStorage`.
  - **JSON Local**: `public/data/games.json` pra respostas robustas do chatbot.
- **Testes e Qualidade**:
  - **Jest + React Testing Library**: Testes unitários TDD (ex.: “Chatbot renderiza mensagem inicial”).
  - **msw**: Mock de APIs pra testes.
  - **ESLint + Prettier**: Consistência de código e formatação.
- **Outros**:
  - **Netlify**: Deploy rápido e contínuo.
  - **Git/GitHub**: Versionamento com commits claros.
  - **Figma**: Mockup da UI (header, hero, chatbot).
  - **Perplexity**: Suporte pra quiz (ex.: perguntas sobre CS:GO) e debug.

## Por que Escolhemos Essas Tecnologias?
- **React (Vite)**:
  - Alinhamento com a vaga: React é um diferencial explícito, mostrando adaptação à stack da FURIA.
  - Produtividade: Minha experiência em React garantiu um MVP polido em 11 dias.
  - Velocidade: Vite oferece inicialização e HMR rápidos, ideal pro prazo (23/04 a 04/05/2025).
- **react-chatbot-kit**:
  - Simplicidade pra criar um chat interativo, permitindo foco na lógica conversacional.
  - Integração nativa com React, reduzindo curva de aprendizado.
- **Firebase**:
  - Familiaridade, sugerido pela FURIA, e rápido pra configurar Authentication/Firestore.
  - Alternativa (Airtable) foi considerada, mas Firebase é mais robusto pra auth e escalabilidade.
- **PandaScore API** (opcional):
  - Diferencial pro desafio, mostrando habilidade com APIs externas.
  - JSON local como fallback garante robustez.
- **Jest e TDD**:
  - Garante qualidade com testes unitários (ex.: “LandingPage renderiza hero”).
  - Prática consolidada em projetos anteriores.
- **Netlify**:
  - Deploy simples, sugerido pela FURIA, com integração GitHub.
- **Por que Web (React vs. Flutter)?**:
  - Considerei Flutter, mas React atende melhor o formato de web chat, acessível pros avaliadores e otimizado pra Netlify.
  - UI com vibe gamer (cores FURIA, tom “GG WP!”) engaja fãs.

## Como Baixar e Rodar Localmente
1. Clone o Repositório:
   ```bash
   git clone https://github.com/<seu-user>/furia-fan-hub.git
   cd furia-fan-hub
   ```
2. Instale Dependências:
   ```bash
   npm install
   ```
3. Configure Firebase (se usar cadastro, Challenge #2):
   - Crie um projeto no [Firebase Console](https://console.firebase.google.com).
   - Copie as credenciais e adicione em `.env` na raiz:
     ```
     VITE_FIREBASE_API_KEY=xxx
     VITE_FIREBASE_AUTH_DOMAIN=xxx
     VITE_FIREBASE_PROJECT_ID=xxx
     VITE_FIREBASE_STORAGE_BUCKET=xxx
     VITE_FIREBASE_MESSAGING_SENDER_ID=xxx
     VITE_FIREBASE_APP_ID=xxx
     ```
4. Configure PandaScore (se usar API):
   - Obtenha uma chave grátis em [pandascore.co](https://pandascore.co).
   - Adicione em `.env`:
     ```
     VITE_PANDASCORE_API_KEY=xxx
     ```
5. Rode Localmente:
   ```bash
   npm start
   ```
   - Abre `http://localhost:5173` com a landing page.
6. Execute Testes:
   ```bash
   npm test
   ```
7. Formate o Código:
   ```bash
   npm run format
   ```
8. Linting:
   ```bash
   npm run lint
   ```

## Possíveis Extensões Além do Desafio
Além do **Challenge #1** (chatbot) e **Challenge #2** (cadastro), podemos implementar:
- **Quiz Interativo**:
  - Múltiplas perguntas (ex.: “Qual o Major que a FURIA chegou às quartas?”).
  - Pontuação salva no Firestore ou localStorage.
  - Recompensas virtuais (ex.: “Você é nível KSCERATO!”).
- **Integração com Twitch**:
  - Chatbot exibe status da live (ex.: “twitch.tv/furia tá ON!”) via Twitch API.
  - Sugestões baseadas no perfil (ex.: “Fã do yuurih? Ele tá na live!”).
- **Notificações de Jogos**:
  - Push notifications via Firebase Cloud Messaging (ex.: “FURIA x MIBR em 1h!”).
- **Galeria de Highlights**:
  - Vídeos de jogadas icônicas (ex.: clutch do FalleN) via YouTube API ou JSON.
  - Lazy loading com `react-lazy-load`.
- **Gamificação**:
  - “FURIOSO Points” por interagir com o chatbot.
  - Ranking de fãs no Firestore (ex.: “Top FURIOSOS”).
- **Multilíngue**:
  - Suporte a inglês/português (ex.: “Next game”).
  - Usa `i18next` pra atrair fãs globais.
- **Analytics**:
  - Firebase Analytics pra rastrear comandos populares.
  - Insights pra melhorar o chatbot.

## Desenvolvimento
- **Cronograma** (23/04 a 04/05/2025):
  - **23/04**: Criar repositório, automatizar arquitetura, mockup (Figma).
  - **24-26/04**: Landing page com header, hero, e esboço do chatbot.
  - **27-28/04**: Chatbot com `react-chatbot-kit` e JSON local.
  - **29/04**: Integração com PandaScore, quiz, e links extras.
  - **30/04**: Cadastro/perfil com Firebase (opcional).
  - **01/05**: Documentação (README, diagrama Draw.io).
  - **02/05**: Vídeo explicativo (OBS, CapCut).
  - **03/05**: Deploy no Netlify, testes finais.
  - **04/05**: Margem pra ajustes e envio.
- **Estrutura Técnica**:
  - **MVVM Adaptado**: Models (`GameModel`, `UserModel`), Views (componentes), ViewModels (hooks).
  - **Automação**: Script `setup-structure.sh` cria/verifica/exclui a arquitetura.
  - **Pastas**:
    - `public/`: Logo FURIA, `games.json`.
    - `src/assets/`: Tema (cores FURIA).
    - `src/components/`: `Chatbot.jsx`, `GameCard.jsx`.
    - `src/pages/`: `LandingPage.jsx`, `ProfilePage.jsx` (opcional).
    - `src/hooks/`: `useChatbot.js`, `useAuth.js`.
    - `src/services/`: `GameService.js` (JSON, PandaScore), `AuthService.js` (Firebase).
    - `src/models/`: `GameModel.js`, `UserModel.js`.
    - `tests/`: Testes TDD (Jest).

## Créditos
Desenvolvido com paixão por e-sports e pela FURIA, inspirado nos clutches épicos do time desde o Major 2019. Este projeto reflete minha experiência em React e vontade de contribuir com a comunidade gamer. **Bora dar GG com a FURIA!** 🎮

---

**Fã da FURIA? Teste o chatbot e sinta a energia do #FURIOSO!**