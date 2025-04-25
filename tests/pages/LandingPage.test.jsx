import { render, screen } from '@testing-library/react';
import { MemoryRouter } from 'react-router-dom';
import LandingPage from '../components/LandingPage';

describe('LandingPage Component', () => {
  test('renderiza header com logo, login e cadastro', () => {
    render(
      <MemoryRouter>
        <LandingPage />
      </MemoryRouter>
    );
    expect(screen.getByAltText(/furia logo/i)).toBeInTheDocument();
    expect(screen.getByRole('link', { name: /login/i })).toBeInTheDocument();
    expect(screen.getByRole('link', { name: /cadastro/i })).toBeInTheDocument();
  });

  test('renderiza hero com título e subtexto', () => {
    render(
      <MemoryRouter>
        <LandingPage />
      </MemoryRouter>
    );
    expect(screen.getByText(/fale com o furioso bot/i)).toBeInTheDocument();
    expect(screen.getByText(/digite "próximo jogo" ou "quiz"/i)).toBeInTheDocument();
  });

  test('renderiza placeholder do chatbot', () => {
    render(
      <MemoryRouter>
        <LandingPage />
      </MemoryRouter>
    );
    expect(screen.getByText(/chatbot em construção/i)).toBeInTheDocument();
  });
});