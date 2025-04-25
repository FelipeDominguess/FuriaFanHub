import CryptoJS from 'crypto-js';

const encryptPassword = (password) => CryptoJS.AES.encrypt(password, 'furia-key').toString();
const decryptPassword = (encrypted) => CryptoJS.AES.decrypt(encrypted, 'furia-key').toString(CryptoJS.enc.Utf8);

export const signupUser = (userData) => {
  const users = JSON.parse(localStorage.getItem('users')) || [];
  if (users.some(u => u.email === userData.email)) {
    throw new Error('E-mail já cadastrado');
  }
  userData.password = encryptPassword(userData.password);
  users.push(userData);
  localStorage.setItem('users', JSON.stringify(users));
  return userData;
};

export const loginUser = (email, password) => {
  const users = JSON.parse(localStorage.getItem('users')) || [];
  const user = users.find(u => u.email === email);
  if (!user) throw new Error('Usuário ou senha incorretos');
  const decrypted = decryptPassword(user.password);
  if (decrypted !== password) throw new Error('Usuário ou senha incorretos');
  return user;
};