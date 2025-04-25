import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { loginUser } from '../../services/Auth.jsX';
import './Login.css';

const LoginPage = () => {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [rememberMe, setRememberMe] = useState(false);
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleSubmit = () => {
    if (!username || !email || !password) {
      setError('Preencha todos os campos');
      return;
    }
    try {
      loginUser(email, password);
      if (rememberMe) {
        localStorage.setItem('rememberedUser', JSON.stringify({ email, password }));
      }
      navigate('/');
    } catch (err) {
      setError(err.message);
    }
  };

  const handleBack = () => {
    navigate('/'); // Volta pra página principal
  };

  return (
    <div className="login-page">
      <header className="login-header">
        <img src="/images/furia_logo.png" alt="FURIA Logo" className="logo" />
      </header>
      <div className="login-container">
        <h1 className="login-title">Login ou Inscrição</h1>
        <div className="login-field">
          <label className="login-label">Nome de usuário</label>
          <input
            className="login-input"
            placeholder="Digite seu nome de usuário"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </div>
        <div className="login-field">
          <label className="login-label">Email</label>
          <input
            className="login-input"
            placeholder="Digite seu email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </div>
        <div className="login-field">
          <label className="login-label">Senha</label>
          <input
            className="login-input"
            placeholder="Digite sua senha"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        <div className="login-remember">
          <label className="login-label remember-label">
            <input
              type="checkbox"
              checked={rememberMe}
              onChange={(e) => setRememberMe(e.target.checked)}
            />
            <span className="custom-checkbox"></span>
            Lembrar senha
          </label>
          <Link to="/forgot-password" className="forgot-password">
            Esqueceu sua senha?
          </Link>
        </div>
        <button className="login-button" onClick={handleSubmit}>
          Entrar
        </button>
        
        <button className="back-button" onClick={handleBack}>
          Voltar
        </button>
        {error && <p className="login-error">{error}</p>}
      </div>
    </div>
  );
};

export default LoginPage;