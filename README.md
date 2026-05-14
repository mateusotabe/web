# 🐳 Laravel 13 — Ambiente Docker

**PHP 8.5 · Nginx · PostgreSQL · Vite**

Este repositório fornece um ambiente de desenvolvimento completo para **Laravel 13**, utilizando **Docker + Docker Compose**, com foco em simplicidade, performance e compatibilidade com Vite.

---

## 📦 Stack

- PHP 8.5 (FPM)
- Nginx (Alpine)
- PostgreSQL 16
- Node.js / pnpm (Vite)
- Composer 2
- Xdebug (ambiente dev)

---

## 🚀 Requisitos

Antes de começar, certifique-se de ter instalado:

- Docker `>= 24`
- Docker Compose `>= 2.0`

---

## Copiando os Arquivos Para um Projeto Laravel

Na pasta do seu projeto execute:

```bash
curl -L https://github.com/mateusotabe/web/archive/refs/heads/laravel13.tar.gz \
| tar -xz --strip-components=1 -C .
```

---

## ▶️ Subindo o ambiente

### 1️⃣ Build e start dos containers

```bash
docker compose up -d --build
```

---

### 2️⃣ Criar arquivo de ambiente

```bash
cp .env.example .env
```

> Ajuste as variáveis se necessário (`DB_*`, `APP_URL`, etc.)

---

### 3️⃣ Instalar dependências PHP (Composer)

```bash
docker compose exec php composer install
```

---

### 4️⃣ Instalar dependências Frontend (pnpm)

```bash
docker compose exec php pnpm install
```

---

### 5️⃣ Rodar migrations

```bash
docker compose exec php php artisan migrate
```

---

### 6️⃣ Gerar chave da aplicação

```bash
docker compose exec php php artisan key:generate
```

---

### 7️⃣ Iniciar Vite (Hot Reload)

```bash
docker compose exec php pnpm run dev
```

A aplicação ficará disponível em:

- 🌐 **Laravel:** http://localhost:8000
- ⚡ **Vite:** http://localhost:5173

---

## 🧠 Observações importantes

### Vite em Docker

O Vite já está configurado para funcionar corretamente em ambiente Docker:

```ts
plugins: [...],
server: {
  host: true,
  port: 5173,
  strictPort: true,
  hmr: {
    host: 'localhost',
  },
}
```

Isso evita problemas comuns como:

- `[::1]:5173`
- `ERR_EMPTY_RESPONSE`
- Hot Reload não funcionando

---

## 🛑 Parar o ambiente

```bash
docker compose down
```

Para remover também os volumes:

```bash
docker compose down -v
```

---

## 🧪 Comandos úteis

```bash
# Entrar no container PHP
docker compose exec php sh

# Ver logs
docker compose logs -f

# Rebuild completo
docker compose up -d --build --force-recreate
```

---

## 📄 Licença

Projeto para fins de desenvolvimento.  
Adapte conforme necessidade do seu time.
