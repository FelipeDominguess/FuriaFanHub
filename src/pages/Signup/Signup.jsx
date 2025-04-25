import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { signupUser } from '../../services/Auth.jsX'; // Corrigi a extensão .jsX pra .jsx
import '../Signup/Signup.css';

const SignupPage = () => {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    password: '',
    favoritePlayer: 'FalleN',
    favoriteGame: 'CS:GO',
    twitch: '',
    twitter: '',
    discord: ''
  });
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = () => {
    if (!formData.name || !formData.email || !formData.password) {
      setError('Preencha os campos obrigatórios');
      return;
    }
    try {
      signupUser(formData);
      navigate('/');
    } catch (err) {
      setError(err.message);
    }
  };

  const handleBack = () => {
    navigate('/'); // Volta pra página principal
  };

  return (
    <div className="signup-page">
      <header className="signup-header">
        <img src="/images/furia_logo.png" alt="FURIA Logo" className="logo" />
      </header>
      <div className="signup-container">
        <h1 className="signup-title">Cadastro</h1>
        <div className="signup-field">
          <label className="signup-label">Nome *</label>
          <input
            name="name"
            className="signup-input"
            placeholder="Digite seu nome"
            value={formData.name}
            onChange={handleChange}
          />
        </div>
        <div className="signup-field">
          <label className="signup-label">E-mail *</label>
          <input
            name="email"
            className="signup-input"
            placeholder="Digite seu e-mail"
            value={formData.email}
            onChange={handleChange}
          />
        </div>
        <div className="signup-field">
          <label className="signup-label">Senha *</label>
          <input
            name="password"
            className="signup-input"
            placeholder="Digite sua senha"
            type="password"
            value={formData.password}
            onChange={handleChange}
          />
        </div>
        <div className="signup-field">
          <label className="signup-label">Jogador Favorito</label>
          <select
            name="favoritePlayer"
            className="signup-select"
            value={formData.favoritePlayer}
            onChange={handleChange}
          >
            <option value="FalleN">FalleN</option>
            <option value="kscerato">kscerato</option>
            <option value="yuurih">yuurih</option>
          </select>
        </div>
        <div className="signup-field">
          <label className="signup-label">Jogo Favorito</label>
          <select
            name="favoriteGame"
            className="signup-select"
            value={formData.favoriteGame}
            onChange={handleChange}
          >
            <option value="CS:GO">CS:GO</option>
            <option value="Valorant">Valorant</option>
            <option value="League of Legends">League of Legends</option>
          </select>
        </div>
        <div className="signup-field">
          <label className="signup-label">Twitch</label>
          <input
            name="twitch"
            className="signup-input"
            placeholder="twitch.tv/seuuser"
            value={formData.twitch}
            onChange={handleChange}
          />
        </div>
        <div className="signup-field">
          <label className="signup-label">Twitter</label>
          <input
            name="twitter"
            className="signup-input"
            placeholder="@seuuser"
            value={formData.twitter}
            onChange={handleChange}
          />
        </div>
        <div className="signup-field">
          <label className="signup-label">Discord</label>
          <input
            name="discord"
            className="signup-input"
            placeholder="seuuser#1234"
            value={formData.discord}
            onChange={handleChange}
          />
        </div>
        <button className="signup-button" onClick={handleSubmit}>
          Cadastrar
        </button>
        <button className="back-button" onClick={handleBack}>
          Voltar
        </button>
        {error && <p className="signup-error">{error}</p>}
      </div>
    </div>
  );
};

export default SignupPage;