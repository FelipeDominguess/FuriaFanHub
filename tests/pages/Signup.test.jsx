import { render, screen, fireEvent } from '@testing-library/react';
import { MemoryRouter } from 'react-router-dom';
import SignupPage from '../pages/SignupPage';

describe('SignupPage', () => {
  test('renderiza campos de cadastro', () => {
    render(<MemoryRouter><SignupPage /></MemoryRouter>);
    expect(screen.getByPlaceholderText(/nome/i)).toBeInTheDocument();
    expect(screen.getByPlaceholderText(/e-mail/i)).toBeInTheDocument();
    expect(screen.getByPlaceholderText(/senha/i)).toBeInTheDocument();
    expect(screen.getByRole('combobox', { name: /favoritePlayer/i })).toBeInTheDocument();
    expect(screen.getByRole('combobox', { name: /favoriteGame/i })).toBeInTheDocument();
    expect(screen.getByPlaceholderText(/twitch/i)).toBeInTheDocument();
    expect(screen.getByPlaceholderText(/twitter/i)).toBeInTheDocument();
    expect(screen.getByPlaceholderText(/discord/i)).toBeInTheDocument();
  });

  test('exibe erro se campos obrigatórios estiverem vazios', () => {
    render(<MemoryRouter><SignupPage /></MemoryRouter>);
    fireEvent.click(screen.getByRole('button', { name: /cadastrar/i }));
    expect(screen.getByText(/preencha os campos obrigatórios/i)).toBeInTheDocument();
  });
});