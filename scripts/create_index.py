# -*- coding: utf-8 -*-

import os
import glob
import re
import sys
import io
from bs4 import BeautifulSoup
from jinja2 import Template, Environment, FileSystemLoader
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')


env = Environment(loader=FileSystemLoader('./templates'))
template = env.get_template('index.html.j2')

path = './tracklists/'
items = []
trans_dict = {'<h1>': '<h3>', '</h1>': '</h3>'}

for i in os.listdir(path):
  item = {}
  item['name'] = re.findall('mix-(.+).html', i)[0]
  item['url'] = path + i
  item['genre'] = re.findall('mix-(\D+)\d+.html', i)[0]
  item['table'] = BeautifulSoup(open(item['url']), "lxml").find('table')
  items.append(item)

items = sorted(items, key=lambda x:x['name'])
genres = sorted(set([i['genre'] for i in items]))
data = {}

for genre in genres:
  data[genre] = []
  for i in items:
    if i['genre'] == genre:
      data[genre].append(i)

render_data = {
  "data": data
}

rendered = template.render(render_data)

print(str(rendered))