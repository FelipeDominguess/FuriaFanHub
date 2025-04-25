import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import LandingPage from './pages/LadingPage/LandingPage'; // Corrigido o typo
import LoginPage from './pages/Login/Login'; // Ajuste o caminho conforme sua estrutura
import SignupPage from './pages/Signup/Signup'; // Ajuste o caminho conforme sua estrutura

const App = () => (
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<LandingPage />} />
      <Route path="/login" element={<LoginPage />} />
      <Route path="/signup" element={<SignupPage />} />
    </Routes>
  </BrowserRouter>
);

export default App;