import React from 'react';
import ProductsPage from './pages/ProductsPage';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>E-Commerce Product Catalog</h1>
      </header>
      <main>
        <ProductsPage />
      </main>
      <footer>
        <p>Interview Project - React Frontend</p>
      </footer>
    </div>
  );
}

export default App; 