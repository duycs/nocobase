# NocoBase - Docker App Postgres

## Khởi động

```bash
docker compose up -d
```

## Thêm custom plugin (lần đầu tiên)

Custom plugin `csv-service` đã được đặt sẵn trong thư mục `custom-plugins/` và được mount vào container qua `docker-compose.yml`. Chỉ cần chạy các lệnh sau **một lần duy nhất** để đăng ký plugin vào database:

```bash
docker compose exec app yarn nocobase pm add csv-service
docker compose exec app yarn nocobase pm enable csv-service
docker compose restart app
```

> Sau khi đăng ký, plugin sẽ tự động được load trong mọi lần khởi động lại container vì:
> - Trạng thái enabled được lưu trong database (volume `./storage/db`)
> - Package được mount trực tiếp vào `node_modules` qua volume trong `docker-compose.yml`

## Cập nhật plugin

Khi có thay đổi trong `custom-plugins/csv-service/dist/`, chỉ cần restart app:

```bash
docker compose restart app
```

## Dừng và xóa container

```bash
docker compose down
```

> **Lưu ý:** Dữ liệu database và storage được giữ nguyên trong thư mục `./storage/`. Chỉ mất khi xóa thư mục này.
