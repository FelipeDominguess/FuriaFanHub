#!/bin/bash

set -x # Debug: mostra cada comando executado

echo "Criando arquitetura do FURIA Fan Hub..."

# Excluir pastas da arquitetura, se existirem
for dir in src/assets src/components src/pages src/hooks src/services src/models tests/components tests/hooks tests/services public/images public/data; do
  if [ -d "$dir" ]; then
    rm -rf "$dir"
    echo "Excluiu $dir"
  fi
done

# Excluir arquivos da arquitetura, se existirem
for file in src/App.jsx src/index.js src/index.css src/assets/theme.js \
  src/components/Chatbot.jsx src/components/GameCard.jsx \
  src/pages/LandingPage.jsx src/pages/ProfilePage.jsx \
  src/hooks/useChatbot.js src/hooks/useAuth.js \
  src/services/GameService.js src/services/AuthService.js \
  src/models/GameModel.js src/models/UserModel.js \
  tests/components/Chatbot.test.js tests/components/GameCard.test.js \
  tests/hooks/useChatbot.test.js tests/hooks/useAuth.test.js \
  tests/services/GameService.test.js tests/services/AuthService.test.js \
  public/data/games.json; do
  if [ -f "$file" ]; then
    rm -f "$file"
    echo "Excluiu $file"
  fi
done

# Criar pastas
mkdir -p src/assets src/components src/pages src/hooks src/services src/models tests/components tests/hooks tests/services public/images public/data
echo "Pastas criadas"

# Criar arquivos com conteúdo inicial
echo "export const theme = {" > src/assets/theme.js
echo "  colors: {" >> src/assets/theme.js
echo "    primary: '#F04E23', // Laranja FURIA" >> src/assets/theme.js
echo "    background: '#1C2526', // Preto FURIA" >> src/assets/theme.js
echo "    text: '#FFFFFF' // Branco" >> src/assets/theme.js
echo "  }" >> src/assets/theme.js
echo "};" >> src/assets/theme.js

echo "import React from 'react';" > src/components/Chatbot.jsx
echo "const Chatbot = () => <div>Chatbot Placeholder</div>;" >> src/components/Chatbot.jsx
echo "export default Chatbot;" >> src/components/Chatbot.jsx

echo "import React from 'react';" > src/components/GameCard.jsx
echo "const GameCard = () => <div>GameCard Placeholder</div>;" >> src/components/GameCard.jsx
echo "export default GameCard;" >> src/components/GameCard.jsx

echo "import React from 'react';" > src/pages/LandingPage.jsx
echo "const LandingPage = () => <div>LandingPage Placeholder</div>;" >> src/pages/LandingPage.jsx
echo "export default LandingPage;" >> src/pages/LandingPage.jsx

echo "import React from 'react';" > src/pages/ProfilePage.jsx
echo "const ProfilePage = () => <div>ProfilePage Placeholder</div>;" >> src/pages/ProfilePage.jsx
echo "export default ProfilePage;" >> src/pages/ProfilePage.jsx

echo "const useChatbot = () => ({});" > src/hooks/useChatbot.js
echo "export default useChatbot;" >> src/hooks/useChatbot.js

echo "const useAuth = () => ({});" > src/hooks/useAuth.js
echo "export default useAuth;" >> src/hooks/useAuth.js

echo "const GameService = {};" > src/services/GameService.js
echo "export default GameService;" >> src/services/GameService.js

echo "const AuthService = {};" > src/services/AuthService.js
echo "export default AuthService;" >> src/services/AuthService.js

echo "export const GameModel = {};" > src/models/GameModel.js

echo "export const UserModel = {};" > src/models/UserModel.js

echo "import React from 'react';" > src/App.jsx
echo "import LandingPage from './pages/LandingPage.jsx';" >> src/App.jsx
echo "const App = () => <LandingPage />;" >> src/App.jsx
echo "export default App;" >> src/App.jsx

echo "import React from 'react';" > src/index.js
echo "import ReactDOM from 'react-dom/client';" >> src/index.js
echo "import App from './App.jsx';" >> src/index.js
echo "import './index.css';" >> src/index.js
echo "const root = ReactDOM.createRoot(document.getElementById('root'));" >> src/index.js
echo "root.render(<React.StrictMode><App /></React.StrictMode>);" >> src/index.js

echo "body {" > src/index.css
echo "  margin: 0;" >> src/index.css
echo "  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;" >> src/index.css
echo "  background-color: #1C2526; /* Preto FURIA */" >> src/index.css
echo "  color: #FFFFFF; /* Branco */" >> src/index.css
echo "}" >> src/index.css

# Criar arquivos de teste (vazios por enquanto)
touch tests/components/Chatbot.test.js
touch tests/components/GameCard.test.js
touch tests/hooks/useChatbot.test.js
touch tests/hooks/useAuth.test.js
touch tests/services/GameService.test.js
touch tests/services/AuthService.test.js

# Criar games.json
echo "[" > public/data/games.json
echo "  {\"command\": \"próximo jogo\", \"response\": \"FURIA x MIBR, 10/05/2025, 19:00\"}," >> public/data/games.json
echo "  {\"command\": \"quiz\", \"response\": \"Quem é o AWPer da FURIA? Digite o nome!\"}" >> public/data/games.json
echo "]" >> public/data/games.json

echo "Arquitetura criada com sucesso!"