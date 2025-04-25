import React from 'react';
import { Link } from 'react-router-dom';
import './LadingPage.css';

const LandingPage = () => (
  <div className="landing-container">
    <header className="header">
      <img src="/images/furia_logo.png" alt="FURIA Logo" className="logo" />
      <nav className="nav">
        <Link to="/login" className="button">Login</Link>
        <Link to="/signup" className="button">Cadastro</Link>
      </nav>
    </header>
    <section className="hero">
      <h1 className="title">Fale com o FURIOSO Bot!</h1>
      
    </section>
    <div className="card chatbot-placeholder">
      Chatbot em construção...
    </div>
  </div>
);

export default LandingPage;