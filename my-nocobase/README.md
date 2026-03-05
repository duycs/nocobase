## NOCOBASE DEV

### 1. Require environment
- Docker and Docker compose
- Node 20+
- Yarn 1.22+

### 2. Install Postgres database
  ```docker compose up -d```

### 3. Restore database
  Restore Postgres backup file *backup\prod-dump-nocobase-...tar*

### 4. Build dev
  ```yarn install --frozen-lockfile```<br>
  ```yarn nocobase install --lang=en-US```

### 5. Add new plugin
  ```yarn pm create @my-nocobase/csv-service```

### 6. Build the plugin
  ```yarn build csv-service```

### 7. Run dev
  ```yarn dev```

### 8. Test
Open [http://localhost:13000](http://localhost:13000) in a web browser.<br>
The initial account and password are ```admin@nocobase.com``` and ```admin123```

## API
[Swagger Docs](http://localhost:13000/admin/settings/api-doc)<br>
[Echo API](https://app.echoapi.com/5dfeaf8ba002000/apis)

## PLUGIN
Plugin folder: ackages/plugins/plugin-name

### 1. csv-service
### 2. object-item-block
