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

### 2. Update app specific configurations

- Update app name in `package.json`
- Update app name in `config/application.rb`
- Update DB names in `config/database.yml`
- Update app name, description, and repo in `app.json`
- Update app name in `manifest.json.erb`
- Generate new credentials by deleting `config/credentials.yml.enc` and `config/master.key` and running `rails credentials:edit`
- Update README

### 3. Install dependencies

```
bundle install
yarn install
```

### 4. Setup database

This project uses PostgreSQL by default.

```
bin/rails db:create
```

### 5. Run the app

This kicks off both `bin/rails server` and `bin/shakapacker-dev-server`

```
yarn start
```

Your app should now be running at http://localhost:3000
