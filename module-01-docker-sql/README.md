# Data Engineering Zoomcamp

This repository contains my work for the **DataTalksClub Data Engineering Zoomcamp (2026)**.

## Module 1 – Docker, SQL & Terraform

### Homework Answers

| Question | Answer |
|----------|--------|
| Question 1 | **pip 26.1.2** |
| Question 2 | **postgres:5432** |
| Question 3 | **8,007** |
| Question 4 | **2025-11-14** |
| Question 5 | **East Harlem North** |
| Question 6 | **Yorkville West** |
| Question 7 | **terraform init → terraform apply -auto-approve → terraform destroy** |

---

## Repository Contents

| File | Description |
|------|-------------|
| `docker-compose.yaml` | Docker Compose configuration for PostgreSQL and pgAdmin |
| `ingest_data.py` | Python script to load the Green Taxi Trips and Taxi Zone Lookup datasets into PostgreSQL |
| `homework.sql` | SQL queries used to answer the homework questions |
| `data/` | Taxi datasets used for the homework *(ignored by Git)* |

---

## Common Commands

### Docker Compose

Start all services

```bash
docker compose up -d
```

View running containers

```bash
docker compose ps
```

Stop all containers

```bash
docker compose down
```

View container logs

```bash
docker compose logs
```

Restart containers

```bash
docker compose restart
```

---

### PostgreSQL

Connect using psql

```bash
psql -h localhost -p 5433 -U postgres -d ny_taxi
```

Useful SQL

```sql
SELECT COUNT(*)
FROM green_tripdata_2025_11;
```

Preview rows

```sql
SELECT *
FROM green_tripdata_2025_11
LIMIT 10;
```

---

### pgAdmin Connection

Inside Docker, PostgreSQL is reached using:

| Setting | Value |
|---------|-------|
| Host | `postgres` |
| Port | `5432` |
| Database | `ny_taxi` |
| Username | `postgres` |
| Password | `postgres` |

> **Note**
>
> From your computer use:
>
> `localhost:5433`
>
> From another Docker container use:
>
> `postgres:5432`

---

### Data Ingestion

Install dependencies

```bash
python -m pip install pandas pyarrow sqlalchemy psycopg2-binary
```

Load data into PostgreSQL

```bash
python ingest_data.py
```

---

### SQL Join Keys

Pickup zone

```sql
green_tripdata_2025_11.PULocationID
=
taxi_zone_lookup.LocationID
```

Dropoff zone

```sql
green_tripdata_2025_11.DOLocationID
=
taxi_zone_lookup.LocationID
```

---

### Terraform

Initialize project

```bash
terraform init
```

Preview infrastructure changes

```bash
terraform plan
```

Create infrastructure

```bash
terraform apply
```

Create infrastructure without confirmation

```bash
terraform apply -auto-approve
```

Destroy infrastructure

```bash
terraform destroy
```

Preview resources managed by Terraform

```bash
terraform state list
```

---

### Git

Check repository status

```bash
git status
```

Stage files

```bash
git add .
```

Commit changes

```bash
git commit -m "Commit message"
```

Push changes

```bash
git push
```

Pull latest changes

```bash
git pull
```

---

## Technologies Used

- Docker
- Docker Compose
- PostgreSQL
- pgAdmin
- Python
- Pandas
- SQLAlchemy
- SQL
- Terraform
- Git