# Setup

### 1. Clone the template

Use GitHub’s Use this template button or:

```
gh repo create my-app --template YOUR_USERNAME/react-rails-app-template
git clone git@github.com:YOUR_USERNAME/my-app.git
cd my-app
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
