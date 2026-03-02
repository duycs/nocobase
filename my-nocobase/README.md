## INIT STEPS

### 1. Require environment
- Docker and Docker compose
- Node 20+
- Yarn 1.22+

### 2. Install Postgres database
  ```docker compose up -d```

### 3. Restore database
  Restore Postgres backup file ```prod-dump-nocobase-...tar```

### 4. Build dev
  ```yarn install --frozen-lockfile```
  ```yarn nocobase install --lang=en-US```

### 5. Add new plugin
  ```yarn pm create @my-nocobase/hello-world```

### 6. Build the plugin
  ```yarn build hello-world```

### 7. Run dev
  ```yarn dev```

### 8. Test
Open [http://localhost:13000](http://localhost:13000) in a web browser. 
The initial account and password are ```admin@nocobase.com``` and ```admin123```
