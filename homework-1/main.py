"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
from config import host,  database, user, password
import csv

customers_data = './north_data/customers_data.csv'
employees_data = './north_data/employees_data.csv'
orders_data = './north_data/orders_data.csv'
# connect to existing database
conn = psycopg2.connect(host=host, database=database, user=user, password=password)
try:
    with conn:  # всегда будет сделан коммит
        with conn.cursor() as cursor:  # всегда закроет курсор

            with open(customers_data) as file:  # откроем customers_data
                file_reader = csv.DictReader(file, delimiter=',')

                for row in file_reader:
                    customer_id = row.get('customer_id')
                    company_name = row.get('company_name')
                    contact_name = row.get('contact_name')

                    cursor.executemany(
                        'INSERT INTO customers VALUES (%s, %s, %s)',
                        [(customer_id, company_name, contact_name)])

            with open(employees_data) as file:  # откроем employees_data
                file_reader = csv.DictReader(file, delimiter=',')

                for row in file_reader:
                    first_name = row.get('first_name')
                    last_name = row.get('last_name')
                    title = row.get('title')
                    birth_date = row.get('birth_date')
                    notes = row.get('notes')

                    cursor.executemany(
                        'INSERT INTO employees VALUES (default, %s, %s, %s, %s, %s)',
                        [(first_name, last_name, title, birth_date, notes)])

            with open(orders_data) as file:
                file_reader = csv.DictReader(file, delimiter=',')

                for row in file_reader:
                    order_id = row.get('order_id')
                    customer_id = row.get('customer_id')
                    employee_id = row.get('employee_id')
                    order_date = row.get('order_date')
                    ship_city = row.get('ship_city')

                    cursor.executemany(
                        'INSERT INTO orders VALUES (%s, %s, %s, %s, %s)',
                        [(order_id, customer_id, employee_id, order_date, ship_city)])
except Exception as _e:
    print("[INFO] Error while working with PostgreSQL", _e)

finally:
    if conn:
        conn.close()
        print("[INFO] PostgreSQL connection closed")
