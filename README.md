# Setup

### 1. Clone the template

Use GitHub’s Use this template button or clone locally:

```
git clone https://github.com/neilglazier/react-rails-app-template.git my-new-app
cd my-new-app
rm -rf .git
git init
git add .
git commit -m "Initial commit"
```

### 2. Install dependencies

```
bundle install
yarn install
```

### 3. Setup database

This project uses PostgreSQL by default.

```
bin/rails db:create
```

### 4. Run the app

This kicks off both `bin/rails server` and `bin/shakapacker-dev-server`

```
yarn start
```

Your app should now be running at http://localhost:3000
