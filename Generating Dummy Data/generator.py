import requests
import random
from faker import Faker

middle_initials = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
def add_middle_initial(name):
    middle_initial = random.choice(middle_initials)
    return f' {middle_initial} '.join(name.split(' '))

fake = Faker()
response = requests.get(
    'https://names.drycodes.com/100?nameOptions=boy_names&separator=space')
boy_names = list(
    map(add_middle_initial, response.text[1:-1].replace("\"", '').split(',')))

with open('dummy_data.txt', 'w') as file:
    file.write(
        "INSERT INTO customer(last_name, first_name, middle_name, address) VALUES ")
    for name in boy_names:
        name = name.split(' ')
        file.write(f"('{name[2]}', '{name[0]}', '{name[1]}', '{' '.join(fake.address().split(','))}'), \n")
